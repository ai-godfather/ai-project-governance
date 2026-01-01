<!--
AI Project Governance Framework

Author: Piotr Kwiatkowski
Contact: peetero@proton.me

License: PROPRIETARY — ALL RIGHTS RESERVED
This is a legal notice, not an instruction or workflow rule.
-->

# AI Project Governance — File Classification

**Generated**: 2026-01-01  
**Purpose**: Classify each governance component for extraction strategy

---

## Classification Categories

| Category | Description | Extraction Strategy |
|----------|-------------|---------------------|
| **CORE_GOVERNANCE** | Project-agnostic workflow rules | Extract as-is, minimal changes |
| **PROJECT_ADAPTER** | Project-specific configurations | Extract as templates with placeholders |
| **BOOTSTRAP_TEMPLATE** | Files for initializing new projects | Create generalized scaffolding |
| **PROMPT** | Role prompts and templates | Extract with configurable variables |
| **EXCLUDED** | Project-specific content, not generalizable | Do not extract |

---

## 1. WORKFLOW SYSTEM — CORE_GOVERNANCE

These files define the universal AI workflow system.

| File | Classification | Notes |
|------|----------------|-------|
| `.ai/_WORKFLOW/README.md` | CORE_GOVERNANCE | Generic quick start |
| `.ai/_WORKFLOW/01_OVERVIEW.md` | CORE_GOVERNANCE | Universal principles |
| `.ai/_WORKFLOW/02_ARCHITECTURE.md` | CORE_GOVERNANCE | Role hierarchy diagrams |
| `.ai/_WORKFLOW/03_ROLES.md` | CORE_GOVERNANCE | All 14 role definitions |
| `.ai/_WORKFLOW/04_EXECUTION_ORDER.md` | CORE_GOVERNANCE | Workflow sequences |
| `.ai/_WORKFLOW/05_FAILURE_PATTERNS.md` | PROJECT_ADAPTER | FPs are project-evolved |
| `.ai/_WORKFLOW/06_FILE_STRUCTURE.md` | CORE_GOVERNANCE | Standard file locations |
| `.ai/_WORKFLOW/07_TROUBLESHOOTING.md` | PROJECT_ADAPTER | Project-specific issues |
| `.ai/_WORKFLOW/08_COMMANDS.md` | CORE_GOVERNANCE | Command reference |
| `.ai/_WORKFLOW/09_ENFORCEMENT.md` | CORE_GOVERNANCE | Compliance rules |
| `.ai/_WORKFLOW/10_ERROR_TRACEABILITY.md` | CORE_GOVERNANCE | Error origin system |
| `.ai/_WORKFLOW/CHANGELOG.md` | EXCLUDED | Project history |
| `.ai/_WORKFLOW/_WORKFLOW_FINAL_DOC.md` | EXCLUDED | Legacy consolidated doc |

---

## 2. RUNTIME GUARDS — CORE_GOVERNANCE

Pre-execution validation logic.

| File | Classification | Notes |
|------|----------------|-------|
| `.ai/runtime/workflow-guard.md` | CORE_GOVERNANCE | Universal guard logic |
| `.ai/runtime/origin-layer-heuristics.md` | CORE_GOVERNANCE | Universal heuristics |
| `.ai/runtime/job-preflight-guard.md` | PROJECT_ADAPTER | Needs job path config |
| `.ai/runtime/doc-guard.md` | CORE_GOVERNANCE | Universal doc governance |
| `.ai/runtime/changelog-generator.md` | CORE_GOVERNANCE | Universal changelog logic |
| `.ai/runtime/prompt-builder.md` | CORE_GOVERNANCE | Universal prompt assembly |
| `.ai/runtime/ui-version-resolver.md` | CORE_GOVERNANCE | Universal version resolution |
| `.ai/runtime/image-digest-verifier.md` | PROJECT_ADAPTER | Needs registry config |
| `.ai/runtime/planner-job-extension.md` | PROJECT_ADAPTER | Enterprise job specifics |

---

## 3. WORKFLOW DEFINITIONS — CORE_GOVERNANCE

MDC workflow contracts.

| File | Classification | Notes |
|------|----------------|-------|
| `.ai/workflows/FIXATOR_VALIDATOR_WORKFLOW.mdc` | CORE_GOVERNANCE | Core validation flow |
| `.ai/workflows/JOB_OBSERVER_WORKFLOW.mdc` | PROJECT_ADAPTER | Needs job config |
| `.ai/workflows/documentation/*.md` | CORE_GOVERNANCE | Universal doc workflows |

