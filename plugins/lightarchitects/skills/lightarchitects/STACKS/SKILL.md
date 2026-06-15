---
name: STACKS
description: LA technology stack map — Rust MCP servers, SvelteKit web, SOUL helix vault, error conventions, build commands, anti-patterns
skill_id: lightarchitects/STACKS
context: reference
---

# LA Technology Stack Reference

## Project Map

> Path authority: check each project's own `CLAUDE.md` for exact binary paths and deploy details. This skill covers conventions only.

| Project | Stack | Deploy verb |
|---------|-------|-------------|
| CORSO, EVA, SOUL, lightarchitects-sdk | Rust MCP (stdio JSON-RPC) | `make deploy` |
| QUANTUM | Rust MCP | `cargo make deploy` — uses Makefile.toml, **not** regular make |
| SERAPH | Rust MCP — dual-binary: Mac bridge + Khadas ARM64 | `make deploy-mac` (Mac) · SSH+rsync (Khadas) |
| AYIN | Rust 2-crate, HTTP dashboard :3742 | `make deploy` + `launchctl kickstart` |
| Berean | SvelteKit 2 + Svelte 5, Neo4j, pnpm monorepo | `pnpm dev` · `pnpm build` |
| Webshell | SvelteKit UI + Rust executor | `pnpm build` + Rust `make deploy` |

## Crate Architecture (Rust MCP)

All MCP servers follow the Trinity V7.0 pattern:
- `stdio JSON-RPC` transport (no HTTP for MCP, HTTP only for AYIN dashboard)
- `serde_json` for serialization; `tokio` async runtime (not `async_std`)
- `SkillError` variants over `anyhow::Error` for recoverable errors
- Handler size target: ≤60 lines. Split into sub-handlers if exceeded.

**Dependency direction**: EVA + CORSO → `soul` (path dep). SOUL → `ayin` (optional, feature-gated). Others standalone.

## Error Handling

Rust MCP handlers: `?` + `SkillError` enum variants. SvelteKit: `error()` helper / `json({error}, {status})`. Never `.unwrap()`, `.expect()`, `panic!()` in production.

## Build Commands (quick ref)

| Project | Quality gate | Deploy |
|---------|-------------|--------|
| CORSO, EVA, SOUL, SERAPH, lightarchitects-sdk | `make quality` | `make deploy` |
| QUANTUM | `cargo make quality` | `cargo make deploy` |
| SvelteKit (Berean, Webshell) | `pnpm test:run && pnpm exec svelte-check --threshold error` | `pnpm build` |

After any Rust rebuild: `/mcp` in Claude Code to reconnect.

## Common Anti-patterns (avoid)

- `unwrap()`/`expect()` — causes panics in stdio MCP servers, kills the connection
- Global mutable state — use message-passing or `Arc<Mutex<>>` with careful scoping
- Oversized handlers — split before 60 lines; complexity gate at ≤10
- `async_std` — tokio only throughout the stack
- Manual `serde` impl — derive always; manual only with `// SERDE:` justification comment
- Blocking in async context — wrap with `tokio::task::spawn_blocking`
