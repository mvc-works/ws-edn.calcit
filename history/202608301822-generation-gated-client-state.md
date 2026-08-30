# Generation-gated WebSocket client / 基于 generation 的 WebSocket 客户端

## English

- Replaced the browser singleton's raw `WebSocket` value with a nominal
  `WsClient` carrying `WsClientState` (`generation`, lifecycle phase, and an
  optional host socket).
- Added method-oriented lifecycle APIs: `.connected?`, `.send`, `.close`, and
  `.reconnect`. The compatibility singleton helpers delegate to the same typed
  implementations.
- A reconnect increments the generation before closing or replacing the old
  socket. Every host callback captures its generation and ignores stale
  `open`, `message`, `close`, and `error` events.
- `.send` returns the typed `WsSendOutcome` instead of leaking the JavaScript
  return value. The legacy `ws-send!` contract remains `Unit`.
- Added pure generation/transition tests and a generated-JS fake-socket smoke
  test that reproduces late events across reconnects. CI runs this smoke after
  compiling the page entry.
- Upgraded the exact Calcit / `@calcit/procs` pair from 0.13.64 to 0.13.66 and
  documented the architecture and migration surface.

## 中文

- 将浏览器端单例中裸露的 `WebSocket` 替换为名义类型 `WsClient`；其内部
  `WsClientState` 明确记录 generation、生命周期阶段和可选宿主 socket。
- 新增 `.connected?`、`.send`、`.close`、`.reconnect` 方法；兼容层的单例
  函数复用同一组类型化实现。
- 重连会在关闭或替换旧 socket 之前先提升 generation。所有宿主回调捕获
  自己的 generation，并忽略旧连接迟到的 `open/message/close/error` 事件。
- `.send` 返回类型化的 `WsSendOutcome`，不泄漏 JavaScript 返回值；旧
  `ws-send!` 继续保持 `Unit` 契约。
- 增加纯 generation/transition 单测，以及基于生成 JS 与伪 socket 的重连
  smoke；CI 在页面入口编译后执行该回归。
- 将 Calcit 与 `@calcit/procs` 精确同步从 0.13.64 升级到 0.13.66，并补充
  架构和迁移文档。
