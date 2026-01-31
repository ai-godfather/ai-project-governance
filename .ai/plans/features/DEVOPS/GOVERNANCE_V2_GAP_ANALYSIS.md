# AI Project Governance Framework — V2.0 Gap Analysis

> **Feature Code**: DEVOPS_007  
> **Version**: 1.0.0  
> **Created**: 2026-01-31  
> **Status**: ANALYSIS COMPLETE  
> **Author**: PLANNER (AI Workflow)

---

## Executive Summary

This document analyzes the evolution of AI Project Governance Framework from v1.0.0 (ai-project-governance repository) to the production implementation in callbotagent-callrelay. The goal is to identify all enhancements that should be backported to create Framework v2.0.0.

### Key Findings

| Metric | v1.0.0 | callrelay (v2.0) | Delta |
|--------|--------|------------------|-------|
| **Roles** | 14 | 16 | +2 new roles |
| **Failure Patterns** | ~89 generic | ~79 (12 project + 47 general + 20 new) | +20 new FPs |
| **Workflow Files** | 10 | 12 | +2 new files |
| **Runtime Guards** | 6 | 8 | +2 new guards |
| **Cursor Rules** | 0 | 8 | NEW enforcement layer |
| **Workflow Definitions** | 2 (task-magic) | 9 | NEW structure |
| **Role Structure** | 3 flat files | 16 modular folders | RESTRUCTURED |

---

## PHASE 1: GAP ANALYSIS

### 1.1 ROLE COMPARISON

#### Role Summary Table

| Role | v1.0.0 | callrelay | Status | Key Changes |
|------|--------|-----------|--------|-------------|
| EMERGENCY_ERROR | ✅ Present | ✅ Present | OK | No changes |
| PLANNER | ✅ Present | ✅ Enhanced | **BACKPORT** | Two-Phase workflow, 35 prohibitions |
| **AUDITOR** | ❌ Missing | ✅ NEW | **ADD** | Quality Gate, 15 audit dimensions |
| **TDD_GUIDE** | ❌ Missing | ✅ NEW | **ADD** | RED phase testing, 6 FP-TDD patterns |
| IMPLEMENTER | ✅ Present | ✅ Enhanced | **BACKPORT** | TDD CHECK, TASK_INDEX immediate update |
| VALIDATOR | ✅ Present | ✅ Enhanced | **BACKPORT** | Documentation Gate, FP-068/069 checks |
| UI_INSPECTOR | ✅ Present | ✅ Present | OK | No changes |
| DATA_SEMANTIC_VALIDATOR | ✅ Present | ✅ Present | OK | No changes |
| UI_BROWSER_VALIDATOR | ✅ Present | ✅ Enhanced | **BACKPORT** | Puppeteer enforcement v3.0 |
| **UI_BROWSER_INSPECTOR** | ❌ Missing | ✅ NEW | **ADD** | E2E Puppeteer test generation |
| FIXATOR | ✅ Present | ✅ Present | OK | No changes |
| RE_VALIDATOR | ✅ Present | ✅ Present | OK | No changes |
| ARCHITECT | ✅ Present | ✅ Present | OK | No changes |
| CODE_DOCUMENTATOR | ✅ Present | ✅ Present | OK | No changes |
| USER_DOCUMENTATOR | ✅ Present | ✅ Present | OK | No changes |
| JOB_OBSERVER | ✅ Present | ✅ Present | OK | No changes |
| DOC_GUARD | ✅ Present | ✅ Present | OK | No changes |

#### New Roles Detail

##### AUDITOR (NEW)

**Purpose**: Quality gate between PLANNER and IMPLEMENTER.

| Attribute | Value |
|-----------|-------|
| Mode | READ-ONLY / STRICT |
| Position | After PLANNER, before IMPLEMENTER |
| Output | `.ai/_PLANS_VALIDATIONS/{FEATURE}/PLANNER_AUDIT_{date}.md` |
| Audit Dimensions | 15 |

