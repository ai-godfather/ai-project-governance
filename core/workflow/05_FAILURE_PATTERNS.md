<!--
CORE GOVERNANCE COMPONENT — PROPRIETARY

Author: Piotr Kwiatkowski
Contact: peetero@proton.me

This file is part of a proprietary governance framework.
NO LICENSE IS GRANTED for use, copying, or modification.
-->

# AI Workflow System - Failure Patterns

> Summary of 89 documented failure patterns and role assignments.

---

## Summary by Category

| Category | FP Range | Count | Detection Role |
|----------|----------|-------|----------------|
| STATE & SNAPSHOT | FP-001 to FP-003 | 3 | VALIDATOR |
| DEPLOYMENT | FP-004 to FP-008 | 5 | VALIDATOR, FIXATOR |
| DATA QUALITY | FP-009 to FP-014 | 6 | DATA_SEMANTIC_VALIDATOR |
| PERFORMANCE | FP-015 to FP-020 | 6 | VALIDATOR, AUDIT |
| CLOUD RUN JOBS | FP-021 to FP-028 | 8 | VALIDATOR |
| SECURITY | FP-029 to FP-032 | 4 | VALIDATOR |
| UI & VISUAL | FP-033 to FP-038 | 6 | UI_INSPECTOR |
| DATA SEMANTIC | FP-039 to FP-041 | 3 | DATA_SEMANTIC_VALIDATOR |
| UI RUNTIME | FP-042 to FP-047 | 6 | UI_BROWSER_VALIDATOR |
| CI/CD | FP-048 to FP-051 | 4 | VALIDATOR |
| GCP CONFIG | FP-052 to FP-057 | 6 | VALIDATOR |
| LIBRARY MISUSE | FP-060 to FP-061 | 2 | VALIDATOR |
| TYPE SAFETY | FP-058, FP-059, FP-066 | 3 | VALIDATOR |
| DB TEMPORAL | FP-065 to FP-067 | 3 | VALIDATOR |
| DB SYNC | FP-068 to FP-073 | 6 | VALIDATOR |
| **JOB EXECUTION** | FP-JOB-* | 5 | JOB_PREFLIGHT_GUARD |
| Additional | FP-074+ | 19+ | Various |

**Total Patterns**: 89

---

## Critical Patterns (BLOCKER-Level)

| FP-ID | Title | Severity |
|-------|-------|----------|
| FP-004 | Migration production file sync | CRITICAL |
| FP-005 | Schema-code synchronization | CRITICAL |
| FP-008 | Env variable drift | CRITICAL |
| FP-010 | Raw SQL outside migration | HIGH |
| FP-014 | Aggregation precision loss | HIGH |
| FP-016 | O(n²) in user path | HIGH |
| FP-042 | Dead click | BLOCKER |
| FP-043 | Silent API failure | BLOCKER |
| FP-044 | Infinite loading | BLOCKER |

---

## FP Checks by Role

### VALIDATOR

- FP-002: State snapshot mismatch
- FP-004: Migration production file sync
- FP-005: Schema-code synchronization
- FP-008: Env variable drift
- FP-014: Aggregation precision loss
- FP-016: O(n²) in user path

### UI_INSPECTOR

- FP-019: UI promise without backend guarantee
- FP-033: Numeric display anomaly
- FP-034: Visual contradiction
- FP-035: Misleading label/legend
- FP-036: Ratio shown as percentage (×100 error)
- FP-037: Missing data shown as zero
- FP-038: Non-persistent ID treated as stable

### DATA_SEMANTIC_VALIDATOR

- FP-014: Aggregation precision loss
- FP-019: UI promise without backend guarantee
- FP-035: Misleading label/legend
- FP-039: Inappropriate aggregation method
- FP-040: Small sample size hidden by precision
- FP-041: Time-window mismatch

### UI_BROWSER_VALIDATOR

- FP-042: Dead click
- FP-043: API failure not shown (silent error)
- FP-044: Infinite loading without timeout
- FP-045: Stale data after interaction
- FP-046: Console error during runtime
- FP-047: Network retry loop

---

## FP Categories Mapped to ORIGIN_LAYER

Each Failure Pattern typically maps to an ORIGIN_LAYER for remediation routing:

