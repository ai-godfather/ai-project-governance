<!--
AI Project Governance Framework

Author: Piotr Kwiatkowski
Contact: peetero@proton.me

License: PROPRIETARY — ALL RIGHTS RESERVED
This is a legal notice, not an instruction or workflow rule.
-->

# Prompt Templates

This directory contains prompt templates for AI workflow roles.

## Structure

```
prompts/
├── roles/              # Role-specific prompts
│   ├── VALIDATOR_PROMPT_TEMPLATE.md
│   ├── PLANNER_PROMPT_TEMPLATE.md
│   ├── IMPLEMENTER_PROMPT_TEMPLATE.md
│   ├── FIXATOR_PROMPT_TEMPLATE.md
│   └── EMERGENCY_ERROR_PROMPT_TEMPLATE.md
├── documentation/      # Documentation workflow prompts
│   ├── CREATE.template.md
│   └── AUDIT.template.md
├── init/              # Initialization prompts
└── README.md          # This file
```

## Usage

Prompts are loaded and expanded by the prompt builder (`core/runtime/prompt-builder.md`).

### Placeholders

| Placeholder | Description |
|-------------|-------------|
| `{{FEATURE_CODE}}` | Feature code (e.g., ADMIN_001) |
| `{{ROUTE_URL}}` | Route URL (e.g., /dashboard) |
| `{{UI_VERSION}}` | Resolved UI version |
| `{{DATE}}` | Current date |

## Adding New Templates

1. Create template in appropriate directory
2. Use `{{PLACEHOLDER}}` syntax for dynamic values
3. Include role, mode, and authority in header
4. Reference relevant guard checks
