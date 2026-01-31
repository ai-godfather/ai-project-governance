# AI Project Governance — Roles Index

> **Version**: 2.0.0  
> **Status**: ACTIVE  
> **Roles**: 16

---

## Role Summary

| # | Role | Category | Mode | Purpose |
|---|------|----------|------|---------|
| 1 | EMERGENCY_ERROR | INCIDENT | READ-ONLY | Production incident handling |
| 2 | PLANNER | PLANNING | READ-ONLY | Feature planning (Two-Phase v2.0) |
| 3 | **AUDITOR** | AUDIT | READ-ONLY | Quality Gate (NEW v2.0) |
| 4 | **TDD_GUIDE** | TESTING | WRITE (tests) | RED phase test creation (NEW v2.0) |
| 5 | IMPLEMENTER | IMPLEMENTATION | WRITE | Code execution |
| 6 | VALIDATOR | VALIDATION | READ-ONLY | First-pass validation |
| 7 | UI_INSPECTOR | VALIDATION | READ-ONLY | UI component inspection |
| 8 | DATA_SEMANTIC_VALIDATOR | VALIDATION | READ-ONLY | Data semantic validation |
| 9 | UI_BROWSER_VALIDATOR | VALIDATION | READ+EXECUTE | Runtime browser validation |
| 10 | **UI_BROWSER_INSPECTOR** | TESTING | READ+EXECUTE | E2E test generation (NEW v2.0) |
| 11 | FIXATOR | REMEDIATION | WRITE (scoped) | Issue remediation |
| 12 | RE_VALIDATOR | VALIDATION | READ-ONLY | Post-fix validation |
| 13 | ARCHITECT | ARCHITECTURE | READ-ONLY | ADR creation |
| 14 | CODE_DOCUMENTATOR | DOCUMENTATION | WRITE (docs) | Technical documentation |
| 15 | USER_DOCUMENTATOR | DOCUMENTATION | WRITE (docs) | User-facing documentation |
| 16 | DOC_GUARD | GOVERNANCE | READ-ONLY | Documentation governance |

---

## Workflow Execution Order

```
                                    ┌─────────────────┐
                                    │ EMERGENCY_ERROR │
                                    └────────┬────────┘
                                             │
                                             ▼
┌─────────────────────────────────────────────────────────────────────┐
│                         STANDARD WORKFLOW                            │
├─────────────────────────────────────────────────────────────────────┤
│                                                                      │
│   PLANNER (Phase 1)  ──► [USER APPROVAL] ──► PLANNER (Phase 2)      │
│         │                                          │                 │
│         ▼                                          ▼                 │
│   Plan File Created                        Task Files Created        │
│                                                    │                 │
│                              ┌─────────────────────┘                 │
│                              ▼                                       │
│                         [AUDITOR]  ◄── Quality Gate (NEW v2.0)      │
│                              │                                       │
│                   ┌──────────┼──────────┐                           │
│                   ▼          ▼          ▼                           │
│               PASS       PARTIAL      FAIL                          │
│                 │            │          │                           │
│                 │            └────► PLANNER fixes                   │
│                 │                       │                           │
│                 ▼                       ▼                           │
│           [TDD_GUIDE]  ◄── Optional (RED phase)                     │
│                 │                                                    │
│                 ▼                                                    │
│           IMPLEMENTER  ──► Tests GREEN                              │
│                 │                                                    │
│                 ▼                                                    │
│            VALIDATOR  ──► UI_INSPECTOR ──► DATA_SEMANTIC_VALIDATOR  │
│                 │                                                    │
│         ┌───────┴───────┐                                           │
│         ▼               ▼                                           │
│      PASS            BLOCK                                          │
│         │               │                                           │
│         │               ▼                                           │
│         │           FIXATOR                                         │
│         │               │                                           │
│         │               ▼                                           │
│         │         RE_VALIDATOR                                      │
│         │               │                                           │
│         └───────────────┘                                           │
│                 │                                                    │
│                 ▼                                                    │
│         CODE_DOCUMENTATOR ──► DOC_GUARD                             │
│                                                                      │
└─────────────────────────────────────────────────────────────────────┘
```

---

## Role Categories

### Planning & Architecture

| Role | Folder | Description |
|------|--------|-------------|
| PLANNER | `PLANNER/` | Creates binding contracts for implementation |
| ARCHITECT | `ARCHITECT/` | Creates Architecture Decision Records |

### Quality Gates (NEW v2.0)

