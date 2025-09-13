---
description: 'Conventional git commits'
---

# Commit Message Guidelines

## Basic Rules

- Use a commit title limited to 50 characters.
- Write the commit title in the imperative mood.
- Wrap the commit description lines at 72 characters.
- Use the commit description to provide detailed context and motivation.

### Commit Message Structure

```xml
<commit-message>
	<type>feat|fix|docs|style|refactor|perf|test|build|ci|chore|revert</type>
	<scope>()</scope>
	<description>A short, imperative summary of the change</description>
	<body>(optional: more detailed explanation)</body>
	<footer>(optional: e.g. BREAKING CHANGE: details, or issue references)</footer>
</commit-message>
```

### Examples

```xml
<examples>
	<example>feat(parser): add ability to parse arrays</example>
	<example>fix(ui): correct button alignment</example>
	<example>docs: update README with usage instructions</example>
	<example>refactor: improve performance of data processing</example>
	<example>chore: update dependencies</example>
	<example>feat!: send email on registration (BREAKING CHANGE: email service required)</example>
	<example>
		feat: allow provided config object to extend other configs

		BREAKING CHANGE: `extends` key in config file is now used for extending other config files
	</example>
	<example>
		feat(api)!: send an email to the customer when a product is shipped
	</example>
	<example>
		chore!: drop support for Node 6

		BREAKING CHANGE: use JavaScript features not available in Node 6.
	</example>
	<example>
		docs: correct spelling of CHANGELOG
	</example>
	<example>
		feat(lang): add Polish language
	</example>
	<example>
		fix: prevent racing of requests

		Introduce a request id and a reference to latest request. Dismiss
		incoming responses other than from latest request.

		Remove timeouts which were used to mitigate the racing issue but are
		obsolete now.

		Reviewed-by: Z
		Refs: #123
	</example>
</examples>

```

### Validation

```xml
<validation>
	<type>Must be one of the allowed types. See <reference>https://www.conventionalcommits.org/en/v1.0.0/#specification</reference></type>
	<scope>Optional, but recommended for clarity.</scope>
	<description>Required. Use the imperative mood (e.g., "add", not "added").</description>
	<body>Optional. Use for additional context.</body>
	<footer>Use for breaking changes or issue references.</footer>
</validation>
```

