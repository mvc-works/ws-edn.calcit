# Browser lifecycle recovery

- Added the stable `Cumulo/cumulo-util.calcit` `0.0.14` dependency to the page
  entry.
- `WsClient0` now owns an optional cleanup capability for browser lifecycle
  listeners. The production `ws-connect!` installs it, while injected test
  clients remain free of browser globals.
- Visibility and online signals call `client-recover!`, which reconnects only
  after the generation-gated client reaches `:closed`; connecting and open
  clients are never replaced by a lifecycle event.
- `.close` runs and clears the cleanup capability before closing the socket.
  The JavaScript smoke covers recovery after close, no duplicate reconnect while
  connecting, and listener/interval cleanup.
