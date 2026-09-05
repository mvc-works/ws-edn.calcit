
ws-edn in calcit-js
----

### Usages

The server and browser connection snippets require their Node/WebSocket hosts, so
they are marked `cirru.no-check`. CI validates both generated entries and runs the
executable client generation/lifecycle smoke; host-independent data snippets below
remain checked by `calcit docs check-md`.

Server side:

```cirru.no-check
ws-edn.server/wss-serve! 5001
  {}
    :on-open $ fn (sid socket)
      println |opened sid
    :on-data $ fn (sid data)
      println |data sid data
    :on-close $ fn (sid event)
      println |close sid
    :on-listening $ fn ()
      println |listening
    :on-error $ fn (error)
      println error

ws-edn.server/wss-send! |demo-sid $ {} (:data "|some data")

ws-edn.server/wss-each! $ fn (sid socket)
  println sid
  ; "or send"
  ws-edn.server/wss-send! sid $ {} (:data "|some data")

; "use in onreload! to bind a new listener"
ws-edn.server/wss-set-on-data! $ fn (sid data)
  println "|received data" sid data
```

Client side (legacy singleton helpers remain compatible):

```cirru.no-check
ws-edn.client/ws-connect! "|ws://localhost:5001"
  {}
    :on-open $ fn (event)
      println |open
    :on-data $ fn (data)
      println |data data
    :on-close $ fn (event)
      println |close
    :on-error $ fn (error)
      println error

ws-edn.client/ws-send! |demo-data

ws-edn.client/ws-connected?
; => true or false

; "use in onreload! to bind a new listener"
ws-edn.client/ws-set-on-data! $ fn (data)
  println data
```

`ws-connect!` now returns a nominal `WsClient`. Prefer lifecycle methods when
the caller owns the connection:

```cirru.no-check
let
    client $ ws-edn.client/ws-connect! |ws://localhost:5001 $ {}
  client .connected?
  match (client .send $ {} (:kind :ping))
    (:sent) nil
    (:not-open phase) (println |send-skipped phase)
  client .reconnect
  client .close
```

Each reconnect advances an internal generation before replacing the host
socket. Late `open`, `message`, `close`, and `error` events from an older socket
are ignored, so a stale callback cannot close or feed data into the active
connection. Browser clients now reuse `Cumulo/cumulo-util.calcit` `0.0.17`:
visibility and online recovery signals reconnect only after the active client has
reached `:closed`. This preserves single-flight connection attempts, and `.close`
removes the lifecycle listeners and timers. Protocol-specific heartbeat messages
and resync hooks still belong to the caller.

`ws-connect!` 现在返回名义类型 `WsClient`。连接所有者可优先使用
`.connected?`、`.send`、`.reconnect` 与 `.close` 方法；旧的单例函数继续兼容。
每次重连会先提升 generation，再替换宿主 WebSocket，因此旧连接迟到的
`open/message/close/error` 事件不会污染当前连接。浏览器端现复用
`Cumulo/cumulo-util.calcit` `0.0.17`：可见性和 online 恢复信号只会在 client
已经进入 `:closed` 后触发连接，保持 single-flight；`.close` 会清理 lifecycle
listener 与 timer。

Unexpected close now enters an explicit `:backoff` phase and schedules one retry.
The immutable Cumulo backoff state is configurable through `:retry-base-ms`
(default `500`), `:retry-max-ms` (default `30000`), and `:retry-jitter` (default
`0.2`). A successful open resets the attempt counter. Manual reconnect and
visible/online recovery cancel a pending timer before connecting immediately;
explicit close cancels it without reconnecting. Protocol resync hooks remain
follow-up work.

意外 close 现在进入显式 `:backoff`，并且最多只保留一个重连 timer。可通过
`:retry-base-ms`（默认 `500`）、`:retry-max-ms`（默认 `30000`）和
`:retry-jitter`（默认 `0.2`）配置 Cumulo 的不可变 backoff 状态。连接成功会
重置 attempt；手动重连和 visible/online 恢复会先取消 timer 再立即连接；显式
close 只清理而不会再次连接。协议 resync hook 留在后续阶段。

Browser clients may opt into a generation-safe heartbeat deadline with
`:heartbeat-timeout-ms`. The deadline starts after `open` and is renewed by every
inbound message. When it expires, ws-edn closes only the active socket and lets
the normal bounded-backoff path reconnect it. The option is disabled by default,
so protocols that legitimately stay silent retain their existing behavior.
Explicit close and generation replacement both cancel the pending heartbeat
timer and lease.

浏览器 client 可通过 `:heartbeat-timeout-ms` 选择启用 generation-safe 的心跳
deadline。连接 `open` 后开始计时，每条入站消息都会续租；超时后 ws-edn 只关闭
当前 generation 的 socket，再由已有的有界 backoff 流程重连。该选项默认关闭，
因此允许长时间静默的旧协议不会改变行为。显式 close 与 generation 替换都会清理
待执行的 heartbeat timer 和 lease；协议层的 ping/pong 与 resync hook 仍由调用方
定义。

Typed decoding for application data:

`ws-edn.schema/Track` is a nominal Struct. Use the built-in `decode-map-as`
boundary when a received map has a known shape; missing required fields and
wrong field types fail before application code consumes the value.

```cirru
ws-edn.schema/decode-track $ {} (:message |hello) (:time |now)
```

Keep open protocol payloads as `Dynamic` only at the WebSocket/JS boundary and
decode them into a named Struct or Enum as soon as their shape is known. Do not
reintroduce the removed `calcit-test`, `lilac`, or `memof` modules.

The module snapshot targets Calcit 0.13.77. Its local `when-let` macro declares
an explicit syntax/expansion contract. `ws-send!` always returns `Unit`; the
method-oriented `.send` returns `WsSendOutcome` instead of leaking JavaScript
`WebSocket.send` results.

模块 Snapshot 已迁移到 Calcit 0.13.77；本地 `when-let` 明确声明 syntax 与
expansion。`ws-send!` 始终返回 `Unit`，方法形式 `.send` 返回
`WsSendOutcome`，不会把 JavaScript `WebSocket.send` 的返回值泄漏到公开 API。

Legacy class mapper (for compatibility with older payloads):

```cirru.no-check
  :class-mapper $ {}
    :Person Person
```

Deps:

```bash
yarn add nanoid
```

### WSS

add in options to enabled WSS mode:

```cirru
{}
  :key "./path-to.pem"
  :cert "./path-to.pem"
```

### License

MIT
