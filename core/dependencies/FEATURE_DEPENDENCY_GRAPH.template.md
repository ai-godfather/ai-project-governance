<!--
AI Project Governance Framework

Author & Contact: https://x.com/God_FatherAI
License: MIT (see LICENSE file in project root)
-->

# Feature Dependency Graph

> **Generated**: {{DATE}}  
> **Project**: {{PROJECT_NAME}}

---

## Purpose

Track dependencies between features to detect cascade impacts when assumptions change.

---

## Dependency Matrix

| Feature | Depends On | Used By |
|---------|------------|---------|
| - | - | - |

---

## Shared Assumptions

| Assumption | Features Using | Source |
|------------|----------------|--------|
| - | - | - |

---

## Cross-Feature Impact Rules

```
IF assumption is shared by >2 features:
    MUST extract to configuration file
    MUST document in this file
    
IF FEATURE_PLAN error detected:
    MUST check this dependency graph
    MUST include affected features in remediation
```

---

## Notes

(Add project-specific dependency notes here)