---

## 4. ROLE DEFINITIONS — CORE_GOVERNANCE

Role-specific configurations.

| Path | Classification | Notes |
|------|----------------|-------|
| `.ai/roles/CODE_DOCUMENTATOR/README.md` | CORE_GOVERNANCE | Universal role |
| `.ai/roles/CODE_DOCUMENTATOR/SAFEGUARDS.md` | CORE_GOVERNANCE | Universal safeguards |
| `.ai/roles/USER_DOCUMENTATOR/*.md` | CORE_GOVERNANCE | Universal role |

---

## 5. PROMPT TEMPLATES — PROMPT

Standardized role prompts.

| File | Classification | Notes |
|------|----------------|-------|
| `VALIDATOR_PROMPT_TEMPLATE.md` | PROMPT | Universal validation prompt |
| `FIXATOR_PROMPT_TEMPLATE.md` | PROMPT | Universal fix prompt |
| `RE_VALIDATOR_PROMPT_TEMPLATE.md` | PROMPT | Universal re-validation prompt |
| `PLANNER_PROMPT_TEMPLATE.md` | PROMPT | Universal planning prompt |
| `IMPLEMENTER_PROMPT_TEMPLATE.md` | PROMPT | Universal implementation prompt |
| `UI_INSPECTOR_PROMPT_TEMPLATE.md` | PROMPT | Universal UI inspection prompt |
| `DATA_SEMANTIC_VALIDATOR_PROMPT_TEMPLATE.md` | PROMPT | Universal semantic prompt |
| `UI_BROWSER_VALIDATOR_PROMPT_TEMPLATE.md` | PROMPT | Universal browser prompt |
| `EMERGENCY_ERROR_PROMPT_TEMPLATE.md` | PROMPT | Universal incident prompt |
| `CODE_DOCUMENTATOR_PROMPT_TEMPLATE.md` | PROMPT | Universal code doc prompt |
| `JOB_OBSERVER_*.md` | PROJECT_ADAPTER | Needs job configuration |
| `PLANNER_JOB_ENTERPRISE_*.md` | PROJECT_ADAPTER | Enterprise job specifics |
| `USER_DOCUMENTATOR/*.md` | PROMPT | Universal user doc prompts |
| `_INIT_DOCUMENTATION/*.md` | BOOTSTRAP_TEMPLATE | Bootstrap prompts |

---

## 6. CURSOR RULES — PROJECT_ADAPTER

IDE enforcement rules.

| File | Classification | Notes |
|------|----------------|-------|
| `.cursor/rules/after_each_chat.mdc` | CORE_GOVERNANCE | Universal chat enforcement |
| `.cursor/rules/.task-magic/_index.md` | CORE_GOVERNANCE | Task magic index |
| `.cursor/rules/.task-magic/tasks.mdc` | PROJECT_ADAPTER | Needs project paths |
| `.cursor/rules/.task-magic/plans.mdc` | PROJECT_ADAPTER | Needs project paths |

---

## 7. PROJECT ROOT CONFIGURATION — PROJECT_ADAPTER

Top-level governance files.

| File | Classification | Notes |
|------|----------------|-------|
| `.cursorrules` | PROJECT_ADAPTER | Heavy project customization |
| `AGENTS.md` | PROJECT_ADAPTER | Project-specific roles |

**Extraction Strategy**: Create template versions with:
- `{{PROJECT_NAME}}` placeholders
- `{{TECH_STACK}}` configurations
- Sections marked as CUSTOMIZABLE vs IMMUTABLE

---

## 8. DOCUMENTATION GOVERNANCE — CORE_GOVERNANCE

AI guardrails and patterns.

| File | Classification | Notes |
|------|----------------|-------|
| `docs/AI_PLANNER_GUARDRAILS.md` | CORE_GOVERNANCE | Universal guardrails |
| `docs/AI_SYSTEM_FAILURE_PATTERNS.md` | PROJECT_ADAPTER | Project-evolved patterns |
| `docs/JOBS/_TROUBLESHOOTING_RULES.md` | EXCLUDED | Project-specific jobs |

**Note**: `AI_PLANNER_GUARDRAILS.md` is CORE but needs project-specific failure patterns added.

---

## 9. NAVIGATION LAYER — BOOTSTRAP_TEMPLATE

Canonical documentation entry points.

