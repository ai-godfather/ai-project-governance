<!--
AI Project Governance Framework

Author & Contact: https://x.com/God_FatherAI
License: MIT (see LICENSE file in project root)
-->

# AI Workflow System

> **Version**: 1.0.0  
> **Status**: PRODUCTION ACTIVE  
> **Roles**: 14 | **Commands**: 16

---

## 🚀 Quick Start

### Basic Workflow Commands

```bash
# Plan a feature
@workflow PLANNER

# Implement from plan
@workflow IMPLEMENTER FEATURE_001

# Validate implementation
@workflow VALIDATOR
@workflow UI_INSPECTOR
@workflow DATA_SEMANTIC_VALIDATOR
@workflow UI_BROWSER_VALIDATOR

# Fix issues (only if BLOCK)
@workflow FIXATOR

# Verify fixes
@workflow RE_VALIDATOR
```

### Documentation Commands

```bash
# Technical documentation
@workflow CODE_DOCUMENTATOR MODULE_NAME

# User documentation
@workflow USER_DOCUMENTATOR CREATE --route="/dashboard"
@workflow USER_DOCUMENTATOR UPDATE --route="/dashboard"
@workflow USER_DOCUMENTATOR AUDIT

# Documentation governance
@workflow DOC_GUARD
```

### Operational Commands

```bash
# Job operations (SRE)
@workflow JOB_OBSERVER <CONTEXT or HANDOFF>

# Production incidents (TOP PRIORITY)
@workflow EMERGENCY_ERROR <SOURCE>
```

---

## 📂 Documentation Structure

```
.ai/_WORKFLOW/
├── README.md               ← You are here (Quick Start)
├── 01_OVERVIEW.md          # System overview & principles
├── 02_ARCHITECTURE.md      # Diagrams & data flow
├── 03_ROLES.md             # All 14 role definitions
├── 04_EXECUTION_ORDER.md   # Workflow sequences
├── 05_FAILURE_PATTERNS.md  # Core FP summary
├── 06_FILE_STRUCTURE.md    # File locations & outputs
├── 08_COMMANDS.md          # Command reference
├── 09_ENFORCEMENT.md       # Compliance & rules
└── 10_ERROR_TRACEABILITY.md # Error Origin & Routing
```

---

## 🎯 Core Principles

| Principle | Rule |
|-----------|------|
| **Code is Truth** | Code > Snapshot > Docs > Plans |
| **No Guessing** | Agents verify, never assume |
| **Scope Lock** | Each role has strict boundaries |
| **FP Awareness** | Failure patterns inform all decisions |

---

## 📊 Role Summary

| Role | Purpose | Mode |
|------|---------|------|
| EMERGENCY_ERROR | Production incidents | ORCHESTRATOR |
| PLANNER | Feature plans | READ-ONLY |
| IMPLEMENTER | Execute plans | WRITE (scoped) |
| VALIDATOR | First-pass validation | READ-ONLY |
| UI_INSPECTOR | Visual anomalies | READ-ONLY |
| DATA_SEMANTIC_VALIDATOR | Data integrity | READ-ONLY |
| UI_BROWSER_VALIDATOR | Runtime verification | EXECUTION |
| CODE_DOCUMENTATOR | Technical docs | READ-ONLY |
| JOB_OBSERVER | Job operations | OPERATIONAL |
| USER_DOCUMENTATOR | User docs | READ-ONLY |
| DOC_GUARD | Doc governance | ADVISORY |
| FIXATOR | Fix issues | WRITE (scoped) |
| RE_VALIDATOR | Verify fixes | READ-ONLY |
| ARCHITECT | ADR for complex features | READ-ONLY |

---

## 📖 Read Order (Recommended)

1. **[01_OVERVIEW.md](01_OVERVIEW.md)** — What is this system?
2. **[02_ARCHITECTURE.md](02_ARCHITECTURE.md)** — Role hierarchy & data flow
3. **[03_ROLES.md](03_ROLES.md)** — All 14 roles in detail
4. **[08_COMMANDS.md](08_COMMANDS.md)** — Command reference
5. **[09_ENFORCEMENT.md](09_ENFORCEMENT.md)** — Compliance rules

---

## 🔗 Key Files

| File | Purpose |
|------|---------|
| `.cursorrules` | Supreme law |
| `AGENTS.md` | Role definitions |
| `docs/AI_PLANNER_GUARDRAILS.md` | Planning guardrails |

---

**Version**: 1.0.0