**Key Features**:
- Coverage Completeness verification
- Phase Alignment validation
- Task Granularity assessment
- Forbidden Additions detection
- API Schema Presence check (FP-054)
- Metric Definitions check (FP-050/051)
- Task Count Verification (FP-055)
- Entity Field Verification (FP-064)
- ASCII Mockup Coverage (FP-060)
- Long Prompt Section Scan (FP-061)

**Verdicts**: PASS | PARTIAL | FAIL

##### TDD_GUIDE (NEW)

**Purpose**: Create failing tests (RED phase) before implementation.

| Attribute | Value |
|-----------|-------|
| Mode | WRITE (tests only) |
| Position | After AUDITOR, before IMPLEMENTER |
| Scope | `tests/**/*.php` only |
| Output | `.ai/_PLANS_VALIDATIONS/{FEATURE}/TDD_GUIDE_REPORT_{date}.md` |

**Key Features**:
- Entity type analysis (FP-TDD-001)
- Controller pattern analysis (FP-TDD-002)
- Authentication behavior analysis (FP-TDD-003)
- Response structure contract (FP-TDD-004)
- API Schema blocking (FP-TDD-005/FP-054)
- Service method verification (FP-TDD-006/FP-057)

**Blocking Conditions**: Missing API RESPONSE STRUCTURE, Missing METRIC SEMANTIC DEFINITIONS

##### UI_BROWSER_INSPECTOR (NEW)

**Purpose**: Generate comprehensive E2E tests using Puppeteer.

| Attribute | Value |
|-----------|-------|
| Mode | READ + EXECUTE |
| Output | `e2e-tests/tests/{feature}-*.test.js` |
| Framework | Puppeteer (Node.js) |

**Test Categories**:
- Multi-Tab Interfaces
- Alpine.js Integration
- JSON Preview
- Form Controls
- API Requests via UI
- Quick Actions
- Modals
- Default State Tests
- LocalStorage Tests
- HMAC/Signature Tests

#### Enhanced Roles Detail

##### PLANNER (Enhanced)

| Enhancement | v1.0.0 | v2.0.0 |
|-------------|--------|--------|
| Workflow | Single phase | **Two-Phase** (plan → approval → tasks) |
| Prohibitions | Not specified | **35 absolute prohibitions** |
| Mandatory Sections | Not defined | PREDECESSOR FEATURE ANALYSIS, MIGRATION COLUMN USAGE MAP, METRIC SEMANTIC DEFINITIONS, API RESPONSE STRUCTURE |
| Task Generation | Immediate | **Requires user approval** |

##### IMPLEMENTER (Enhanced)

| Enhancement | v1.0.0 | v2.0.0 |
|-------------|--------|--------|
| TDD Check | Not required | **MANDATORY** before PHP implementation |
| TASK_INDEX Update | End of session | **Immediate** after each task (FP-068) |
| Audit Gate | Not enforced | **AUDITOR PASS required** |

##### VALIDATOR (Enhanced)

| Enhancement | v1.0.0 | v2.0.0 |
|-------------|--------|--------|
| Documentation Gate | Not enforced | **BLOCKING** if docs missing (FP-069) |
| TASK_INDEX Check | Not performed | **BLOCKING** if status mismatch (FP-068) |
| FP Coverage | FP-002 to FP-016 | **Extended** to FP-069 |

##### UI_BROWSER_VALIDATOR (Enhanced)

| Enhancement | v1.0.0 | v2.0.0 |
|-------------|--------|--------|
| Tooling | MCP Browser / Playwright | **Puppeteer primary**, MCP supplementary |
| Test Enforcement | Optional | **MUST run Puppeteer tests** |
| Database Testing | Not specified | **Database-driven testing v3.0** |
| Verdicts | BLOCK / PASS | PASS / PARTIAL / FAIL / BLOCKED / NO_TESTS |

