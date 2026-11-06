# 宿主事件回调写成具体签名

关联 Calcit #2613。Node `ws` / `https` 与浏览器 WebSocket 的宿主 trait 原先把事件回调写成 `AnyFn`，`.on` 的事件名和回调形状没有对应关系。

## 改动

- `NodeHttpServerHost`：`.add-listener` / `.on` 拆成 `.on-upgrade`（`Fn NodeHttpRequestHost JsObject JsObject`）和 `.on-error`（`Fn JsObject`）；`.listen` 回调为 `Fn (-> Unit)`。
- `NodeWebSocketHost`：`.on` 拆成 `.on-message`（`Fn NodeDataHost Bool`）、`.on-close`（`Fn Number JsObject`）、`.on-error`（`Fn JsObject`）。
- `NodeWebSocketServerHost`：`.on` 拆成 `.on-connection`（`Fn NodeWebSocketHost NodeHttpRequestHost`）、`.on-listening`、`.on-error`。
- 拆出的方法在 `:ffi :names` 里都映射回 JS 的 `on` / `addListener`，事件名仍作为第一个参数传入，生成的 JS 不变。
- `BrowserWebSocketHost` 的 `:onopen` / `:onmessage` / `:onclose` / `:onerror` 字段写成具体 `Fn`，`:onmessage` 接收 `BrowserMessageEventHost`。

剩余两处 `Option AnyFn` 是从开放 options Map 里取回调的解码边界，保持不变。

## 验证

0.35.1 CLI：两个 entry 的 `--check-only`、`--ns` 检查、strict `fix --verify`、dynamic-method 0 项、24 项单元测试、JS 编译后 Node host / 网络往返测试与 client generation 脚本通过。把 `.on-message` 回调改成三参数时报 `W_METHOD_ARG_TYPE_MISMATCH`。
