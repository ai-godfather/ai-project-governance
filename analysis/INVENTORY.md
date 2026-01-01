<!--
AI Project Governance Framework

Author: Piotr Kwiatkowski
Contact: peetero@proton.me

License: PROPRIETARY — ALL RIGHTS RESERVED
This is a legal notice, not an instruction or workflow rule.
-->

# AI Project Governance — Full Inventory

**Generated**: 2026-01-01  
**Source Repository**: hyperxadvisor (superx-copytrade-analyzer)  
**Purpose**: Complete inventory of all files participating in AI governance system

---

## 1. WORKFLOW SYSTEM (`.ai/_WORKFLOW/`)

Core workflow documentation and enforcement rules.

| File | Lines | Purpose |
|------|-------|---------|
| `README.md` | ~150 | Quick start and navigation |
| `01_OVERVIEW.md` | ~200 | System overview & principles |
| `02_ARCHITECTURE.md` | ~300 | Diagrams & data flow |
| `03_ROLES.md` | ~450 | All 14 role definitions |
| `04_EXECUTION_ORDER.md` | ~200 | Workflow sequences |
| `05_FAILURE_PATTERNS.md` | ~400 | 89 FP summary |
| `06_FILE_STRUCTURE.md` | ~150 | File locations & outputs |
| `07_TROUBLESHOOTING.md` | ~200 | Known issues & fixes |
| `08_COMMANDS.md` | ~150 | 16 commands reference |
| `09_ENFORCEMENT.md` | ~300 | Compliance & rules |
| `10_ERROR_TRACEABILITY.md` | ~400 | Error Origin & Routing |
| `CHANGELOG.md` | ~100 | Version history |
| `_WORKFLOW_FINAL_DOC.md` | ~2000 | Consolidated reference (legacy) |

---

## 2. RUNTIME GUARDS (`.ai/runtime/`)

Pre-execution validation and automation specs.

| File | Lines | Purpose |
|------|-------|---------|
| `workflow-guard.md` | ~420 | Pre-execution validation for all roles |
| `origin-layer-heuristics.md` | ~390 | Auto-detection of error origins |
| `job-preflight-guard.md` | ~300 | Job argument validation from code |
| `doc-guard.md` | ~200 | Documentation governance guard |
| `changelog-generator.md` | ~100 | Automated changelog creation |
| `prompt-builder.md` | ~100 | Prompt assembly from templates |
| `ui-version-resolver.md` | ~100 | UI version auto-injection |
| `image-digest-verifier.md` | ~100 | Docker image verification |
| `planner-job-extension.md` | ~200 | Enterprise job planning template |

---

## 3. WORKFLOW DEFINITIONS (`.ai/workflows/`)

MDC workflow contracts and documentation workflows.

| File | Purpose |
|------|---------|
| `FIXATOR_VALIDATOR_WORKFLOW.mdc` | Main validation/fix workflow (~1500 lines) |
| `JOB_OBSERVER_WORKFLOW.mdc` | SRE job operations workflow |
| `documentation/DOC_GUARD.workflow.md` | Documentation guard workflow |
| `documentation/DOCUMENTATION_AUDIT.workflow.md` | Doc audit workflow |
| `documentation/DOCUMENTATION_CREATE.workflow.md` | Doc creation workflow |
| `documentation/DOCUMENTATION_UPDATE.workflow.md` | Doc update workflow |
| `documentation/HELP_INTEGRATE.workflow.md` | Help sidebar integration |

---

## 4. ROLE DEFINITIONS (`.ai/roles/`)

Role-specific configuration and safeguards.

| Path | Purpose |
|------|---------|
| `CODE_DOCUMENTATOR/README.md` | Code documentator role definition |
| `CODE_DOCUMENTATOR/SAFEGUARDS.md` | Anti-churn safeguards |
| `USER_DOCUMENTATOR/README.md` | User documentator role definition |
| `USER_DOCUMENTATOR/HOW_TO_WRITE_DOCS.md` | Documentation writing guide |
| `USER_DOCUMENTATOR/USER_DOCUMENTATOR_AUDIT.md` | Audit mode spec |
| `USER_DOCUMENTATOR/USER_DOCUMENTATOR_CREATE.md` | Create mode spec |
| `USER_DOCUMENTATOR/USER_DOCUMENTATOR_UPDATE.md` | Update mode spec |

---

## 5. PROMPT TEMPLATES (`.ai/prompts/_templates/`)

