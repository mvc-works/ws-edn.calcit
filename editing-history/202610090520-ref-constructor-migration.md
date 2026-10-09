# Ref 构造改用 ref 与 defref

- Calcit 升级到 0.29.0-alpha.19（`deps.cirru`、`@calcit/procs`、`.yarnrc.yml` 预批准版本），与其他 Respo/Cumulo 库对齐。
- 运行 `calcit calcit.cirru fix --rule core-ref-constructor-v1 --include-attached`，11 处机器可应用改写：3 处 `defatom` → `defref`，8 处 `atom` → `ref`；复查结果 `:changed false`。
- 三个全局 Ref 的 `:doc` 由 "Global atom" 改为 "Global Ref"。
- 本地跑通 CI 全部步骤：format、check-only（page 与 server）、check-public、dynamic-methods、quality baseline、`yarn check:unit`、`yarn check:deprecated`、README 片段检查、`yarn compile-page`。
