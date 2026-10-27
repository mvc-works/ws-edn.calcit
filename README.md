
ws-edn in calcit-js
----

### 使用者需要注意

候选 `0.0.49` 配对正式 Calcit CLI / `@calcit/procs` `0.31.0`、已发布
Cumulo Util `0.0.33` 和 JS FFI `0.2.7`。消费者需同步完整精确版本图并重新生成 JS；
0.30.1 使用者继续用已发布的 `0.0.48`。本提交不等于新 tag 已发布，不以 main/hash
替代发布依赖，不放宽 Caps strict、proof audit 或原类型门禁。

客户端状态更新保留当前方法写法；WsClient 与既有测试的构造改用直接构造器，
Demo 的 Track mapper 使用真实空 Track 值。生命周期清理 Ref 明确存储
`Option<Fn() -> Unit>`，与 Util 的真实返回合同一致；协议、重连、心跳及清理顺序不变。

两处浏览器宿主断言改为 `js-cast` 成员检查；缺少声明成员的非法宿主替身会更早失败。
原生成 JS 夹具的全局 WebSocket 构造器替身补齐 native 本有的四个初始事件槽，原断言保留。
MessageEvent 的 data 声明纠正为真实 raw 值，仍由原 `parse-client-message` 的 `string?`
检查及 Result 合同收敛，保留非文本拒绝、脱敏错误和 callback 异常；不放宽业务 payload。
Node Buffer 不属于可 `js-cast` 的宿主，原窄转换及 String 结果检查继续保留，见
[JS FFI #191](https://github.com/calcit-lang/js-ffi/issues/191)，不伪装成 JsObject。

修复旧 `ws-edn.util/when-let` 将 `first` 的 Option 当作符号展开的问题，见
[#79](https://github.com/mvc-works/ws-edn.calcit/issues/79)。兼容 helper 保留 nil 语句语义，
绑定只求值一次，false 仍执行正文；新代码优先使用 core 的 Option `when-let`。
若使用本库的旧 helper，请用显式 namespace alias 区分同名宏。仅增加一项真实缺陷回归，
复用现有 native/生成 JS 检查，不增加独立脚本或编译器改写规则。

原完整 strict、分入口公开检查、unit、客户端 generation/retry/heartbeat/cleanup、
Node 宿主、真实 WS/WSS 回环、HTTPS health、文档和 Vite 构建继续执行。
宿主网络回归使用 127.0.0.1、合成数据和显式信任的临时证书，不部署或重启业务服务。

### 现有接口与边界

客户端和服务端 options 保留 `Map<Tag,Dynamic>`，外层容器不擦除，异构值保持开放。
Number 的零/负数/小数、String 的空串/Unicode 和缺失/非法值返回 None 的行为不变。
回调读取的 `fn?` 只证明 callable kind，不能证明 arity 或返回类型；九处既有回调恢复点
仍如实审阅，不把开放 Fn 强装成已完成的签名证明。与一处 Buffer 信任边界合计仍有
十处 unsafe，本迁移不宣称零类型债务。

线上 EDN、端口、TLS 配置、可选 :host 绑定及 class-mapper 合同保持。
Node `writeHead` / `addListener` 继续沿用准确 trait 映射；严格检查与静态容器拒绝仍是门禁，
`weak-types` 仅提供诊断，不通过旧计数或预算例外替代检查。Yarn 新包安装隔离期保持一小时。

### Usages

The server and browser connection snippets require their Node/WebSocket hosts, so
they are marked `cirru.no-check`. CI validates both generated entries and runs the
executable client generation/lifecycle smoke; host-independent data snippets below
remain checked by `calcit docs check-md`.

Server side:

`wss-serve!` 新增可选 `:host` String，例如 `:host |127.0.0.1` 用于只接受回环连接。
WS 和 TLS 都传递该地址；省略时保留 Node 原默认监听行为，不会自动变为回环。
显式提供非 String 的 host 会报错，不会悄悄退回默认监听。
地址值交由 Node 解析；空字符串等值不等同于回环隔离，请明确写 `127.0.0.1`。
线上协议、端口、生命周期回调及 class-mapper 不变；这不是认证、授权或 sandbox。
原双客户端用例改为显式回环并检查实际绑定地址；同一测试文件补充 TLS health/WSS Unicode 往返，
使用临时证书的显式 CA 信任，不关闭证书校验，不增加独立验证脚本。

```cirru.no-check
ws-edn.server/wss-serve! 5001
  {}
    :host |127.0.0.1
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
connection. Browser clients reuse `Cumulo/cumulo-util.calcit`:
visibility and online recovery signals reconnect only after the active client has
reached `:closed`. This preserves single-flight connection attempts, and `.close`
removes the lifecycle listeners and timers. Protocol-specific heartbeat messages
and resync hooks still belong to the caller.

`ws-connect!` 现在返回名义类型 `WsClient`。连接所有者可优先使用
`.connected?`、`.send`、`.reconnect` 与 `.close` 方法；旧的单例函数继续兼容。
每次重连会先提升 generation，再替换宿主 WebSocket，因此旧连接迟到的
`open/message/close/error` 事件不会污染当前连接。浏览器端现复用
`Cumulo/cumulo-util.calcit`：可见性和 online 恢复信号只会在 client
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

模块 Snapshot 使用 Calcit 0.31.0-alpha.6；本地 `when-let` 明确声明 syntax 与
expansion。`ws-send!` 始终返回 `Unit`，方法形式 `.send` 返回
`WsSendOutcome`，不会把 JavaScript `WebSocket.send` 的返回值泄漏到公开 API。

### 客户端 options 合同

`ws-connect!`、`create-client-with!` 与客户端句柄中的 options 使用
`Map<Tag, Dynamic>`：配置键是 Tag，值可以是不同 arity 的回调或 Number。
两个读取 helper 保留 `fn?` / `number?` 检查，不把容器合同当作字段值验证。
数值缺失、String、Bool 和 nil 返回 None；零、负数和小数按原 Number
合同返回 Some，重试策略仍由原 backoff 实现负责，不在读取时猜默认值。

开放输入应先在调用方验证为 Tag-keyed Map，再传入连接入口；不使用
`assert-type` 或 unsafe 冒充转换。直接从 JavaScript 调用绕过静态合同
时，非 Map 输入仍会在读取阶段失败，连接接口不承担任意宿主对象的深层解码。

执行 `yarn check:unit` 验证附带契约，再生成页面 JS 并运行
`yarn check:client-generation`：同一组数值/回调 `:tests` 会在临时 Snapshot
中回放，保留原源码字节，并验证错误容器/键类型的静态拒绝以及原连接生命周期。

### 客户端消息错误边界

已注册 `:on-data` 的客户端收到非文本帧或无效 Cirru EDN 时，会把一个
JavaScript `Error` 交给现有 `:on-error`，且不调用 `:on-data`。错误的
`message` 以 `[ws-edn/message]` 开头，只说明“需要文本消息”或“EDN 无效”，
不包含原始帧、解析器详情或凭证。transport 的 `onerror` 仍传递原始宿主事件，
不重新包装；因此原有错误回调入口不变，也没有新增平行配置项。

没有可调用的 `:on-error` 时，非法帧仍抛错，但改为上述经过脱敏的消息。
合法 EDN（包括 nil 和 false）只交付一次；`:on-data` 和 `:on-error`
自身的异常继续向外传播，不会被当成解析失败再次通知。旧 generation 的迟到
消息继续忽略；未注册 `:on-data` 时保留只续租 heartbeat、不解析 payload 的行为。
原有 `:class-mapper` 继续传给解析器，不代表业务 payload 已取得具体类型证明。

应用在自己的错误回调中决定是否保留旧状态、请求快照或有界重连；模块不会猜测
业务默认值、自动重试解析或修改应用状态。用 `yarn check:unit` 查看定义附带的
消息契约，`yarn check:client-generation` 用公开 socket factory 验证通知次数、
错误脱敏、回调异常身份和生命周期隔离。

### 0.28 类型边界迁移（历史记录）

Calcit CLI 与 `@calcit/procs` 对齐到 0.28.0，JS-FFI 声明升级到
0.2.1-alpha.11。Node HTTP/WebSocket 事件与可选 callback 使用源码类型 `Fn`；
`DynFn` 是编译器内部名称，写成源码 symbol 会被当作未绑定的类型名称，不能代表
开放 callable。这个事件接口允许不同 arity 的函数，不承诺每个事件的 payload 已验证。
可选 callback 仍在运行时用 `fn?` 检查，Number、Tag 和缺失值都不会被注册。

旧 `%some/%none` 构造曾在 `reset! Option<Fn>` 写入处触发两条合同告警。
迁移为具名 Option 构造后，正式 0.28 的客户端新生成 JS 已通过
generation/lifecycle 回归，覆盖旧 generation 回调隔离、重试、heartbeat、
cleanup 与 singleton Ref。已有 `fn?` 证明及 Fn 参数合同消除了两处强制转换；
callback 保留开放 arity，没有缩窄为单一回调签名。

当时的正式工具链通过 12 项附属测试、两个入口严格检查、客户端/共享公开定义
34/34、服务端/共享公开定义 23/23，以及两项 Node Buffer/Date 回归。
随机本地端口的真实双客户端网络回归确认 EDN 往返、不同 String session ID 和连接清理。
服务端调用 nanoid 后校验 String，不再把函数对象当作 session ID；四处缺省 callback
返回具名 None，避免事件处理把函数值当作 Enum。
质量基线通过，unsafeCoerce 从 30 降至 27，废弃调用为 0，预算未放宽。
本地链接现已固定到发布的 JS-FFI alpha.11 与 cumulo-util 0.0.23，未修改缓存。
完整 Caps 严格依赖解析仍应以远端 CI 为准；本地网络回归不覆盖 TLS 或真实浏览器页面。

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

### 限制

- 当前公开配对使用 Calcit 预发布工具链，不代表稳定 0.31 已完成。
- 当前网络回归验证本地 WS/WSS 和 HTTPS health，不覆盖真实浏览器页面。
- 既有宿主边界及混合协议载荷保持开放，不代表深层业务数据已取得具体类型证明。
- 本模块不承诺 WASM 后端支持；浏览器/Node 生成 JS 是本次验证目标。

### License

MIT
