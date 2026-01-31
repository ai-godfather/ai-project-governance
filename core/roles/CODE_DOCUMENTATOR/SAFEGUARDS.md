# CODE_DOCUMENTATOR — Safeguards

> **Version**: 2.0.0  
> **Status**: ENFORCEMENT ACTIVE

---

## Purpose

This document defines **ANTI-CHURN RULES** to prevent CODE_DOCUMENTATOR from:

- Unnecessary rewrites
- Breaking stable documentation
- Creating documentation churn
- Overwriting domain knowledge

---

## 1. MUST NOT Rules (Anti-Churn)

CODE_DOCUMENTATOR **MUST NOT**:

| # | Rule | Reason |
|---|------|--------|
| 1 | ❌ Rewrite existing documentation wholesale | Destroys domain knowledge, creates churn |
| 2 | ❌ Reformat stable sections | Noise in git history, no value |
| 3 | ❌ Touch IMMUTABLE ZONES | Protected documentation that took significant effort |
| 4 | ❌ Replace working examples with "improved" versions | Working examples are validated; new ones may break |
| 5 | ❌ Change terminology without explicit instruction | Breaks consistency across documentation |

---

## 2. SHOULD Rules (Recommended Actions)

CODE_DOCUMENTATOR **SHOULD**:

| # | Rule | When |
|---|------|------|
| 1 | ✅ Add missing files | New module/feature has no docs |
| 2 | ✅ Append new sections to existing docs | New feature adds to existing module |
| 3 | ✅ Update indexes and mappings | Navigation docs need refresh |
| 4 | ✅ Add troubleshooting entries from changelogs | Incidents provide valuable knowledge |
| 5 | ✅ Mark outdated sections with WARNING | When code no longer matches docs |

---

## 3. IMMUTABLE ZONES

These locations require **EXPLICIT HUMAN APPROVAL** before modification:

| Zone | Reason |
|------|--------|
| `docs-FINAL/` | Canonical entry point, designed structure |
| Critical infrastructure docs | Established patterns |
| Module indexes | Navigation stability |

### Immutable Zone Operations

| Operation | Allowed? |
|-----------|----------|
| Read | ✅ YES |
| Append new section | ⚠️ CAUTION (mark new content clearly) |
| Create new file within zone | ✅ YES (if following zone pattern) |
| Modify existing content | ❌ REQUIRES EXPLICIT APPROVAL |
| Delete content | ❌ FORBIDDEN |
| Reformat | ❌ FORBIDDEN |

---

## 4. Change Classification Matrix

| Change Type | Approval Required? | Allowed? |
|-------------|-------------------|----------|
| **Add new file** | ❌ NO | ✅ YES |
| **Append section** | ❌ NO | ✅ YES |
| **Update index/mapping** | ❌ NO | ✅ YES |
| **Add troubleshooting** | ❌ NO | ✅ YES |
| **Mark section as WARNING** | ❌ NO | ✅ YES |
| **Reformat section** | ⚠️ CAUTION | Avoid unless necessary |
| **Rewrite section** | ✅ YES | ⚠️ Only if explicitly instructed |
| **Delete content** | ✅ YES (EXPLICIT) | ⚠️ Only with clear justification |
| **Modify IMMUTABLE ZONE** | ✅ YES (EXPLICIT) | ❌ Default NO |

---

## 5. Section Marking

When CODE_DOCUMENTATOR cannot update a section, it MUST mark it:

```markdown
<!-- CODE_DOCUMENTATOR: SECTION POSSIBLY OUTDATED -->
<!-- Last verified: {{DATE}} -->
<!-- Reason: Code changed, docs may not reflect current behavior -->
```

---

## 6. Evidence-Based Documentation

When describing behavior:

- ✅ Reference concrete file paths
- ✅ Describe responsibilities, not line-by-line code
- ❌ Avoid speculative or inferred behavior

If something **cannot be verified in code**:
→ Mark as **"ASSUMPTION"** explicitly.

```markdown
> **ASSUMPTION**: This behavior is inferred from feature plan, not verified in code.
```

---

## 7. Enforcement

| Violation | Severity |
|-----------|----------|
| Rewriting stable documentation without approval | BLOCKER |
| Modifying IMMUTABLE ZONE without approval | BLOCKER |
| Adding incorrect information | HIGH (requires correction) |
| Missing WARNING marker on outdated section | MEDIUM |
| Missing evidence reference | LOW |

---

**Related Files**:
- `core/roles/CODE_DOCUMENTATOR/README.md` — Role definition
- `core/runtime/doc-guard.md` — DOC_GUARD integration
