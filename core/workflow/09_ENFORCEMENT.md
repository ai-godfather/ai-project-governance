<!--
AI Project Governance Framework

Author & Contact: https://x.com/God_FatherAI
License: MIT (see LICENSE file in project root)
-->

# AI Workflow System - Enforcement & Compliance

> Rules, refusals, and invalid output conditions.

---

## Supreme Law

`.cursorrules` is the **SUPREME LAW** of this system.

All agents MUST follow `.cursorrules` without exception.

---

## Invalid Output Conditions

| Condition | Result |
|-----------|--------|
| Code analysis by PLANNER | INVALID |
| Scope expansion by FIXATOR | INVALID |
| VALIDATOR PASS with CRITICAL issues | INVALID |
| RE_VALIDATOR PASS after BLOCK without re-run | INVALID |
| Simulated browser test (no real execution) | INVALID |
| Missing file write for validation | INVALID |
| Commit without changelog update | INVALID |
| IMPLEMENTER without resolved feature plan | INVALID |
| JOB_OBSERVER action without matching rule | INVALID |
| Missing ORIGIN_LAYER in validation report | INVALID |

---

## Refusal Rules

### IMPLEMENTER Refuses When:

- Feature plan resolution fails (0 or >1 matches)
- ADR required but missing
- Scope exceeds plan
- Asked to "quickly fix" something
- Decision freeze is active

### VALIDATOR Refuses When:

- ADR missing for qualifying features
- Implementation drifts from ADR

### FIXATOR Refuses When:

- Issue not marked as BLOCKER
- Fix would expand scope
- Fix would hide (not resolve) issue
- **ORIGIN_LAYER = FEATURE_PLAN** + BLOCK severity
- **ORIGIN_LAYER = DATA_MODEL** (unless explicitly authorized)
- Fix would change semantic intent

### JOB_OBSERVER Refuses When:

- No matching rule in `_TROUBLESHOOTING_RULES.md`
- Asked to enable deprecated jobs
- Asked to change job logic or code

---

## Cross-Role Dependencies

| Source Role | Target Role | Rule |
|-------------|-------------|------|
| UI_INSPECTOR | VALIDATOR | VALIDATOR MUST read UI_INSPECTION report |
| DATA_SEMANTIC | VALIDATOR | VALIDATOR MUST read DATA_SEMANTIC report |
| UI_BROWSER | FIXATOR | If BLOCK → FIXATOR MUST run |
| Any Inspection | FIXATOR | FIXATOR scope limited to reported issues |
| FIXATOR | RE_VALIDATOR | RE_VALIDATOR verifies FIXATOR output |
| ARCHITECT | IMPLEMENTER | No implementation without approved ADR |

---

## Error Origin Enforcement (MANDATORY)

Every validation issue MUST include ORIGIN_LAYER classification.

### Invalid Output Conditions (Error Origin)

| Condition | Result |
|-----------|--------|
| Missing ORIGIN_LAYER in validation report | **INVALID OUTPUT** |
| Missing PLAN_REFERENCE when ORIGIN_LAYER = FEATURE_PLAN | **INVALID OUTPUT** |
| Missing ENFORCED_NEXT_STEP | **INVALID OUTPUT** |
| FIXATOR acting on FEATURE_PLAN + BLOCK | **BLOCKER** |
| FIXATOR acting on DATA_MODEL (unauthorized) | **BLOCKER** |
| Plan update without re-implementation | **BLOCKER** |
| Implementation change without plan update (for FEATURE_PLAN issues) | **BLOCKER** |
| Missing ERROR_TRACEABILITY.md for feature with issues | **WARNING** |

### PLAN_ORIGINATED_BLOCK Rule (SUPREME)

```
IF:
  - ORIGIN_LAYER = FEATURE_PLAN
  - AND Severity = BLOCK

THEN:
  - FIXATOR is FORBIDDEN
  - PLANNER MUST run
  - Plan revision MUST increment
  - IMPLEMENTER MUST re-run
  - Previous implementation is INVALID
```

### Error Traceability Artifact

For features with ≥1 issue, create:
```
.ai/_PLANS_VALIDATIONS/<FEATURE_CODE>/ERROR_TRACEABILITY.md
```