---

### 1.2 WORKFLOW FILES COMPARISON

| File | v1.0.0 | callrelay | Status | Changes |
|------|--------|-----------|--------|---------|
| 01_OVERVIEW.md | ✅ | ✅ | Compare | Minor updates |
| 02_ARCHITECTURE.md | ✅ | ✅ | Compare | Minor updates |
| 03_ROLES.md | ✅ (14 roles) | ✅ (16 roles) | **UPDATE** | +AUDITOR, +TDD_GUIDE, +UI_BROWSER_INSPECTOR, Hook Compliance |
| 04_EXECUTION_ORDER.md | ✅ | ✅ Enhanced | **BACKPORT** | Two-Phase PLANNER, AUDITOR Gate, Documentation Gate |
| 05_FAILURE_PATTERNS.md | ✅ (~89 FPs) | ✅ Extended | **BACKPORT** | +FP-050 to FP-069, +FP-CR-* structure |
| 06_FILE_STRUCTURE.md | ✅ | ✅ | Compare | Minor updates |
| **07_TROUBLESHOOTING.md** | ❌ | ✅ | **ADD** | New troubleshooting database |
| 08_COMMANDS.md | ✅ | ✅ | Compare | New commands for AUDITOR, TDD_GUIDE |
| 09_ENFORCEMENT.md | ✅ | ✅ | Compare | File output enforcement |
| 10_ERROR_TRACEABILITY.md | ✅ | ✅ | Compare | Minor updates |
| **11_HOOKS.md** | ❌ | ✅ | **ADD** | PHP quality hooks (PHPStan, phpcs) |
| README.md | ✅ | ✅ Enhanced | **UPDATE** | v2.0 features summary |

**Gap Summary**: +2 new files (07, 11), 4 major updates

---

### 1.3 RUNTIME GUARDS COMPARISON

| Guard | v1.0.0 | callrelay | Status | Purpose |
|-------|--------|-----------|--------|---------|
| workflow-guard.md | ✅ | ✅ | Compare | Pre-execution validation |
| origin-layer-heuristics.md | ✅ | ✅ | Compare | Error classification |
| doc-guard.md | ✅ | ✅ | Compare | Documentation governance |
| changelog-generator.md | ✅ | ✅ | Compare | Changelog format |
| prompt-builder.md | ✅ | ✅ | Compare | Prompt assembly |
| ui-version-resolver.md | ✅ | ✅ | Compare | UI version injection |
| **file-output-enforcer.md** | ❌ | ✅ | **ADD** | Output enforcement mechanism |
| **hooks-system.md** | ❌ | ✅ | **ADD** | PHP quality hooks system |

**Gap Summary**: +2 new runtime guards

---

### 1.4 CURSOR RULES (NEW ENFORCEMENT LAYER)

v1.0.0 has **NO** `.cursor/rules/*.mdc` enforcement layer.
callrelay has **8** enforcement files:

| File | Purpose | Priority | Backport Status |
|------|---------|----------|-----------------|
| 00-workflow-enforcement.mdc | Core workflow rules | CRITICAL | **TEMPLATE** |
| 01-blocking-conditions.mdc | BLOCK/STOP conditions | CRITICAL | **TEMPLATE** |
| 02-pre-commit-checklist.mdc | Commit requirements | HIGH | **TEMPLATE** |
| 03-failure-patterns-critical.mdc | Critical FPs quick reference | HIGH | **TEMPLATE** |
| 04-role-boundaries.mdc | Role permissions matrix | HIGH | **TEMPLATE** |
| 05-callrelay-context.mdc | Project-specific context | PROJECT | `{project}-context.mdc.template` |
| 06-ui-browser-validator-enforcement.mdc | E2E testing rules | HIGH | **TEMPLATE** |
| 07-gcloud-project-verification.mdc | GCP safety checks | PROJECT | SKIP (optional adapter) |

