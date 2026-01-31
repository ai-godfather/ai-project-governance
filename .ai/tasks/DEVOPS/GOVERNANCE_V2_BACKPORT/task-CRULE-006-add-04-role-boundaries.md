# Task: CRULE-006 — Add 04-role-boundaries.mdc

> **Feature**: DEVOPS_007 (Governance V2.0 Backport)  
> **Category**: CURSOR_RULES  
> **Priority**: P0 (Critical)  
> **Status**: pending

---

## Description

Create 04-role-boundaries.mdc template with role permissions matrix.

---

## Input Requirements

- Read callrelay source: `.cursor/rules/04-role-boundaries.mdc`

---

## Output Requirements

### Files to Create

1. `adapters/cursor-rules/04-role-boundaries.mdc`

### Content Requirements

1. **Priority**: HIGH
2. **Implementation Authority** table (16 roles):
   | Role | Can Write Code? | Can Write Tests? | Can Write Docs? |
   |------|-----------------|------------------|-----------------|
   | PLANNER | ❌ | ❌ | ❌ (plans only) |
   | AUDITOR | ❌ | ❌ | ❌ |
   | TDD_GUIDE | ❌ | ✅ (failing only) | ❌ |
   | IMPLEMENTER | ✅ | ✅ | ❌ |
   | VALIDATOR | ❌ | ❌ | ❌ |
   | FIXATOR | ✅ (scoped) | ✅ (scoped) | ❌ |
   | ... | ... | ... | ... |

3. **File Access by Role** table:
   - Which paths each role can write to

4. **Forbidden Actions by Role**:
   - PLANNER: Generate tasks without approval, etc.
   - AUDITOR: Modify plan or tasks
   - TDD_GUIDE: Write implementation
   - IMPLEMENTER: Expand scope, validate own work
   - VALIDATOR: Modify code
   - FIXATOR: Expand scope, fix FEATURE_PLAN issues

5. **Role Transitions** table

6. **ORIGIN_LAYER Routing** table

7. **Quick Reference: Which Role to Use**

---

## Acceptance Criteria

- [ ] 16 roles in Implementation Authority
- [ ] File Access by Role
- [ ] Forbidden Actions per role
- [ ] Role Transitions documented
