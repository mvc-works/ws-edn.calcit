# ws-edn Agent Guide

This file defines the safe workflow for editing this repository with Calcit CLI.

## Mandatory First Step

Before any `calcit edit` or `calcit tree` change, run:

```bash
calcit docs agents --full
```

Do not start structural edits before reloading the latest agent guidance.

## Documentation Source of Truth

Use `calcit docs` as the documentation entrypoint.

- Use `calcit docs search <keyword>` for lookup.
- Use `calcit docs read <filename>` for reading details.
- Do not depend on local guidebook files as the primary source.

## File Editing Rules

- Do not directly edit `compact.cirru` or `calcit.cirru` with text replacement.
- Use structured commands first:
  - `calcit edit ...`
  - `calcit tree ...`
- If `compact.cirru` was manually changed, run formatting before commit:
  - `calcit edit format`

## Runtime Model

This project has two entries:

- default page entry: `ws-edn.app.page/main!`
- server entry: `server` (`ws-edn.app.server/main!`)

Current `calcit` behavior is once-by-default. Use `-w` to watch.

## Project Commands

### Dependency and toolchain

```bash
calcit --version
caps outdated --yes
caps
corepack enable
corepack prepare yarn@4.12.0 --activate
yarn install --immutable
```

### Build commands

```bash
calcit js
yarn compile-page
yarn compile-server
yarn vite build --base=./
```

### Watch commands

```bash
yarn watch-page
yarn watch-server
```

## CI Parity Checklist

Match local verification to `.github/workflows/compile.yaml`:

1. `caps --ci && yarn install --immutable`
2. `yarn compile-page`
3. `yarn compile-server`
4. `yarn vite build --base=./`

## Upgrade Notes

When upgrading:

- Keep versions aligned:
  - `deps.cirru` `:calcit-version`
  - `package.json` `@calcit/procs`
  - `package.json` `packageManager`
- Keep `.yarnrc.yml` with:

```yaml
nodeLinker: node-modules
```

- Ensure `.gitignore` contains:

```gitignore
.yarn/*.gz
```

## Common Pitfalls

- Record/struct shape mismatch can crash runtime deserialization, for example field-count mismatch errors.
- If schema fields changed, update all `%{} <Type>` constructors on both page and server paths.
- If `calcit js` reports warnings, codegen is blocked. Resolve all warnings before build.
