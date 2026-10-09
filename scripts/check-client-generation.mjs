import assert from "node:assert/strict";
import { execFileSync, spawnSync } from "node:child_process";
import { copyFile, mkdir, mkdtemp, readFile, rm, symlink } from "node:fs/promises";
import { tmpdir } from "node:os";
import { join, resolve } from "node:path";
import { pathToFileURL } from "node:url";
import { CalcitMap, init_tags, invoke_method } from "@calcit/procs";
import {
  client_option_callback,
  client_option_number,
  client_state_handle,
  create_client_with_$x_,
  install_browser_lifecycle_$x_,
  ws_connect_$x_,
  ws_connected_$q_,
} from "../out-page/ws-edn.client.mjs";
import { Track, decode_track } from "../out-page/ws-edn.schema.mjs";

// Replay the owning Calcit contracts, not a second JS implementation. Use a
// guarded Snapshot copy and the same published toolchain as normal compilation.
const originalSnapshot = await readFile("calcit.cirru");
const optionsFixture = await mkdtemp(join(tmpdir(), "ws-edn-options-contract-"));
try {
  const snapshot = join(optionsFixture, "calcit.cirru");
  await copyFile("calcit.cirru", snapshot);
  await copyFile("deps.cirru", join(optionsFixture, "deps.cirru"));
  await mkdir(join(optionsFixture, ".calcit"));
  await symlink(resolve(".calcit/modules"), join(optionsFixture, ".calcit/modules"), "dir");
  await symlink(resolve("node_modules"), join(optionsFixture, "node_modules"), "dir");
  const commandOptions = { encoding: "utf8", timeout: 60000, maxBuffer: 16 * 1024 * 1024 };
  const run = (...args) => execFileSync("calcit", [snapshot, ...args], commandOptions);
  const tests = [["client-option-number", 4], ["client-option-callback", 5], ["parse-client-message", 4]].flatMap(([name, count]) => {
    const response = JSON.parse(run("query", "def", `ws-edn.client/${name}`, "--format", "json"));
    assert.deepEqual(response.diagnostics, []);
    assert.equal(response.data.tests.length, count);
    return response.data.tests;
  });
  const revision = JSON.parse(run("query", "config", "--format", "json")).revision;
  const operations = [
    ["edit", "def", "ws-edn.client/replay-options-contract!", "--input-format", "json-ast", "--code",
      JSON.stringify(["defn", "replay-options-contract!", [], ...tests.map(test => test.code), "&unit"])],
    ["edit", "schema", "ws-edn.client/replay-options-contract!", "--input-format", "json-ast", "--code",
      JSON.stringify(["::", "'Fn", ["{}", [":args", ["[]"]], [":return", "'Unit"], [":features", ["#{}", ":js-ffi"]]]])],
    ["config", "set", "init-fn", "ws-edn.client/replay-options-contract!"],
    ["config", "set", "reload-fn", "ws-edn.client/replay-options-contract!"],
  ];
  run("docs", "agents", "--contract");
  const transaction = ["edit", "transaction", "--code", JSON.stringify(operations), "--expect-revision", revision, "--format", "edn"];
  run(...transaction, "--dry-run");
  run(...transaction);
  run("--check-only");
  const output = join(optionsFixture, "js-out");
  run("--emit-path", output, "js");
  (await import(pathToFileURL(join(output, "ws-edn.client.mjs")).href)).replay_options_contract_$x_();

  // Keep a concrete container contract: statically invalid options must fail
  // before any browser socket or lifecycle operation can execute.
  for (const name of ["client-option-number", "client-option-callback"]) {
    for (const input of ["42", "nil", "[]", "{} (|wrong-key 1)"]) {
      const argument = input === "42" || input === "nil" ? input : `(${input})`;
      const snippet = `ns app.proof $ :require (ws-edn.client :refer (${name}))\n\n${name} ${argument} :retry-base-ms`;
      const rejected = spawnSync("calcit", ["eval", "--dep", "./", snippet], commandOptions);
      if (rejected.error) throw rejected.error;
      assert.notEqual(rejected.status, 0, `${name}: invalid options ${input}`);
      assert.match(`${rejected.stdout}\n${rejected.stderr}`, /W_FN_ARG_TYPE_MISMATCH|E_CALL_ARGUMENT_MISMATCH/);
    }
  }
  assert.deepEqual(await readFile("calcit.cirru"), originalSnapshot);
  console.log("Nine original options and four message AST contracts pass on generated JS; invalid containers are rejected statically.");
} finally {
  await rm(optionsFixture, { recursive: true, force: true });
  assert.deepEqual(await readFile("calcit.cirru"), originalSnapshot);
}
for (const invalid of [null, 42, false, "not-a-map", []]) {
  assert.throws(() => client_option_number(invalid, init_tags(["retry-base-ms"])["retry-base-ms"]));
  assert.throws(() => client_option_callback(invalid, init_tags(["on-data"])["on-data"]));
}

