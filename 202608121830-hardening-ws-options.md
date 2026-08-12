# 2026-08-12 18:30

- 新增 `WsOptions` 与 `WssOptions` Struct，明确 WebSocket 回调、证书和 class mapper 的 Option 类型。
- `ws-connect!`、`maintain-socket!`、`wss-serve!` 标注 JS FFI 边界，并将客户端 class mapper 改为 Struct 字段访问。
- 通过 `cr --check-only`；客户端页面生成和 Vite 构建成功。服务器端仍保留 11 个 unresolved Dynamic 审计项，但不再有结构字段警告。
