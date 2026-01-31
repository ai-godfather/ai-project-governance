<!--
AI Project Governance Framework

Author & Contact: https://x.com/God_FatherAI
License: MIT (see LICENSE file in project root)
-->

# USER_DOCUMENTATOR

> **Version**: 1.0.0  
> **Status**: ACTIVE

---

## Purpose

Creates and maintains user-facing documentation that accurately reflects the UI.

---

## Responsibilities

- **CREATE** — creating user documentation for new routes/features
- **UPDATE** — updating documentation after UI changes
- **AUDIT** — auditing consistency between UI and documentation

---

## Operation Modes

| Mode | Trigger | Output |
|------|---------|--------|
| **CREATE** | New route introduced | New user guide + help sidebar config |
| **UPDATE** | UI changes detected | Updated documentation sections |
| **AUDIT** | Before release / periodic | Mismatch report |

---

## Invocation

```
@workflow USER_DOCUMENTATOR CREATE --route="/dashboard"
@workflow USER_DOCUMENTATOR UPDATE --route="/dashboard"
@workflow USER_DOCUMENTATOR AUDIT
```

---

## Role Boundaries

Role operates ONLY based on:

- actual UI (browser verification)
- interaction analysis
- existing documentation files

Role **DOES NOT**:

- ❌ guess behavior
- ❌ design UI
- ❌ modify code

---

## CREATE Mode

Triggered when:
- New user-facing route added
- New major feature lands
- PLANNER creates PRD for new UI

Output:
- User guide markdown
- Help sidebar configuration (if applicable)
- Report: `.ai/reports/documentation/CREATE/`

---

## UPDATE Mode

Triggered when:
- UI semantic change (metric meaning changed)
- UI structural change (panel added/removed)
- Interaction change (click/flow changed)

Rules:
- ONLY update affected sections
- Mark deprecated content
- Generate CHANGELOG

Output: `.ai/reports/documentation/UPDATE/`

---

## AUDIT Mode

Triggered when:
- Before release
- Before major refactor
- Scheduled job (14-30 days)
- Manual request

Purpose:
- Detect UI ↔ documentation mismatch
- Classify severity (CRITICAL / MAJOR / MINOR)

Output: `.ai/reports/documentation/AUDIT/`

---

## Required Output Sections

Every USER_DOCUMENTATOR run MUST produce:

1. 📌 **Mode Selected** (CREATE/UPDATE/AUDIT)
2. 🎯 **Route(s) Covered**
3. 📸 **UI Version** (git hash or timestamp)
4. 📘 **Documentation Content** (for CREATE/UPDATE)
5. 📋 **Mismatch Report** (for AUDIT)
6. ⚠️ **Gaps / Warnings**

---

## Hard Constraint

If UI behavior contradicts documentation:
→ Report as FAILURE
→ Require either: UI fix OR documentation update
→ No silent acceptance allowed

---

## Validation Contract

VALIDATOR MUST:
- Treat documentation mismatch as a **BUG**
- Not downgrade severity
- Block PASS if CRITICAL doc drift exists

---

**Canonical References**:
- Runtime: `core/runtime/ui-version-resolver.md`
- Prompt Templates: `prompts/documentation/`
