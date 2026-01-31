# Feature Plans Directory

> This directory contains feature plans created by PLANNER.

---

## Structure

```
.ai/plans/
├── features/
│   └── {CATEGORY}/
│       └── {FEATURE_CODE}_*.md    # Feature plan files
├── adr/                            # Architecture Decision Records
│   └── {feature}-adr.md
└── README.md                       # This file
```

## Categories

| Category | Description |
|----------|-------------|
| ADMIN | Admin features |
| USER | User-facing features |
| API | API features |
| INFRA | Infrastructure |
| JOB | Background jobs |
| PERF | Performance |
| DEVOPS | DevOps tasks |

## Plan File Format

Feature plans follow this structure:

```markdown
# Feature Plan: {FEATURE_NAME}

> **Feature Code**: {CATEGORY}_{NUMBER}  
> **Version**: 1.0.0  
> **Created**: YYYY-MM-DD  
> **Status**: PLAN READY — AWAITING APPROVAL

---

## Executive Summary

[Brief description of the feature]

## IN SCOPE

- Item 1
- Item 2

## OUT OF SCOPE

- Excluded item 1

## PREDECESSOR FEATURE ANALYSIS (if V2/V3)

[Analysis of previous versions and inherited issues]

## TASK BREAKDOWN

| Task ID | Name | Description | Priority |
|---------|------|-------------|----------|
| 001 | Task name | Description | P0 |

## ACCEPTANCE CRITERIA

- [ ] Criterion 1
- [ ] Criterion 2

## 🛑 APPROVAL GATE

**Plan ready for review. Approve to generate task files.**
```

## Workflow

1. Run `@workflow PLANNER` with feature request
2. PLANNER creates plan file (Phase 1)
3. User reviews and approves
4. PLANNER generates task files (Phase 2)
5. AUDITOR verifies task coverage

---

**This directory is empty after fresh installation.**  
Plans are created when you run `@workflow PLANNER`.