Standardized prompts for each workflow role.

| File | Purpose |
|------|---------|
| `VALIDATOR_PROMPT_TEMPLATE.md` | First-pass validation prompt |
| `FIXATOR_PROMPT_TEMPLATE.md` | Issue fixing prompt |
| `RE_VALIDATOR_PROMPT_TEMPLATE.md` | Fix verification prompt |
| `PLANNER_PROMPT_TEMPLATE.md` | Feature planning prompt |
| `IMPLEMENTER_PROMPT_TEMPLATE.md` | Implementation execution prompt |
| `UI_INSPECTOR_PROMPT_TEMPLATE.md` | Visual anomaly detection prompt |
| `DATA_SEMANTIC_VALIDATOR_PROMPT_TEMPLATE.md` | Semantic integrity prompt |
| `UI_BROWSER_VALIDATOR_PROMPT_TEMPLATE.md` | Runtime verification prompt |
| `EMERGENCY_ERROR_PROMPT_TEMPLATE.md` | Incident response prompt |
| `CODE_DOCUMENTATOR_PROMPT_TEMPLATE.md` | Technical documentation prompt |
| `JOB_OBSERVER_ROLE_TEMPLATE.md` | SRE operations prompt |
| `JOB_OBSERVER_WORKFLOW_PROMPT_TEMPLATE.md` | Job workflow prompt |
| `PLANNER_JOB_ENTERPRISE_STREAMING_RESILIENCE_V2.md` | Enterprise job template |
| `USER_DOCUMENTATOR/CREATE.template.md` | User doc creation template |
| `USER_DOCUMENTATOR/UPDATE.template.md` | User doc update template |
| `USER_DOCUMENTATOR/AUDIT.template.md` | User doc audit template |
| `_INIT_DOCUMENTATION/PLANNER_DOCUMENTATION_REBUILD_V1.md` | Doc rebuild planner |
| `_INIT_DOCUMENTATION/CODE_AUDITOR.md` | Code audit prompt |
| `_INIT_DOCUMENTATION/DOC_ANALYTYST.md` | Doc analysis prompt |
| `_INIT_DOCUMENTATION/IMPLEMENTER_PROMPT.md` | Init implementation prompt |

---

## 6. CURSOR RULES (`.cursor/rules/`)

IDE-level enforcement and task magic system.

| File | Purpose |
|------|---------|
| `after_each_chat.mdc` | Chat-end summary & changelog enforcement |
| `.task-magic/_index.md` | Task magic index |
| `.task-magic/tasks.mdc` | Task creation & management rules |
| `.task-magic/plans.mdc` | Feature plan creation rules |

---

## 7. PROJECT ROOT CONFIGURATION

Top-level governance files.

| File | Lines | Purpose |
|------|-------|---------|
| `.cursorrules` | ~3000 | SUPREME LAW - all project rules |
| `AGENTS.md` | ~1700 | AI agent guidelines and role definitions |

---

## 8. DOCUMENTATION GOVERNANCE (`docs/`)

AI-specific documentation and guardrails.

| File | Purpose |
|------|---------|
| `docs/AI_PLANNER_GUARDRAILS.md` | 31 prohibitions from 80+ incidents |
| `docs/AI_SYSTEM_FAILURE_PATTERNS.md` | 89 documented failure patterns |
| `docs/JOBS/_TROUBLESHOOTING_RULES.md` | Job troubleshooting binding rules |

---

## 9. NAVIGATION LAYER (`docs-FINAL/`)

Canonical entry points for documentation.

| File | Purpose |
|------|---------|
| `README.md` | Start here + navigation |
| `00_OVERVIEW.md` | System overview |
| `01_ARCHITECTURE.md` | Architecture documentation |
| `02_JOBS.md` | Jobs overview |
| `03_INFRASTRUCTURE.md` | Infrastructure overview |
| `04_ADMIN.md` | Admin panel overview |
| `INDEX.md` | Full navigation index |
| `INTENTIONALLY_UNDOCUMENTED.md` | Explicit undocumented markers |
| `TROUBLESHOOTING_QUICK.md` | Quick troubleshooting reference |
| `DEBUGGING/WHERE_TO_LOOK.md` | AI debugging entry points |

---

## 10. COMPLIANCE & TRACKING (`.ai/COMPLIANCE/`)

Governance metrics and status.

