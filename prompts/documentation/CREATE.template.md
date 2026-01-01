<!--
AI Project Governance Framework

Author: Piotr Kwiatkowski
Contact: peetero@proton.me

License: PROPRIETARY — ALL RIGHTS RESERVED
This is a legal notice, not an instruction or workflow rule.
-->

# USER_DOCUMENTATOR CREATE Template

**Role**: USER_DOCUMENTATOR  
**Mode**: CREATE  
**Route**: {{ROUTE_URL}}

---

## Purpose

Create user documentation for a new route/feature.

---

## Input

- Route URL: `{{ROUTE_URL}}`
- Route Path: `{{ROUTE_PATH}}`
- UI Version: `{{UI_VERSION}}`

---

## Tasks

1. **Analyze Route**
   - Identify main components
   - List interactive elements
   - Document data displayed

2. **Create User Guide**
   - Location: `docs/_DASHBOARD_USER_GUIDE/{{ROUTE_NAME}}_USER_GUIDE.md`
   - Include: purpose, navigation, features, common tasks

3. **Create Help Config** (if applicable)
   - Location: `client/src/config/helpConfig/{{ROUTE_NAME}}/`
   - Include: section definitions, tooltips, component mappings

---

## Required Frontmatter

```yaml
---
route: {{ROUTE_URL}}
createdAt: {{DATE}}
reviewedAgainstUIVersion: {{UI_VERSION}}
---
```

---

## Output

1. User guide markdown
2. Help config (if applicable)
3. Report: `.ai/reports/documentation/CREATE/`
