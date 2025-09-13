---
description: 'Conventional Pull Request title and description'
---

# Conventional Pull Request Description Guidelines

Pull requests should tell a story. The commits are the chapters, the description is the introduction, and the conversation is the dialogue with your reviewers. Follow the structure below to keep your PRs consistent, clear, and reviewable.

## PR Title Format

- Use conventional commit prefixes (`feat:`, `fix:`, `docs:`, `refactor:`, etc.).
- Keep the title under 72 characters.
- Write in the imperative mood ("add feature", not "adds feature").
- Add scope in parentheses when relevant: `feat(api):`.
- For breaking changes, use `!`: `feat(api)!:`.

### PR Structure

```xml
<pull-request>
	<title>
		<type>feat|fix|docs|style|refactor|perf|test|build|ci|chore</type>
		<scope>(optional)</scope>
		<description>A short, imperative summary of the PR</description>
	</title>
	<body>
		<description>Brief description of the changes made.</description>
		<motivation>Why is this change necessary? What problem does it solve?</motivation>
		<implementation>Key technical implementation details or approach taken.</implementation>
		<testing>How were the changes tested? What tests were added?</testing>
		<related-issues>Fixes|Closes|Resolves issue references</related-issues>
		<breaking-changes>(if applicable: description + migration notes)</breaking-changes>
	</body>
</pull-request>
````

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

### Validation

```xml
<validation>
	<title>Required. Must use valid type prefix and imperative mood.</title>
	<scope>Optional, but recommended for clarity.</scope>
	<description>Required. Short summary of PR purpose.</description>
	<body>
		<description>Required. Explain what the PR changes.</description>
		<motivation>Required. Explain why changes are needed.</motivation>
		<implementation>Optional but encouraged for technical clarity.</implementation>
		<testing>Required. Explain validation of changes.</testing>
		<related-issues>Strongly recommended. Link with GitHub keywords.</related-issues>
		<breaking-changes>Required if breaking changes exist. Include migration instructions.</breaking-changes>
	</body>
</validation>
```

```

Do you also want me to merge the **Type Prefixes** section into an XML list (like `<types>` inside `<validation>`), the same way you had it for commits?
```
