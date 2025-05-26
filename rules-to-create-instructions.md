---
applyTo: "**/*.instructions.md"
---

# Rules to Create Custom Instructions for copilot

## Tips for defining custom instructions

Keep your instructions short and self-contained. Each instruction should be a single, simple statement. If you need to provide multiple pieces of information, use multiple instructions.

Don't refer to external resources in the instructions, such as specific coding standards.

Split instructions into multiple files. This approach is useful for organizing instructions by topic or type of task.

Make it easy to share custom instructions with your team or across projects by storing your instructions in instruction files. You can also version control the files to track changes over time.

Use the applyTo property in the instruction file header to automatically apply the instructions to specific files or folders.

Reference custom instructions in your prompt files to keep your prompts clean and focused, and to avoid duplicating instructions for different tasks.
