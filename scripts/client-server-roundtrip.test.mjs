import assert from "node:assert/strict";
import { once } from "node:events";
import { execFileSync } from "node:child_process";
import { mkdtemp, readFile, rm } from "node:fs/promises";
import { tmpdir } from "node:os";
import { join } from "node:path";
import { get } from "node:https";
import { WebSocket as NodeWebSocket } from "ws";
import test from "node:test";
import * as c from "../out-page/calcit.core.mjs";
import * as client from "../out-page/ws-edn.client.mjs";
import * as server from "../js-out/ws-edn.server.mjs";

async function waitFor(predicate, label) {
  const deadline = Date.now() + 5000;
  while (!predicate()) {
    assert.ok(Date.now() < deadline, `Timed out: ${label}`);
    await new Promise(resolve => setTimeout(resolve, 10));
  }
}

test("real clients preserve EDN payloads and distinct String session IDs", { timeout: 15000 }, async t => {
  const tags = c.init_tags(["host", "on-open", "on-data", "on-error"]);
  const ids = [];
  const incoming = [];
  const failures = [];
  const clients = [];
  const replies = [[], []];
  const messageErrors = [[], []];
  const wss = server.wss_serve_$x_(0, c._$n__$M_(
    tags.host, "127.0.0.1",
    tags["on-open"], sid => {
      if (typeof sid !== "string") failures.push("session ID is not a String");
      ids.push(sid);
    },
    tags["on-data"], (sid, data) => {
      incoming.push([sid, data]);
      server.wss_send_$x_(sid, data);
    },
  ));
  t.after(async () => {
    for (const connection of clients) client.client_close_$x_(connection);
    for (const socket of wss.clients) socket.terminate();
    await new Promise(resolve => wss.close(resolve));
  });
  await once(wss, "listening", { signal: t.signal });
  assert.equal(wss.address().address, "127.0.0.1");
  const url = `ws://127.0.0.1:${wss.address().port}`;
  for (let index = 0; index < 2; index += 1) {
    clients.push(client.create_client_with_$x_(url, c._$n__$M_(
      tags["on-data"], data => { replies[index].push(data); },
      tags["on-error"], error => { messageErrors[index].push(error); },
    ), address => new WebSocket(address)));
  }
  await waitFor(() => ids.length === 2 && clients.every(connection => client.client_connected_$q_(connection)), "both connections");
  assert.deepEqual(failures, []);
  assert.notEqual(ids[0], ids[1]);
  assert.ok(ids.every(sid => sid.length > 0));
  const payloads = [
    c.parse_cirru_edn("{} (:message |中文) (:items $ [] 1 |two) (:optional nil)"),
    c.parse_cirru_edn(":: :reply $ {} (:count 2) (:ok true)"),
  ];
  for (let index = 0; index < clients.length; index += 1) {
    assert.equal(client.client_send(clients[index], payloads[index]).tag.value, "sent");
  }
  await waitFor(() => incoming.length === 2 && replies.every(values => values.length === 1), "EDN echoes");
  for (let index = 0; index < clients.length; index += 1) {
    assert.ok(c._$n__$e_(payloads[index], replies[index][0]));
  }
  assert.ok(incoming.every(([sid]) => typeof sid === "string" && ids.includes(sid)));
  assert.equal(new Set(incoming.map(([sid]) => sid)).size, 2);

  // Real wire parsing failures notify once without delivering private payloads;
  // the same connections must still deliver their next valid message once.
  for (const socket of wss.clients) socket.send("{} $ :token $ private-wire-token-53");
  await waitFor(() => messageErrors.every(errors => errors.length === 1), "checked message errors");
  for (let index = 0; index < clients.length; index += 1) {
    assert.equal(replies[index].length, 1);
    assert.match(messageErrors[index][0].message, /^\[ws-edn\/message\] invalid Cirru EDN$/);
    assert.doesNotMatch(messageErrors[index][0].message, /private-wire-token|:token/);
    assert.equal(client.client_send(clients[index], payloads[index]).tag.value, "sent");
  }
  await waitFor(() => incoming.length === 4 && replies.every(values => values.length === 2), "valid echoes after errors");
  for (let index = 0; index < clients.length; index += 1) {
    assert.ok(c._$n__$e_(payloads[index], replies[index][1]));
    assert.equal(messageErrors[index].length, 1);
  }
  for (const connection of clients) client.client_close_$x_(connection);
  await waitFor(() => c._$n_map_$o_count(c.deref(server._$s_global_connections)) === 0, "session cleanup");
});

test("TLS host binding preserves health and Unicode EDN with an explicitly trusted certificate", { timeout: 15000 }, async t => {
  const directory = await mkdtemp(join(tmpdir(), "ws-edn-host-tls-"));
  t.after(() => rm(directory, { recursive: true, force: true }));
  const key = join(directory, "key.pem");
  const cert = join(directory, "cert.pem");
  execFileSync("openssl", ["req", "-x509", "-newkey", "rsa:2048", "-nodes",
    "-keyout", key, "-out", cert, "-days", "1", "-subj", "/CN=localhost",
    "-addext", "subjectAltName=IP:127.0.0.1"], { stdio: "ignore" });
  const ca = await readFile(cert);
  const tags = c.init_tags(["host", "key", "cert", "on-data"]);
  const wss = server.wss_serve_$x_(0, c._$n__$M_(
    tags.host, "127.0.0.1", tags.key, key, tags.cert, cert,
    tags["on-data"], (sid, data) => server.wss_send_$x_(sid, data),
  ));
  const httpsServer = wss.options.server;
  let socket;
  t.after(async () => {
    socket?.terminate();
    for (const connection of wss.clients) connection.terminate();
    await new Promise(resolve => wss.close(resolve));
    await new Promise(resolve => httpsServer.close(resolve));
  });
  await once(wss, "listening", { signal: t.signal });
  assert.equal(httpsServer.address().address, "127.0.0.1");
  const port = httpsServer.address().port;
  const status = await new Promise((resolve, reject) => {
    get(`https://127.0.0.1:${port}/`, { ca }, response => {
      response.resume();
      resolve(response.statusCode);
    }).on("error", reject);
  });
  assert.equal(status, 200);
  socket = new NodeWebSocket(`wss://127.0.0.1:${port}/`, { ca });
  await once(socket, "open", { signal: t.signal });
  const reply = once(socket, "message", { signal: t.signal });
  const payload = c.parse_cirru_edn("{} (:message |回环🌱)");
  socket.send(c.format_cirru_edn(payload));
  const [message] = await reply;
  assert.ok(c._$n__$e_(payload, c.parse_cirru_edn(message.toString())));
});
