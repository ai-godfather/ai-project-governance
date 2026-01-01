<!--
AI Project Governance Framework

Author: Piotr Kwiatkowski
Contact: peetero@proton.me

License: PROPRIETARY — ALL RIGHTS RESERVED
This is a legal notice, not an instruction or workflow rule.
-->

# AI Project Governance — Repository Structure

**Version**: 1.0.0  
**Updated**: 2026-01-01

---

## Directory Layout

```
ai-project-governance/
│
├── README.md                           # Main documentation (contract)
├── REPO_STRUCTURE.md                   # This file
├── governance.config.yaml.template     # Configuration template
├── LICENSE.txt                         # Proprietary License — All Rights Reserved
│
├── analysis/                           # Extraction analysis (read-only)
│   ├── INVENTORY.md                    # Full file inventory
│   ├── CLASSIFICATION.md               # File classification
│   └── UNIFICATION_REPORT.md           # Generalization decisions
│
├── core/                               # Universal governance (copy as-is)
│   │
│   ├── workflow/                       # Workflow system
│   │   ├── README.md                   # Quick start
│   │   ├── 01_OVERVIEW.md              # System overview
│   │   ├── 02_ARCHITECTURE.md          # Role hierarchy
│   │   ├── 03_ROLES.md                 # All 14 roles
│   │   ├── 04_EXECUTION_ORDER.md       # Workflow sequences
│   │   ├── 05_FAILURE_PATTERNS.md      # Core failure patterns
│   │   ├── 06_FILE_STRUCTURE.md        # File locations
│   │   ├── 08_COMMANDS.md              # Command reference
│   │   ├── 09_ENFORCEMENT.md           # Compliance rules
│   │   └── 10_ERROR_TRACEABILITY.md    # Error origin system
│   │
│   ├── runtime/                        # Runtime guards
│   │   ├── workflow-guard.md           # Pre-execution validation
│   │   ├── origin-layer-heuristics.md  # Error classification
│   │   ├── doc-guard.md                # Documentation governance
│   │   ├── changelog-generator.md      # Changelog automation
│   │   ├── prompt-builder.md           # Prompt assembly
│   │   └── ui-version-resolver.md      # UI version injection
│   │
│   ├── roles/                          # Role definitions
│   │   ├── CODE_DOCUMENTATOR.md        # Technical docs role
│   │   ├── CODE_DOCUMENTATOR_SAFEGUARDS.md
│   │   └── USER_DOCUMENTATOR.md        # User docs role
│   │
│   ├── compliance/                     # Compliance tracking
│   │   ├── COMPLIANCE_STATUS.template.md
│   │   └── COMPLIANCE_METRICS.template.md
│   │
│   ├── dependencies/                   # Dependency tracking
│   │   ├── FEATURE_DEPENDENCY_GRAPH.template.md
│   │   └── IMPACT_ANALYSIS.template.md
│   │
│   └── decisions/                      # Decision tracking
│       ├── README.template.md
│       ├── FEATURE_INDEX.template.md
│       ├── TASK_INDEX.template.md
│       ├── CHANGELOG_INDEX.template.md
│       └── SNAPSHOT_INDEX.template.md
│
├── adapters/                           # Project-specific templates
│   │
│   ├── cursorrules/                    # .cursorrules templates
│   │   ├── base.cursorrules            # Core rules (universal)
│   │   ├── typescript-express.cursorrules
│   │   ├── typescript-nextjs.cursorrules
│   │   ├── python-fastapi.cursorrules
│   │   └── README.md                   # Customization guide
│   │
│   ├── agents/                         # AGENTS.md templates
│   │   ├── base.AGENTS.md              # Core agent definitions
│   │   ├── typescript.AGENTS.md        # TypeScript-specific
│   │   ├── python.AGENTS.md            # Python-specific
│   │   └── README.md                   # Customization guide
│   │
│   └── task-magic/                     # Task magic templates
│       ├── tasks.mdc                   # Task rules
│       ├── plans.mdc                   # Plan rules
│       └── README.md                   # Configuration guide
│
├── bootstrap/                          # Project initialization
│   │
│   ├── templates/                      # Directory templates
│   │   ├── .ai/                        # AI directory structure
│   │   │   ├── _WORKFLOW/
│   │   │   ├── runtime/
│   │   │   ├── workflows/
│   │   │   ├── roles/
│   │   │   ├── prompts/
│   │   │   ├── plans/
│   │   │   ├── tasks/
│   │   │   ├── ADR/
│   │   │   ├── CHANGELOGS/
│   │   │   ├── COMPLIANCE/
│   │   │   ├── DECISIONS/
│   │   │   ├── DEPENDENCIES/
│   │   │   ├── _PLANS_VALIDATIONS/
│   │   │   └── TASKS.md
│   │   │
│   │   ├── docs-FINAL/                 # Navigation layer
│   │   │   ├── README.template.md
│   │   │   ├── INDEX.template.md
│   │   │   ├── DEBUGGING/
│   │   │   │   └── WHERE_TO_LOOK.template.md
│   │   │   └── INTENTIONALLY_UNDOCUMENTED.template.md
│   │   │
│   │   ├── docs/                       # Documentation root
│   │   │   ├── AI_PLANNER_GUARDRAILS.md
│   │   │   ├── AI_SYSTEM_FAILURE_PATTERNS.template.md
│   │   │   ├── DANGEROUS_OPERATIONS/
│   │   │   ├── MAPPINGS/
│   │   │   └── BACKEND/
│   │   │
│   │   └── .cursor/
│   │       └── rules/
│   │           ├── after_each_chat.mdc
│   │           └── .task-magic/
│   │
│   ├── scripts/                        # Bootstrap scripts
│   │   ├── init.sh                     # Main initialization
│   │   ├── init.ps1                    # PowerShell version
│   │   ├── validate.sh                 # Validate installation
│   │   └── upgrade.sh                  # Upgrade governance
│   │
│   └── BOOTSTRAP_FLOW.md               # Initialization guide
│
├── prompts/                            # Prompt templates
│   │
│   ├── roles/                          # Role-specific prompts
│   │   ├── VALIDATOR_PROMPT_TEMPLATE.md
│   │   ├── FIXATOR_PROMPT_TEMPLATE.md
│   │   ├── RE_VALIDATOR_PROMPT_TEMPLATE.md
│   │   ├── PLANNER_PROMPT_TEMPLATE.md
│   │   ├── IMPLEMENTER_PROMPT_TEMPLATE.md
│   │   ├── UI_INSPECTOR_PROMPT_TEMPLATE.md
│   │   ├── DATA_SEMANTIC_VALIDATOR_PROMPT_TEMPLATE.md
│   │   ├── UI_BROWSER_VALIDATOR_PROMPT_TEMPLATE.md
│   │   ├── EMERGENCY_ERROR_PROMPT_TEMPLATE.md
│   │   ├── CODE_DOCUMENTATOR_PROMPT_TEMPLATE.md
│   │   └── JOB_OBSERVER_PROMPT_TEMPLATE.md
│   │
│   ├── documentation/                  # Documentation prompts
│   │   ├── CREATE.template.md
│   │   ├── UPDATE.template.md
│   │   └── AUDIT.template.md
│   │
│   └── init/                           # Bootstrap prompts
│       ├── CODE_AUDITOR.md
│       ├── DOC_ANALYST.md
│       └── PLANNER_DOCUMENTATION_REBUILD.md
│
├── docs/                               # Framework documentation
│   │
│   ├── guides/                         # User guides
│   │   ├── QUICK_START.md              # Getting started
│   │   ├── INSTALLATION.md             # Full installation
│   │   ├── CONFIGURATION.md            # Configuration options
│   │   ├── CUSTOMIZATION.md            # Extending the framework
│   │   ├── ROLES.md                    # Role reference
│   │   ├── WORKFLOWS.md                # Workflow reference
│   │   └── TROUBLESHOOTING.md          # Common issues
│   │
│   └── examples/                       # Example configurations
│       ├── minimal.md                  # Minimal setup
│       ├── standard.md                 # Standard setup
│       └── enterprise.md               # Full enterprise setup
│
└── examples/                           # Complete project examples
    │
    ├── typescript-express/             # Express.js example
    │   ├── governance.config.yaml
    │   ├── .cursorrules
    │   ├── AGENTS.md
    │   └── .ai/                        # Pre-populated
    │
    └── python-fastapi/                 # FastAPI example
        ├── governance.config.yaml
        ├── .cursorrules
        ├── AGENTS.md
        └── .ai/                        # Pre-populated
```