| Role | Folder | Description |
|------|--------|-------------|
| AUDITOR | `AUDITOR/` | Verifies task fidelity to plan |
| TDD_GUIDE | `TDD_GUIDE/` | Creates failing tests (RED phase) |

### Implementation

| Role | Folder | Description |
|------|--------|-------------|
| IMPLEMENTER | `IMPLEMENTER/` | Executes plans, makes tests GREEN |

### Validation

| Role | Folder | Description |
|------|--------|-------------|
| VALIDATOR | `VALIDATOR/` | First-pass code validation |
| UI_INSPECTOR | `UI_INSPECTOR/` | UI component inspection |
| DATA_SEMANTIC_VALIDATOR | `DATA_SEMANTIC_VALIDATOR/` | Data meaning validation |
| UI_BROWSER_VALIDATOR | `UI_BROWSER_VALIDATOR/` | Runtime browser validation |
| UI_BROWSER_INSPECTOR | `UI_BROWSER_INSPECTOR/` | E2E test generation |
| RE_VALIDATOR | `RE_VALIDATOR/` | Post-fix validation |

### Remediation

| Role | Folder | Description |
|------|--------|-------------|
| FIXATOR | `FIXATOR/` | Issue remediation (scoped) |

### Documentation

| Role | Folder | Description |
|------|--------|-------------|
| CODE_DOCUMENTATOR | `CODE_DOCUMENTATOR/` | Technical documentation |
| USER_DOCUMENTATOR | `USER_DOCUMENTATOR/` | User-facing documentation |
| DOC_GUARD | `DOC_GUARD/` | Documentation governance |

### Incident Response

| Role | Folder | Description |
|------|--------|-------------|
| EMERGENCY_ERROR | `EMERGENCY_ERROR/` | Production incident handling |

---

## File Structure Per Role

Each role folder contains:

```
ROLE_NAME/
├── README.md           # Role overview (required)
├── OUTPUT_RULES.md     # File output enforcement (if role creates files)
└── SAFEGUARDS.md       # Anti-churn rules (CODE_DOCUMENTATOR only)
```

---

## Role Permissions Matrix

| Role | Read Code | Write Code | Write Tests | Write Docs | Create Files |
|------|-----------|------------|-------------|------------|--------------|
| PLANNER | ✅ | ❌ | ❌ | ❌ | Plans, Tasks |
| AUDITOR | ✅ | ❌ | ❌ | ❌ | Reports |
| TDD_GUIDE | ✅ | ❌ | ✅ | ❌ | Tests |
| IMPLEMENTER | ✅ | ✅ | ✅ | ❌ | Source, Config |
| VALIDATOR | ✅ | ❌ | ❌ | ❌ | Reports |
| FIXATOR | ✅ | ✅ (scoped) | ✅ (scoped) | ❌ | — |
| CODE_DOCUMENTATOR | ✅ | ❌ | ❌ | ✅ | Docs |
| USER_DOCUMENTATOR | ✅ | ❌ | ❌ | ✅ | Docs |

---

## Quick Reference: @workflow Commands

| Command | Role | Purpose |
|---------|------|---------|
| `@workflow PLANNER` | PLANNER | Create feature plan |
| `@workflow AUDITOR <CODE>` | AUDITOR | Audit task coverage |
| `@workflow TDD_GUIDE <TASK>` | TDD_GUIDE | Create failing tests |
| `@workflow IMPLEMENTER <CODE>` | IMPLEMENTER | Execute plan |
| `@workflow VALIDATOR` | VALIDATOR | First-pass validation |
| `@workflow FIXATOR` | FIXATOR | Fix reported issues |
| `@workflow RE_VALIDATOR` | RE_VALIDATOR | Verify fixes |
| `@workflow CODE_DOCUMENTATOR` | CODE_DOCUMENTATOR | Technical docs |
| `@workflow USER_DOCUMENTATOR` | USER_DOCUMENTATOR | User docs |
| `@workflow DOC_GUARD` | DOC_GUARD | Doc governance |
| `@workflow EMERGENCY_ERROR` | EMERGENCY_ERROR | Incident handling |

---

## Version History

| Version | Date | Changes |
|---------|------|---------|
| 2.0.0 | {{DATE}} | Added AUDITOR, TDD_GUIDE, UI_BROWSER_INSPECTOR; Two-Phase PLANNER |
| 1.0.0 | — | Initial 14 roles |

---

**Canonical Reference**: `core/workflow/03_ROLES.md`
