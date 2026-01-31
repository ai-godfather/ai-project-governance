# Cursor Rules Templates

> **Version**: 2.0.0  
> **Purpose**: Enforcement layer for AI governance in Cursor IDE

---

## Overview

This directory contains template files for Cursor IDE rules (`.cursor/rules/*.mdc`). These rules enforce AI Project Governance Framework v2.0 at the IDE level.

---

## Files

| File | Purpose | Priority |
|------|---------|----------|
| `00-workflow-enforcement.mdc` | Core workflow rules | CRITICAL |
| `01-blocking-conditions.mdc` | BLOCK conditions for each role | CRITICAL |
| `02-pre-commit-checklist.mdc` | Commit requirements | HIGH |
| `03-failure-patterns-critical.mdc` | Critical FP quick reference | HIGH |
| `04-role-boundaries.mdc` | Role permissions matrix | HIGH |
| `05-project-context.mdc.template` | Project-specific context | PROJECT |

---

## Installation

### Option 1: Bootstrap Script

When running `init.sh`, cursor rules are automatically copied:

```bash
./bootstrap/scripts/init.sh
```

### Option 2: Manual Copy

1. Copy template files to your project:

```bash
cp adapters/cursor-rules/*.mdc /path/to/project/.cursor/rules/
```

2. Customize project context:

```bash
cp adapters/cursor-rules/05-project-context.mdc.template \
   /path/to/project/.cursor/rules/05-project-context.mdc
```

3. Replace placeholders in `05-project-context.mdc`:
   - `{{PROJECT_NAME}}` → your project name
   - `{{LANGUAGE}}` → your language (typescript, python, php, etc.)
   - `{{FRAMEWORK}}` → your framework
   - etc.

---

## Customization

### Required Placeholders

| Placeholder | Description | Example |
|-------------|-------------|---------|
| `{{PROJECT_NAME}}` | Project identifier | `my-api` |
| `{{LANGUAGE}}` | Primary language | `typescript` |
| `{{FRAMEWORK}}` | Web framework | `express` |
| `{{DATABASE}}` | Database type | `postgresql` |
| `{{LINTER_COMMAND}}` | Linter command | `npm run lint` |
| `{{TEST_COMMAND}}` | Test command | `npm test` |
| `{{SOURCE_DIR}}` | Source directory | `src/` |
| `{{TEST_DIR}}` | Test directory | `tests/` |

### Project-Specific Rules

You can add additional project-specific rules:

```bash
# Create project-specific rule
touch /path/to/project/.cursor/rules/06-custom-rules.mdc
```

---

## Enforcement

These rules are automatically loaded by Cursor IDE and applied to all AI interactions within the project.

### Rule Priority

1. `00-workflow-enforcement.mdc` — Always checked first
2. `01-blocking-conditions.mdc` — BLOCK conditions
3. `02-pre-commit-checklist.mdc` — Before commits
4. `03-failure-patterns-critical.mdc` — During validation
5. `04-role-boundaries.mdc` — Role permissions
6. `05-project-context.mdc` — Project specifics

---

## Related Files

- `core/workflow/*.md` — Workflow documentation
- `core/roles/*/README.md` — Role definitions
- `governance.config.yaml` — Configuration schema

---

**Version**: 2.0.0  
**Framework**: AI Project Governance
