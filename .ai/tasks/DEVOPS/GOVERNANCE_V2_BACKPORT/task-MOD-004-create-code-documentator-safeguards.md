# Task: MOD-004 — Create CODE_DOCUMENTATOR SAFEGUARDS.md

> **Feature**: DEVOPS_007 (Governance V2.0 Backport)  
> **Category**: MODULAR_ROLES  
> **Priority**: P1  
> **Status**: pending

---

## Description

Create SAFEGUARDS.md with anti-churn rules for CODE_DOCUMENTATOR.

---

## Input Requirements

- Read callrelay source: `.ai/roles/CODE_DOCUMENTATOR/SAFEGUARDS.md`

---

## Output Requirements

### Files to Create

1. `core/roles/CODE_DOCUMENTATOR/SAFEGUARDS.md`

### Content Requirements

1. **Purpose**: Prevent documentation churn
2. **Anti-Churn Rules**:
   - Don't rewrite existing docs unnecessarily
   - Preserve historical context
   - Update only changed sections
3. **What Triggers Update**:
   - Code behavior changed
   - API changed
   - New feature added
4. **What Does NOT Trigger Update**:
   - Refactoring without behavior change
   - Internal variable rename
   - Comment updates

---

## Acceptance Criteria

- [ ] Anti-churn rules documented
- [ ] Trigger/No-trigger distinction clear
