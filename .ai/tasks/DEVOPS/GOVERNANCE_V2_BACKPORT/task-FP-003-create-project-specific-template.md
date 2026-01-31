# Task: FP-003 — Create Project-Specific FP Template

> **Feature**: DEVOPS_007 (Governance V2.0 Backport)  
> **Category**: FAILURE_PATTERNS  
> **Priority**: P1  
> **Status**: pending

---

## Description

Create template structure for project-specific failure patterns (FP-{PROJECT}-*).

---

## Input Requirements

- Read callrelay source: `.ai/reports/failure-patterns/CALLRELAY_FAILURE_PATTERNS_V1.md` (structure only)

---

## Output Requirements

### Files to Create

1. `bootstrap/templates/failure-patterns/PROJECT_FAILURE_PATTERNS.template.md`

### Content Requirements

```markdown
# {{PROJECT_NAME}} — Project-Specific Failure Patterns

> **Version**: 1.0.0  
> **Project**: {{PROJECT_DISPLAY_NAME}}

---

## Naming Convention

Project-specific patterns use: `FP-{{PROJECT_PREFIX}}-XXX`

Example: FP-CR-001 for CallRelay, FP-HX-001 for HyperX

---

## Pattern Template

### FP-{{PROJECT_PREFIX}}-XXX: [Title]

| Attribute | Value |
|-----------|-------|
| **Severity** | CRITICAL / HIGH / MEDIUM / LOW |
| **ORIGIN_LAYER** | IMPLEMENTATION / CONFIGURATION / etc. |
| **Detection** | VALIDATOR / FIXATOR / etc. |
| **Times Occurred** | N |

**Symptom**: [description]

**Root Cause**: [analysis]

**Fix Pattern**: [code or steps]

---

## Your Patterns

(Add project-specific patterns below)

```

---

## Acceptance Criteria

- [ ] Template created
- [ ] Naming convention documented
- [ ] Pattern template included
- [ ] Bootstrap copies this file
