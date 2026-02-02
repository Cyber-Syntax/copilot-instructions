---
description: 'Conventional Pull Request title and description'
---
### Instructions

Use conventional commit prefixes (`feat:`, `fix:`, `docs:`, `refactor:`, etc.).
Keep the title under 72 characters.
Write in the imperative mood ("add feature", not "adds feature").
Add scope in parentheses when relevant: `feat(api):`.
For breaking changes, use `!`: `feat(api)!:`.

### Examples

```xml
<examples>
 <example>
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
 </example>

 <example>
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
 </example>
</examples>
```
