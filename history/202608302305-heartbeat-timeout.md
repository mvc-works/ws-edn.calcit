# Generation-safe heartbeat timeout

- Added an opt-in `:heartbeat-timeout-ms` deadline to the nominal browser
  `WsClient`; silent legacy protocols remain unchanged by default.
- Opening the socket and receiving any message renews a Cumulo `HeartbeatLease`.
  Expiration closes only the currently active generation and reuses the bounded
  reconnect path.
- Explicit close, reconnect, stale generation replacement, and close callbacks
  clear the heartbeat timer and lease.
- Added deterministic fake-clock regression coverage for renewal, timeout,
  reconnect handoff, and explicit cleanup.
