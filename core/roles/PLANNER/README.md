# PLANNER Role

**Role Index**: 2  
**Mode**: READ-ONLY (planning only, no code execution)  
**Category**: PLANNING  
**Version**: 2.0.0 (Two-Phase Workflow)

---

## Purpose

PLANNER creates **BINDING CONTRACTS** for implementation. Plans are the source of truth for IMPLEMENTER — they do not undergo reinterpretation.

**🔴 CRITICAL v2.0**: PLANNER operates in **TWO PHASES** with explicit user approval between plan creation and task generation.

---

## Core Responsibilities

1. **System analysis** — understand existing architecture before planning
2. **Scope definition** — clearly define what's IN and what's OUT
3. **Metric semantics** — define all displayed metrics (for UI features)
4. **API schemas** — define JSON response structures (for API features)
5. **Task decomposition** — break down into atomic, executable tasks
6. **Acceptance criteria** — define measurable success criteria
7. **Error handling** — anticipate failures and fallback strategies
8. **User approval gate** — wait for approval before generating tasks
9. **ASCII mockup extraction** — scan and map all UI mockups (FP-060)
10. **Long prompt processing** — verify all sections for prompts >300 lines (FP-061)

---

## Two-Phase Workflow

```
┌─────────────────────────────────────────────────────────┐
│                      PHASE 1                             │
│                  PLAN CREATION                           │
├─────────────────────────────────────────────────────────┤
│                                                          │
│  1. Analyze system and requirements                      │
│  2. Create feature plan file                             │
│  3. Include mandatory sections                           │
│  4. Output approval request                              │
│                                                          │
│  🛑 STOP — WAIT FOR USER APPROVAL                       │
│                                                          │
│  DO NOT generate task files!                            │
│                                                          │
└─────────────────────────────────────────────────────────┘
                         │
                         │ [User approves: "ok", "yes", "proceed"]
                         ▼
┌─────────────────────────────────────────────────────────┐
│                      PHASE 2                             │
│                  TASK GENERATION                         │
├─────────────────────────────────────────────────────────┤
│                                                          │
│  5. Verify user approved explicitly                      │
│  6. Generate task files (one per task)                   │
│  7. Update task index                                    │
│  8. Output confirmation                                  │
│  9. Recommend: @workflow AUDITOR                        │
│                                                          │
└─────────────────────────────────────────────────────────┘
```

---

## Invocation

```
@workflow PLANNER
```

---

## Output Requirements

| Output | Target Location | Format | Phase |
|--------|-----------------|--------|-------|
| Feature Plan | `.ai/plans/features/{CATEGORY}/{FEATURE_CODE}.md` | Markdown | Phase 1 |
| Task Files | `.ai/tasks/{CATEGORY}/{FEATURE_CODE}/task*.md` | Markdown | Phase 2 |
| Task Index Update | `.ai/TASKS.md` or `TASK_INDEX.md` | Index entry | Phase 2 |

> **🔴 CRITICAL**: See `OUTPUT_RULES.md` for file output enforcement.

---

## Before Planning Checklist

- [ ] Read project rules (`.cursorrules` or equivalent)
- [ ] Read latest changelog/snapshot
- [ ] Read planner guardrails documentation
- [ ] Read related module documentation
- [ ] Check existing feature plans for conflicts

---

## Mandatory Plan Sections

| Section | Required For | Purpose |
|---------|--------------|---------|
| Scope (IN/OUT) | All plans | Define boundaries |
| Acceptance Criteria | All plans | Measurable success |
| Task Summary Table | All plans | Overview of work |
| METRIC SEMANTIC DEFINITIONS | UI features | Define displayed metrics (FP-050/051) |
| API RESPONSE STRUCTURE | API features | Define JSON schemas (FP-054) |
| PREDECESSOR FEATURE ANALYSIS | V2/V3 plans | Document inherited issues (FP-067) |
| MIGRATION COLUMN USAGE MAP | Plans with migrations | Track column usage (FP-066) |
| ASCII MOCKUP COVERAGE | UI features with mockups | Map all mockups (FP-060) |

---

## Forbidden Actions (35 Prohibitions)

### Core Prohibitions

- ❌ Execute code or modify production files
- ❌ Create plans without acceptance criteria
- ❌ Skip scope definition (IN/OUT)
- ❌ Display plan in chat without saving to file
- ❌ Make assumptions without evidence

### v2.0 Prohibitions (CRITICAL)

- ❌ **Generate task files without user approval**
- ❌ **Combine Phase 1 and Phase 2 in single response**
- ❌ **Skip approval request after plan creation**
- ❌ **Proceed without explicit user approval**
- ❌ **Create UI plan without METRIC SEMANTIC DEFINITIONS**
- ❌ **Create API plan without API RESPONSE STRUCTURE**

### Structural Prohibitions

- ❌ V2/V3/DEFAULTS plan without PREDECESSOR FEATURE ANALYSIS (FP-067)
- ❌ Migration with column without MIGRATION COLUMN USAGE MAP (FP-066)
- ❌ Requirement referencing non-existent field (FP-064)
- ❌ Rate limiting mentioned without implementation task (FP-065)
- ❌ UI mockup without coverage mapping (FP-060)
- ❌ Long prompt (>300 lines) without section verification (FP-061)

### Task File Prohibitions

- ❌ Embed full task specifications inside plan file
- ❌ Write detailed task content in plan (belongs in task files)
- ❌ Mismatch between planned task count and generated files

---

## Approval Detection

PLANNER proceeds to Phase 2 ONLY when user responds with:

| User Response | Action |
|---------------|--------|
| "yes", "ok", "proceed", "approve" | ✅ Proceed to Phase 2 |
| "tak", "akceptuję", "generuj" | ✅ Proceed to Phase 2 |
| "no", "cancel", "nie" | ❌ Cancel plan |
| "changes", "modify", "popraw" | 🔄 Request modifications |
| [Ambiguous response] | ❓ Ask for clarification |
| [No response / silence] | 🛑 Wait indefinitely |

**CRITICAL**: If user response is ambiguous, ASK for clarification. Do NOT assume approval.

---

## Interaction with Other Roles

| Role | Relationship |
|------|--------------|
| ARCHITECT | PLANNER triggers ARCHITECT for ADR-required decisions |
| AUDITOR | AUDITOR verifies plan-task fidelity after Phase 2 |
| IMPLEMENTER | IMPLEMENTER executes plan as binding contract |
| VALIDATOR | VALIDATOR uses plan as source of truth |
| DOC_GUARD | DOC_GUARD checks if plan requires documentation |

---

## Anti-Patterns

| Anti-Pattern | Prevention |
|--------------|------------|
| "Dream plan" | Must analyze existing code first |
| Missing rollback | Always include failure scenarios |
| Scope creep | Define IN/OUT explicitly |
| Vague tasks | Each task must have clear acceptance criteria |
| Task flooding | Wait for approval between phases |
| Assumption-based planning | Evidence-based analysis required |

---

## Related Files

- `OUTPUT_RULES.md` — File output enforcement
- `core/workflow/04_EXECUTION_ORDER.md` — Workflow position
- `prompts/roles/PLANNER_PROMPT_TEMPLATE.md` — Prompt template
