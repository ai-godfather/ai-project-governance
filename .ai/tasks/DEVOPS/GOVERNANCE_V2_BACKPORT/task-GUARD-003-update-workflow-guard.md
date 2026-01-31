# Task: GUARD-003 — Update workflow-guard.md

> **Feature**: DEVOPS_007 (Governance V2.0 Backport)  
> **Category**: RUNTIME_GUARDS  
> **Priority**: P0 (Critical)  
> **Status**: pending

---

## Description

Update workflow-guard.md with AUDITOR gate checks and file output enforcement.

---

## Input Requirements

- Read callrelay source: `.ai/runtime/workflow-guard.md`
- Read existing v1.0: `core/runtime/workflow-guard.md`

---

## Output Requirements

### Files to Modify

1. `core/runtime/workflow-guard.md`

### Content Requirements

1. **Add AUDITOR Gate Check**:
   - Before IMPLEMENTER: Verify AUDITOR PASS
   
2. **Add File Output Check**:
   - Integrate with file-output-enforcer.md

3. **Add TDD_GUIDE Position Check**:
   - After AUDITOR, before IMPLEMENTER (optional)

4. **Update Guard Checks by Role** table

---

## Acceptance Criteria

- [ ] AUDITOR gate check added
- [ ] File output check added
- [ ] TDD_GUIDE position documented
- [ ] Guard Checks table updated for 16 roles

---

## Dependencies

- GUARD-001: file-output-enforcer.md
- ROLE-001: AUDITOR role
