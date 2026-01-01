<!--
AI Project Governance Framework

Author: Piotr Kwiatkowski
Contact: peetero@proton.me

License: PROPRIETARY — ALL RIGHTS RESERVED
This is a legal notice, not an instruction or workflow rule.
-->

# AI Project Governance — Unification Report

**Generated**: 2026-01-01  
**Purpose**: Document generalization decisions and configuration points

---

## 1. GENERALIZATION SUMMARY

### What Was Generalized

| Component | Original | Generalized |
|-----------|----------|-------------|
| Project name | "HyperXAdvisor", "SuperX" | `{{PROJECT_NAME}}` |
| Tech stack references | "tRPC", "Drizzle", "Cloud Run" | `{{TECH_STACK}}` section |
| Database references | PostgreSQL-specific | `{{DATABASE}}` placeholder |
| Cloud provider | GCP-specific | `{{CLOUD_PROVIDER}}` abstraction |
| Job system | Cloud Run Jobs | `{{JOB_SYSTEM}}` abstraction |
| Documentation paths | `docs/JOBS/`, `docs/COPIER_*` | `docs/{{MODULE}}/` |
| Feature codes | `ADMIN_`, `COPIER_INTEL_` | `{{CATEGORY}}_` configurable |

### What Remains Project-Specific (Configurable)

| Configuration | Description | Default |
|---------------|-------------|---------|
| `project.name` | Display name | "My Project" |
| `project.repo` | Repository name | "my-project" |
| `paths.jobs` | Job scripts location | `scripts/JOBS/` |
| `paths.docs` | Documentation root | `docs/` |
| `paths.docsFinal` | Navigation layer | `docs-FINAL/` |
| `categories.features` | Feature categories | `["ADMIN", "USER", "INFRA"]` |
| `stack.database` | Database type | "postgresql" |
| `stack.cloud` | Cloud provider | "gcp" |
| `stack.jobs` | Job runtime | "cloud-run-jobs" |
| `governance.frozenPeriod` | ADR freeze days | 14 |
| `governance.maxTasksPerTurn` | Parallel task limit | 3 |

### What Is Immutable (Core Governance)

| Component | Reason |
|-----------|--------|
| Role definitions | Universal across projects |
| Execution order | Workflow integrity |
| Error traceability | Cross-project standard |
| Compliance tracking | Governance contract |
| Guard logic | Pre-execution safety |
| Origin layer heuristics | Universal classification |
| Prompt structures | Consistent agent behavior |

---

## 2. ROLE GENERALIZATION

### Universal Roles (No Changes Needed)

| Role | Generalization Status |
|------|----------------------|
| EMERGENCY_ERROR | ✅ Universal — incident response |
| PLANNER | ✅ Universal — feature planning |
| IMPLEMENTER | ✅ Universal — code execution |
| VALIDATOR | ✅ Universal — first-pass validation |
| UI_INSPECTOR | ✅ Universal — visual anomaly detection |
| DATA_SEMANTIC_VALIDATOR | ✅ Universal — semantic integrity |
| UI_BROWSER_VALIDATOR | ✅ Universal — runtime verification |
| FIXATOR | ✅ Universal — issue remediation |
| RE_VALIDATOR | ✅ Universal — fix verification |
| ARCHITECT | ✅ Universal — ADR creation |
| CODE_DOCUMENTATOR | ✅ Universal — technical docs |
| USER_DOCUMENTATOR | ✅ Universal — user docs |
| DOC_GUARD | ✅ Universal — doc governance |

### Project-Configurable Roles

| Role | Configuration Needed |
|------|---------------------|
| JOB_OBSERVER | Job system type, paths, troubleshooting rules |

---

## 3. FAILURE PATTERN GENERALIZATION

### Core Patterns (Universal)

These patterns apply to any project:

