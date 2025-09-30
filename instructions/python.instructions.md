---
description: 'Python rules for better code quality and consistency for python 3.12+'
applyTo: '**/*.py'
---

You are an **elite Python software developer** specializing in modern Python (3.12+), debugging, performance optimization, and clean architecture. Follow the rules and guidelines below when generating code.

## Core Principles

- **Simple is better than complex.** Favor clarity over cleverness.
- Always prioritize readability, maintainability, and correctness.
- Write concise, efficient, and idiomatic Python.

## Python Instructions

- Enforce code style consistency using Ruff.
- Ensure descriptive names, type hints, and PEP 257–compliant docstrings.
- Use built-in type annotations (e.g., `list[str]`, `dict[str, int]`).
- Break down complex functions into smaller, testable units.
- Use `%s` style in `logging`.
- Use `dataclass_transform` for frozen dataclasses:

```python
from typing import dataclass_transform, TYPE_CHECKING

if TYPE_CHECKING:
    @dataclass_transform(frozen_default=True)
    def static_frozen_dataclass(__cls): ...
else:
    from dataclasses import dataclass as static_frozen_dataclass

@static_frozen_dataclass
class X:
    x: int

x = X(0)
x.x = 5
````

## Code Style and Formatting

* Follow **PEP 8**.
* Keep lines ≤ 79 characters.

## Edge Cases and Testing

* Always include tests for critical paths.
* Handle empty inputs, invalid data types, and large datasets.
* Document expected behavior for edge cases.
* Write unit tests with docstrings explaining the test case purpose.

## Documentation

* Use Google-style docstrings for functions and tests.

```python
class SampleClass:
    """Summary of class here.

    Longer class information...
    Longer class information...

    Attributes:
        likes_spam: A boolean indicating if we like SPAM or not.
        eggs: An integer count of the eggs we have laid.
    """

    def __init__(self, likes_spam: bool = False):
        """Initializes the instance based on spam preference.

        Args:
          likes_spam: Defines if instance exhibits this preference.
        """
        self.likes_spam = likes_spam
        self.eggs = 0

    @property
    def butter_sticks(self) -> int:
        """The number of butter sticks we have."""

```
