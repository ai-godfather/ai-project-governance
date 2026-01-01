<!--
AI Project Governance Framework

Author: Piotr Kwiatkowski
Contact: peetero@proton.me

License: PROPRIETARY — ALL RIGHTS RESERVED
This is a legal notice, not an instruction or workflow rule.
-->

# AI Project Governance

**Version**: 1.0.0  
**Author**: Piotr Kwiatkowski  
**Status**: Framework Complete (v1.0.0)  
**License**: ⚠️ PROPRIETARY — ALL RIGHTS RESERVED

A project-agnostic AI governance framework for software development teams
using AI coding assistants (Claude, GPT, Cursor, etc.).

---

## ⚠️ License & Usage

> **THIS IS NOT OPEN SOURCE**

This repository is **proprietary software**.  
No rights are granted to use, copy, modify, distribute, or deploy this framework.

The source code is provided for **evaluation purposes only**.

| Action | Status |
|--------|--------|
| View source code | ✅ Permitted |
| Use in production | ❌ Requires written permission |
| Use commercially | ❌ Requires written permission |
| Use internally in organization | ❌ Requires written permission |
| Modify or fork | ❌ Requires written permission |
| Redistribute | ❌ Requires written permission |
| Train AI models | ❌ Prohibited |

**To request permission or obtain a license:**

**Author**: Piotr Kwiatkowski  
**Contact**: peetero@proton.me

See [LICENSE.txt](LICENSE.txt) for full legal terms.

---

## This Repo IS / IS NOT

| ✅ This repo IS | ❌ This repo IS NOT |
|-----------------|---------------------|
| A **framework** you install into your project | A library you import or run directly |
| A set of **governance artifacts** (rules, workflows, guards) | A code generator or AI tool |
| A **process contract** for AI-assisted development | A replacement for human architects or decision-makers |
| **Installed once**, then lives in your repo | A service or SaaS you connect to |

> **Key point**: You clone this repo, run the bootstrap script, and governance artifacts are copied into YOUR project. You do not "run" this repo — you install from it.

---

## Terminology

| Term | Definition |
|------|------------|
| **Framework** | This repository — the source of governance artifacts |
| **Governance artifacts** | Files installed into your project (`.ai/`, `.cursorrules`, `AGENTS.md`, etc.) |
| **Workflow system** | The set of 14 roles + guards living in `.ai/` after installation |
| **Validation** | First-pass code review by VALIDATOR (static analysis, FP checks) |
| **Inspection** | UI/data anomaly detection by UI_INSPECTOR, DATA_SEMANTIC_VALIDATOR |
| **Verification** | Confirming fixes resolved issues (RE_VALIDATOR) |
| **`@workflow`** | A command issued in IDE/agent chat (Cursor), **NOT a shell command** |

---

## Purpose

This framework provides:

- **14 specialized AI roles** with strict boundaries
- **Workflow contracts** for validation, fixing, and documentation
- **Pre-execution guards** preventing common failure modes
- **Error traceability** from symptom to root cause
- **Documentation governance** keeping docs in sync with code
- **Task management** with Task Magic system
- **Bootstrap tooling** for new projects starting from zero

---

## Core Principles

| Principle | Rule |
|-----------|------|
| **Code is Truth** | Code > Snapshot > Docs > Plans |
| **No Guessing** | Agents verify with evidence, never assume |
| **Scope Lock** | Each role has strict, non-negotiable boundaries |
| **Failure Patterns** | Known failures (89 FPs) inform all decisions |
| **Determinism** | Workflows are repeatable and auditable |
| **Safe Removal** | Framework can be removed cleanly without breaking your code |

---

## When NOT to Use This Framework

Do **NOT** adopt this framework if:

- ❌ **No process owner** — no one will enforce changelog/validation discipline
- ❌ **No CI/CD or PR review** — governance requires observable workflow
- ❌ **Hackathon / throwaway code** — overhead exceeds value
- ❌ **Solo dev with no future team** — simpler approaches suffice
- ❌ **Unwilling to follow role boundaries** — framework will be bypassed, creating false confidence
- ❌ **No Cursor IDE** — MDC workflow commands require Cursor (or compatible agent)
- ❌ **Expecting AI to make architectural decisions** — framework enforces process, not judgment