---

## Directory Purposes

### `/core/` — Universal Governance

Files that work identically across all projects.

- **Copy directly** to target project's `.ai/` directory
- **Do not modify** — these are immutable governance contracts
- Updates come from upgrading the governance version

### `/adapters/` — Project Adapters

Template files that need project-specific configuration.

- **Select appropriate template** for your tech stack
- **Customize placeholders** (`{{PROJECT_NAME}}`, etc.)
- **Extend with project-specific** rules

### `/bootstrap/` — Initialization

Scripts and templates for setting up new projects.

- **Run once** when adopting governance
- Creates directory structure
- Populates initial templates
- Validates installation

### `/prompts/` — Role Prompts

Standardized prompts for each workflow role.

- **Used by workflows** to generate consistent outputs
- **Customize variables** for project context
- **Do not modify structure** — only fill placeholders

### `/docs/` — Framework Documentation

Guides for using the governance framework.

- **Read first** before installation
- Reference during customization
- Troubleshooting guides

### `/examples/` — Working Examples

Complete project setups for reference.

- **Copy and adapt** for your project
- Shows proper configuration
- Demonstrates best practices

---

## File Naming Conventions

| Pattern | Usage |
|---------|-------|
| `*.md` | Markdown documentation |
| `*.mdc` | MDC workflow files (Cursor-specific) |
| `*.template.md` | Templates with placeholders |
| `*.cursorrules` | Cursor rules files |
| `*.AGENTS.md` | Agent definition files |
| `*.yaml` | Configuration files |

