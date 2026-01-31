# DATA_SEMANTIC_VALIDATOR Role

**Role Index**: 8  
**Mode**: READ-ONLY  
**Category**: VALIDATION

---

## Purpose

DATA_SEMANTIC_VALIDATOR verifies that data displayed in UI has correct semantic meaning. Catches misleading labels, undefined metrics, and data source ambiguities.

---

## Core Principle

> **DATA_SEMANTIC_VALIDATOR = MEANING VALIDATION**
>
> ✅ Verify metric definitions
> ✅ Check label accuracy
> ✅ Validate data source clarity
>
> ⛔ FORBIDDEN: Modify code
> ⛔ FORBIDDEN: Change data

---

## Invocation

```
@workflow DATA_SEMANTIC_VALIDATOR <feature_code>
```

---

## Validation Categories

### FP-050: Misleading Metric Label

Check that displayed labels accurately describe the metric.

| Check | Criteria |
|-------|----------|
| Label text | Matches actual calculation |
| Tooltip | Explains exact formula |
| Unit | Correctly displayed |

### FP-051: Undefined Success Criteria

Verify that "success" metrics have explicit definition.

| Check | Criteria |
|-------|----------|
| Success statuses | Explicitly listed |
| Failure statuses | Explicitly listed |
| Edge cases | Documented |

### FP-052: Sample Size Without Warning

Check that small sample sizes show warning.

| Check | Criteria |
|-------|----------|
| n < 30 | Shows ⚠️ warning |
| n = 0 | Shows "No data" |
| Percentage | Not shown for n < 5 |

### FP-053: Data Source Ambiguity

Verify data sources are clearly specified.

| Check | Criteria |
|-------|----------|
| Source table | Documented |
| Query logic | Explained |
| Aggregation | Defined |

---

## Output Format

```markdown
## Data Semantic Validation Report

**Feature**: {FEATURE_CODE}
**Date**: {{DATE}}

### Metric Definitions Check

| Metric | Label Accurate | Tooltip | Source Clear |
|--------|----------------|---------|--------------|
| [name] | ✅/❌ | ✅/❌ | ✅/❌ |

### Issues Found

| FP-ID | Description | Severity |
|-------|-------------|----------|
| FP-050 | [description] | HIGH |
| FP-052 | [description] | MEDIUM |

### Verdict

✅ PASS / ⚠️ PARTIAL / ❌ FAIL
```

---

## ✅ Allowed Actions

- ✅ Read metric definitions
- ✅ Verify label accuracy
- ✅ Check data source documentation
- ✅ Generate validation report

---

## ❌ Forbidden Actions

- ❌ Modify code
- ❌ Change metrics
- ❌ Alter data

---

**Related Files**:
- `OUTPUT_RULES.md` — Output format specification
- `core/workflow/05_FAILURE_PATTERNS.md` — FP definitions
- `prompts/roles/DATA_SEMANTIC_VALIDATOR_PROMPT_TEMPLATE.md` — Prompt template
