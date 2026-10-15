import assert from 'node:assert/strict';
import test from 'node:test';
import { IncomingMessage, ServerResponse } from 'node:http';
import { Socket } from 'node:net';

import { node_data_string, write_health_response_$x_ } from '../js-out/ws-edn.server.mjs';
import { current_iso_time_$x_ } from '../js-out/ws-edn.util.mjs';

test('converts a Node message Buffer to text', () => {
  assert.equal(node_data_string(Buffer.from('hello')), 'hello');
});

test('reads the host Date as an ISO string', () => {
  assert.match(current_iso_time_$x_(), /^\d{4}-\d{2}-\d{2}T/);
});

test('uses Node writeHead and end for the health response', () => {
  const socket = new Socket();
  try {
    const response = new ServerResponse(new IncomingMessage(socket));
    write_health_response_$x_(response);
    assert.equal(response.statusCode, 200);
    assert.equal(response.writableEnded, true);
  } finally {
    socket.destroy();
  }
});
