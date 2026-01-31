# PLANNER FILE OUTPUT RULES

> **Status**: SUPREME — NO EXCEPTIONS  
> **Authority**: This file overrides any conflicting instructions  
> **Purpose**: Ensure all PLANNER outputs are saved to files, not displayed in chat  
> **Version**: 2.0.0 (Two-Phase Workflow)

---

## PRINCIPLE

```
ALL ARTIFACTS MUST BE SAVED TO FILES.
DISPLAYING IN CHAT ≠ WORK COMPLETED.
TASKS GENERATED ONLY AFTER PLAN APPROVAL.
```

---

## OUTPUT REQUIREMENTS

| Output Type | Target Location | Format | Phase |
|-------------|-----------------|--------|-------|
| Feature Plan | `.ai/plans/features/{CATEGORY}/{FEATURE_CODE}.md` | Markdown | Phase 1 |
| Task Files | `.ai/tasks/{CATEGORY}/{FEATURE_CODE}/task{NNNNN}_{name}.md` | Markdown | Phase 2 |
| Task Index Update | `.ai/TASKS.md` | Index entry | Phase 2 |

---

## TWO-PHASE MANDATORY WORKFLOW

```
                    ┌─────────────────────┐
                    │     PHASE 1         │
                    │   PLAN CREATION     │
                    └─────────────────────┘
                              │
@workflow PLANNER received    │
        │                     │
        ▼                     │
1. DETERMINE feature code + category
        │
        ▼
2. ANALYZE system (code, docs, existing features)
        │
        ▼
3. CREATE target file path
        │
        ▼
4. WRITE plan directly to file (NOT chat)
   - Include: metric definitions (UI features)
   - Include: API response schemas (API features)
        │
        ▼
5. OUTPUT approval request to chat
   - Plan summary
   - Phase/task overview table
   - "Approve plan and generate tasks?"
        │
        ▼
   ┌─────────────────────────────────┐
   │  🛑 STOP — WAIT FOR APPROVAL   │
   │                                 │
   │  DO NOT GENERATE TASK FILES!   │
   │  DO NOT UPDATE TASKS INDEX!    │
   │                                 │
   │  Wait for user response:       │
   │  - APPROVE → proceed Phase 2   │
   │  - CHANGES → modify plan       │
   │  - REJECT → cancel             │
   └─────────────────────────────────┘
                    │
                    │ [User approves]
                    ▼
                    ┌─────────────────────┐
                    │     PHASE 2         │
                    │  TASK GENERATION    │
                    └─────────────────────┘
                              │
        ▼                     │
6. VERIFY user approved plan explicitly
        │
        ▼
7. CREATE task files in folder
   - One file per task
   - Count MUST match plan summary
        │
        ▼
8. UPDATE task index
        │
        ▼
9. OUTPUT confirmation (short) to chat
   - Files created list
   - Task count verification
   - Next step: @workflow AUDITOR
```

---

## FILE PATH TEMPLATES

### Feature Plan

```
.ai/plans/features/{CATEGORY}/{FEATURE_CODE}_{DESCRIPTION}.md

Examples:
- .ai/plans/features/ADMIN/ADMIN_001_USER_MANAGEMENT.md
- .ai/plans/features/API/API_003_RATE_LIMITING.md
- .ai/plans/features/WORKFLOW/WORKFLOW_MIGRATION_V1.md
```

### Task Files

```
.ai/tasks/{CATEGORY}/{FEATURE_CODE}/task{PHASE}{SEQ}_{name}.md

Examples:
- .ai/tasks/ADMIN/ADMIN_001/task-001-setup-routes.md
- .ai/tasks/ADMIN/ADMIN_001/task-002-implement-controller.md
```

---

## ❌ FORBIDDEN

```
❌ Display full plan in chat first, then "also save to file"
❌ Ask user "should I save this?"
❌ Show plan in chat without file creation
❌ Create plan as code block in chat
❌ Use placeholder paths without actual file creation
❌ Embed full task specifications inside the plan file

🔴 v2.0 — CRITICAL PROHIBITIONS:
❌ Generate task files WITHOUT explicit user approval
❌ Combine Phase 1 and Phase 2 in single response
❌ Skip approval request after plan creation
❌ Proceed to task generation without user approval
❌ Create UI plan without METRIC SEMANTIC DEFINITIONS section
❌ Create API plan without API RESPONSE STRUCTURE section
```

