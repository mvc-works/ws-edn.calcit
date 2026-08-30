import assert from "node:assert/strict";
import { CalcitMap, init_tags } from "@calcit/procs";
import {
  client_close_$x_,
  client_connected_$q_,
  client_reconnect_$x_,
  client_send,
  create_client_with_$x_,
} from "../out-page/ws-edn.client.mjs";

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

assert.equal(sockets.length, 1);
assert.equal(client_connected_$q_(client), false);
sockets[0].onopen({ generation: 1 });
assert.equal(client_connected_$q_(client), true);

client_reconnect_$x_(client);
assert.equal(sockets[0].closeCalls, 1);
assert.equal(sockets.length, 2);
assert.equal(client_connected_$q_(client), false);

sockets[0].onopen({ stale: true });
sockets[0].onmessage({ data: "\ndo |stale\n" });
sockets[0].onclose({ stale: true });
assert.equal(client_connected_$q_(client), false);
assert.deepEqual(received, []);

sockets[1].onopen({ generation: 2 });
assert.equal(client_connected_$q_(client), true);
sockets[0].onclose({ stale: true });
assert.equal(client_connected_$q_(client), true);
sockets[1].onmessage({ data: "\ndo |fresh\n" });
assert.deepEqual(received, ["fresh"]);

client_send(client, "payload");
assert.equal(sockets[1].sent.length, 1);
client_close_$x_(client);
assert.equal(sockets[1].closeCalls, 1);
assert.equal(client_connected_$q_(client), false);
sockets[1].onclose({ generation: 2 });

console.log("ws client generation smoke passed");
