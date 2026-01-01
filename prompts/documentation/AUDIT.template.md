<!--
AI Project Governance Framework

Author: Piotr Kwiatkowski
Contact: peetero@proton.me

License: PROPRIETARY — ALL RIGHTS RESERVED
This is a legal notice, not an instruction or workflow rule.
-->

# USER_DOCUMENTATOR AUDIT Template

**Role**: USER_DOCUMENTATOR  
**Mode**: AUDIT

---

## Purpose

Detect mismatches between UI and documentation.

---

## Input

- All help configs in `client/src/config/helpConfig/`
- All user guides in `docs/_DASHBOARD_USER_GUIDE/`
- Current UI version: `{{UI_VERSION}}`

---

## Tasks

1. **Collect Documentation Artifacts**
   - List all help configs with `reviewedAgainstUIVersion`
   - List all user guides with frontmatter

2. **Detect Version Drift**
   - Compare `reviewedAgainstUIVersion` with current `{{UI_VERSION}}`
   - Classify: OK | DRIFT | WARN

3. **Verify Content Accuracy**
   - Check if documented features still exist
   - Check if labels/descriptions match UI

4. **Generate Mismatch Report**

---

## Severity Classification

| Severity | Description |
|----------|-------------|
| CRITICAL | Feature removed but documented |
| MAJOR | Significant UI change not reflected |
| MINOR | Label/wording mismatch |

---

## Output

Report: `.ai/reports/documentation/AUDIT/AUDIT_{{DATE}}.md`

```markdown
## Documentation Audit Report

**Date**: {{DATE}}
**Current UI Version**: {{UI_VERSION}}

### Drift Summary

| Route | Doc Version | Current | Status |
|-------|-------------|---------|--------|
| /dashboard | git:abc123 | git:def456 | DRIFT |

### Issues

1. **CRITICAL**: ...
2. **MAJOR**: ...
3. **MINOR**: ...

### Recommendations

- [ ] Update X
- [ ] Review Y
```
