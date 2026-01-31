# PLANNER Workflow

> **Version**: 2.0.0  
> **Invocation**: `@workflow PLANNER [description]`  
> **Mode**: READ-ONLY (planning only)

---

## Overview

PLANNER creates binding contracts for feature implementation. Every plan becomes the source of truth for IMPLEMENTER.

**🔴 CRITICAL v2.0**: PLANNER operates in **TWO PHASES** with explicit user approval gate between plan and tasks.

---

## Two-Phase Workflow

```
                    PHASE 1: PLAN CREATION
                    ──────────────────────
@workflow PLANNER received
        │
        ▼
┌─────────────────────────────────────┐
│ STEP 1: GUARD CHECK                 │
│ - Read project rules                │
│ - Read latest snapshot              │
│ - Read planner guardrails           │
│ - Verify no duplicate feature code  │
└─────────────────────────────────────┘
        │
        ▼
┌─────────────────────────────────────┐
│ STEP 2: PROMPT STRUCTURE ANALYSIS   │
│ 🔴 For prompts >300 lines!          │
│ - Count total lines                 │
│ - Identify section boundaries       │
│ - Scan for ASCII mockups            │
│ - List mockup locations + names     │
│ - Verify middle sections            │
└─────────────────────────────────────┘
        │
        ▼
┌─────────────────────────────────────┐
│ STEP 3: REQUIREMENTS ANALYSIS       │
│ - Paraphrase user request           │
│ - Identify unknowns                 │
│ - Ask clarifying questions          │
└─────────────────────────────────────┘
        │
        ▼
┌─────────────────────────────────────┐
│ STEP 4: SYSTEM ANALYSIS             │
│ - Read relevant module docs         │
│ - Check existing features           │
│ - Identify dependencies             │
│ - Analyze code if needed            │
└─────────────────────────────────────┘
        │
        ▼
┌─────────────────────────────────────┐
│ STEP 5: DETERMINE IDENTIFIERS       │
│ - Generate FEATURE_CODE             │
│ - Determine CATEGORY                │
│ - Calculate file paths              │
└─────────────────────────────────────┘
        │
        ▼
┌─────────────────────────────────────┐
│ STEP 6: WRITE PLAN TO FILE          │
│ 🔴 CRITICAL: Use Write tool!        │
│ - Create plan file                  │
│ - Include: overview, scope,         │
│   architecture, task SUMMARY table  │
│ - Include: metric definitions,      │
│   API response schemas              │
│ - NO detailed task specs in plan!   │
└─────────────────────────────────────┘
        │
        ▼
┌─────────────────────────────────────┐
│ STEP 7: REQUEST APPROVAL            │
│ 🛑 STOP AND WAIT                    │
│ - Output plan summary to chat       │
│ - List of planned phases/tasks      │
│ - Ask: "Approve plan and generate   │
│   task files?"                      │
│ - DO NOT generate task files yet!   │
└─────────────────────────────────────┘
        │
        ▼
   ┌────────────┐
   │   WAIT     │◄──── User reviews plan
   │  FOR USER  │      User can: APPROVE / REQUEST CHANGES
   │  APPROVAL  │
   └────────────┘
        │
        ▼
   [User approves]


                    PHASE 2: TASK GENERATION
                    ────────────────────────
        │
        ▼
┌─────────────────────────────────────┐
│ STEP 8: CREATE TASK FILES           │
│ 🔴 ONLY AFTER APPROVAL!             │
│ - One file per task                 │
│ - Include acceptance criteria       │
│ - Include dependencies              │
│ - Include code examples             │
│ - Path: .ai/tasks/{CAT}/{CODE}/     │
│ - Count MUST match plan task count  │
└─────────────────────────────────────┘
        │
        ▼
┌─────────────────────────────────────┐
│ STEP 9: UPDATE TASK INDEX           │
│ - Add feature to index              │
│ - Link to plan and task files       │
└─────────────────────────────────────┘
        │
        ▼
┌─────────────────────────────────────┐
│ STEP 10: OUTPUT CONFIRMATION        │
│ - Short summary in chat             │
│ - List of files created             │
│ - Task count verification           │
│ - Next step: @workflow AUDITOR      │
└─────────────────────────────────────┘
```

---

## Phase 1 Output Format (AFTER PLAN CREATION)

