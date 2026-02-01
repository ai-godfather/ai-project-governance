---
name: ai-project-governance
description: AI Project Governance Framework v2.0.0 - 16 specialized roles, quality gates, and structured workflows for AI-assisted software development with Cursor/Claude/GPT
homepage: https://github.com/ai-godfather/ai-project-governance
metadata:
  openclaw:
    emoji: 🛡️
    requires:
      bins: ["git", "bash"]
      env: ["GOVERNANCE_WORKSPACE"]
    primaryEnv: "GOVERNANCE_WORKSPACE"
    skillKey: "ai-governance"
    install:
      - id: "git"
        kind: "brew"
        package: "git"
        bins: ["git"]
        label: "Install Git"
---

# AI Project Governance Framework 🛡️

**Version**: 2.0.0  
**Author**: God_FatherAI (https://x.com/God_FatherAI)  
**License**: MIT

A project-agnostic AI governance framework for software development teams using AI coding assistants (Claude, GPT, Cursor, etc.).

## What's New in v2.0.0

| Feature | Description |
|---------|-------------|
| **16 Roles** | AUDITOR, TDD_GUIDE, UI_BROWSER_INSPECTOR + 13 others |
| **Two-Phase PLANNER** | User approval gate between plan and task generation |
| **Quality Gate (AUDITOR)** | 15-dimension audit before implementation |
| **TDD Support** | Optional RED phase test creation before implementation |
| **Cursor Rules** | 6 enforcement templates for `.cursor/rules/` |
| **89+ Failure Patterns** | Documented anti-patterns with solutions |

## Quick Install

```bash
# Clone framework
git clone https://github.com/ai-godfather/ai-project-governance.git /tmp/governance

# Run bootstrap installer
cd /tmp/governance
./bootstrap/scripts/init.sh --target=/your/project/path
```

## Governance Levels

| Level | For | Includes |
|-------|-----|----------|
| **Minimal** | POC, small projects | PLANNER → IMPLEMENTER |
| **Standard** ⭐ | Production, teams | + AUDITOR, VALIDATOR, TDD |
| **Enterprise** | Regulated industries | + Full audit trail, all roles |

## Core Workflows

Use `@workflow` commands in Cursor/AI chat:

```
@workflow PLANNER     → Create implementation plan
@workflow AUDITOR     → 15-dimension quality audit
@workflow IMPLEMENTER → Execute approved plan
@workflow VALIDATOR   → Validate implementation
@workflow TDD_GUIDE   → Test-first development
```

## 16 Specialized Roles

### Planning (4)
- **PLANNER** - Creates implementation plans
- **ARCHITECT** - Architectural decisions
- **AUDITOR** 🆕 - 15-dimension quality gate
- **TDD_GUIDE** 🆕 - Test-first development

### Implementation (5)
- **IMPLEMENTER** - Code implementation
- **UI_BROWSER_INSPECTOR** 🆕 - UI/CSS verification
- **DATA_SEMANTIC_VALIDATOR** - Data integrity
- **DOC_GUARD** - Documentation enforcement

### Validation (4)
- **VALIDATOR** - Implementation validation
- **RE_VALIDATOR** - Regression verification
- **FIXATOR** - Error fixing
- **EMERGENCY_ERROR** - Critical issues

### Documentation (3)
- **CODE_DOCUMENTATOR** - Technical docs
- **JOB_OBSERVER** - Progress tracking

## Features

- 🛡️ **Quality Gate** - AUDITOR stops bad plans before code
- 📋 **Two-Phase Planning** - User approval between plan and tasks
- 🔴 **TDD Support** - RED phase tests before implementation
- 📊 **89+ Failure Patterns** - AI learns from documented mistakes
- 🎯 **16 Roles** - Specialized agents with clear boundaries
- 📝 **Cursor Integration** - 6 enforcement templates

## Requirements

- Cursor IDE (recommended) or VS Code with AI assistant
- Git
- TypeScript/JavaScript project (recommended)

## Resources

- **GitHub**: https://github.com/ai-godfather/ai-project-governance
- **Author**: https://x.com/God_FatherAI
- **Docs**: See `docs/` folder in repo

## License

MIT License - See LICENSE file for details.