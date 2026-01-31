# Task: WDOC-004 — Add 07_TROUBLESHOOTING.md

> **Feature**: DEVOPS_007 (Governance V2.0 Backport)  
> **Category**: WORKFLOW_DOCS  
> **Priority**: P1  
> **Status**: pending

---

## Description

Create 07_TROUBLESHOOTING.md as a template for known issues database.

---

## Input Requirements

- Read callrelay source: `.ai/_WORKFLOW/07_TROUBLESHOOTING.md`
- Generalize to template format

---

## Output Requirements

### Files to Create

1. `core/workflow/07_TROUBLESHOOTING.md`

### Content Requirements

1. **Purpose**: Known issues database template
2. **Structure**:
   - Issue Index table
   - Issue format template
   - Resolution tracking
3. **Issue Template**:
   ```markdown
   ### ISSUE-XXX: [Title]
   
   | Attribute | Value |
   |-----------|-------|
   | Severity | HIGH/MEDIUM/LOW |
   | First Seen | YYYY-MM-DD |
   | Status | OPEN/RESOLVED |
   
   **Symptom**: [description]
   
   **Root Cause**: [analysis]
   
   **Resolution**: [fix]
   ```
4. **Navigation Links**: Prev/Next

---

## Acceptance Criteria

- [ ] File created at correct location
- [ ] Template structure defined
- [ ] Issue format template included
- [ ] Generalized (no project-specific content)
