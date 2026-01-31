# Task: BOOT-004 — Update BOOTSTRAP_FLOW.md

> **Feature**: DEVOPS_007 (Governance V2.0 Backport)  
> **Category**: BOOTSTRAP  
> **Priority**: P0 (Critical)  
> **Status**: pending

---

## Description

Update BOOTSTRAP_FLOW.md to document new v2.0 installation steps.

---

## Input Requirements

- Read existing: `bootstrap/BOOTSTRAP_FLOW.md`

---

## Output Requirements

### Files to Modify

1. `bootstrap/BOOTSTRAP_FLOW.md`

### Content Updates

1. **Add Phase for Cursor Rules**:
   - Phase N: Install Cursor Rules
   - Copy MDC files
   - Replace placeholders in 05-project-context.mdc

2. **Add Phase for Workflows**:
   - Phase M: Install Workflow Definitions
   - Copy workflow files

3. **Add Phase for Modular Roles**:
   - Phase P: Install Modular Roles
   - Copy role folders

4. **Update Phase Diagram** to include new phases

5. **Add Upgrade Section**: Reference upgrade.sh

---

## Acceptance Criteria

- [ ] New phases documented
- [ ] Diagram updated
- [ ] Upgrade section added