const listeners = new Map();
const intervals = new Map();
const timeouts = new Map();
let nextTimer = 1;
Math.random = () => 0.5;
globalThis.document = { visibilityState: "visible" };
Object.defineProperty(globalThis, "navigator", {
  configurable: true,
  value: { onLine: true },
});
globalThis.window = {
  addEventListener: (name, listener) => listeners.set(name, listener),
  removeEventListener: (name, listener) => {
    if (listeners.get(name) === listener) listeners.delete(name);
  },
};
globalThis.setInterval = (callback, interval) => {
  const id = nextTimer++;
  intervals.set(id, { callback, interval });
  return id;
};
globalThis.clearInterval = (id) => intervals.delete(id);
globalThis.setTimeout = (callback, delay) => {
  const id = nextTimer++;
  timeouts.set(id, { callback, delay });
  return id;
};
globalThis.clearTimeout = (id) => timeouts.delete(id);

const runNextTimeout = () => {
  const entry = timeouts.entries().next().value;
  assert.notEqual(entry, undefined);
  const [id, timer] = entry;
  timeouts.delete(id);
  timer.callback();
  return timer.delay;
};

class FakeSocket {
  constructor(url) {
    this.url = url;
    this.closeCalls = 0;
    this.sent = [];
  }

  close() {
    this.closeCalls += 1;
  }

  send(data) {
    this.sent.push(data);
  }
}

const tags = init_tags(["heartbeat-timeout-ms", "on-data"]);
const sockets = [];
const received = [];
const options = new CalcitMap().assoc(tags["on-data"], (data) => {
  received.push(data);
});
const client = create_client_with_$x_("ws://example.test", options, (url) => {
  const socket = new FakeSocket(url);
  sockets.push(socket);
  return socket;
});
const connected = () => invoke_method("connected?", client);

assert.strictEqual(client_state_handle(client), client);
for (const invalid of [null, 0, false, new CalcitMap()]) {
  assert.throws(() => install_browser_lifecycle_$x_(invalid),
    /\[ws-edn\] expected a WsClient state handle/);
}
assert.equal(listeners.size, 0);
assert.equal(intervals.size, 0);

assert.equal(sockets.length, 1);
assert.equal(connected(), false);
sockets[0].onopen({ generation: 1 });
assert.equal(connected(), true);
assert.equal(timeouts.size, 0);

invoke_method("reconnect", client);
assert.equal(sockets[0].closeCalls, 1);
assert.equal(sockets.length, 2);
assert.equal(connected(), false);

sockets[0].onopen({ stale: true });
sockets[0].onmessage({ data: "\ndo |stale\n" });
sockets[0].onclose({ stale: true });
assert.equal(connected(), false);
assert.deepEqual(received, []);

sockets[1].onopen({ generation: 2 });
assert.equal(connected(), true);
sockets[0].onclose({ stale: true });
assert.equal(connected(), true);
sockets[1].onmessage({ data: "\ndo |fresh\n" });
assert.deepEqual(received, ["fresh"]);
for (const invalid of [null, 42, false, {}, new Uint8Array([1, 2])]) {
  assert.throws(() => sockets[1].onmessage({ data: invalid }), /expected a text WebSocket message/);
}
assert.deepEqual(received, ["fresh"]); // Invalid wire frames never reach the application callback.


invoke_method("send", client, "payload");
assert.equal(sockets[1].sent.length, 1);
invoke_method("close", client);
assert.equal(sockets[1].closeCalls, 1);
assert.equal(connected(), false);
sockets[1].onclose({ generation: 2 });

const lifecycleSockets = [];
const lifecycleClient = create_client_with_$x_(
  "ws://lifecycle.test",
  new CalcitMap(),
  (url) => {
    const socket = new FakeSocket(url);
    lifecycleSockets.push(socket);
    return socket;
  },
);
install_browser_lifecycle_$x_(lifecycleClient);
assert.equal(lifecycleSockets.length, 1);
assert.equal(listeners.size, 4);
assert.equal(intervals.size, 1);

lifecycleSockets[0].onclose({ closed: true });
assert.equal(timeouts.size, 1);
assert.equal([...timeouts.values()][0].delay, 500);
listeners.get("online")({});
assert.equal(lifecycleSockets.length, 2);
assert.equal(timeouts.size, 0);
listeners.get("visibilitychange")({});
assert.equal(lifecycleSockets.length, 2);

