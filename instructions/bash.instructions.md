---
applyTo: "**/*.sh,**/*.bash"
---

# Bash Coding Rules

# Shebang & Execution

- Use `#!/usr/bin/env bash` as the shebang line.
- Always `chmod +x` your scripts and verify execution bits.

# Variables & Naming

- Use lowercase for internal variables (unless they're true constants, then UPPERCASE).
- Prefix global variables with a script‑specific namespace (e.g. `myapp_foo`).
- Quote all variable expansions: `"$var"` (avoid unintentional word‑splitting/globbing).

# Imports & Dependencies

- Source helper libraries explicitly: `source /path/to/lib.sh` (no implicit assumptions).
- Check for required external commands at script start (`command -v jq >/dev/null || exit 1`).

# Code Style

- Follow Single Responsibility Principle: one function, one task.
- Use guard clauses to reduce nested `if` blocks.
- Avoid magic numbers—define named constants at top.
- Prefer `[[ … ]]` over `[ … ]` for test expressions.

# Logging & Output

- Use a `log()` function with levels: `debug()`, `info()`, `warn()`, `error()`.
- Write logs to stderr by default.
- Never use bare `echo` for error messages.

# Configuration

- Use XDG base dir to store config files: `$XDG_CONFIG_HOME/myapp/config.sh`.
- Validate and sanitize all config values after loading.

# Comments & Documentation

- Write a module‑level header comment: purpose, author, license.
- Use function‑level doc comments (describe params, outputs, side‑effects).
- Don't comment obvious code; explain _why_, not _what_.

# Error Handling

- `set -o errexit -o nounset -o pipefail` at top.
- Check return codes explicitly when calling external commands.
- Use `trap 'cleanup; exit $?' EXIT` for resource cleanup.
- Create and throw custom error codes with meaningful messages.
- Use descriptive error messages.

# Security

- Sanitize all user inputs: reject or escape metacharacters.
- Avoid `eval`; if unavoidable, strictly validate input.
- Use safe file operations: `cp --target-directory="$dest"` etc.
- Prevent directory traversal: reject paths containing `..`.

# Performance

- Avoid subshells in hot loops—use built‑in shell constructs.
- Use `readarray` over manual `while read` for large lists.
- Batch external calls (e.g. group `grep` patterns).
- Profile with `time` and `shellcheck --profile`.

# Testing

- Use `bats-core` for unit tests; place tests in `tests/`.
- Mock external commands with `load 'test_helper/bats-mock.bash'`.
- Test both success and failure paths.
- Include type checks: `assert 1 -eq "$(bash -c 'echo $((2+3))')"`
