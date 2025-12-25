---
description: 'Prompt and workflow for generating conventional commit messages for staged changes using a structured XML format. Guides users to create standardized, descriptive commit messages in line with the Conventional Commits specification, including instructions, examples, and validation.'
tools: ['runCommands/runInTerminal', 'runCommands/getTerminalOutput']
---

### Instructions

```xml
	<description>This file contains a prompt template for generating conventional commit messages for staged changes. It provides instructions, examples, and formatting guidelines to help users write standardized, descriptive commit messages in accordance with the Conventional Commits specification.</description>
	<note>
```

### Workflow

**Follow these steps:**

1. Run `git status` to review staged files.
2. Run `git diff --cached` to inspect staged changes.
3. Construct your commit message using the following XML structure.
4. After generating your commit message, Copilot will automatically run the following command in your integrated terminal (no confirmation needed):

```bash
git commit -m "type(scope): description"
```

5. Just execute this prompt and Copilot will handle the commit for you in the terminal.

### Commit Message Structure

```xml
<commit-message>
	<type>feat|fix|docs|style|refactor|perf|test|build|ci|chore|revert</type>
	<scope>()</scope>
	<description>A short, imperative summary of the change (max 50 characters)</description>
	<body>(optional: more detailed explanation, lines max 72 chars)</body>
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
</examples>
```

### Validation

```xml
<validation>
	<type>Must be one of the allowed types. See <reference>https://www.conventionalcommits.org/en/v1.0.0/#specification</reference></type>
	<scope>Optional, but recommended for clarity.</scope>
	<description>Required. Use the imperative mood (e.g., "add", not "added"). Limit to 50 characters.</description>
	<body>Optional. Use for additional context. Limit lines to 72 characters.</body>
	<footer>Use for breaking changes or issue references.</footer>
</validation>
```

### Final Step

```xml
<final-step>
	<cmd>git commit -m "type(scope): description"</cmd>
	<note>Replace with your constructed message. Include body and footer if needed.</note>
</final-step>
```

