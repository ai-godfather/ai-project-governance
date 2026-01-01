<!--
AI Project Governance Framework

Author: Piotr Kwiatkowski
Contact: peetero@proton.me

License: PROPRIETARY — ALL RIGHTS RESERVED
This is a legal notice, not an instruction or workflow rule.
-->

# AI Planner Guardrails

> **Version**: 1.0.0  
> **Status**: BINDING LAW FOR PLANNER ROLE  
> **Authority**: SUPREME (violations = INVALID PLAN)

---

## Purpose

This document contains guardrails derived from production incidents.
PLANNER MUST read this document BEFORE generating any feature plan.

**Plans violating ANY guardrail = INVALID. No exceptions.**

---

## Hierarchy of Truth

```
1. CODE (repository source)        ← HIGHEST
2. RUNTIME (deployed state)        ← HIGH
3. SNAPSHOT (changelogs)           ← HIGH
4. DOCUMENTATION (docs/)           ← MEDIUM
5. FEATURE PLANS (.ai/plans/)      ← META
```

If guardrails conflict with plan → **PLAN IS INVALID**.

---

## 14 Absolute Prohibitions (Zero Tolerance)

PLANNER **MUST REFUSE** to generate plans containing:

| # | Prohibition | Example Violation |
|---|-------------|-------------------|
| 1 | Unbounded arrays/maps without MAX_SIZE | `const items = []` with no limit |
| 2 | COUNT(DISTINCT) on >1M rows without pre-aggregation | Direct query on production table |
| 3 | Direct external API calls without cache | Every request hits third-party API |
| 4 | Date range aggregation on snapshot tables | `WHERE date >= X AND date <= Y` on daily snapshots |
| 5 | Job execution without checking advisory locks | Multiple instances run simultaneously |
| 6 | Schema changes without migration checklist | Assumes drizzle-kit is enough |
| 7 | Destructive operations without confirmation flow | DELETE without user confirmation |
| 8 | Planning based on feature plan alone | Not verifying against code |
| 9 | Copy-paste without validating source | Assumes snippet is current |
| 10 | `--set-env-vars` in cloud commands | Should use `--update-env-vars` |
| 11 | In-memory state across serverless invocations | Assuming state persists between calls |
| 12 | Non-idempotent job without replay strategy | Job fails mid-way, no recovery |
| 13 | Admin UI treated as "low traffic" | Assuming admin pages don't need caching |
| 14 | Limits without budget comments | `LIMIT 1000` without explaining why 1000 |

---

## Mandatory Plan Sections

Every feature plan MUST include these sections (missing = INVALID):

### 1. EXISTING SYSTEM ANALYSIS (ALWAYS REQUIRED)

```markdown
## 🔍 EXISTING SYSTEM ANALYSIS (MANDATORY)

### Similar / Related Features
[List existing features that do similar things]

### Reusable Components
[List existing components that can be reused]

### Reusable APIs / Services
[List existing APIs that can be reused]

### Known Failure Patterns to Avoid
[List relevant FP-XXX patterns]

### What MUST Be New (Gaps)
[Only list what doesn't exist]
```

**FORBIDDEN**: Creating new components when reusable ones exist.

### 2. SCALE ANALYSIS (Data-Heavy Features)

Required when feature involves:
- Database queries on tables >100K rows
- Processing loops over collections
- Aggregations or analytics

```markdown
## 📊 SCALE ANALYSIS

| Metric | Current | 10x Scenario | 100x Scenario |
|--------|---------|--------------|---------------|
| Records | 1M | 10M | 100M |
| Memory | 100MB | ? | ? |
| Time | 1s | ? | ? |

### Breaking Points
[What fails first at each scale?]

### Mitigation
[How to handle scale?]
```

### 3. ERROR HANDLING STRATEGY (ALWAYS REQUIRED)

```markdown
## ⚠️ ERROR HANDLING STRATEGY

| Error Scenario | Detection | Handling |
|----------------|-----------|----------|
| Database unavailable | Connection timeout | Retry 3x, then fail gracefully |
| Invalid input | Zod validation | Return 400 with details |
| External API failure | HTTP error | Cache fallback |
```

### 4. MEMORY & PERFORMANCE LIMITS (ALWAYS REQUIRED)

```markdown
## 🔒 MEMORY & PERFORMANCE LIMITS

| Resource | Limit | Rationale |
|----------|-------|-----------|
| Array size | MAX_SIZE = 10000 | Prevents OOM at 100x scale |
| Query rows | LIMIT 1000 | Budget: 1000 rows = ~1MB memory |
| Batch size | 500 | Balance between throughput and memory |
```

