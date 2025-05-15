# Pull Request Description Guidelines

## PR Title Format

- Use a PR title limited to 72 characters.
- Start the title with a valid type prefix (e.g., `feat:`, `fix:`, `chore:`, `docs:`).
- Place a colon and a space immediately after the prefix.
- Add an optional scope in parentheses, e.g., `feat(api):`.
- Write the PR title in the imperative mood, e.g., "add feature" not "adds feature".
- For breaking changes, add a `!` before the colon, e.g., `feat!:` or `feat(api)!:`.

## PR Description Structure

The PR description should be structured as follows:

```
## Description

Brief description of the changes made.

## Motivation

Why is this change necessary? What problem does it solve?

## Implementation Details

Key technical implementation details or approach taken.

## Testing

How were the changes tested? What tests were added?

## Related Issues

Fixes #123
Related to #456

## Breaking Changes (if applicable)

Description of breaking changes and migration path.
```

## Additional Guidelines

- Link your PR to related issues using GitHub keywords (Fixes, Closes, Resolves).
- Include screenshots or videos for UI changes.
- Add annotations for complex changes to help reviewers.
- Include any necessary documentation updates.
- Address potential performance implications.
- Note any follow-up work that will be done in separate PRs.

## Type Prefixes

Following conventional commits specification:

- **feat:** A new feature
- **fix:** A bug fix
- **docs:** Documentation only changes
- **style:** Changes that do not affect the meaning of the code
- **refactor:** A code change that neither fixes a bug nor adds a feature
- **perf:** A code change that improves performance
- **test:** Adding missing tests or correcting existing tests
- **build:** Changes that affect the build system or external dependencies
- **ci:** Changes to CI configuration files and scripts
- **chore:** Other changes that don't modify src or test files

## Examples

### Feature PR with scope

```
feat(authentication): implement OAuth2 login flow

## Description
Adds OAuth2 authentication support using Google and GitHub providers.

## Motivation
Users have requested social login options to simplify the registration process.

## Implementation Details
- Added OAuth2 client configuration
- Created authentication middleware
- Implemented user profile mapping from OAuth providers
- Updated login UI to show social login options

## Testing
- Added integration tests for OAuth flow
- Manual testing with Google and GitHub accounts
- Verified error handling for authentication failures

## Related Issues
Closes #142
```

### Breaking Change PR

```
feat(api)!: change response format for user endpoints

## Description
Changes the response structure of all user-related endpoints.

## Motivation
The new response format is more consistent with REST best practices and
simplifies client-side processing.

## Implementation Details
- Updated all user controller response mappings
- Added response transformation layer
- Updated documentation

## Testing
- Updated all affected API tests
- Verified backward compatibility support functions

## Related Issues
Resolves #256

## Breaking Changes
User endpoint responses now return data wrapped in a standardized envelope:

OLD:
{
  "name": "John",
  "email": "john@example.com"
}

NEW:
{
  "data": {
    "name": "John",
    "email": "john@example.com"
  },
  "meta": {
    "timestamp": "2025-05-15T12:00:00Z"
  }
}

Migration: Update client applications to access user data via the "data" property.
```
