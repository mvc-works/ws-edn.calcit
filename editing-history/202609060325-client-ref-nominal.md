# Singleton nominal client / 单例客户端具名类型

Issue: https://github.com/mvc-works/ws-edn.calcit/issues/33

Current checkpoint: cumulo-util 0.0.18 is now published from verified main
5fd2a5634a2f9fa920b99fea9ce0568f7864dd69 (Action 34006419742). The formal
manifest now pins that release plus js-ffi 0.1.12; no local source override is
used. Strict Caps/toolchain, client/server generation, all four unit tests,
generation/heartbeat/singleton smoke, production build and unchanged quality
baseline pass. The unreleased core Ref checker also accepts both entries with
these formal dependencies. Earlier unresolved/publication notes below are
historical. Module release and Calcium consumer acceptance still require review,
green Actions, exact main validation and a separate ws-edn release.

上游 0.0.18 正式发布后已替换临时联调依赖，现用纯发布版本通过模块验证；
新核心检查器也通过两个入口，等待本 PR review/CI，不提前声称应用验收完成。

Base: published 0.0.25, main 43e9719. Work is isolated from the existing dirty
checkout and all other worktrees. No dependency versions or installed caches
were edited; caps --strict resolves the unchanged cumulo-util 0.0.17 dependency.

The unreleased core Ref-write validator exposed a singleton write whose inferred
payload had become a generic name after `assert-type client 'WsClient0`.
Qualified type names alone traded that warning for a lifecycle argument mismatch.
The final local change uses actual WsClient0 and WsClient definition values,
restores the trait-bearing nominal type before storing the client, qualifies the
global Ref schema, and returns the already-typed local. This does not add an
unsafe coercion or alter connection behavior.

Query evidence at the final `%some client` changes from generic confidence with
no methods to exact nominal confidence with WsClientOps methods. The underlying
struct still displays WsClient0; the attached .close/.connected?/.reconnect/.send
methods are retained.

Published Calcit 0.13.77 JS generation passes, the extended fake-socket singleton
regression passes (connect, replace/close previous, state queries, explicit close),
existing generation/lifecycle smoke passes, and all four native unit tests pass.
Canonical formatting makes no changes and git diff --check passes.

With the unreleased core compiler, the singleton Ref warning is gone; entry
preprocessing still fails on two ws-edn timer writes and one cumulo-util.activity
timer write. Those remaining errors are not suppressed and this module is not
ready for release. The core/public diagnostic publication permission remains
unresolved; no issue, PR, push, merge or release was attempted here.

未限定的带引号类型名会丢失具名结构和方法证据；改为实际类型定义，并在写入 Ref
前恢复带 trait 的客户端类型。新回归验证单例生命周期，正式依赖版本保持不变。
新编译器下仍有三个 timer 告警，不能以旧编译器测试通过宣称严格迁移完成。

## Browser timer follow-up

Reused the already-published js-ffi 0.1.12 `set-timeout!` contract, adding it as
an explicit runtime dependency and default-entry module. Both reconnect and
heartbeat scheduling now use that adapter. Their callbacks explicitly return
Unit; the typed adapter caught the reconnect callback's previous implicit
optional-Unit result. No additional unsafe coercion was added in ws-edn, and
generation checks, cancellation, delay selection and backoff state are unchanged.

caps --strict resolves the two published dependencies. The architecture planner
cannot resolve dependency definitions, so the local plan records the external
contract in its description and validates only the two owned functions; dry-run
now succeeds with no operations or diagnostics. Published 0.13.77 client/server
JS generation, four unit tests and the generation/heartbeat/singleton smoke all
pass. Formatting is unchanged; git diff --check passes.

The new core validator now reports only the remaining cumulo-util.activity touch
timer warning when preprocessing ws-connect!. This is not a clean module check
and not a release claim. The provider must be fixed and published through its
own review/Actions gates before final dependency validation and release.

两处定时器复用已发布的浏览器类型化接口，回调明确返回 Unit，现有重连/心跳/
单例回归通过。新编译器下告警从三条降为一条，剩余属于 cumulo-util，未屏蔽。

Local integration follow-up: an ignored copy of the snapshot now loads the
isolated cumulo-util timer fix through an explicit local module path. With the
unreleased core Ref validator, page preprocessing and JS generation succeed,
then the full generation/heartbeat/singleton smoke succeeds on that fresh output.
All four observed Ref-write warnings are gone in this local combination. Formal
deps.cirru still pins published cumulo-util 0.0.17; release/consumer acceptance
must wait for reviewed, green upstream releases and exact-version resolution.