**Backport**: 6 as templates, 1 as template pattern, 1 skip

---

### 1.5 FAILURE PATTERNS COMPARISON

#### v1.0.0 Categories (89 patterns)

| Category | FP Range | Count |
|----------|----------|-------|
| STATE & SNAPSHOT | FP-001 to FP-003 | 3 |
| DEPLOYMENT | FP-004 to FP-008 | 5 |
| DATA QUALITY | FP-009 to FP-014 | 6 |
| PERFORMANCE | FP-015 to FP-020 | 6 |
| CLOUD RUN JOBS | FP-021 to FP-028 | 8 |
| SECURITY | FP-029 to FP-032 | 4 |
| UI & VISUAL | FP-033 to FP-038 | 6 |
| DATA SEMANTIC | FP-039 to FP-041 | 3 |
| UI RUNTIME | FP-042 to FP-047 | 6 |
| CI/CD | FP-048 to FP-051 | 4 |
| GCP CONFIG | FP-052 to FP-057 | 6 |
| LIBRARY MISUSE | FP-060 to FP-061 | 2 |
| TYPE SAFETY | FP-058, FP-059, FP-066 | 3 |
| DB TEMPORAL | FP-065 to FP-067 | 3 |
| DB SYNC | FP-068 to FP-073 | 6 |
| JOB EXECUTION | FP-JOB-* | 5 |
| Additional | FP-074+ | 19+ |

#### callrelay NEW Patterns (to backport)

| Category | FP Range | Count | Detection Role |
|----------|----------|-------|----------------|
| **DATA SEMANTIC** | FP-050 to FP-056 | 7 | DATA_SEMANTIC_VALIDATOR |
| **PROCESS/WORKFLOW** | FP-057 to FP-069 | 13 | AUDITOR, VALIDATOR, TDD_GUIDE |
| **PROJECT-SPECIFIC** | FP-CR-001 to FP-CR-012 | 12 | TEMPLATE pattern |

##### New Data Semantic Patterns (FP-050 to FP-056)

| FP-ID | Pattern | Detection | Prevention |
|-------|---------|-----------|------------|
| FP-050 | Misleading Metric Label | DATA_SEMANTIC | Tooltip with exact calculation |
| FP-051 | Undefined Success Criteria | DATA_SEMANTIC | Explicit status list |
| FP-052 | Sample Size Without Warning | DATA_SEMANTIC | Show ⚠️ when n < 30 |
| FP-053 | Data Source Ambiguity | DATA_SEMANTIC | Specify table.column |
| FP-054 | API Structure Undocumented | TDD_GUIDE | JSON example per endpoint |
| FP-055 | Task File Incomplete Generation | AUDITOR | Verify count: planned = generated |
| FP-056 | Implementation Status Drift | VALIDATOR | Immediate status update |

##### New Process Patterns (FP-057 to FP-069)

| FP-ID | Pattern | Detection | Prevention |
|-------|---------|-----------|------------|
| FP-057 | Service Interface Not Verified | AUDITOR | SERVICE INTERFACE VERIFICATION section |
| FP-058 | Graceful Degradation Missing | DATA_SEMANTIC | GRACEFUL DEGRADATION section |
| FP-059 | External API Fallback Missing | DATA_SEMANTIC | EXTERNAL API FALLBACK section |
| FP-060 | ASCII Mockup Not Mapped | AUDITOR | ASCII MOCKUP COVERAGE table |
| FP-061 | Long Prompt Partial Read | PLANNER | LONG PROMPT VERIFICATION |
| FP-062 | Third-Party Library Config | VALIDATOR | Library config in plan |
| FP-063 | Missing Runtime Verification | VALIDATOR | E2E test requirement |
| FP-064 | Plan References Non-Existent Field | AUDITOR | Verify entity before referencing |
| FP-065 | Rate Limit Not Implemented | VALIDATOR | Require implementation task |
| FP-066 | Migration Column Unused | AUDITOR | MIGRATION COLUMN USAGE MAP |
| FP-067 | Inherited Issue Undocumented | AUDITOR | PREDECESSOR FEATURE ANALYSIS |
| FP-068 | TASK_INDEX Status Mismatch | VALIDATOR | Immediate status updates |
| FP-069 | Documentation Task Incomplete | VALIDATOR | Block until docs complete |

