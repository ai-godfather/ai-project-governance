<!--
AI Project Governance Framework

Author & Contact: https://x.com/God_FatherAI
License: MIT (see LICENSE file in project root)
-->

# AI Workflow System - Architecture

> System architecture, role hierarchy, and data flow diagrams.

---

## Role Hierarchy

```
┌─────────────────────────────────────────────────────────────────┐
│                     SUPREME LAW: .cursorrules                   │
└─────────────────────────────────────────────────────────────────┘
                                │
          ┌──────────────────────┴──────────────────────┐
          │                                             │
          ▼                                             ▼
┌─────────────────────────┐               ┌─────────────────────────┐
│   🚨 EMERGENCY_ERROR    │               │    FEATURE DEVELOPMENT  │
│ (Production Incidents)  │               │         PATH            │
│   TOP-LEVEL ENTRY       │               └─────────────────────────┘
└─────────────────────────┘                             │
          │                                             ▼
          │                               ┌─────────────────────────┐
          │                               │     ARCHITECT PHASE     │
          │                               │ (Complex features: ADR) │
          │                               └─────────────────────────┘
          │                                             │
          │                                             ▼
          │                               ┌─────────────────────────┐
          │                               │        PLANNER          │
          │                               │  (Feature planning)     │
          │                               └─────────────────────────┘
          │                                             │
          │                                             ▼
          │                               ┌─────────────────────────┐
          │                               │    ★ IMPLEMENTER ★      │
          │                               │  (ONLY implementation)  │
          │                               └─────────────────────────┘
          │                                             │
          └──────────────────────┬──────────────────────┘
                                 │
                                 ▼
┌─────────────────────────────────────────────────────────────────┐
│                   VALIDATION LAYER (4 ROLES)                    │
├─────────────────────────────────────────────────────────────────┤
│  VALIDATOR → UI_INSPECTOR → DATA_SEMANTIC_VALIDATOR →           │
│                      UI_BROWSER_VALIDATOR                       │
└─────────────────────────────────────────────────────────────────┘
                                 │
                    ┌────────────┴────────────┐
                    │                         │
                    ▼                         ▼
         ┌──────────────────┐      ┌──────────────────┐
         │     FIXATOR      │      │   RE_VALIDATOR   │
         │  (If issues)     │      │ (If no issues)   │
         └──────────────────┘      └──────────────────┘
                    │
                    ▼
         ┌──────────────────┐
         │   RE_VALIDATOR   │
         │ (After fixes)    │
         └──────────────────┘
```

---

## Data Flow

```
Feature Request
      │
      ▼
┌─────────────┐     ┌─────────────┐     ┌─────────────┐
│   PLANNER   │ ──▶ │ IMPLEMENTER │ ──▶ │  VALIDATOR  │
└─────────────┘     └─────────────┘     └─────────────┘
                                              │
                    ┌─────────────────────────┼─────────────────────────┐
                    │                         │                         │
                    ▼                         ▼                         ▼
           ┌─────────────┐           ┌─────────────┐           ┌─────────────┐
           │ UI_INSPECTOR│           │DATA_SEMANTIC│           │ UI_BROWSER  │
           │             │           │ _VALIDATOR  │           │ _VALIDATOR  │
           └─────────────┘           └─────────────┘           └─────────────┘
                    │                         │                         │
                    └─────────────────────────┼─────────────────────────┘
                                              │
                                              ▼
                                   ┌──────────────────┐
                                   │  VERDICT MERGE   │
                                   │ (Any BLOCK → FIX)│
                                   └──────────────────┘
                                              │
                              ┌───────────────┴───────────────┐
                              │                               │
                              ▼                               ▼
                    ┌──────────────┐                ┌──────────────┐
                    │   FIXATOR    │                │ RE_VALIDATOR │
                    └──────────────┘                │  (PASS path) │
                              │                     └──────────────┘
                              ▼
                    ┌──────────────┐
                    │ RE_VALIDATOR │
                    │ (After fix)  │
                    └──────────────┘
```

---

## Error Origin Traceability Flow

Every validation issue is classified by ORIGIN_LAYER and routed accordingly:

```
                    ┌──────────────────────────────┐
                    │     ISSUE DETECTED           │
                    │ (by any validation role)     │
                    └──────────────────────────────┘
                                   │
                                   ▼
                    ┌──────────────────────────────┐
                    │   CLASSIFY ORIGIN_LAYER      │
                    └──────────────────────────────┘
                                   │
        ┌──────────────────────────┼──────────────────────────┐
        │                          │                          │
        ▼                          ▼                          ▼
┌───────────────┐        ┌───────────────┐        ┌───────────────┐
│ FEATURE_PLAN  │        │IMPLEMENTATION │        │UI_PRESENTATION│
│               │        │               │        │               │
│ FIXATOR       │        │ FIXATOR ✅    │        │ FIXATOR ✅    │
│ FORBIDDEN ❌  │        │               │        │               │
└───────────────┘        └───────────────┘        └───────────────┘
        │                          │                          │
        ▼                          │                          │
┌───────────────┐                  │                          │
│   PLANNER     │                  │                          │
│ (update plan) │                  │                          │
└───────────────┘                  │                          │
        │                          │                          │
        ▼                          │                          │
┌───────────────┐                  │                          │
│ IMPLEMENTER   │                  │                          │
│ (re-run)      │                  │                          │
└───────────────┘                  │                          │
        │                          │                          │
        └──────────────────────────┼──────────────────────────┘
                                   │
                                   ▼
                    ┌──────────────────────────────┐
                    │       RE_VALIDATOR           │
                    │ (verify plan ↔ implementation)│
                    └──────────────────────────────┘
```

### Origin Layer Routing

| ORIGIN_LAYER | BLOCK Severity | ENFORCED_NEXT_STEP |
|--------------|----------------|-------------------|
| FEATURE_PLAN | BLOCK | PLANNER → IMPLEMENTER |
| IMPLEMENTATION | BLOCK | FIXATOR |
| UI_PRESENTATION | BLOCK | FIXATOR |
| DATA_MODEL | BLOCK | ARCHITECT |
| EXTERNAL_DEPENDENCY | Any | MONITOR_ONLY |

### Key Rule: PLAN_ORIGINATED_BLOCK

```
IF ORIGIN_LAYER = FEATURE_PLAN AND Severity = BLOCK:
    → FIXATOR is FORBIDDEN
    → PLANNER MUST update plan
    → IMPLEMENTER MUST re-run
```

See: [10_ERROR_TRACEABILITY.md](10_ERROR_TRACEABILITY.md)

---

## Post-Implementation Paths

### Documentation Path

```
IMPLEMENTER
    │
    ▼
CODE_DOCUMENTATOR ──▶ Technical Docs (docs/<MODULE>/)
    │
    ▼
USER_DOCUMENTATOR ──▶ User Docs (docs/_DASHBOARD_USER_GUIDE/)
    │
    ▼
HELP_INTEGRATE ──▶ UI Integration (Help Sidebar)
```

### Operations Path

```
DEPLOY
    │
    ▼
JOB_OBSERVER ──▶ Monitor, Diagnose, Transition
    │
    ├── SAFE ACTIONS
    │
    └── ESCALATION (if no rule matches)
```

### Incident Path

```
PRODUCTION INCIDENT
    │
    ▼
EMERGENCY_ERROR ──▶ Context Freeze
    │
    ▼
VALIDATOR (mandatory first)
    │
    ▼
CLASSIFY ──▶ VERDICT (BLOCK / NOT_BLOCK)
    │
    ├── BLOCK ──▶ FIXATOR ──▶ RE_VALIDATOR
    │
    └── NOT_BLOCK ──▶ Monitor / Close
```

---

## Layer Descriptions

### Planning Layer

| Role | Purpose |
|------|---------|
| ARCHITECT | ADR for complex features |
| PLANNER | Feature plans |

### Implementation Layer

| Role | Purpose |
|------|---------|
| IMPLEMENTER | Execute plans (ONLY authorized implementer) |

### Validation Layer

| Role | Purpose |
|------|---------|
| VALIDATOR | First-pass validation |
| UI_INSPECTOR | Visual anomaly detection |
| DATA_SEMANTIC_VALIDATOR | Semantic integrity |
| UI_BROWSER_VALIDATOR | Runtime browser verification |

### Remediation Layer

| Role | Purpose |
|------|---------|
| FIXATOR | Fix reported issues (scoped) |
| RE_VALIDATOR | Verify fixes |

### Documentation Layer

| Role | Purpose |
|------|---------|
| CODE_DOCUMENTATOR | Technical documentation |
| USER_DOCUMENTATOR | User-facing documentation |

### Operations Layer

| Role | Purpose |
|------|---------|
| JOB_OBSERVER | Job operations / SRE |
| EMERGENCY_ERROR | Production incident response |

---

**Prev**: [01_OVERVIEW.md](01_OVERVIEW.md)  
**Next**: [03_ROLES.md](03_ROLES.md)