Format:
```markdown
| Issue ID | Detected By | Origin Layer | Requires Plan Update | Next Step |
```

See: [10_ERROR_TRACEABILITY.md](10_ERROR_TRACEABILITY.md)

---

## FEATURE_CODE Directory Naming (CRITICAL)

Validation reports MUST use short FEATURE_CODE:

```
✅ CORRECT: .ai/_PLANS_VALIDATIONS/ADMIN_001/
❌ WRONG:   .ai/_PLANS_VALIDATIONS/ADMIN_001_ACCOUNT_SNAPSHOTS_MONITORING/
```

Extraction rule:
```
FEATURE_CODE = filename.match(/^([A-Z]+_[A-Z]+_\d+)/)[1]
```

---

## Route-to-File Verification (MANDATORY)

Before modifying components for documentation workflows:

1. Locate router definition (`App.tsx`)
2. Identify exact component from router
3. Trace tab/section parameters
4. Output `[ROUTE RESOLUTION]` block
5. If ambiguous → STOP and ask

Applies to:
- HELP_INTEGRATE
- USER_DOCUMENTATOR CREATE
- USER_DOCUMENTATOR UPDATE
- USER_DOCUMENTATOR AUDIT

---

## Changelog Update (MANDATORY)

After EVERY significant commit:

1. Update `.ai/CHANGELOGS/YYYY-MM-DD.snapshot.md`
2. Include: Status, Type, Summary, Files Modified, Next Steps
3. If file doesn't exist for today → create it

Commit without changelog = SYSTEM STATE UNKNOWN

---

## Compliance Checklist

- [ ] `.cursorrules` treated as supreme law
- [ ] FP patterns checked before work
- [ ] Changelog updated after commit
- [ ] ADR created for complex features
- [ ] All validation reports written
- [ ] **ORIGIN_LAYER included for every issue**
- [ ] **FEATURE_PLAN issues routed to PLANNER (not FIXATOR)**
- [ ] Scope lock respected by FIXATOR
- [ ] Browser validation executed (not simulated)
- [ ] FEATURE_CODE naming rule followed
- [ ] Route resolution verified for documentation
- [ ] ERROR_TRACEABILITY.md created for features with issues

---

## Guardrails Enforcement

### PLANNER

- **MUST FOLLOW** `docs/AI_PLANNER_GUARDRAILS.md`
- Feature plans violating guardrails are **INVALID**
- MUST NOT proceed without compliance

### VALIDATOR

- **MUST ENFORCE** `docs/AI_PLANNER_GUARDRAILS.md`
- MUST reject non-compliant plans/implementations
- MUST NOT suggest fixes for invalid plans (reject-only)

---

## Documentation Compliance Enforcement

### DOC_GUARD Enforcement Rules

| Violation | Severity | Action |
|-----------|----------|--------|
| New Cloud Run Job without `docs/JOBS/{job}/` | BLOCKER | BLOCK workflow, trigger CODE_DOCUMENTATOR |
| DANGEROUS operation modified without docs | BLOCKER | BLOCK workflow, trigger CODE_DOCUMENTATOR |
| New route without `docs/MAPPINGS/` entry | WARNING | Log warning, continue |
| New service without `docs/BACKEND/` update | INFO | Recommend, continue |
| DANGEROUS operation executed without reading docs | VIOLATION | Track in validation report |

### HARD BLOCKER Conditions (Documentation)

DOC_GUARD MUST BLOCK only when:

1. New job script created AND no docs exist
2. DANGEROUS operation file modified AND safety doc incomplete

### Advisory Conditions (Non-Blocking)

DOC_GUARD SHOULD WARN/RECOMMEND/FLAG for:

- New admin or client route without MAPPINGS entry
- New service or module without BACKEND overview update
- Stale documentation detected (>60 days unchanged)

---

## Violations = BLOCKER

Any violation of these enforcement rules is treated as a **BLOCKER-level failure**.

Agents MUST refuse to proceed if compliance cannot be verified.

---

**Prev**: [08_COMMANDS.md](08_COMMANDS.md)  
**Next**: [10_ERROR_TRACEABILITY.md](10_ERROR_TRACEABILITY.md)