invoke_method("close", lifecycleClient);
assert.equal(lifecycleSockets[1].closeCalls, 1);
assert.equal(listeners.size, 0);
assert.equal(intervals.size, 0);

const retrySockets = [];
const retryClient = create_client_with_$x_(
  "ws://retry.test",
  new CalcitMap(),
  (url) => {
    const socket = new FakeSocket(url);
    retrySockets.push(socket);
    return socket;
  },
);
retrySockets[0].onclose({ retry: 1 });
assert.equal(runNextTimeout(), 500);
assert.equal(retrySockets.length, 2);
retrySockets[1].onclose({ retry: 2 });
assert.equal(runNextTimeout(), 1000);
assert.equal(retrySockets.length, 3);
retrySockets[2].onopen({ recovered: true });
retrySockets[2].onclose({ retryAfterReset: true });
assert.equal([...timeouts.values()][0].delay, 500);
invoke_method("close", retryClient);
assert.equal(timeouts.size, 0);

let nowMs = 1000;
Date.now = () => nowMs;
const heartbeatOptions = new CalcitMap().assoc(
  tags["heartbeat-timeout-ms"],
  2000,
);
const heartbeatSockets = [];
const heartbeatClient = create_client_with_$x_(
  "ws://heartbeat.test",
  heartbeatOptions,
  (url) => {
    const socket = new FakeSocket(url);
    heartbeatSockets.push(socket);
    return socket;
  },
);
heartbeatSockets[0].onopen({ heartbeat: true });
assert.equal(timeouts.size, 1);
assert.equal([...timeouts.values()][0].delay, 2000);
const firstHeartbeatTimer = [...timeouts.keys()][0];
const staleHeartbeatCallback = timeouts.get(firstHeartbeatTimer).callback;
nowMs = 1500;
heartbeatSockets[0].onmessage({ data: "ignored-without-listener" });
assert.equal(timeouts.size, 1);
assert.equal(timeouts.has(firstHeartbeatTimer), false);
staleHeartbeatCallback();
assert.equal(timeouts.size, 1);
assert.equal(heartbeatSockets[0].closeCalls, 0);
nowMs = 3500;
assert.equal(runNextTimeout(), 2000);
assert.equal(heartbeatSockets[0].closeCalls, 1);
heartbeatSockets[0].onclose({ heartbeatTimeout: true });
assert.equal(timeouts.size, 1);
invoke_method("close", heartbeatClient);
assert.equal(timeouts.size, 0);

const closeSockets = [];
const closeClient = create_client_with_$x_(
  "ws://heartbeat-close.test",
  heartbeatOptions,
  (url) => {
    const socket = new FakeSocket(url);
    closeSockets.push(socket);
    return socket;
  },
);
closeSockets[0].onopen({ heartbeat: true });
assert.equal(timeouts.size, 1);
invoke_method("close", closeClient);
assert.equal(closeSockets[0].closeCalls, 1);
assert.equal(timeouts.size, 0);
closeSockets[0].onclose({ explicit: true });
assert.equal(timeouts.size, 0);

// Exercise the singleton path as well as the injected factory path: lifecycle
// adaptation must not lose the nominal client stored in the global Option Ref.
const singletonSockets = [];
const originalWebSocket = Object.getOwnPropertyDescriptor(globalThis, "WebSocket");
globalThis.WebSocket = class extends FakeSocket {
  constructor(url) {
    super(url);
    singletonSockets.push(this);
  }
};
try {
  const first = ws_connect_$x_("ws://singleton-first.test", new CalcitMap());
  assert.equal(invoke_method("connected?", first), false);
  singletonSockets[0].onopen({ singleton: true });
  assert.equal(ws_connected_$q_(), true);
  const second = ws_connect_$x_("ws://singleton-second.test", new CalcitMap());
  assert.equal(singletonSockets[0].closeCalls, 1);
  assert.equal(ws_connected_$q_(), false);
  singletonSockets[1].onopen({ singleton: true });
  assert.equal(invoke_method("connected?", second), true);
  assert.equal(ws_connected_$q_(), true);
  invoke_method("close", second);
  assert.equal(ws_connected_$q_(), false);
  assert.equal(singletonSockets[1].closeCalls, 1);
} finally {
  if (originalWebSocket) Object.defineProperty(globalThis, "WebSocket", originalWebSocket);
  else delete globalThis.WebSocket;
}

console.log("ws client generation and singleton nominal Ref smoke passed");