---

### 1.6 WORKFLOW DEFINITIONS (NEW LAYER)

v1.0.0 has `adapters/task-magic/` with 2 files (plans.mdc, tasks.mdc).
callrelay has `.ai/workflows/` with 9 executable workflow definitions:

| File | Purpose | Status |
|------|---------|--------|
| PLANNER.workflow.md | Two-Phase workflow | **ADD** |
| AUDITOR.workflow.md | Quality Gate workflow | **ADD** |
| IMPLEMENTER.workflow.md | Implementation workflow | **ADD** |
| VALIDATOR_FIXATOR.workflow.md | Validation chain | **ADD** |
| UI_BROWSER_INSPECTOR.workflow.md | E2E test generation | **ADD** |
| DATA_SEMANTIC_VALIDATOR.workflow.md | Semantic checks | **ADD** |
| SMOKE_TESTER.workflow.md | Smoke test workflow | **ADD** |
| documentation/CODE_DOCUMENTATOR.workflow.md | Tech docs | **ADD** |
| documentation/DOC_GUARD.workflow.md | Doc governance | **ADD** |

**Gap Summary**: NEW layer with 9 files

---

### 1.7 MODULAR ROLES STRUCTURE

v1.0.0 has `core/roles/` with 3 flat files.
callrelay has `.ai/roles/` with 16 modular folders:

| Folder | Files | Purpose |
|--------|-------|---------|
| AUDITOR/ | README.md, OUTPUT_RULES.md | Quality Gate role |
| CODE_DOCUMENTATOR/ | README.md, SAFEGUARDS.md | Tech docs role |
| DATA_SEMANTIC_VALIDATOR/ | README.md, OUTPUT_RULES.md | Semantic validation |
| DOC_GUARD/ | README.md | Doc governance |
| FIXATOR/ | README.md | Issue remediation |
| IMPLEMENTER/ | README.md | Code execution |
| PLANNER/ | README.md, OUTPUT_RULES.md | Feature planning |
| TDD_GUIDE/ | README.md, OUTPUT_RULES.md | RED phase testing |
| UI_BROWSER_INSPECTOR/ | README.md, OUTPUT_RULES.md | E2E test generation |
| UI_BROWSER_VALIDATOR/ | README.md, OUTPUT_RULES.md | Runtime validation |
| VALIDATOR/ | README.md | First-pass validation |

**Pattern Files**:
- `README.md` — Role overview (all roles)
- `OUTPUT_RULES.md` — File output enforcement (roles that create files)
- `SAFEGUARDS.md` — Anti-churn rules (CODE_DOCUMENTATOR)

---

## PHASE 2: GENERALIZATION ANALYSIS

### 2.1 PROJECT-SPECIFIC (Needs Templating)

| Element | callrelay-specific | Template Variable |
|---------|-------------------|-------------------|
| PHPStan commands | `vendor/bin/phpstan` | `{{LINTER_COMMAND}}` |
| PHPUnit commands | `vendor/bin/phpunit` | `{{TEST_COMMAND}}` |
| Docker Compose | `docker compose exec api` | `{{CONTAINER_RUNTIME}}` |
| Cloud Run | GCP-specific | `{{CLOUD_PLATFORM}}` |
| PostgreSQL | Database type | `{{DATABASE}}` |
| Telnyx/VAPI | Telephony providers | REMOVE (project-specific) |
| FP-CR-* patterns | CallRelay-specific | Template structure |