| FP-ID | Pattern | Universal? |
|-------|---------|-----------|
| FP-001 | Frontend assumes data presence | ✅ |
| FP-002 | Non-deterministic mock data | ✅ |
| FP-003 | Plan treated as system state | ✅ |
| FP-004 | Fix scope expansion | ✅ |
| FP-005 | Implicit complexity | ✅ |
| FP-006 | Documentation optimism | ✅ |
| FP-007 | Missing pagination | ✅ |
| FP-008 | Unbounded concurrency | ✅ |
| FP-036 | Ratio shown as percentage | ✅ |
| FP-037 | Missing data shown as zero | ✅ |
| FP-038 | Non-persistent ID as stable | ✅ |
| FP-039 | Inappropriate aggregation | ✅ |
| FP-040 | Small sample hidden by precision | ✅ |
| FP-041 | Time-window mismatch | ✅ |
| FP-042 | Dead click | ✅ |
| FP-043 | Silent API failure | ✅ |
| FP-044 | Infinite loading | ✅ |
| FP-045 | Stale data after interaction | ✅ |
| FP-046 | Console error | ✅ |
| FP-047 | Network retry loop | ✅ |

### Project-Evolved Patterns (Customizable)

These patterns are learned from project-specific incidents:

| Pattern Type | How to Add |
|--------------|------------|
| Migration patterns | Add to `AI_SYSTEM_FAILURE_PATTERNS.md` |
| Job-specific patterns | Add to `JOBS/_TROUBLESHOOTING_RULES.md` |
| API-specific patterns | Add to project guardrails |
| Infrastructure patterns | Add to project guardrails |

**Recommendation**: Start with core patterns, evolve project-specific ones.

---

## 4. GUARDRAILS GENERALIZATION

### Universal Guardrails (14 Absolute Prohibitions)

These apply to ANY project:

1. ❌ Unbounded arrays/maps without MAX_SIZE
2. ❌ COUNT(DISTINCT) on >1M rows without pre-aggregation
3. ❌ Direct external API calls without cache
4. ❌ Date range aggregation on snapshot tables
5. ❌ Job execution without checking locks
6. ❌ Schema changes without migration checklist
7. ❌ Destructive operations without confirmation
8. ❌ Planning based on feature plan alone
9. ❌ Copy-paste without validation
10. ❌ `--set-env-vars` (use `--update-env-vars`)
11. ❌ In-memory state across serverless invocations
12. ❌ Non-idempotent job without replay strategy
13. ❌ Admin UI treated as "low traffic"
14. ❌ Limits without budget comments

### Project-Configurable Guardrails

| Guardrail | Configuration |
|-----------|---------------|
| Memory limits | `{{MAX_MEMORY_MB}}` |
| Batch sizes | `{{MAX_BATCH_SIZE}}` |
| Query limits | `{{MAX_QUERY_ROWS}}` |
| Timeout values | `{{DEFAULT_TIMEOUT_MS}}` |
| Cache TTL | `{{DEFAULT_CACHE_TTL}}` |

---

## 5. DOCUMENTATION GOVERNANCE GENERALIZATION

### Universal DOC_GUARD Rules

| Detection | Action | Universal? |
|-----------|--------|-----------|
| New job without docs | HARD BLOCK | ✅ |
| DANGEROUS op without docs | HARD BLOCK | ✅ |
| New route without mapping | WARN | ✅ |
| New service without overview | RECOMMEND | ✅ |
| Stale documentation | FLAG | ✅ |

### Configurable Documentation Structure

```yaml
documentation:
  navigation_layer: "docs-FINAL/"
  modules_root: "docs/"
  dangerous_ops: "docs/DANGEROUS_OPERATIONS/"
  deprecated: "docs/DEPRECATED_{{RESOURCE_TYPE}}/"
  mappings: "docs/MAPPINGS/"
  jobs: "docs/JOBS/"
```

---

## 6. TASK MAGIC GENERALIZATION

### Universal Task Structure

