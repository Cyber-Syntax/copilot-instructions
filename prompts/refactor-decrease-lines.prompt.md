---
description: "Review, refactor, and simplify project code while applying clean code and maintainability principles."
tools: ['vscode', 'execute/runNotebookCell', 'execute/testFailure', 'execute/getTerminalOutput', 'execute/runTask', 'execute/createAndRunTask', 'execute/runInTerminal', 'read/getNotebookSummary', 'read/problems', 'read/readFile', 'read/readNotebookCellOutput', 'read/terminalSelection', 'read/terminalLastCommand', 'edit/createFile', 'edit/editFiles', 'search', 'web', 'agent']
---

# Module Refactoring Planning Prompt

You are tasked with planning a comprehensive refactoring of a specified Python module in the my-unicorn project to reduce its line count below 500 lines, improving maintainability and developer understanding. This is a PLANNING phase only—do NOT make any actual code changes, edits, or modifications to files. Your output must be a detailed plan that outlines what would be done, without executing any steps.

## Prerequisites

- You MUST have access to the full source code of the module to be refactored.
- You MUST understand the project's architecture from AGENTS.md (e.g., src/my_unicorn/ structure, utils/ submodules).
- You MUST follow project guidelines: KISS, DRY, YAGNI; run ruff check --fix and ruff format on any future changes (but not now).

## Analysis Requirements

Thoroughly analyze the module and identify:

- Functions that can be moved to utility modules (e.g., src/my_unicorn/utils/ submodules) if they are used across multiple files.
- Classes that should reside in dedicated modules with descriptive names following project conventions (e.g., src/my_unicorn/[category]/[class_name].py).
- Any unused code, unnecessary lines, redundant elements, dead imports, or redundant logic to remove.
- Current line count and structure overview.

## Planning Steps

Create a detailed plan by following these steps (do not execute them):

1. Review the entire module to understand its structure, dependencies, responsibilities, and current line count.
2. Identify shared functions and propose extraction into appropriate utility modules (e.g. utils/validation.py).
3. Identify classes and propose extraction into separate modules with descriptive names (e.g., core/download.py).
4. Identify dead code, unused imports, or redundant logic and propose removal.
5. Propose how to ensure the refactored module remains functional (e.g., update imports/references in other files).
6. Propose validation steps: Check line count reduction below 500, ensure modularity, and suggest testing (e.g., run pytest after changes).
7. Write to a markdown file summarizing the proposed changes, including extracted functions/classes, removed code, and estimated final line count.

## Output Format

Provide a new markdown file and include summaries of the proposed changes in a structured list, including:

- **Extracted Functions**: List each function, its current location, and proposed new location (e.g., "function_name from module.py → utils/helpers.py").
- **Extracted Classes**: List each class, its current module, and proposed new module name (e.g., "ClassName from module.py → core/class_module.py").
- **Removed Code Elements**: List unused code, redundant logic, or dead imports to remove (e.g., "Unused import: from unused_module import unused_func").
- **Proposed Final Line Count**: Estimate the reduced line count after all proposed changes.
- **Additional Recommendations**: Suggest further improvements, such as renaming for clarity, adding docstrings, or splitting into more submodules.
- **Risk Assessment**: Identify potential risks (e.g., breaking changes to dependencies) and mitigation strategies.
- **Next Steps**: Outline the sequence for implementing the plan (e.g., extract utils first, then classes, then remove dead code).

Ensure the plan is actionable, follows project conventions, and reduces complexity without introducing new issues. Do not proceed to implementation—await approval of this plan.