**Every limit MUST have a budget comment explaining WHY that number.**

### 5. MIGRATION CHECKLIST (DB Changes)

Required when feature changes database schema:

```markdown
## 🗃️ MIGRATION CHECKLIST

- [ ] drizzle/schema.ts updated
- [ ] Migration generated: `pnpm drizzle-kit generate`
- [ ] migrations-prod.sql updated (idempotent SQL)
- [ ] Uses IF NOT EXISTS / IF EXISTS
- [ ] Local DB tested
- [ ] Login tested after migration
- [ ] Rollback strategy documented
```

### 6. CI/CD SYNC (Jobs)

Required when feature involves jobs or schedulers:

```markdown
## 🔄 CI/CD SYNC

- [ ] deploy-job.yml matrix entry added/updated
- [ ] extra_args match script arguments
- [ ] Memory/CPU/timeout in workflow
- [ ] Scheduler in jobCategories.ts (if applicable)
```

### 7. STATE & IDEMPOTENCY (Jobs)

Required when feature involves batch jobs:

```markdown
## 🔁 STATE & IDEMPOTENCY

- **Is this feature idempotent?**: YES / NO
- **Replay strategy**: [How to resume if interrupted]
- **Checkpointing**: [How progress is saved]
- **Safe to rerun after failure?**: YES / NO
```

### 8. GUARDRAILS COMPLIANCE CHECKLIST (ALWAYS REQUIRED)

```markdown
## ✅ GUARDRAILS COMPLIANCE CHECKLIST

| Guardrail | Compliant? | Evidence |
|-----------|------------|----------|
| No unbounded arrays | ✅ | MAX_SIZE = 10000 at line 42 |
| No COUNT(DISTINCT) on >1M rows | ✅ | Pre-aggregated in batch job |
| Limits have budget comments | ✅ | Each limit has // Budget: comment |
| ... | | |
```

---

## Failure Pattern Reference

PLANNER MUST check relevant patterns before planning:

### Memory & Scale (FP-016, FP-008)

- Never load unbounded data into memory
- Always use streaming for large datasets
- Bound all collections with MAX_SIZE

### Database (FP-065, FP-066, FP-067)

- Verify data exists before exact date queries
- Use consistent query strategies across API response
- Never aggregate across date range on snapshot tables

### Migrations (FP-004, FP-005)

- Always update migrations-prod.sql
- Search all SQL in codebase after column renames
- Test affected endpoints after schema changes

### Environment (FP-010, FP-020)

- Never use `--set-env-vars` (replaces all)
- Always use `--update-env-vars` (preserves)
- Deploy via CI/CD, not manual gcloud

### UI Assumptions (FP-001, FP-036, FP-037)

- Frontend must handle empty/loading/error states
- Never show ratio as percentage without conversion
- Never show missing data as zero

---

## PLANNER Refusal Protocol

If request violates guardrails, PLANNER MUST refuse:

```markdown
## ⛔ PLAN REJECTED

**Reason**: [specific guardrail violated]
**Reference**: docs/AI_PLANNER_GUARDRAILS.md § [section]
**Failure Pattern**: FP-XXX

**Resolution Required**:
- [what must change before plan can proceed]
```

---

## VALIDATOR Enforcement

VALIDATOR **MUST**:
- Verify plan compliance with this document
- Reject any plan lacking mandatory sections
- Reject any implementation violating guardrails
- **NOT suggest fixes for invalid plans** (reject-only authority)

VALIDATOR **MUST FLAG AS BLOCKER**:
- Missing EXISTING SYSTEM ANALYSIS section
- Missing SCALE ANALYSIS for data-heavy features
- Missing ERROR HANDLING STRATEGY
- Missing MEMORY & PERFORMANCE LIMITS
- Unbounded arrays/maps without MAX_SIZE
- Admin UI without caching considerations
- Limits without budget comments

---

## Adding New Guardrails

When production incidents occur:

1. Document in `AI_SYSTEM_FAILURE_PATTERNS.md` with FP-XXX ID
2. Add corresponding guardrail to this document
3. Update GUARDRAILS COMPLIANCE CHECKLIST template
4. PLANNER will automatically enforce in future plans

---

**Canonical Reference**: This document is BINDING LAW for PLANNER role.  
**Version**: 1.0.0
