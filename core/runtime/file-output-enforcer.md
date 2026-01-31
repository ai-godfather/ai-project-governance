# File Output Enforcer

> **Version**: 2.0.0  
> **Status**: ENFORCEMENT ACTIVE  
> **Purpose**: Ensure all role outputs are saved to files, not displayed in chat

---

## Principle

```
ALL ROLE ARTIFACTS MUST BE SAVED TO FILES.
DISPLAYING IN CHAT ≠ WORK COMPLETED.
```

---

## Enforcement Matrix

| Role | Output Type | Target Location | Required? |
|------|-------------|-----------------|-----------|
| PLANNER | Feature Plan | `.ai/plans/features/{CAT}/{CODE}.md` | 🔴 YES |
| PLANNER | Task Files | `.ai/tasks/{CAT}/{CODE}/task*.md` | 🔴 YES |
| AUDITOR | Audit Report | `.ai/_PLANS_VALIDATIONS/{CODE}/PLANNER_AUDIT_{date}.md` | 🔴 YES |
| TDD_GUIDE | Test Files | `{{TEST_DIR}}/{feature}/*.test.*` | 🔴 YES |
| TDD_GUIDE | TDD Report | `.ai/_PLANS_VALIDATIONS/{CODE}/TDD_GUIDE_REPORT_{date}.md` | 🔴 YES |
| VALIDATOR | Validation Report | `.ai/_PLANS_VALIDATIONS/{CODE}/VALIDATION_{date}.md` | 🔴 YES |
| UI_BROWSER_INSPECTOR | E2E Tests | `{{E2E_DIR}}/tests/{feature}*.test.*` | 🔴 YES |
| UI_BROWSER_VALIDATOR | Validation Report | `.ai/_PLANS_VALIDATIONS/{CODE}/UI_VALIDATION_{date}.md` | 🔴 YES |
| DATA_SEMANTIC_VALIDATOR | Semantic Report | `.ai/_PLANS_VALIDATIONS/{CODE}/DATA_SEMANTIC_{date}.md` | 🔴 YES |
| CODE_DOCUMENTATOR | Documentation | `docs/...` | 🔴 YES |

---

## Enforcement Workflow

```
Role invoked
        │
        ▼
┌─────────────────────────────────────┐
│ STEP 1: READ OUTPUT_RULES.md        │
│ - Identify required outputs         │
│ - Calculate target paths            │
└─────────────────────────────────────┘
        │
        ▼
┌─────────────────────────────────────┐
│ STEP 2: EXECUTE ROLE WORKFLOW       │
│ - Perform analysis/work             │
│ - Build output content              │
└─────────────────────────────────────┘
        │
        ▼
┌─────────────────────────────────────┐
│ STEP 3: WRITE TO FILE               │
│ 🔴 CRITICAL: Use Write tool!        │
│ - Create directory if needed        │
│ - Save output to file               │
│ - DO NOT display in chat first      │
└─────────────────────────────────────┘
        │
        ▼
┌─────────────────────────────────────┐
│ STEP 4: CONFIRM IN CHAT             │
│ - Short confirmation only           │
│ - Include file path                 │
│ - Include next step                 │
└─────────────────────────────────────┘
```

---

## ❌ FORBIDDEN PATTERNS

```
❌ Display full output in chat, then "I'll also save to file"
❌ Ask user "should I save this?"
❌ Show output in chat without file creation
❌ Create output as code block in chat
❌ Use placeholder paths without actual file creation
```

---

## ✅ CORRECT PATTERNS

```
✅ Write output directly to file using Write tool
✅ Display only short confirmation in chat
✅ Include file path in confirmation
✅ Include next step recommendation
```

---

## Chat Confirmation Format

After saving to file, output ONLY:

```markdown
## ✅ {ACTION} COMPLETE

**File Created**: `{path}`

### Summary
{2-3 sentences}

### Next Step
{recommendation}
```

---

## Validation Rules

| Condition | Severity | Action |
|-----------|----------|--------|
| Output in chat without file save | 🔴 INVALID | Redo with file save |
| File path not created | 🔴 INVALID | Create file |
| Chat output longer than summary | 🟡 WARNING | Reduce chat output |

---

## Role-Specific OUTPUT_RULES

Each role that produces files has an `OUTPUT_RULES.md`:

| Role | Location |
|------|----------|
| PLANNER | `core/roles/PLANNER/OUTPUT_RULES.md` |
| AUDITOR | `core/roles/AUDITOR/OUTPUT_RULES.md` |
| TDD_GUIDE | `core/roles/TDD_GUIDE/OUTPUT_RULES.md` |
| UI_BROWSER_INSPECTOR | `core/roles/UI_BROWSER_INSPECTOR/OUTPUT_RULES.md` |
| UI_BROWSER_VALIDATOR | `core/roles/UI_BROWSER_VALIDATOR/OUTPUT_RULES.md` |
| DATA_SEMANTIC_VALIDATOR | `core/roles/DATA_SEMANTIC_VALIDATOR/OUTPUT_RULES.md` |

---

**Related Files**:
- `core/roles/*/OUTPUT_RULES.md` — Role-specific rules
- `adapters/cursor-rules/*.mdc` — Enforcement layer
