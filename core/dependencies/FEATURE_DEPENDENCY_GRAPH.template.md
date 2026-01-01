<!--
CORE GOVERNANCE COMPONENT — PROPRIETARY

Author: Piotr Kwiatkowski
Contact: peetero@proton.me

This file is part of a proprietary governance framework.
NO LICENSE IS GRANTED for use, copying, or modification.
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