If any of the above apply, consider a lighter approach or delay adoption until conditions change.

---

## Scope Boundaries

This framework **DOES**:

- ✅ Enforce a structured development process
- ✅ Prevent common AI failure modes (89 documented patterns)
- ✅ Require evidence-based claims (file paths, logs)
- ✅ Block undocumented dangerous operations
- ✅ Track compliance and decision history

This framework **DOES NOT**:

- ❌ Generate code for you
- ❌ Replace human architects or decision-makers
- ❌ Make business or technical decisions
- ❌ Guarantee bug-free code (it reduces risk, not eliminates it)
- ❌ Work without human oversight and enforcement

---

## Roles Overview

| # | Role | Purpose | Mode |
|---|------|---------|------|
| 0 | EMERGENCY_ERROR | Production incidents | Orchestrator |
| 1 | PLANNER | Feature planning | Read-Only |
| 2 | IMPLEMENTER | Code execution | Write (scoped) |
| 3 | VALIDATOR | First-pass validation | Read-Only |
| 4 | UI_INSPECTOR | Visual anomalies | Read-Only |
| 5 | DATA_SEMANTIC_VALIDATOR | Data integrity | Read-Only |
| 6 | UI_BROWSER_VALIDATOR | Runtime verification | Execution |
| 7 | FIXATOR | Issue remediation | Write (scoped) |
| 8 | RE_VALIDATOR | Fix verification | Read-Only |
| 9 | ARCHITECT | ADR creation | Read-Only |
| 10 | CODE_DOCUMENTATOR | Technical docs | Read-Only |
| 11 | USER_DOCUMENTATOR | User docs | Read-Only |
| 12 | JOB_OBSERVER | Job operations (SRE) | Operational |
| 13 | DOC_GUARD | Doc governance | Advisory |

---

## Installation

### Happy Path (Recommended)

> ⚠️ **Run all commands from your project root directory.** Script paths can be absolute, but CWD must be your target project.

```bash
# 1. Clone the governance framework
git clone https://github.com/yourorg/ai-project-governance.git /tmp/governance

# 2. Navigate to YOUR project (target repo)
cd /path/to/your-project

# 3. Create configuration file
cat > governance.config.yaml << 'EOF'
project:
  name: "my-project"
  display_name: "My Project"
stack:
  language: "typescript"
EOF

# 4. Run bootstrap with config (auto-replaces placeholders)
/tmp/governance/bootstrap/scripts/init.sh --config=./governance.config.yaml

# 5. Validate installation (strict mode recommended)
/tmp/governance/bootstrap/scripts/validate.sh --strict

# 6. Commit governance artifacts
git add .ai/ .cursor/ .cursorrules AGENTS.md docs/ governance.config.yaml
git commit -m "chore: initialize AI project governance v1.0.0"

# 7. Clean up
rm -rf /tmp/governance
```

### Advanced Path (Higher Drift Risk)

For manual installation or customized setups, see [docs/guides/INSTALLATION.md](docs/guides/INSTALLATION.md).

> ⚠️ Manual placeholder replacement is error-prone. Prefer `--config` approach.

### Common Mistakes

| Mistake | Consequence | Prevention |
|---------|-------------|------------|
| Running `init.sh` from wrong directory | Artifacts installed in wrong repo | Always `cd` to target project first |
| Forgetting `--config` | Placeholders remain (`{{PROJECT_NAME}}`) | Use `validate.sh --strict` to catch |
| macOS vs Linux `sed -i` | Syntax error or no replacement | Use `--config` or see INSTALLATION.md |
| Missing `.cursor/rules/.task-magic/` | `@workflow` commands not recognized | Re-run init or copy manually |
| Not committing governance artifacts | Team doesn't have rules | Commit immediately after validate |
| Using `--force` on existing project | Your custom rules are lost forever | Use `--migrate` instead (creates backup) |
| Skipping backup merge review | Custom rules not preserved | Always check `.governance-backup-*/` |

