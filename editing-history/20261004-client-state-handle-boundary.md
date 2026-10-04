# 客户端状态句柄的类型边界

Diary 在正式 Calcit 0.28 下被 `assert-type client WsClient0` 阻挡：
工厂返回带 trait 的 WsClient，调用方却直接断言成原始结构。把所有内部
接收者改成 WsClient 会让固定 0.19.1 无法解析别名字段，因此不能采用。

保留内部函数的 WsClient0 字段契约，在生命周期入口和全局回调更新处
使用 `client-state-handle`：先检查 Struct、名义名称和完整字段集合，再
返回同一个句柄。没有复制状态或 Ref，没有新增 unsafe-coerce。这个检查
验证句柄布局；字段值仍由类型化工厂负责，不是任意外部数据的深层解码器。

工厂的五个空 Option 初始值在创建 atom 前明确 payload 类型。这样 Ref
从一开始就具有回调、计时器或心跳租约的正确类型，避免推导成
Ref<Option<Never>> 后再扩大可变引用类型。socket-factory 的宿主返回类型
改为完整命名空间引用。

原 `DynFn` 标注不是工具链认可的内建类型，改用内建 Fn；已有回调守卫和
转换位置保留。浏览器回调字段及回调 Option 采用同一个 callable 类型。

## 验证

- 从官方 0.19.1 tag 编译本机 CLI，并用该版本完成全部 Snapshot 编辑。
- 使用固定发布依赖图：页面和 server 严格检查、两个入口 JS 生成通过。
- 5 项 native 单元测试通过，包含非法值及其他名义结构拒绝。
- 重新生成页面 JS 后，客户端 generation / singleton / 重试 / heartbeat /
  lifecycle 回归通过。新增断言验证句柄身份不变，非法句柄不会安装监听器
  或计时器。
- 质量基线通过，预算未扩大；Node 24.19.0 下 Vite 前端构建通过。
- 接入独立 Diary 迁移快照后，候选 Calcit 0.29.0-alpha.1 的完整客户端
  main! / reload! 严格检查和 JS 生成通过；新输出的初始、离线、登录页
  SSR 内容检查通过。

正式 0.28 的 Diary 完整入口仍有 JS-FFI EventHost 回调及两个 add-watch
泛型回调警告；本修复不代表这些问题或浏览器实际交互已完成。版本 pin
保持原值，生成文件和临时报告不入库。
