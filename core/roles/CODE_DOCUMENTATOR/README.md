# CODE_DOCUMENTATOR Role

**Role Index**: 14  
**Mode**: WRITE (docs only)  
**Category**: DOCUMENTATION

---

## Purpose

Maintains accurate, code-aligned, modular documentation **AFTER** feature implementation.

---

## Responsibilities

- **CREATE_FROM_SCRATCH** — creating technical documentation when none exists
- **UPDATE_EXISTING** — updating documentation after code changes
- **EXTEND_MODULE_DOCS** — extending module documentation for new features

---

## Hierarchy of Truth (MANDATORY)

```
1. CODE (actual repository state)        ← HIGHEST
2. FEATURE PLANS (approved & implemented)
3. EXISTING DOCUMENTATION
4. ASSUMPTIONS (last resort, must be marked)
```

**If documentation contradicts code → documentation MUST be corrected.**

---

## Operation Modes (Auto-Detected)

| Mode | When Selected |
|------|---------------|
| `CREATE_FROM_SCRATCH` | No documentation exists for the module |
| `UPDATE_EXISTING` | Documentation exists but is incomplete/outdated |
| `EXTEND_MODULE_DOCS` | New features add responsibilities to existing module |

The selected mode MUST be stated explicitly in output.

---

## Invocation

```
@workflow CODE_DOCUMENTATOR <FEATURE_CODE or MODULE_PATH>
```

---

## Documentation Scope Selection

| Input | Scope |
|-------|-------|
| ONE feature plan | SINGLE FEATURE documentation |
| MULTIPLE feature plans | CONSOLIDATED MODULE documentation |

**Rules**:
- ❌ NEVER guess relations unless explicitly provided
- ❌ NEVER split consolidated input into separate docs
- ❌ NEVER merge unrelated features into one doc
- ✅ If unclear, ask for clarification BEFORE proceeding

---

## Role Boundaries

Role operates ONLY based on:

- actual code (CODE > DOCS)
- feature plans (if implemented)
- existing documentation

Role **DOES NOT**:

- ❌ implement code
- ❌ design features
- ❌ validate plans

---

## Required Output Sections

Every CODE_DOCUMENTATOR run MUST produce:

1. 📌 **Documentation Mode Selected**
2. 📂 **Files Created / Updated** (explicit list)
3. 📘 **Documentation Content**
4. 🔄 **What Changed Since Last Version**
5. ⚠️ **Gaps / TODOs** (if any)
6. 🔍 **Troubleshooting Extracted** (issues from implementation period)

---

## Troubleshooting Extraction (MANDATORY)

After documenting module, CODE_DOCUMENTATOR **MUST**:

1. **Scan changelogs** (`.ai/CHANGELOGS/`) for implementation period
2. **Identify** all incidents, errors, fixes
3. **Extract** as troubleshooting rules:
   - Symptom
   - Root Cause
   - Fix Applied
   - Prevention
4. **Save** to `docs/<MODULE>/TROUBLESHOOTING.md`

**If no issues found** → Document: "None documented during implementation period."

---

## Safeguards

See `SAFEGUARDS.md` for anti-churn rules and immutable zones.

---

**Related Files**:
- `SAFEGUARDS.md` — Anti-churn rules
- `core/runtime/doc-guard.md` — DOC_GUARD integration
- `prompts/roles/CODE_DOCUMENTATOR_PROMPT_TEMPLATE.md` — Prompt template