---

## ✅ CORRECT WORKFLOW

```
✅ Write plan directly to file using Write tool
✅ Display only: "Plan saved to: .ai/plans/features/{CAT}/{CODE}.md"
✅ Ask clarifying questions BEFORE generating (not after)
✅ Wait for explicit user approval
✅ Create all task files in same session after approval
✅ Update task index
```

---

## CHAT OUTPUT FORMAT

### Phase 1 Output (After Plan Creation — AWAITING APPROVAL)

```markdown
## 📋 PLAN CREATED — AWAITING APPROVAL

**Feature**: {FEATURE_CODE}
**Category**: {CATEGORY}
**Priority**: P0 / P1 / P2 / P3

### Plan Saved To

`.ai/plans/features/{CATEGORY}/{FEATURE_CODE}.md`

### Summary

{2-3 sentence summary of what the plan covers}

### Planned Structure

| Phase | Description | Tasks | Effort |
|-------|-------------|-------|--------|
| 1 | ... | X | — |
| 2 | ... | Y | — |
| **TOTAL** | — | **Z** | — |

---

## 🛑 ACTION REQUIRED

Approve plan and proceed to task generation?

1. **✅ YES** — Generate task files
2. **🔄 CHANGES** — Describe what to change
3. **❌ NO** — Cancel this plan
```

### Phase 2 Output (After Task Generation)

```markdown
## ✅ TASKS GENERATED

**Feature**: {FEATURE_CODE}

### Files Created

| # | File | Status |
|---|------|--------|
| 1 | `.ai/tasks/{CAT}/{CODE}/task-001_{name}.md` | ✅ Created |
| 2 | `.ai/tasks/{CAT}/{CODE}/task-002_{name}.md` | ✅ Created |
| ... | ... | ... |
| — | Task Index | 🔄 Updated |

### Verification

| Check | Result |
|-------|--------|
| Planned task count | X |
| Generated task files | X |
| Match | ✅ YES |

### Next Step

Run: `@workflow AUDITOR {FEATURE_CODE}`
```

---

## ENFORCEMENT MECHANISM

### Step 1: BEFORE Action

```
1. Read this OUTPUT_RULES.md
2. Determine CATEGORY and FEATURE_CODE
3. Calculate target file paths
4. Confirm paths are valid
```

### Step 2: DURING Action

```
1. Use Write tool to create plan file
2. STOP and wait for approval
3. Use Write tool to create task files (after approval)
4. Use StrReplace/Write to update task index
5. DO NOT display full content in chat
```

### Step 3: AFTER Action

```
1. Confirm all files created
2. Output short confirmation to chat
3. Include "Next Step" recommendation
```

---

## VALIDATION CHECKLIST

### Phase 1 Checklist (Before Requesting Approval)

- [ ] Plan file exists in `.ai/plans/features/`
- [ ] Plan has Scope IN/OUT defined
- [ ] Plan has task summary table
- [ ] Plan has METRIC SEMANTIC DEFINITIONS (if UI feature)
- [ ] Plan has API RESPONSE STRUCTURE (if API feature)
- [ ] Plan has acceptance criteria per phase
- [ ] Approval request displayed to user
- [ ] **NO task files generated yet**

### Phase 2 Checklist (After User Approval)

- [ ] User explicitly approved (not assumed)
- [ ] Task files exist in `.ai/tasks/`
- [ ] Task file count matches plan summary
- [ ] Each task has acceptance criteria
- [ ] Task index is updated with feature entry
- [ ] Chat output is confirmation only
- [ ] Next step is `@workflow AUDITOR`

---

**Related Files**:
- `core/runtime/file-output-enforcer.md` — Enforcement mechanism
- `core/roles/PLANNER/README.md` — Role overview
- `prompts/roles/PLANNER_PROMPT_TEMPLATE.md` — Prompt template