### 2.2 FRAMEWORK-GENERIC (Backport As-Is)

| Element | Description |
|---------|-------------|
| Two-Phase PLANNER | User approval gate before task generation |
| AUDITOR role concept | Quality gate with audit dimensions |
| TDD_GUIDE role concept | RED phase test creation |
| UI_BROWSER_INSPECTOR | E2E test generation workflow |
| Error traceability enhancements | ORIGIN_LAYER refinements |
| File output enforcement | Mandatory file saves |
| Cursor rules structure | MDC enforcement layer |
| Workflow definitions structure | Executable workflow specs |
| Modular roles structure | Folder-per-role with README/OUTPUT_RULES |
| FP-050 to FP-069 | Process failure patterns |

### 2.3 NEW CONFIGURATION SCHEMA (v2.0)

```yaml
# governance.config.yaml.template — v2.0 additions

governance:
  # v2.0 PLANNER enhancements
  planner:
    two_phase: true                    # NEW
    approval_gate: true                # NEW
    prohibitions_count: 35             # NEW
  
  # v2.0 AUDITOR configuration
  auditor:
    enabled: true                      # NEW
    audit_dimensions: 15               # NEW
    blocking_checks:
      - api_schema
      - metric_definitions
      - task_count
      - entity_fields
      - ascii_mockup_coverage
  
  # v2.0 TDD configuration
  tdd:
    enabled: false                     # NEW — optional by default
    framework: "{{TEST_FRAMEWORK}}"    # phpunit, jest, pytest, etc.
    scope:
      - "tests/**/*"
  
  # v2.0 Documentation Gate
  documentation_gate:
    enabled: true                      # NEW
    blocking: true                     # NEW

# v2.0 Hooks configuration
hooks:
  enabled: false                       # NEW — opt-in
  linter: "{{LINTER}}"                 # phpstan, eslint, ruff, etc.
  linter_command: "{{LINTER_COMMAND}}"
  test_runner: "{{TEST_RUNNER}}"
  test_command: "{{TEST_COMMAND}}"
  
# v2.0 Cursor rules enforcement
enforcement:
  cursor_rules:
    workflow_enforcement: true         # NEW
    blocking_conditions: true          # NEW
    pre_commit_checklist: true         # NEW
    role_boundaries: true              # NEW
    failure_patterns_critical: true    # NEW

# v2.0 Workflow definitions
workflows:
  executable_definitions: true         # NEW
  
# v2.0 Modular roles
roles:
  modular_structure: true              # NEW
  output_rules: true                   # NEW
  safeguards: ["CODE_DOCUMENTATOR"]    # NEW
```

---

## SUMMARY: Items to Backport

### New Roles (3)
1. AUDITOR
2. TDD_GUIDE
3. UI_BROWSER_INSPECTOR

### Enhanced Roles (4)
1. PLANNER — Two-Phase workflow
2. IMPLEMENTER — TDD CHECK, immediate TASK_INDEX
3. VALIDATOR — Documentation Gate
4. UI_BROWSER_VALIDATOR — Puppeteer enforcement

### New Workflow Files (2)
1. 07_TROUBLESHOOTING.md
2. 11_HOOKS.md

### New Runtime Guards (2)
1. file-output-enforcer.md
2. hooks-system.md

### New Layers (3)
1. `.cursor/rules/` — 6 template files
2. `core/workflows/` — 9 workflow definitions
3. `core/roles/` — modular folder structure

### New Failure Patterns (20)
- FP-050 to FP-056 (7 Data Semantic)
- FP-057 to FP-069 (13 Process)

### Configuration Schema Updates
- Extended governance.config.yaml.template

---

## Next Steps

Upon approval, PLANNER will proceed to **PHASE 2: Task Generation** to create individual task files for implementing these backports.

---

**Document Version**: 1.0.0  
**Created**: 2026-01-31  
**Author**: PLANNER (AI Workflow)