### Migrating from Existing Configuration

If your project already has `.cursorrules`, `AGENTS.md`, or `.cursor/rules/`:

```bash
# RECOMMENDED: Backup existing files, then install
/tmp/governance/bootstrap/scripts/init.sh --migrate --config=./governance.config.yaml

# This will:
# 1. Create backup in .governance-backup-YYYYMMDD-HHMMSS/
# 2. Install governance framework
# 3. Show warnings about files that need manual merge
```

After migration, **manually merge** your custom rules:

| File | How to Merge |
|------|--------------|
| `.cursorrules` | Add your custom `[PROJECT-SPECIFIC RULES]` section at the end of new file |
| `AGENTS.md` | Add project-specific sections (Key Rules, Patterns) to new file |
| `.cursor/rules/*.mdc` | Keep custom MDC files alongside new `.task-magic/` files |

> ⚠️ **Never blindly replace** — review the backup and merge intentionally.

### Detailed Guides

| Guide | Description |
|-------|-------------|
| [docs/guides/QUICK_START.md](docs/guides/QUICK_START.md) | 5-minute getting started |
| [docs/guides/INSTALLATION.md](docs/guides/INSTALLATION.md) | Full installation options |
| [docs/guides/MIGRATION.md](docs/guides/MIGRATION.md) | Migrating from existing config |
| [bootstrap/BOOTSTRAP_FLOW.md](bootstrap/BOOTSTRAP_FLOW.md) | 7-phase detailed flow |

---

## Installed Artifacts

After bootstrap, these files/folders are added to YOUR project:

| Artifact | Purpose | Committed? |
|----------|---------|------------|
| `.ai/` | Workflow system, guards, plans, changelogs | ✅ Yes |
| `.cursor/rules/.task-magic/` | MDC workflow files for Cursor | ✅ Yes |
| `.cursorrules` | Supreme rules (highest authority) | ✅ Yes |
| `AGENTS.md` | AI agent quick-reference | ✅ Yes |
| `docs/AI_PLANNER_GUARDRAILS.md` | 31 absolute prohibitions | ✅ Yes |
| `docs-FINAL/` | Documentation navigation layer | ✅ Yes |
| `governance.config.yaml` | Project configuration | ✅ Yes |

---

## Installation Mapping

How framework repo maps to your project:

| Framework Repo | → | Your Project |
|----------------|---|--------------|
| `core/workflow/*` | → | `.ai/_WORKFLOW/*` |
| `core/runtime/*` | → | `.ai/runtime/*` |
| `core/roles/*` | → | `.ai/roles/*` |
| `adapters/cursorrules/*.cursorrules` | → | `.cursorrules` |
| `adapters/agents/*.AGENTS.md` | → | `AGENTS.md` |
| `adapters/task-magic/*.mdc` | → | `.cursor/rules/.task-magic/` |
| `bootstrap/templates/docs/*` | → | `docs/` |
| `bootstrap/scripts/*` | → | (not copied — used at install time) |

---

## Configuration

Create `governance.config.yaml` in your project root:

```yaml
project:
  name: "my-project"
  display_name: "My Project"

stack:
  language: "typescript"
  framework: "express"
  database: "postgresql"
  cloud: "gcp"

governance:
  frozen_period_days: 14
  max_tasks_per_turn: 3

categories:
  features: [ADMIN, USER, API, INFRA]
```

See [docs/guides/CONFIGURATION.md](docs/guides/CONFIGURATION.md) for all options.

---

## Usage

### Workflow Commands

> ⚠️ **`@workflow` is an IDE/agent chat command (Cursor), NOT a shell command.**  
> Type it in Cursor's AI chat, not in terminal.

```
# Plan a feature
@workflow PLANNER

# Implement from plan
@workflow IMPLEMENTER FEATURE_001

# Validate implementation
@workflow VALIDATOR
@workflow UI_INSPECTOR
@workflow DATA_SEMANTIC_VALIDATOR
@workflow UI_BROWSER_VALIDATOR

# Fix issues
@workflow FIXATOR

# Verify fixes
@workflow RE_VALIDATOR
```

### Production Incidents

