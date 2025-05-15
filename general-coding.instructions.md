#TODO:Use applyto all and exclude md files on general code
- [ ] Currently there is no way to disable the other files like md.


# General Coding Standards

## Project Structure

- Put code in `src/`.
- Put tests in `tests/`.
- Put docs in `docs/`.
- Put configs in `config/`.

## Code Style

- Follow Single Responsibility Principle (SRP).
- Follow DRY (Don't Repeat Yourself) principle.
- Prioritize code clarity over cleverness.
- Keep functions under 50 lines.
- Replace magic numbers with named constants.
- Use guard clauses to avoid nested conditionals.
- Avoid premature optimization.

## Comments & Documentation

- Write clear documentation for public modules, classes, and functions.
- Document parameters, outputs, and side effects.
- Explain why code exists, not what it does.
- Clarify complex logic.
- Don't comment on obvious code.

## Functions & Design

- One function, one responsibility.
- Validate parameters at function start.
- Prefer pure functions; separate stateful logic.
- Prefer immutable data structures.

## Error Handling

- Handle errors and edge cases at the beginning of functions.
- Use early returns for error conditions to avoid deeply nested statements.
- Keep error handling blocks minimal.
- Check return values from functions that might fail.
- Use descriptive error messages.

## Security

- Validate and sanitize all external inputs.
- Validate file paths and names.
- Prevent directory traversal by validating paths.
- Avoid executing unsafe code with untrusted input.
- Make sure secrets aren't printed or logged.
- Store secrets in a secure vault or service.

## Performance

- Profile code before optimizing.
- Choose appropriate data structures.
- Set timeouts on all blocking calls.

## Testing

- Mock external services in tests.
- Test error paths explicitly.
- Focus on important behaviors, not just coverage.
- Test both success and failure paths.
