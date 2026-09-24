import assert from 'node:assert/strict';
import test from 'node:test';

import { node_data_string } from '../js-out/ws-edn.server.mjs';
import { current_iso_time_$x_ } from '../js-out/ws-edn.util.mjs';

test('converts a Node message Buffer to text', () => {
  assert.equal(node_data_string(Buffer.from('hello')), 'hello');
});

test('reads the host Date as an ISO string', () => {
  assert.match(current_iso_time_$x_(), /^\d{4}-\d{2}-\d{2}T/);
});