```
@workflow EMERGENCY_ERROR https://app.example.com/error
```

### Documentation

```
@workflow CODE_DOCUMENTATOR MODULE_NAME
@workflow USER_DOCUMENTATOR CREATE --route="/dashboard"
@workflow DOC_GUARD
```

---

## Required Workflows by Change Type

Not every change requires full validation chain:

| Change Type | Required Workflows |
|-------------|-------------------|
| New feature | PLANNER → IMPLEMENTER → VALIDATOR → FIXATOR → RE_VALIDATOR |
| UI changes | + UI_INSPECTOR, DATA_SEMANTIC_VALIDATOR, UI_BROWSER_VALIDATOR |
| Backend only | VALIDATOR (UI validators optional) |
| Bug fix | VALIDATOR → FIXATOR → RE_VALIDATOR |
| Production incident | EMERGENCY_ERROR → (if BLOCK) FIXATOR → RE_VALIDATOR |
| Documentation | CODE_DOCUMENTATOR or USER_DOCUMENTATOR |
| New job / dangerous op | + DOC_GUARD (hard blocker if docs missing) |

---

## Directory Structure

After installation, your project will have:

```
your-project/
├── .ai/
│   ├── _WORKFLOW/          # Workflow system
│   ├── runtime/            # Runtime guards
│   ├── workflows/          # MDC workflow files
│   ├── roles/              # Role definitions
│   ├── prompts/            # Prompt templates
│   ├── plans/              # Feature plans
│   ├── tasks/              # Task files
│   ├── CHANGELOGS/         # State snapshots
│   ├── COMPLIANCE/         # Metrics
│   ├── DECISIONS/          # History indexes
│   └── _PLANS_VALIDATIONS/ # Validation reports
├── .cursor/
│   └── rules/              # Cursor-specific rules
├── docs-FINAL/             # Navigation layer
├── docs/
│   └── AI_PLANNER_GUARDRAILS.md
├── .cursorrules            # Supreme rules
├── AGENTS.md               # Agent definitions
└── governance.config.yaml  # Configuration
```

---

## Governance Levels

The framework supports three levels of adoption:

### Non-Negotiables (ALL Levels)

Even at Minimal level, these rules are **mandatory**:

- ✅ **Hierarchy of truth**: Code > Snapshot > Docs > Plans
- ✅ **Role boundaries**: Only IMPLEMENTER writes code; validators don't fix
- ✅ **No guessing**: Claims require file path / log evidence
- ✅ **Changelog discipline**: Commits require changelog entries

### Level 1: Minimal

- Core workflow roles (PLANNER, IMPLEMENTER, VALIDATOR)
- Basic `.cursorrules`
- Simple `AGENTS.md`

**Best for**: Small projects, proof-of-concepts

### Level 2: Standard

- All 14 roles
- Full workflow system
- Documentation governance
- Task Magic system

**Best for**: Production applications, team projects

### Level 3: Enterprise

- Everything in Standard
- Custom failure patterns
- ADR enforcement
- Compliance tracking
- Job observer (SRE)

**Best for**: Large codebases, regulated industries

---

## AI Agent Contract

### Mandatory Reading Order (in target repo)

When an AI agent starts working on a governed project, it MUST read in this order:

1. `.cursorrules` — Supreme law
2. `AGENTS.md` — Role definitions and quick reference
3. `.ai/_WORKFLOW/04_EXECUTION_ORDER.md` — Workflow sequence
4. `.ai/_WORKFLOW/09_ENFORCEMENT.md` — Compliance rules
5. `.ai/runtime/workflow-guard.md` — Pre-execution validation
6. Latest `.ai/CHANGELOGS/*.snapshot.md` — Current system state

### DO / DO NOT (AI Agents)

| ✅ DO | ❌ DO NOT |
|-------|----------|
| Respect `.cursorrules` as supreme law | Edit `.ai/_WORKFLOW/` files (framework-managed) |
| Follow role boundaries strictly | Act outside your assigned role |
| Cite file paths as evidence | Make claims without evidence |
| Read latest changelog before work | Assume system state from memory |
| Refuse work if prerequisites missing | Guess when plan is ambiguous |
| Mark unknown information as UNKNOWN | Invent missing data |

