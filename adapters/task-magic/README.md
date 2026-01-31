<!--
AI Project Governance Framework

Author & Contact: https://x.com/God_FatherAI
License: MIT (see LICENSE file in project root)
-->

# Task Magic Adapters

This directory contains MDC (Markdown Configuration) rules for task and plan management.

## Files

| File | Purpose |
|------|---------|
| `tasks.mdc` | Task creation, status flow, file format |
| `plans.mdc` | Feature plan structure and categories |

## Installation

Copy both files to your project's `.cursor/rules/` directory:

```bash
cp tasks.mdc /path/to/project/.cursor/rules/.task-magic/
cp plans.mdc /path/to/project/.cursor/rules/.task-magic/
```

## How It Works

When these rules are active:

1. **Tasks**: AI creates properly formatted task files in `.ai/tasks/`
2. **Plans**: AI creates feature plans in `.ai/plans/features/`
3. **Status**: AI updates TASKS.md with current status
4. **Archive**: AI moves completed features to `_archive/`

## Customization

Modify the templates in each file to match your project conventions:

- Category prefixes
- Priority levels
- Required sections
- Status values
