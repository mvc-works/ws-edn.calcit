# 客户端 options 的容器证明

关联本仓库 #47、Diary #69 与 Calcit #1529。正式 ws-edn `0.0.33` 的
`client-option-number` 在下游 alpha.6 完整 strict workflow 被拒绝：
输入声明 Dynamic，却直接调用 `&map:get`。这不是 Optional 字段误报，
也不应靠扩大编译器证明规则或修改消费者缓存解决。

从真实页面调用、公开文档、工厂与现有生命周期/网络测试确认 options
本来就是 Tag-keyed Map；异构 callback 和 Number 值则保持 Dynamic。
修正 `WsClient0.options`、连接入口、工厂与两个 helper 的容器合同，
不改 runtime 函数体、Ref 身份、socket 创建或默认重试行为。

保留 `fn?` / `number?` 检查：开放 callable arity 不被伪装成特定签名；
缺失或错误 Number 值仍返回 None，零、负数、小数不被替换为默认值。
直接 JS 调用不做额外的容器 key 深度解码，绕过静态合同的非 Map 仍在
原读取阶段失败。动态来源需要调用方在真实边界校验，而不是添加 assert/unsafe。

新增四个数值 definition `:tests`，原五个 callback 测试未变。
扩展既有 generation runner，以 CLI transaction、dry-run 和 revision
守卫在临时 Snapshot 中回放九个原 AST；复制正式依赖意图，只链接已安装
模块，独立保存本机状态，结束后校验 canonical Snapshot 字节不变。
八个错误容器/键测试必须报参数类型错误，不能以 import/解析错误冒充拒绝。

本地正式 Calcit/procs `0.28.0` 下，16 个 native 测试、两个入口检查、
客户端/共享 34/34 与服务端/共享 23/23 公开定义、同源 JS 回放、原
generation/singleton/retry/heartbeat/cleanup、Node Buffer/Date 和随机本地
端口的真实双客户端 EDN 回归通过。质量基线未改，废弃调用为零，Vite
页面构建通过。已发布 alpha.6 的两个 helper 参数来源证明也通过。

保持模块原工具链 pin，未发布工作树不冒充正式版本。PR review、原 CI、
精确 main CI 和正式模块发版之后，Diary 才升级到新 tag 并重验完整门禁。
其他 core、JS FFI 与业务 state 诊断仍需逐项解决，本修复不代表 Diary 全部迁移完成。
