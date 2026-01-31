# Task: GUARD-004 — Update origin-layer-heuristics.md

> **Feature**: DEVOPS_007 (Governance V2.0 Backport)  
> **Category**: RUNTIME_GUARDS  
> **Priority**: P1  
> **Status**: pending

---

## Description

Update origin-layer-heuristics.md with new FP routing for FP-050 to FP-069.

---

## Input Requirements

- Read callrelay source: `.ai/runtime/origin-layer-heuristics.md`
- Read existing v1.0: `core/runtime/origin-layer-heuristics.md`

---

## Output Requirements

### Files to Modify

1. `core/runtime/origin-layer-heuristics.md`

### Content Requirements

1. **Add FP Routing** for new patterns:
   | FP Range | Typical ORIGIN_LAYER | Remediation |
   |----------|---------------------|-------------|
   | FP-050 to FP-056 | FEATURE_PLAN / DATA_MODEL | PLANNER / ARCHITECT |
   | FP-057 to FP-069 | FEATURE_PLAN / IMPLEMENTATION | PLANNER / FIXATOR |

2. **Update Decision Flow** with new patterns

---

## Acceptance Criteria

- [ ] FP-050 to FP-069 routing added
- [ ] Decision flow updated
