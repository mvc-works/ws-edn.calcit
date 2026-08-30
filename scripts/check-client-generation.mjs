import assert from "node:assert/strict";
import { CalcitMap, init_tags, invoke_method } from "@calcit/procs";
import {
  create_client_with_$x_,
  install_browser_lifecycle_$x_,
} from "../out-page/ws-edn.client.mjs";

const listeners = new Map();
const intervals = new Map();
let nextTimer = 1;
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
globalThis.clearTimeout = () => {};

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

const tags = init_tags(["on-data"]);
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

assert.equal(sockets.length, 1);
assert.equal(connected(), false);
sockets[0].onopen({ generation: 1 });
assert.equal(connected(), true);

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
listeners.get("online")({});
assert.equal(lifecycleSockets.length, 2);
listeners.get("visibilitychange")({});
assert.equal(lifecycleSockets.length, 2);

invoke_method("close", lifecycleClient);
assert.equal(lifecycleSockets[1].closeCalls, 1);
assert.equal(listeners.size, 0);
assert.equal(intervals.size, 0);

console.log("ws client generation smoke passed");