### Evidence-First Rule

All AI claims must be backed by:
- File paths (e.g., `server/routers.ts:42`)
- Log evidence (e.g., error message, stack trace)
- Explicit source reference

Claims without evidence must be marked `UNKNOWN` or `ASSUMPTION`.

---

## Why This Prevents AI Lying

The framework enforces truthfulness through multiple mechanisms:

| Mechanism | How It Works |
|-----------|--------------|
| **Hierarchy of Truth** | Code > Snapshot > Docs > Plans — agents cannot claim something contradicting code |
| **Workflow Guards** | Pre-execution checks block roles from running without prerequisites |
| **Origin-Layer Classification** | Every issue is traced to source (FEATURE_PLAN, IMPLEMENTATION, etc.) |
| **DOC_GUARD Hard Blockers** | New jobs / dangerous ops require documentation — no silent additions |
| **Refusal Conditions** | Roles MUST refuse if conditions not met (e.g., FIXATOR refuses FEATURE_PLAN errors) |
| **Changelog Enforcement** | Commits without changelog = system state UNKNOWN = blocker |

### Safety Contract

> If you skip required workflows or guards, the output is **non-compliant** and **outside governance**.  
> Treat it as unverified work that may contain errors, hallucinations, or undocumented changes.

---

## Safe Removal

The framework is designed to be safely removable:

```bash
# Remove AI governance
rm -rf .ai/
rm -rf .cursor/rules/.task-magic/
rm .cursorrules
rm AGENTS.md
rm governance.config.yaml

# Optionally keep documentation
# rm -rf docs-FINAL/
# rm docs/AI_*.md
```

**What remains**:
- Your actual code (untouched)
- Documentation you chose to keep
- Git history of governance-related commits

---

## Upgrading

```bash
# Download new version
git clone https://github.com/yourorg/ai-project-governance.git /tmp/gov-new

# Run upgrade script (from your project root)
cd /path/to/your-project
/tmp/gov-new/bootstrap/scripts/upgrade.sh --from=v1.0.0 --to=v1.1.0
```

The upgrade will:
1. Backup current governance
2. Update core files (`.ai/_WORKFLOW/`, `.ai/runtime/`)
3. Preserve customizations (`.cursorrules`, `AGENTS.md`, config)
4. Validate upgrade

---

## Framework Origin

This framework was extracted and generalized from a production system
(HyperXAdvisor) with:

- **80+ production incidents** documented as failure patterns
- **2000+ tasks** executed through the workflow
- **50+ feature plans** validated
- **8 months** of real-world usage

The extraction preserved all learned patterns while removing
project-specific details.

---

## Key Files Reference

| Location | Purpose |
|----------|---------|
| `adapters/cursorrules/` | `.cursorrules` templates |
| `adapters/agents/` | `AGENTS.md` templates |
| `core/workflow/03_ROLES.md` | All 14 role definitions |
| `core/workflow/09_ENFORCEMENT.md` | Compliance rules |
| `core/runtime/workflow-guard.md` | Pre-execution validation |
| `bootstrap/templates/docs/AI_PLANNER_GUARDRAILS.md` | 31 absolute prohibitions |
| `docs/guides/` | User guides |

---

## Support

- **Documentation**: See `docs/guides/`
- **Bootstrap**: See `bootstrap/BOOTSTRAP_FLOW.md`
- **Licensing inquiries**: peetero@proton.me

---

## Acknowledgments

- Built with insights from 80+ production incidents
- Inspired by enterprise governance patterns
- Designed for AI-assisted development workflows

---

## Version History

| Version | Date | Changes |
|---------|------|---------|
| 1.0.0 | 2026-01-01 | Initial release |

---

## Legal

**Copyright (c) 2026 Piotr Kwiatkowski. All rights reserved.**

This repository is proprietary software. See [LICENSE.txt](LICENSE.txt) and [NOTICE.md](NOTICE.md).

Unauthorized use may result in legal action.

---

**Interested in licensing?**

Contact: **peetero@proton.me**