// Only frame validation/parsing belongs to the message error boundary. Real
// application and error-handler exceptions must retain their original identity.
const errorTags = init_tags(["on-data", "on-error"]);
const messageSockets = [];
const messageValues = [];
const messageErrors = [];
const messageClient = create_client_with_$x_("ws://message-errors.test",
  new CalcitMap()
    .assoc(errorTags["on-data"], value => messageValues.push(value))
    .assoc(errorTags["on-error"], error => messageErrors.push(error)),
  url => {
    const socket = new FakeSocket(url);
    messageSockets.push(socket);
    return socket;
  });
messageSockets[0].onopen({});
const privateFrame = "{} $ :token $ unrecognized-private-token-7f12";
const previousConsoleError = console.error;
const messageLogs = [];
console.error = (...args) => messageLogs.push(args.join(" "));
try {
  for (const invalid of [null, 42, false, {}, new Uint8Array([1, 2]), "{", privateFrame]) {
    assert.doesNotThrow(() => messageSockets[0].onmessage({ data: invalid }));
  }
} finally {
  console.error = previousConsoleError;
}
assert.equal(messageErrors.length, 7);
assert.deepEqual(messageValues, []);
for (const error of messageErrors) {
  assert.ok(error instanceof Error);
  assert.equal(error.name, "Error");
  assert.match(error.message, /^\[ws-edn\/message\]/);
  assert.doesNotMatch(error.message, /unrecognized-private-token|:token/);
}
assert.doesNotMatch(messageLogs.join("\n"), /unrecognized-private-token|:token/);
messageSockets[0].onmessage({ data: "do |after-error" });
assert.deepEqual(messageValues, ["after-error"]);
invoke_method("reconnect", messageClient);
messageSockets[0].onmessage({ data: "{" });
messageSockets[0].onmessage({ data: null });
assert.equal(messageErrors.length, 7);
assert.deepEqual(messageValues, ["after-error"]);
messageSockets[1].onopen({});
const transportError = { type: "error", marker: "transport-identity" };
console.error = () => {};
try {
  messageSockets[1].onerror(transportError);
} finally {
  console.error = previousConsoleError;
}
assert.equal(messageErrors.at(-1), transportError);
invoke_method("close", messageClient);

// The legacy mapper still reaches the parser through the public client path.
const mapperTags = init_tags(["class-mapper", "Track", "message", "time"]);
const mapperPrototype = decode_track(new CalcitMap()
  .assoc(mapperTags.message, "")
  .assoc(mapperTags.time, ""));
let mappedSocket;
const mappedValues = [];
const mappedClient = create_client_with_$x_("ws://mapped-message.test",
  new CalcitMap()
    .assoc(mapperTags["class-mapper"], new CalcitMap().assoc(mapperTags.Track, mapperPrototype))
    .assoc(errorTags["on-data"], value => mappedValues.push(value)),
  url => (mappedSocket = new FakeSocket(url)));
mappedSocket.onopen({});
mappedSocket.onmessage({ data: "%{} Track (:message |hello) (:time |now)" });
assert.equal(mappedValues.length, 1);
assert.equal(mappedValues[0].structRef, Track);
assert.deepEqual(mappedValues[0].values, ["hello", "now"]);
invoke_method("close", mappedClient);

const exerciseCallbackFailure = (throwInData) => {
  const original = new Error(throwInData ? "application-failure" : "error-handler-failure");
  let errorCalls = 0;
  let socket;
  const client = create_client_with_$x_("ws://callback-failure.test",
    new CalcitMap()
      .assoc(errorTags["on-data"], () => { if (throwInData) throw original; })
      .assoc(errorTags["on-error"], () => { errorCalls += 1; throw original; }),
    url => (socket = new FakeSocket(url)));
  socket.onopen({});
  assert.throws(() => socket.onmessage({ data: throwInData ? "do |ok" : "{" }), error => error === original);
  assert.equal(errorCalls, throwInData ? 0 : 1);
  invoke_method("close", client);
};
exerciseCallbackFailure(true);
exerciseCallbackFailure(false);

for (const invalidHandler of [null, 42]) {
  let socket;
  let calls = 0;
  const client = create_client_with_$x_("ws://unhandled-message.test",
    new CalcitMap()
      .assoc(errorTags["on-data"], () => { calls += 1; })
      .assoc(errorTags["on-error"], invalidHandler),
    url => (socket = new FakeSocket(url)));
  socket.onopen({});
  assert.throws(() => socket.onmessage({ data: privateFrame }), /\[ws-edn\/message\] invalid Cirru EDN/);
  assert.throws(() => socket.onmessage({ data: null }), /expected a text WebSocket message/);
  assert.equal(calls, 0);
  invoke_method("close", client);
}
console.log("Checked message notification, privacy, callback identity and stale-generation contracts passed");
