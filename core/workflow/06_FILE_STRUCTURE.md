<!--
AI Project Governance Framework

Author & Contact: https://x.com/God_FatherAI
License: MIT (see LICENSE file in project root)
-->

# AI Workflow System - File Structure

> File locations, outputs, and directory conventions.

---

## Prompt Templates

```
.ai/prompts/_templates/
├── VALIDATOR_PROMPT_TEMPLATE.md
├── FIXATOR_PROMPT_TEMPLATE.md
├── RE_VALIDATOR_PROMPT_TEMPLATE.md
├── PLANNER_PROMPT_TEMPLATE.md
├── IMPLEMENTER_PROMPT_TEMPLATE.md
├── UI_INSPECTOR_PROMPT_TEMPLATE.md
├── DATA_SEMANTIC_VALIDATOR_PROMPT_TEMPLATE.md
├── UI_BROWSER_VALIDATOR_PROMPT_TEMPLATE.md
├── CODE_DOCUMENTATOR_PROMPT_TEMPLATE.md
├── JOB_OBSERVER_WORKFLOW_PROMPT_TEMPLATE.md
├── EMERGENCY_ERROR_PROMPT_TEMPLATE.md
└── USER_DOCUMENTATOR/
    ├── CREATE.template.md
    ├── UPDATE.template.md
    └── AUDIT.template.md
```

---

## Validation Outputs

```
.ai/_PLANS_VALIDATIONS/
├── {FEATURE_CODE}/
│   ├── VALIDATION_*.md
│   ├── UI_INSPECTION_YYYY-MM-DD.md
│   ├── DATA_SEMANTIC_VALIDATION_YYYY-MM-DD.md
│   ├── UI_BROWSER_VALIDATION_YYYY-MM-DD.md
│   ├── FIXATOR_REPORT_YYYY-MM-DD.md
│   └── RE_VALIDATION_YYYY-MM-DD.md
```

**CRITICAL**: FEATURE_CODE naming rule:
- Use SHORT prefix (e.g., `ADMIN_114`)
- NOT full plan name (e.g., NOT `ADMIN_114_ACCOUNT_SNAPSHOTS_MONITORING`)

---

## Feature Plans

**CATEGORY-BASED STRUCTURE**:

```
.ai/plans/features/
├── ADMIN/                    # Category subfolder
│   ├── ADMIN_001_FEATURE_NAME.md
│   └── ...
├── FINOPS/
│   └── FINOPS_001_*.md
├── JOB/
├── COPIER_INTEL/
├── PROXY_MODULE/
├── INFRA/
├── USER/
├── HTTP/
├── PERF/
├── DEVOPS/
└── _uncategorized/           # Legacy plans
```

**Resolution Algorithm**: Recursive scan of `features/**/*.md` matching `basename.startsWith("<FEATURE_PREFIX>_")`

---

## Task Files

**CATEGORY-BASED STRUCTURE**:

```
.ai/tasks/
├── ADMIN/                    # Category folder
│   ├── ADMIN_001/            # Feature folder
│   │   ├── task00101_*.md    # Task files
│   │   └── task00102_*.md
│   └── ...
├── FINOPS/
│   └── FINOPS_001/
├── JOB/
├── COPIER_INTEL/
├── PROXY_MODULE/
├── INFRA/
├── USER/
├── HTTP/
├── PERF/
├── DEVOPS/
├── _archive/                 # Completed features
└── _uncategorized/           # Legacy tasks without feature code
```

---

## ADR Location

```
.ai/ADR/
└── {feature-name}-adr.md
```

---

## Changelogs

```
.ai/CHANGELOGS/
├── YYYY-MM-DD.md           # Full snapshot
└── YYYY-MM-DD.snapshot.md  # Condensed snapshot
```

---

## Workflow Documentation

```
.ai/_WORKFLOW/
├── README.md               # Quick start
├── 01_OVERVIEW.md          # Overview & principles
├── 02_ARCHITECTURE.md      # Diagrams & flow
├── 03_ROLES.md             # Role definitions
├── 04_EXECUTION_ORDER.md   # Execution sequences
├── 05_FAILURE_PATTERNS.md  # FP summary
├── 06_FILE_STRUCTURE.md    # This file
├── 07_TROUBLESHOOTING.md   # Known issues
├── 08_COMMANDS.md          # Command reference
├── 09_ENFORCEMENT.md       # Compliance rules
├── 10_ERROR_TRACEABILITY.md # Error origin system
└── CHANGELOG.md            # Version history
```

---

## Technical Documentation

```
docs/
├── JOBS/
│   ├── {job-name}/
│   │   ├── README.md
│   │   ├── 01_OVERVIEW.md
│   │   ├── 03_CONFIGURATION.md
│   │   ├── 07_TROUBLESHOOTING.md
│   │   └── CHEAT_SHEET.md
│   ├── _TROUBLESHOOTING_RULES.md   # Binding rules for JOB_OBSERVER
│   └── TROUBLESHOOTING_SYSTEM.md   # How rules are extracted
├── AI_SYSTEM_FAILURE_PATTERNS.md   # All 89 FPs
└── AI_PLANNER_GUARDRAILS.md        # Planning rules
```

---

## User Documentation

```
docs/_DASHBOARD_USER_GUIDE/
├── DASHBOARD_USER_GUIDE.md
└── ... (other guides)
```

---

## Runtime Files

```
.ai/runtime/
├── ui-version-resolver.md       # UI version resolution algorithm
├── workflow-guard.md            # Pre-execution validation
├── origin-layer-heuristics.md   # ORIGIN_LAYER auto-detection
├── changelog-generator.md       # Auto-changelog generation
├── doc-guard.md                 # Documentation governance guard
├── job-preflight-guard.md       # Code-derived job verification
├── image-digest-verifier.md     # Container image validation
└── planner-job-extension.md     # Enterprise job planning
```

---

## Compliance Tracking

```
.ai/COMPLIANCE/
├── COMPLIANCE_STATUS.md   # Current compliance state
└── COMPLIANCE_METRICS.md  # Historical metrics
```

---

## Feature Dependencies

```
.ai/DEPENDENCIES/
├── FEATURE_DEPENDENCY_GRAPH.md  # Cross-feature dependencies
└── IMPACT_ANALYSIS.md           # Cascade impact analysis
```

---

## Decisions

```
.ai/DECISIONS/
├── README.md             # Decision tracking overview
├── FEATURE_INDEX.md      # All feature plans index
├── TASK_INDEX.md         # Task statistics
├── CHANGELOG_INDEX.md    # Changelog entries index
└── SNAPSHOT_INDEX.md     # System state snapshots
```

---

**Prev**: [05_FAILURE_PATTERNS.md](05_FAILURE_PATTERNS.md)  
**Next**: [08_COMMANDS.md](08_COMMANDS.md)