---

## Placeholder Variables

Used in template files:

| Variable | Description | Example |
|----------|-------------|---------|
| `{{PROJECT_NAME}}` | Project identifier | `my-project` |
| `{{PROJECT_DISPLAY_NAME}}` | Human name | `My Project` |
| `{{TECH_STACK}}` | Technology description | `TypeScript + Express` |
| `{{DATABASE}}` | Database type | `PostgreSQL` |
| `{{CLOUD_PROVIDER}}` | Cloud platform | `GCP` |
| `{{JOB_SYSTEM}}` | Job execution | `Cloud Run Jobs` |

---

## Installation Targets

When installed, files go to:

| Source | Target |
|--------|--------|
| `core/workflow/*` | `.ai/_WORKFLOW/` |
| `core/runtime/*` | `.ai/runtime/` |
| `core/roles/*` | `.ai/roles/` |
| `core/compliance/*` | `.ai/COMPLIANCE/` |
| `core/decisions/*` | `.ai/DECISIONS/` |
| `core/dependencies/*` | `.ai/DEPENDENCIES/` |
| `adapters/cursorrules/*` | `.cursorrules` |
| `adapters/agents/*` | `AGENTS.md` |
| `adapters/task-magic/*` | `.cursor/rules/.task-magic/` |
| `bootstrap/templates/.ai/*` | `.ai/` |
| `bootstrap/templates/docs-FINAL/*` | `docs-FINAL/` |
| `bootstrap/templates/docs/*` | `docs/` |
| `prompts/*` | `.ai/prompts/_templates/` |

---

**End of Repository Structure**
