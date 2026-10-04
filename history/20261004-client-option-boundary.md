# 修正客户端 Option callback 边界

这轮处理 Respo #194 下游 Cumulo Reel CI 暴露的 ws-edn 依赖阻塞。本地分支先前已经修正 `WsClient` / `WsClient0` 与 state handle 合同；客户端新产物还被两条 `reset! Option<Fn>` 告警阻止。

## 变更与证据

通过正式 Calcit CLI，将 23 个定义/测试的旧 Option/Result 构造迁移到具名构造。两个 reset 告警随之消失，没有改变 Ref、callback arity 或连接行为。

`client-option-callback` 在 `fn?` 之后直接返回 Fn；`ws-set-on-data!` 的参数本身已经声明为 Fn，因此去掉两处重复的 `unsafe-coerce`。新增测试确认缺失、Number、Tag 返回 None，以及零参数/一参数函数保留原函数值。

默认入口显式声明 browser、server 入口声明 node，让公开定义检查可以验证完整命名空间；CI 接入了带覆盖完整性断言的公开定义门禁。

新增真实网络回归首先复现了缺省 callback 返回 `%none` 函数而不是 Enum 的错误。四处缺省值改为具名 None，并按对应 callback 合同标注空 Option 的类型上下文。服务端 session ID 原先强转 nanoid 函数对象，现在调用 `new-session-id!` 生成并用 `string?` 校验实际返回值，消除该强转。

网络回归使用两个真实 WebSocket 客户端和随机 loopback 端口，验证不同非空 String ID、Unicode/嵌套列表/nil/匿名 Enum 的 EDN 往返，以及关闭后注册表清空；资源由测试 hook 清理。该回归已接入 CI。

## 正式 0.28 本地复核

- 客户端与服务端入口严格检查通过。
- 原生附属测试 12/12；其中 5 项为新 callback 合同测试。
- 客户端/共享公开定义 34/34，服务端/共享公开定义 23/23，均无诊断且 complete=true。
- 新生成客户端 JS 的 generation/lifecycle/singleton 回归通过。
- 新生成服务端 JS 的 Node Buffer/Date 回归 2/2；Node 24 Vite 生产构建通过。
- 真实客户端/服务端 WebSocket 回归 1/1，通过 EDN 往返、会话隔离与清理。
- 原质量基线通过，unsafeCoerce 27/30，deprecatedCalls 为 0；没有提高预算。

验证链接固定到发布缓存：JS-FFI alpha.11 (`799e707`，要求 Calcit 0.28 alpha.3) 和 cumulo-util 0.0.23 (`bf21934`)；正式 Calcit 0.28 满足此工具链下限。未使用刚同步到 alpha.2 的 JS-FFI main，也未改写共享缓存。测试输出、生成 JS 和临时 JSON 都没有入库。

这些源码回归没有替代 Caps 严格依赖解析、TLS 或真实浏览器页面验证。下游消费的发布版本还需要合并、发布并更新清单；不据本地成功关闭 milestone。
