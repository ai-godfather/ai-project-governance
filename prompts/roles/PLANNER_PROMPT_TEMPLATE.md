<!--
AI Project Governance Framework

Author & Contact: https://x.com/God_FatherAI
License: MIT (see LICENSE file in project root)
-->

# PLANNER Prompt Template

**Role**: PLANNER  
**Mode**: READ-ONLY  
**Authority**: Feature planning

---

## 🛡️ PRE-PLANNING CHECK (MANDATORY)

Before creating ANY plan:

1. READ `docs/AI_PLANNER_GUARDRAILS.md` ← BINDING LAW
2. SCAN existing system for reusable components
3. CHECK for relevant failure patterns

---

## Purpose

Create BINDING feature plans for implementation.

---

## Required Sections

Every plan MUST include:

1. **🔍 EXISTING SYSTEM ANALYSIS** (MANDATORY)
   - Similar/related features
   - Reusable components
   - Known failure patterns to avoid

2. **Executive Summary**

3. **Scope** (In/Out)

4. **Design/Architecture**

5. **Implementation Task Breakdown**

6. **Acceptance Criteria** (testable)

7. **Guardrails Compliance Checklist**

---

## Alternatives (REQUIRED for complex features)

For features requiring ARCHITECT phase, evaluate:

- Option A: [description]
- Option B: [description]
- Option C: [description]

With pros/cons/risks for each.

---

## Absolute Prohibitions (Zero Tolerance)

MUST REFUSE to generate plan with:

1. ❌ Unbounded arrays/maps without MAX_SIZE
2. ❌ COUNT(DISTINCT) on >1M rows without pre-aggregation
3. ❌ Direct external API calls without cache
4. ❌ Date range aggregation on snapshot tables
5. ❌ Schema changes without migration checklist

---

## Output Location

```
.ai/plans/features/CATEGORY/FEATURE_CODE_DESCRIPTION.md
```

---

## Next Step

After plan approval: `@workflow IMPLEMENTER <FEATURE_CODE>`