| File | Purpose |
|------|---------|
| `COMPLIANCE_STATUS.md` | Current compliance state |
| `COMPLIANCE_METRICS.md` | Historical metrics |

---

## 11. DECISION TRACKING (`.ai/DECISIONS/`)

Feature and task indexes.

| File | Purpose |
|------|---------|
| `README.md` | Decision history explanation |
| `FEATURE_INDEX.md` | All feature plans indexed |
| `TASK_INDEX.md` | Task statistics by category |
| `CHANGELOG_INDEX.md` | Changes mapped to areas |
| `SNAPSHOT_INDEX.md` | Daily snapshots index |

---

## 12. DEPENDENCY TRACKING (`.ai/DEPENDENCIES/`)

Cross-feature impact analysis.

| File | Purpose |
|------|---------|
| `FEATURE_DEPENDENCY_GRAPH.md` | Feature dependencies |
| `IMPACT_ANALYSIS.md` | Cascade impact analysis |

---

## 13. ARCHITECTURE DECISION RECORDS (`.ai/ADR/`)

Major architectural decisions.

| Pattern | Purpose |
|---------|---------|
| `{feature-name}-adr.md` | ADR for complex features |

---

## 14. CHANGELOGS (`.ai/CHANGELOGS/`)

System state snapshots.

| Pattern | Purpose |
|---------|---------|
| `YYYY-MM-DD.md` | Full daily snapshot |
| `YYYY-MM-DD.snapshot.md` | Condensed snapshot |

---

## 15. VALIDATION ARTIFACTS (`.ai/_PLANS_VALIDATIONS/`)

Validation reports by feature.

| Pattern | Purpose |
|---------|---------|
| `<FEATURE_CODE>/VALIDATION_*.md` | First-pass validation |
| `<FEATURE_CODE>/AUDIT_*.md` | Performance/DB audits |
| `<FEATURE_CODE>/RE_VALIDATION_*.md` | Fix verification |
| `<FEATURE_CODE>/UI_INSPECTION_*.md` | Visual anomaly reports |
| `<FEATURE_CODE>/DATA_SEMANTIC_VALIDATION_*.md` | Semantic integrity reports |
| `<FEATURE_CODE>/UI_BROWSER_VALIDATION_*.md` | Runtime verification reports |
| `<FEATURE_CODE>/DOC_GUARD_REPORT_*.md` | Documentation guard reports |

---

## 16. FEATURE PLANS (`.ai/plans/features/`)

Feature specifications by category.

| Category | Count | Examples |
|----------|-------|----------|
| ADMIN | 20+ | Admin panel features |
| COPIER_INTEL | 5+ | Copier intelligence features |
| DEVOPS | 5+ | DevOps and documentation features |
| FINOPS | 1+ | Financial operations |
| HTTP | 1+ | HTTP tracking features |
| INFRA | 4+ | Infrastructure features |
| JOB | 7+ | Job-related features |
| PROXY_MODULE | 4+ | Proxy system features |
| USER | 2+ | User-facing features |
| PERF | 1+ | Performance features |

---

## 17. TASKS (`.ai/tasks/`)

Task files by category and feature.

| Structure | Purpose |
|-----------|---------|
| `CATEGORY/FEATURE_CODE/task*.md` | Individual tasks |
| `_archive/` | Completed feature tasks |
| `_uncategorized/` | Legacy tasks |

---

## TOTAL INVENTORY SUMMARY

| Category | Files | Description |
|----------|-------|-------------|
| Workflow System | 13 | Core workflow docs |
| Runtime Guards | 9 | Pre-execution validation |
| Workflow Definitions | 7 | MDC workflow contracts |
| Role Definitions | 7 | Role-specific configs |
| Prompt Templates | 20 | Standardized prompts |
| Cursor Rules | 4 | IDE enforcement |
| Root Config | 2 | Supreme rules |
| Doc Governance | 3 | AI guardrails |
| Navigation Layer | 10 | docs-FINAL/ entry points |
| Compliance | 2 | Metrics tracking |
| Decisions | 5 | History indexes |
| Dependencies | 2 | Impact analysis |
| ADRs | Variable | Architecture records |
| Changelogs | Variable | State snapshots |
| Validations | Variable | Report artifacts |
| Plans | 50+ | Feature specs |
| Tasks | 2000+ | Task files |

**Total Core Governance Files**: ~85 files  
**Total Generated Artifacts**: Variable (depends on project activity)

---

**End of Inventory**
