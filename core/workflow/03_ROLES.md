<!--
AI Project Governance Framework

Author & Contact: https://x.com/God_FatherAI
License: MIT (see LICENSE file in project root)
-->

# AI Workflow System - Role Definitions

> Complete reference for all 14 workflow roles.

---

## Role Index

| # | Role | Type | Mode |
|---|------|------|------|
| 0 | [EMERGENCY_ERROR](#0-emergency_error) | Incident Response | Orchestrator |
| 1 | [PLANNER](#1-planner) | Planning | Read-Only |
| 2 | [IMPLEMENTER](#2-implementer) | Implementation | Write (scoped) |
| 3 | [VALIDATOR](#3-validator) | Validation | Read-Only |
| 4 | [UI_INSPECTOR](#4-ui_inspector) | Validation | Read-Only |
| 5 | [DATA_SEMANTIC_VALIDATOR](#5-data_semantic_validator) | Validation | Read-Only |
| 6 | [UI_BROWSER_VALIDATOR](#6-ui_browser_validator) | Validation | Execution |
| 7 | [FIXATOR](#7-fixator) | Remediation | Write (scoped) |
| 8 | [RE_VALIDATOR](#8-re_validator) | Verification | Read-Only |
| 9 | [ARCHITECT](#9-architect) | Planning | Read-Only |
| 10 | [CODE_DOCUMENTATOR](#10-code_documentator) | Documentation | Read-Only |
| 11 | [USER_DOCUMENTATOR](#11-user_documentator) | Documentation | Read-Only |
| 12 | [JOB_OBSERVER](#12-job_observer) | Operations | Operational |
| 13 | [DOC_GUARD](#13-doc_guard) | Governance | Advisory |

---

## 0. EMERGENCY_ERROR

**Purpose**: Handle **PRODUCTION INCIDENTS** with rapid, structured, production-safe response.

| Aspect | Detail |
|--------|--------|
| **Mode** | READ-FIRST / ORCHESTRATOR |
| **Input** | URL, error message, screenshot, stack trace |
| **Output** | Structured incident report with BLOCK/NOT_BLOCK verdict |
| **Command** | `@workflow EMERGENCY_ERROR <SOURCE>` |

**Mandatory Steps**:
1. CONTEXT FREEZE
2. VALIDATOR (mandatory first)
3. CLASSIFY
4. VERDICT (BLOCK/NOT_BLOCK)
5. REPORT

**Classifications**:

| Classification | FIXATOR? |
|----------------|----------|
| ACTIVE_BLOCKER | ✅ REQUIRED |
| RECOVERED_TRANSIENT | ❌ FORBIDDEN |
| HISTORICAL_ARTIFACT | ❌ FORBIDDEN |
| UI_PRESENTATION_ONLY | ⚠️ OPTIONAL |
| UNKNOWN | ❌ ESCALATE |

---

## 1. PLANNER

**Purpose**: Create feature plans compatible with Task Magic.

| Aspect | Detail |
|--------|--------|
| **Mode** | READ-ONLY |
| **Input** | Feature request |
| **Output** | `.ai/plans/features/{FEATURE_CODE}_*.md` |
| **Command** | `@workflow PLANNER` |

**Rules**:
- MUST scan existing system before designing
- MUST follow `docs/AI_PLANNER_GUARDRAILS.md`
- MUST NOT generate tasks or write code

**Error Origin Responsibility (when invoked due to FEATURE_PLAN error)**:
- MUST identify invalid assumptions
- MUST correct feature plan sections
- MUST document changed assumptions explicitly
- MUST increment plan revision metadata
- MUST output "Semantic Corrections" section

See: [10_ERROR_TRACEABILITY.md](10_ERROR_TRACEABILITY.md)

---

## 2. IMPLEMENTER

**Purpose**: Execute approved feature plans **VERBATIM**. The **ONLY ROLE** authorized to implement.

| Aspect | Detail |
|--------|--------|
| **Mode** | WRITE (scope-locked) |
| **Input** | Feature prefix |
| **Output** | Code, TASKS.md, changelog |
| **Command** | `@workflow IMPLEMENTER <PREFIX>` |

**Resolution Contract**:
- Scan `.ai/plans/features/`
- Match `filename.startsWith("<PREFIX>_")`
- EXACTLY 1 match = SUCCESS
- 0 or >1 matches = HARD FAIL

**Forbidden**:
- ❌ Guess or use heuristics
- ❌ Validate own work
- ❌ Expand scope beyond plan

---

## 3. VALIDATOR

**Purpose**: First-pass validation for correctness, performance, memory, DB risks.

| Aspect | Detail |
|--------|--------|
| **Mode** | READ-ONLY |
| **Input** | Code, feature plan |
| **Output** | `.ai/_PLANS_VALIDATIONS/<FEATURE>/VALIDATION_*.md` |
| **Command** | `@workflow VALIDATOR` |

**FP Coverage**: FP-002, FP-004, FP-005, FP-008, FP-014, FP-016

**Error Origin (MANDATORY)**:
- MUST include Error Origin block for EVERY issue
- MUST classify ORIGIN_LAYER correctly
- MUST reference plan section if ORIGIN_LAYER = FEATURE_PLAN
- MUST quote assumption from plan if applicable

See: [10_ERROR_TRACEABILITY.md](10_ERROR_TRACEABILITY.md)

---

## 4. UI_INSPECTOR

**Purpose**: Detect visual, UX and presentation-level anomalies.

| Aspect | Detail |
|--------|--------|
| **Mode** | READ-ONLY |
| **Input** | UI components |
| **Output** | `.ai/_PLANS_VALIDATIONS/<FEATURE>/UI_INSPECTION_*.md` |
| **Command** | `@workflow UI_INSPECTOR` |

**Detects**:
- ×100 errors (ratio as percentage)
- Missing data shown as zero
- Non-persistent ID as stable
- Misleading labels

**FP Coverage**: FP-019, FP-033 to FP-038

---

## 5. DATA_SEMANTIC_VALIDATOR

**Purpose**: Detect semantically wrong, ambiguous or misleading data.

| Aspect | Detail |
|--------|--------|
| **Mode** | READ-ONLY |
| **Input** | Data queries, aggregations |
| **Output** | `.ai/_PLANS_VALIDATIONS/<FEATURE>/DATA_SEMANTIC_VALIDATION_*.md` |
| **Command** | `@workflow DATA_SEMANTIC_VALIDATOR` |

**Detects**:
- Unit mismatches
- Time-window mismatches
- Statistical mirages

**FP Coverage**: FP-014, FP-019, FP-035, FP-039 to FP-041

---

## 6. UI_BROWSER_VALIDATOR

**Purpose**: Validate actual user experience in a **real browser**.

| Aspect | Detail |
|--------|--------|
| **Mode** | EXECUTION |
| **Input** | Entry URL |
| **Output** | `.ai/_PLANS_VALIDATIONS/<FEATURE>/UI_BROWSER_VALIDATION_*.md` |
| **Command** | `@workflow UI_BROWSER_VALIDATOR` |
| **Tooling** | MCP Browser / Playwright |

**Detects**:
- Dead clicks
- Silent API failures
- Infinite loading
- Console errors

**FP Coverage**: FP-042 to FP-047

**Verdicts**: BLOCK | CONDITIONAL_PASS | PASS

---

## 7. FIXATOR

**Purpose**: Fix issues identified by validation reports.

| Aspect | Detail |
|--------|--------|
| **Mode** | WRITE (scoped) |
| **Input** | Validation reports |
| **Output** | Code changes |
| **Command** | `@workflow FIXATOR` |

**Scope Lock**:
- ✅ MAY fix BLOCKER issues
- ❌ MUST NOT expand scope
- ❌ MUST NOT change logic
- ❌ MUST NOT introduce features

**Error Origin Constraints (MANDATORY)**:

FIXATOR **MUST REFUSE** if:
- ORIGIN_LAYER = `FEATURE_PLAN` + BLOCK severity
- ORIGIN_LAYER = `DATA_MODEL` (unless explicitly authorized)
- Fix would change semantic intent

FIXATOR **MAY FIX**:
- ORIGIN_LAYER = `IMPLEMENTATION` (any severity)
- ORIGIN_LAYER = `UI_PRESENTATION` (any severity)

See: [10_ERROR_TRACEABILITY.md](10_ERROR_TRACEABILITY.md)

---

## 8. RE_VALIDATOR

**Purpose**: Confirm all reported issues were fixed.

| Aspect | Detail |
|--------|--------|
| **Mode** | READ-ONLY |
| **Input** | Original reports, fixed code |
| **Output** | `.ai/_PLANS_VALIDATIONS/<FEATURE>/RE_VALIDATION_*.md` |
| **Command** | `@workflow RE_VALIDATOR` |

**Rules**:
- MUST verify each issue is resolved
- MUST check no new issues
- MUST FAIL if fix hides issue

**Error Origin Verification (MANDATORY)**:

MUST verify:
- All FEATURE_PLAN-originated issues triggered plan update
- Implementation corresponds to UPDATED plan
- Plan revision matches implementation

See: [10_ERROR_TRACEABILITY.md](10_ERROR_TRACEABILITY.md)

---

## 9. ARCHITECT

**Purpose**: Produce ADR for complex features.

| Aspect | Detail |
|--------|--------|
| **Mode** | READ-ONLY |
| **Input** | Complex feature request |
| **Output** | `.ai/ADR/{feature}-adr.md` |
| **Trigger** | External deps, schema changes, new jobs |

**ADR Requirements**:
- Problem statement
- ≥3 alternatives
- Chosen option with rationale
- Reversibility cost
- Decision freeze period

---

## 10. CODE_DOCUMENTATOR

**Purpose**: Maintain accurate, code-aligned technical documentation.

| Aspect | Detail |
|--------|--------|
| **Mode** | READ-ONLY |
| **Input** | Feature code or module path |
| **Output** | `docs/<MODULE>/` (modular structure) |
| **Command** | `@workflow CODE_DOCUMENTATOR <TARGET>` |

**Modes**:
- CREATE_FROM_SCRATCH
- UPDATE_EXISTING
- EXTEND_MODULE_DOCS

**Mandatory**:
- Hierarchy: Code > Plans > Docs > Assumptions
- Troubleshooting extraction from changelogs
- Evidence-based (file paths required)

---

## 11. USER_DOCUMENTATOR

**Purpose**: Create and maintain user-facing documentation.

| Aspect | Detail |
|--------|--------|
| **Mode** | READ-ONLY |
| **Output** | `docs/_DASHBOARD_USER_GUIDE/` |
| **Command** | `@workflow USER_DOCUMENTATOR <MODE>` |

**Modes**:
- CREATE - New route documentation
- UPDATE - Update for UI changes
- AUDIT - Check UI ↔ docs sync

---

## 12. JOB_OBSERVER

**Purpose**: Operational supervision of background jobs (SRE role).

| Aspect | Detail |
|--------|--------|
| **Mode** | OPERATIONAL |
| **Input** | Job context, handoff prompt |
| **Output** | Status report, safe actions |
| **Command** | `@workflow JOB_OBSERVER <CONTEXT>` |

**Allowed**:
- ✅ Diagnose job states
- ✅ Pause/resume schedulers
- ✅ Transition modes (backfill → steady)

**Forbidden**:
- ❌ Change job logic
- ❌ Write code
- ❌ Enable deprecated jobs

---

## 13. DOC_GUARD

**Purpose**: Automatic detection of missing documentation for code changes.

### Core Principle

> **DOC_GUARD CANNOT BLOCK WORK.**  
> **DOC_GUARD MUST BLOCK LIES.**

| Aspect | Detail |
|--------|--------|
| **Mode** | ADVISORY (with 2 hard exceptions) |
| **Input** | Git diff, modified files |
| **Output** | DOC_GUARD_REPORT.md |
| **Trigger** | After IMPLEMENTER, before VALIDATOR |
| **Command** | `@workflow DOC_GUARD` |

### Detection Patterns

| File Pattern | Required Documentation | Blocker? |
|--------------|------------------------|----------|
| `scripts/JOBS/*.mts` (NEW) | `docs/JOBS/{job-name}/` | 🔴 HARD BLOCKER |
| `docs/DANGEROUS_OPERATIONS/**` (MOD) | Corresponding safety doc | 🔴 HARD BLOCKER |
| New admin/client pages | `docs/MAPPINGS/` entry | ⚠️ Advisory |
| New services | `docs/BACKEND/` update | 💡 Recommend |

### Hard Blockers (ONLY 2)

DOC_GUARD **MAY BLOCK** only when:

1. **New Cloud Run Job** is added AND no docs exist
2. **DANGEROUS operation** is modified AND no safety docs exist

All other cases → WARN / RECOMMEND / FLAG (continue workflow)

---

## Implementation Authority

| Role | Can Implement? |
|------|----------------|
| PLANNER | ❌ FORBIDDEN |
| **IMPLEMENTER** | ✅ **ONLY AUTHORIZED** |
| VALIDATOR | ❌ FORBIDDEN |
| UI_INSPECTOR | ❌ FORBIDDEN |
| DATA_SEMANTIC_VALIDATOR | ❌ FORBIDDEN |
| UI_BROWSER_VALIDATOR | ❌ FORBIDDEN |
| FIXATOR | ❌ FORBIDDEN (fixes only) |
| RE_VALIDATOR | ❌ FORBIDDEN |
| CODE_DOCUMENTATOR | ❌ FORBIDDEN |
| USER_DOCUMENTATOR | ❌ FORBIDDEN |
| JOB_OBSERVER | ❌ FORBIDDEN |
| DOC_GUARD | ❌ FORBIDDEN |

---

**Prev**: [02_ARCHITECTURE.md](02_ARCHITECTURE.md)  
**Next**: [04_EXECUTION_ORDER.md](04_EXECUTION_ORDER.md)