| File | Classification | Notes |
|------|----------------|-------|
| `docs-FINAL/README.md` | BOOTSTRAP_TEMPLATE | Template for start page |
| `docs-FINAL/INDEX.md` | BOOTSTRAP_TEMPLATE | Template for nav index |
| `docs-FINAL/DEBUGGING/WHERE_TO_LOOK.md` | BOOTSTRAP_TEMPLATE | Template for debugging |
| `docs-FINAL/INTENTIONALLY_UNDOCUMENTED.md` | BOOTSTRAP_TEMPLATE | Template for exclusions |
| Other `docs-FINAL/*.md` | EXCLUDED | Project architecture |

---

## 10. COMPLIANCE & TRACKING — CORE_GOVERNANCE

| File | Classification | Notes |
|------|----------------|-------|
| `.ai/COMPLIANCE/COMPLIANCE_STATUS.md` | BOOTSTRAP_TEMPLATE | Empty template |
| `.ai/COMPLIANCE/COMPLIANCE_METRICS.md` | BOOTSTRAP_TEMPLATE | Empty template |

---

## 11. DECISION TRACKING — BOOTSTRAP_TEMPLATE

| File | Classification | Notes |
|------|----------------|-------|
| `.ai/DECISIONS/README.md` | BOOTSTRAP_TEMPLATE | Template with instructions |
| `.ai/DECISIONS/FEATURE_INDEX.md` | BOOTSTRAP_TEMPLATE | Empty template |
| `.ai/DECISIONS/TASK_INDEX.md` | BOOTSTRAP_TEMPLATE | Empty template |
| `.ai/DECISIONS/CHANGELOG_INDEX.md` | BOOTSTRAP_TEMPLATE | Empty template |
| `.ai/DECISIONS/SNAPSHOT_INDEX.md` | BOOTSTRAP_TEMPLATE | Empty template |

---

## 12. DEPENDENCY TRACKING — BOOTSTRAP_TEMPLATE

| File | Classification | Notes |
|------|----------------|-------|
| `.ai/DEPENDENCIES/FEATURE_DEPENDENCY_GRAPH.md` | BOOTSTRAP_TEMPLATE | Empty template |
| `.ai/DEPENDENCIES/IMPACT_ANALYSIS.md` | BOOTSTRAP_TEMPLATE | Empty template |

---

## 13. DIRECTORY STRUCTURES — BOOTSTRAP_TEMPLATE

These directories should be created empty with README files:

| Directory | Purpose |
|-----------|---------|
| `.ai/ADR/` | Architecture decision records |
| `.ai/CHANGELOGS/` | Daily state snapshots |
| `.ai/_PLANS_VALIDATIONS/` | Validation report storage |
| `.ai/plans/features/` | Feature plan storage |
| `.ai/tasks/` | Task file storage |
| `.ai/prompts/` | Generated prompts storage |
| `.ai/memory/` | Archived tasks |
| `.ai/reports/` | Documentation reports |

---

## CLASSIFICATION SUMMARY

| Category | Count | Extraction Action |
|----------|-------|-------------------|
| CORE_GOVERNANCE | 35 | Extract directly |
| PROJECT_ADAPTER | 15 | Extract as templates |
| BOOTSTRAP_TEMPLATE | 18 | Create scaffolding |
| PROMPT | 12 | Extract with variables |
| EXCLUDED | 10 | Do not extract |

---

## EXTRACTION PRIORITY

### Priority 1 — Essential Core (MUST HAVE)

1. `.ai/_WORKFLOW/03_ROLES.md` — Role definitions
2. `.ai/_WORKFLOW/09_ENFORCEMENT.md` — Compliance rules
3. `.ai/_WORKFLOW/10_ERROR_TRACEABILITY.md` — Error origin system
4. `.ai/runtime/workflow-guard.md` — Pre-execution validation
5. `.ai/workflows/FIXATOR_VALIDATOR_WORKFLOW.mdc` — Core workflow
6. `docs/AI_PLANNER_GUARDRAILS.md` — Guardrails

### Priority 2 — Operational Core (SHOULD HAVE)

1. `.ai/_WORKFLOW/01-08` — Full workflow docs
2. `.ai/runtime/*` — All runtime guards
3. All prompt templates
4. `.cursor/rules/after_each_chat.mdc` — Chat enforcement

### Priority 3 — Bootstrap (NICE TO HAVE)

1. `docs-FINAL/` templates
2. `.ai/DECISIONS/` templates
3. `.ai/COMPLIANCE/` templates
4. Task magic system

---

**End of Classification**
