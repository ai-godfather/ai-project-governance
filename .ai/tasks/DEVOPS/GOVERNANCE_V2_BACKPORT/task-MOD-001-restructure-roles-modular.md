# Task: MOD-001 — Restructure core/roles/ to Modular

> **Feature**: DEVOPS_007 (Governance V2.0 Backport)  
> **Category**: MODULAR_ROLES  
> **Priority**: P0 (Critical)  
> **Status**: pending

---

## Description

Restructure core/roles/ from flat files to folder-per-role structure.

---

## Input Requirements

- Read callrelay structure: `ls -la .ai/roles/`
- Read existing v1.0: `core/roles/` (3 flat files)

---

## Output Requirements

### Structure to Create

```
core/roles/
├── README.md               # Index of all roles
├── EMERGENCY_ERROR/
│   └── README.md
├── PLANNER/
│   ├── README.md
│   └── OUTPUT_RULES.md
├── AUDITOR/
│   ├── README.md
│   └── OUTPUT_RULES.md
├── TDD_GUIDE/
│   ├── README.md
│   └── OUTPUT_RULES.md
├── IMPLEMENTER/
│   └── README.md
├── VALIDATOR/
│   └── README.md
├── UI_INSPECTOR/
│   └── README.md
├── DATA_SEMANTIC_VALIDATOR/
│   ├── README.md
│   └── OUTPUT_RULES.md
├── UI_BROWSER_VALIDATOR/
│   ├── README.md
│   └── OUTPUT_RULES.md
├── UI_BROWSER_INSPECTOR/
│   ├── README.md
│   └── OUTPUT_RULES.md
├── FIXATOR/
│   └── README.md
├── RE_VALIDATOR/
│   └── README.md
├── ARCHITECT/
│   └── README.md
├── CODE_DOCUMENTATOR/
│   ├── README.md
│   └── SAFEGUARDS.md
├── USER_DOCUMENTATOR/
│   └── README.md
├── JOB_OBSERVER/
│   └── README.md
└── DOC_GUARD/
    └── README.md
```

---

## Acceptance Criteria

- [ ] 16 role folders created
- [ ] Each has README.md
- [ ] OUTPUT_RULES.md where needed
- [ ] Index README.md at root

---

## Dependencies

None (foundation task)