```markdown
# Task {ID}: {Description}

**Status**: pending | inprogress | completed | failed
**Priority**: high | medium | low
**Type**: {{TASK_TYPES}}
**Dependencies**: task{id} or None
**Estimated Time**: X hours

## DESCRIPTION
## ACCEPTANCE CRITERIA
## TESTING STRATEGY
## FILES TO MODIFY
## VALIDATION ARTIFACTS (MANDATORY)
## COMPLETION CHECKLIST
```

### Configurable Elements

| Element | Configuration |
|---------|---------------|
| Task types | `["frontend", "backend", "database", "devops", "docs"]` |
| ID format | `task{NNNNN}_{slug}.md` |
| Category prefixes | `["ADMIN", "USER", "INFRA", "JOB"]` |
| Archive path | `.ai/tasks/_archive/` |

---

## 7. CONFIGURATION FILE FORMAT

### Proposed `governance.config.yaml`

```yaml
# AI Project Governance Configuration
# Place in project root alongside .cursorrules

project:
  name: "My Project"
  display_name: "My Project Display Name"
  repo: "my-project"
  
paths:
  ai_root: ".ai/"
  docs_root: "docs/"
  docs_final: "docs-FINAL/"
  jobs: "scripts/JOBS/"
  cursorrules: ".cursorrules"
  agents: "AGENTS.md"

categories:
  features:
    - ADMIN
    - USER
    - INFRA
    - JOB
    - PERF
  tasks:
    - frontend
    - backend
    - database
    - devops
    - docs

stack:
  language: "typescript"
  framework: "express"  # or "nextjs", "fastapi", etc.
  database: "postgresql"
  orm: "drizzle"  # or "prisma", "sqlalchemy"
  cloud: "gcp"  # or "aws", "azure"
  jobs: "cloud-run-jobs"  # or "lambda", "step-functions"

governance:
  frozen_period_days: 14
  max_tasks_per_turn: 3
  changelog_required: true
  validation_required: true
  
limits:
  max_memory_mb: 28000
  max_batch_size: 10000
  max_query_rows: 100000
  default_timeout_ms: 30000

documentation:
  immutable_zones:
    - "docs/JOBS/"
    - "docs/INFRASTRUCTURE/"
  dangerous_operations:
    - "cleanup-*"
    - "truncate-*"
    - "delete-*"
```

---

## 8. EXTRACTION ARTIFACTS

### Files to Generate

| Artifact | Description |
|----------|-------------|
| `core/` | Universal governance files |
| `adapters/` | Template configurations |
| `bootstrap/` | Project initialization |
| `prompts/` | Role prompt templates |
| `docs/` | Documentation templates |
| `examples/` | Example configurations |

### Template Variables

| Variable | Usage |
|----------|-------|
| `{{PROJECT_NAME}}` | Project identifier |
| `{{PROJECT_DISPLAY_NAME}}` | Human-readable name |
| `{{TECH_STACK}}` | Technology description |
| `{{DATABASE}}` | Database type |
| `{{CLOUD_PROVIDER}}` | Cloud platform |
| `{{JOB_SYSTEM}}` | Job execution system |
| `{{MAX_MEMORY_MB}}` | Memory limit |
| `{{MAX_BATCH_SIZE}}` | Batch processing limit |

---

## 9. MIGRATION PATH

### For Existing Projects

1. **Assess**: Run governance audit
2. **Install**: Copy `core/` and `adapters/`
3. **Configure**: Create `governance.config.yaml`
4. **Bootstrap**: Run initialization script
5. **Customize**: Add project-specific patterns

### For New Projects

1. **Clone**: Copy governance framework
2. **Configure**: Edit `governance.config.yaml`
3. **Initialize**: Run `bootstrap/init.sh`
4. **Start**: Begin using `@workflow` commands

---

## 10. VERSION COMPATIBILITY

| Version | Description |
|---------|-------------|
| v1.0.0 | Initial extraction from HyperXAdvisor |
| v1.1.0 | Generalized role definitions |
| v1.2.0 | Configurable failure patterns |
| v2.0.0 | Full project-agnostic framework |

---

**End of Unification Report**