```markdown
## 📋 PLAN CREATED — AWAITING APPROVAL

**Feature**: {FEATURE_CODE}
**Category**: {CATEGORY}
**Priority**: P0 / P1 / P2 / P3

### Plan Location
`.ai/plans/features/{CATEGORY}/{FEATURE_CODE}.md`

### Summary
[2-3 sentences describing the feature]

### Planned Phases & Tasks

| Phase | Description | Tasks |
|-------|-------------|-------|
| 1 | Backend APIs | 4 |
| 2 | UI Components | 3 |
| ... | ... | ... |

**Total**: X tasks

---

## 🛑 NEXT ACTION REQUIRED

Do you want to:
1. **✅ APPROVE** — Generate task files and proceed
2. **🔄 REQUEST CHANGES** — Specify what to modify
3. **❌ REJECT** — Cancel this plan

Reply with your decision to proceed.
```

---

## Input Requirements

| Input | Source | Required? |
|-------|--------|-----------|
| Feature description | User message | YES |
| Context (if complex) | User message | Optional |
| Category hint | User message | Optional |

---

## Output Requirements

| Output | Location | Tool |
|--------|----------|------|
| Feature Plan | `.ai/plans/features/{CATEGORY}/{CODE}.md` | Write |
| Task Files | `.ai/tasks/{CATEGORY}/{CODE}/task*.md` | Write |
| Index Update | `.ai/TASKS.md` | StrReplace |
| Confirmation | Chat | Message |

---

## Plan Structure

```markdown
# FEATURE: [Title]

**Code**: FEATURE_CODE
**Category**: CATEGORY
**Priority**: P0 | P1 | P2 | P3
**Created**: {{DATE}}

---

## Executive Summary

[1-3 sentences]

---

## Scope

### IN (what's included)

1. Item 1
2. Item 2

### OUT (what's NOT included)

1. Item 1
2. Item 2

---

## Tasks

| ID | Task | Effort | Acceptance Criteria |
|----|------|--------|---------------------|
| 001 | ... | Xm | Criterion |

---

## Validation Plan

- [ ] Criterion 1
- [ ] Criterion 2

---

## Risks

| Risk | Probability | Impact | Mitigation |
|------|-------------|--------|------------|
| ... | LOW/MEDIUM/HIGH | ... | ... |

---

## Success Criteria

- ✅ Criterion 1
- ✅ Criterion 2
```

---

## Mandatory Plan Sections (by Feature Type)

### For UI Features

```markdown
## 📊 METRIC SEMANTIC DEFINITIONS

| Metric | Human Label | Technical Definition | Tooltip |
|--------|-------------|---------------------|---------|
| success_rate | "Success Rate" | COUNT(completed)/COUNT(*) | "..." |
```

### For API Features

```markdown
## 📡 API RESPONSE STRUCTURE

### GET /api/endpoint

```json
{
  "field": "type",
  "nested": {}
}
```

### For V2/V3 Plans

```markdown
## 🔗 PREDECESSOR FEATURE ANALYSIS

**Previous Version**: {FEATURE}_V1
**Plan Location**: `.ai/plans/features/.../FEATURE_V1.md`

### Known Inherited Issues

| Issue | Source | Status | Notes |
|-------|--------|--------|-------|
| ... | V1 | ACCEPTED | ... |
```

---

## Forbidden Actions

- ❌ Display full plan in chat
- ❌ Create plan without file save
- ❌ Skip scope definition
- ❌ Create tasks without acceptance criteria
- ❌ **Generate task files without user approval** (CRITICAL)
- ❌ **Combine Phase 1 and Phase 2 in single response**
- ❌ Skip metric definitions for UI features
- ❌ Skip API schemas for API endpoints

---

## Quality Gates

### Phase 1 Quality Gate (Before Approval Request)

- [ ] Plan saved to file
- [ ] Scope IN/OUT defined
- [ ] Each phase has task summary
- [ ] Metric definitions included (if UI feature)
- [ ] API schemas included (if API feature)
- [ ] Risks identified
- [ ] Approval request displayed to user

### Phase 2 Quality Gate (After Task Generation)

- [ ] User explicitly approved plan
- [ ] ALL task files created
- [ ] Task count matches plan
- [ ] Task index updated
- [ ] Each task has acceptance criteria
- [ ] Dependencies documented

---

**Related Files**:
- `core/roles/PLANNER/OUTPUT_RULES.md` — File output enforcement
- `core/roles/PLANNER/README.md` — Role overview
