# 客户端消息解析错误通知

关联 #53、Calcit #1529、Diary #62。原客户端先解析 EDN，再调用应用回调；解析失败发生在应用代码之外，现有 `:on-error` 无法观察这一失败。

## 边界

- `parse-client-message` 只负责文本类型检查，并在 try 内调用传入的 decoder，返回 `Result<Payload,String>`，`Payload` 由 decoder 决定。`connect-client!` 传入带 `:class-mapper` 的 `parse-cirru-edn`，成功值仍是开放协议数据，不假定业务 schema；错误只包含固定阶段信息，不包含原始帧或解析器诊断。
- `notify-client-error!` 复用原有 `:on-error` 与其开放宿主 callback 合同，错误参数为泛型 `E`，直接调用 `client-option-callback` 返回的 `Fn`，不再 `unsafe-coerce`。原 transport 事件按对象身份传递，消息错误为带 `[ws-edn/message]` 前缀的 JavaScript Error。
- 应用 `on-data` 与 `on-error` 在解析 try 之外执行；其异常不被吞掉或重新分类。缺少可调用错误处理器时仍明确抛错。
- generation、heartbeat、无数据订阅者、socket factory、singleton 和 legacy class mapper 保持已有行为；不新增 resync 策略、自动默认值或依赖版本。

## 验证

纯解析语义放在四组 Calcit definition `:tests`，与原九组 options 契约同 AST 回放到 JS。公开 socket factory 验证非文本帧、无效 EDN、脱敏、一次通知、应用异常身份、transport 身份和迟到 generation；真实双客户端网络验证坏帧后的合法消息继续交付。原 #52 非文本帧用例保持原断言。

使用 main 当前固定的 CLI/npm 0.29.0-alpha.19，不修改模块缓存。两个 entry、公开定义检查、20 项单元测试、JS 回放、Node host/network 与 Vite 构建均通过。

## 质量基线

早期版本把开放 EDN 的 `Dynamic` 写进 helper schema，并在通知 helper 中 `unsafe-coerce` 回调，旧 `config/calcit-quality.cirru` 报告五项按 definition 的回归。现在 payload 类型交给 decoder 泛型，开放 `Dynamic` 只留在 `connect-client!` 原有的宿主/EDN 边界；通知 helper 用泛型错误参数并直接调用 `Fn`。两个 helper 的预算全部为 0，基线未修改，`unsafeCoerce` 总数从 21 降到 20。

仍需正式发布模块，由 Diary 正常升级并验证保留旧状态和有界恢复。
