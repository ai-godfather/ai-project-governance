<!--
AI Project Governance Framework

Author & Contact: https://x.com/God_FatherAI
License: MIT (see LICENSE file in project root)
-->

# Workflow Guard — Pre-Execution Validation

> **Version**: 1.0.0  
> **Status**: ENFORCEMENT ACTIVE  
> **Authority**: SUPREME (bounded by .cursorrules)

---

## Purpose

The Workflow Guard runs **BEFORE** any workflow role executes.
It validates preconditions and **BLOCKS** execution if requirements are not met.

---

## Guard Execution (MANDATORY)

Every role MUST execute guard check as **FIRST STEP**.

```
WORKFLOW INVOCATION
        │
        ▼
┌───────────────────────┐
│   WORKFLOW GUARD      │
│   (Pre-Execution)     │
└───────────────────────┘
        │
        ├── ALL CHECKS PASS ──▶ PROCEED TO ROLE EXECUTION
        │
        └── ANY CHECK FAIL ──▶ BLOCK EXECUTION
                                 │
                                 ▼
                          OUTPUT STRUCTURED ERROR
                          ROUTE TO CORRECT ROLE
```

---

## Guard Checks by Role

### VALIDATOR / UI_INSPECTOR / DATA_SEMANTIC_VALIDATOR / UI_BROWSER_VALIDATOR

| Check | Condition | On Fail |
|-------|-----------|---------|
| Feature plan exists | `.ai/plans/features/<PREFIX>_*.md` resolves | BLOCK: "No feature plan found" |
| Changelog current | `.ai/CHANGELOGS/YYYY-MM-DD.snapshot.md` exists | WARN: "No today's snapshot" |
| Previous reports | Check for existing validations | INFO: Context inheritance |

### FIXATOR

| Check | Condition | On Fail |
|-------|-----------|---------|
| Validation report exists | `.ai/_PLANS_VALIDATIONS/<FEATURE>/VALIDATION_*.md` | BLOCK: "No validation report" |
| ORIGIN_LAYER specified | Every issue has ORIGIN_LAYER | BLOCK: "Missing ORIGIN_LAYER" |
| FEATURE_PLAN check | No issue with ORIGIN_LAYER=FEATURE_PLAN + BLOCK | BLOCK: "Route to PLANNER" |
| DATA_MODEL check | No unauthorized DATA_MODEL issues | BLOCK: "Requires ARCHITECT auth" |

### RE_VALIDATOR

| Check | Condition | On Fail |
|-------|-----------|---------|
| Original report exists | Validation report from previous run | BLOCK: "No original report" |
| FIXATOR report exists | If FIXATOR was invoked | WARN: "No fix report" |
| Plan revision check | For FEATURE_PLAN issues, plan version incremented | BLOCK: "Plan not updated" |
| Re-implementation check | For FEATURE_PLAN issues, code re-run detected | BLOCK: "Implementation not re-run" |

### IMPLEMENTER

| Check | Condition | On Fail |
|-------|-----------|---------|
| Feature plan resolves | Exactly 1 match for prefix | BLOCK: "Ambiguous/missing plan" |
| ADR check | If required, ADR exists | BLOCK: "ADR required" |
| Previous FP BLOCK check | If had FEATURE_PLAN BLOCK, plan is v2+ | BLOCK: "Use updated plan" |
| Decision freeze check | No active freeze | BLOCK: "Decision freeze active" |

### DOC_GUARD

| Check | Condition | On Fail |
|-------|-----------|---------|
| Git diff available | Files modified in current change | SKIP: No changes to check |
| New job detection | `scripts/JOBS/*.mts` added | INFO: Check for job docs |
| Job docs exist | `docs/JOBS/{job}/` exists | BLOCK: Missing job docs |
| DANGEROUS op modified | `docs/DANGEROUS_OPERATIONS/**` changed | BLOCK: Missing safety docs |
| Advisory checks | Routes, services, modules | WARN: Recommend docs |

**Note**: DOC_GUARD is ADVISORY except for 2 hard blockers (new job, DANGEROUS op).

### PLANNER

| Check | Condition | On Fail |
|-------|-----------|---------|
| Guardrails available | `docs/AI_PLANNER_GUARDRAILS.md` exists | WARN: "No guardrails" |
| Existing system scanned | Codebase context loaded | PROCEED |

---

## Guard Output Format

On execution, guard produces structured result:

```json
{
  "timestamp": "2026-01-01T15:30:00Z",
  "role": "FIXATOR",
  "feature": "ADMIN_001",
  "checks": [
    {
      "name": "validation_report_exists",
      "status": "PASS",
      "evidence": ".ai/_PLANS_VALIDATIONS/ADMIN_001/VALIDATION_2026-01-01.md"
    },
    {
      "name": "origin_layer_specified",
      "status": "PASS",
      "details": "5/5 issues have ORIGIN_LAYER"
    },
    {
      "name": "feature_plan_block_check",
      "status": "FAIL",
      "reason": "Issue #2 has ORIGIN_LAYER=FEATURE_PLAN + Severity=BLOCK",
      "issue_id": "BLOCKER-002",
      "enforced_action": "Route to PLANNER"
    }
  ],
  "verdict": "BLOCK",
  "enforced_action": "PLANNER must update plan before FIXATOR can proceed",
  "blocked_issues": ["BLOCKER-002"]
}
```

---

## Guard Check Implementation

### Step 1: Read Context

```markdown
1. Identify FEATURE_CODE from invocation
2. Locate validation reports: .ai/_PLANS_VALIDATIONS/<FEATURE>/
3. Locate feature plan: .ai/plans/features/<PREFIX>_*.md
4. Read ERROR_TRACEABILITY.md if exists
```

### Step 2: Execute Checks

```markdown
FOR EACH check in role_checks:
  IF check.condition NOT MET:
    record FAIL with reason
    IF check.severity == BLOCK:
      SET verdict = BLOCK
      SET enforced_action
  ELSE:
    record PASS with evidence
```

### Step 3: Output Result

```markdown
IF verdict == BLOCK:
  OUTPUT guard_result JSON
  OUTPUT "🛡️ WORKFLOW GUARD: BLOCKED"
  OUTPUT enforced_action
  HALT execution
ELSE:
  OUTPUT "🛡️ WORKFLOW GUARD: PASSED"
  PROCEED to role execution
```

---

## FIXATOR-Specific Guard Logic

### FEATURE_PLAN Block Detection

```python
def check_feature_plan_block(validation_report):
    blocked_issues = []
    
    for issue in validation_report.issues:
        if issue.origin_layer == "FEATURE_PLAN":
            if issue.severity in ["BLOCK", "BLOCK_DEPLOYMENT", "CRITICAL"]:
                blocked_issues.append({
                    "id": issue.id,
                    "origin": "FEATURE_PLAN",
                    "severity": issue.severity,
                    "plan_section": issue.plan_reference.section,
                    "assumption": issue.plan_reference.assumption
                })
    
    if blocked_issues:
        return {
            "status": "FAIL",
            "reason": f"{len(blocked_issues)} issue(s) have ORIGIN_LAYER=FEATURE_PLAN + BLOCK",
            "blocked_issues": blocked_issues,
            "enforced_action": "PLANNER must update plan"
        }
    
    return {"status": "PASS"}
```

---

## Integration with Prompt Templates

Add this section to ALL role prompt templates:

```markdown
## 🛡️ WORKFLOW GUARD CHECK (MANDATORY FIRST STEP)

Before ANY action, execute guard check:

1. Read `.ai/runtime/workflow-guard.md`
2. Execute checks for YOUR ROLE
3. If ANY check FAILS with BLOCK → HALT and output guard result
4. If ALL checks PASS → proceed to role execution

**Output guard result as first section of your response:**

```
🛡️ WORKFLOW GUARD: PASSED / BLOCKED

| Check | Status | Evidence/Reason |
|-------|--------|-----------------|
| ... | PASS/FAIL | ... |

Verdict: PROCEED / BLOCK
```

If BLOCKED, do NOT proceed. Output enforced action and stop.
```

---

## Enforcement

| Violation | Severity |
|-----------|----------|
| Role execution without guard check | INVALID OUTPUT |
| FIXATOR proceeds despite FEATURE_PLAN BLOCK | BLOCKER |
| RE_VALIDATOR passes without plan revision check | BLOCKER |
| Guard output missing from role response | WARNING |

---

## Quick Reference

```
VALIDATOR:      Plan exists? Changelog current?
FIXATOR:        Report exists? ORIGIN_LAYER ok? No FP BLOCK?
RE_VALIDATOR:   Original report? Plan revision? Re-implementation?
IMPLEMENTER:    Plan resolves? ADR? No freeze?
DOC_GUARD:      New job docs? DANGEROUS docs? Advisory checks?
PLANNER:        Guardrails available?
JOB_OBSERVER:   Args valid? Image current? Config matches code?
```

---

**Canonical Reference**: This file  
**Related**: 
- `core/workflow/10_ERROR_TRACEABILITY.md`
- `core/runtime/doc-guard.md`
