# Prompts Directory

> This directory contains prompt templates for common AI workflows.

---

## Structure

```
.ai/prompts/
├── roles/                          # Role-specific prompts
│   └── {ROLE}_PROMPT_TEMPLATE.md
├── workflows/                      # Workflow prompts
│   └── {WORKFLOW}_PROMPT.md
└── README.md                       # This file
```

## Usage

Prompts can be invoked by referencing them in your AI chat:

```
@file .ai/prompts/roles/PLANNER_PROMPT_TEMPLATE.md
```

Or used as context for workflow commands.

## Creating Custom Prompts

1. Create a new `.md` file in the appropriate subdirectory
2. Include clear instructions and expected outputs
3. Reference required context files

## Example Prompt Structure

```markdown
# PROMPT: {NAME}

## Role
[Which workflow role should execute this]

## Context
[What files/information to read first]

## Task
[Clear description of what to accomplish]

## Output Requirements
[Expected deliverables and format]

## Example
[Example of expected output]
```

---

**This directory is empty after fresh installation.**  
Add custom prompts as needed for your project workflows.