| FP Category | FP Range | Typical ORIGIN_LAYER | Remediation |
|-------------|----------|---------------------|-------------|
| STATE & SNAPSHOT | FP-001 to FP-003 | IMPLEMENTATION | FIXATOR |
| DEPLOYMENT | FP-004 to FP-008 | IMPLEMENTATION | FIXATOR |
| DATA QUALITY | FP-009 to FP-014 | DATA_MODEL / FEATURE_PLAN | ARCHITECT / PLANNER |
| PERFORMANCE | FP-015 to FP-020 | IMPLEMENTATION | FIXATOR |
| CLOUD RUN JOBS | FP-021 to FP-028 | IMPLEMENTATION | FIXATOR |
| SECURITY | FP-029 to FP-032 | IMPLEMENTATION | FIXATOR |
| UI & VISUAL | FP-033 to FP-038 | UI_PRESENTATION | FIXATOR |
| DATA SEMANTIC | FP-039 to FP-041 | **FEATURE_PLAN** | PLANNER |
| UI RUNTIME | FP-042 to FP-047 | IMPLEMENTATION / UI_PRESENTATION | FIXATOR |
| CI/CD | FP-048 to FP-051 | EXTERNAL_DEPENDENCY | MONITOR |
| GCP CONFIG | FP-052 to FP-057 | EXTERNAL_DEPENDENCY | MONITOR |
| LIBRARY MISUSE | FP-060 to FP-061 | IMPLEMENTATION | FIXATOR |
| DB TEMPORAL | FP-065 to FP-067 | DATA_MODEL | ARCHITECT |
| DB SYNC | FP-068 to FP-073 | IMPLEMENTATION | FIXATOR |

### High-Risk FEATURE_PLAN Patterns

These FPs often indicate FEATURE_PLAN errors requiring PLANNER:

| FP-ID | Title | Why FEATURE_PLAN |
|-------|-------|------------------|
| FP-019 | UI promise without backend guarantee | Plan assumed capability that doesn't exist |
| FP-035 | Misleading label/legend | Plan terminology doesn't match data semantics |
| FP-039 | Inappropriate aggregation method | Plan specified wrong algorithm |
| FP-040 | Small sample size hidden by precision | Plan didn't account for data limitations |
| FP-041 | Time-window mismatch | Plan assumed wrong temporal boundaries |

### Origin Layer Decision Guide

When detecting a Failure Pattern:

1. **Check if plan assumption is wrong**
   - YES → `ORIGIN_LAYER = FEATURE_PLAN`
   - NO → Continue

2. **Check if code doesn't match valid plan**
   - YES → `ORIGIN_LAYER = IMPLEMENTATION`
   - NO → Continue

3. **Check if display is wrong but logic correct**
   - YES → `ORIGIN_LAYER = UI_PRESENTATION`
   - NO → Continue

4. **Check if schema/aggregation is wrong**
   - YES → `ORIGIN_LAYER = DATA_MODEL`
   - NO → Check external deps

5. **Check if external service caused issue**
   - YES → `ORIGIN_LAYER = EXTERNAL_DEPENDENCY`

See: [10_ERROR_TRACEABILITY.md](10_ERROR_TRACEABILITY.md)

---

## JOB EXECUTION Failure Patterns

**Canonical Reference**: `.ai/runtime/job-preflight-guard.md`

These patterns are automatically checked by the JOB PREFLIGHT GUARD
before any job operation (execute, update, deploy, fix).

### FP-JOB-ARG-001: Unsupported Argument

| Attribute | Value |
|-----------|-------|
| **Severity** | BLOCKER |
| **Detection** | JOB_PREFLIGHT_GUARD |
| **Trigger** | Configured arg not in code's parseArgs options |
| **Action** | Remove unknown arg from config |

### FP-JOB-ARG-002: Missing Required Argument

| Attribute | Value |
|-----------|-------|
| **Severity** | BLOCKER |
| **Detection** | JOB_PREFLIGHT_GUARD |
| **Trigger** | Required arg (per code) not configured |
| **Action** | Add required arg to job config |

### FP-JOB-IMG-001: Tag Without Digest Verification

| Attribute | Value |
|-----------|-------|
| **Severity** | WARNING |
| **Detection** | IMAGE_DIGEST_VERIFIER |
| **Trigger** | Image uses `:latest` tag without digest resolution |
| **Action** | Resolve tag to digest before execution |

### FP-JOB-IMG-002: Stale Image (Digest Mismatch)

| Attribute | Value |
|-----------|-------|
| **Severity** | BLOCKER |
| **Detection** | IMAGE_DIGEST_VERIFIER |
| **Trigger** | Job uses older digest than latest build |
| **Action** | Update job with latest image |

### FP-JOB-CFG-001: Config Drift from Code

| Attribute | Value |
|-----------|-------|
| **Severity** | BLOCKER |
| **Detection** | JOB_PREFLIGHT_GUARD |
| **Trigger** | Config diverged from code reality |
| **Action** | Sync config with code |

---

## Full Reference

Complete documentation: `docs/AI_SYSTEM_FAILURE_PATTERNS.md`

---

**Prev**: [04_EXECUTION_ORDER.md](04_EXECUTION_ORDER.md)  
**Next**: [06_FILE_STRUCTURE.md](06_FILE_STRUCTURE.md)
