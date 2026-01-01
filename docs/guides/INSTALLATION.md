<!--
AI Project Governance Framework

Author: Piotr Kwiatkowski
Contact: peetero@proton.me

License: PROPRIETARY — ALL RIGHTS RESERVED
This is a legal notice, not an instruction or workflow rule.
-->

# Installation Guide

Complete installation instructions for AI Project Governance.

---

## Overview

There are three installation methods:

| Method | Best For | Time |
|--------|----------|------|
| **Bootstrap Script** | New projects, automation | 2 min |
| **Manual Copy** | Customized setups | 5-10 min |
| **Selective Install** | Minimal adoption | 5 min |

---

## Prerequisites

### Required

- Git repository (initialized)
- Bash shell (macOS, Linux, or WSL on Windows)
- Text editor (Cursor IDE recommended)

### Recommended

- Cursor IDE (for MDC workflow support)
- Node.js 18+ (for TypeScript projects)

---

## Method 1: Bootstrap Script (Recommended)

### Step 1: Get the Framework

```bash
# Clone the governance framework
git clone https://github.com/your-org/ai-project-governance.git /tmp/governance
```

### Step 2: Navigate to Your Project

```bash
cd /path/to/your/project
```

### Step 3: Run Init Script

```bash
# Basic installation
/tmp/governance/bootstrap/scripts/init.sh

# With configuration file (for automated placeholder replacement)
/tmp/governance/bootstrap/scripts/init.sh --config=./governance.config.yaml

# Force overwrite existing files
/tmp/governance/bootstrap/scripts/init.sh --force

# For CI/CD (no prompts)
/tmp/governance/bootstrap/scripts/init.sh --non-interactive --force
```

### Step 4: Validate

```bash
/tmp/governance/bootstrap/scripts/validate.sh
```

### Step 5: Clean Up

```bash
rm -rf /tmp/governance
```

---

## Method 2: Manual Copy

### Step 1: Create Directory Structure

```bash
# Core AI directories
mkdir -p .ai/{_WORKFLOW,runtime,workflows,roles}
mkdir -p .ai/{prompts/_templates,plans/features,tasks}
mkdir -p .ai/{ADR,CHANGELOGS,COMPLIANCE,DECISIONS,DEPENDENCIES}
mkdir -p .ai/{_PLANS_VALIDATIONS,memory,reports}

# Documentation directories
mkdir -p docs-FINAL/DEBUGGING
mkdir -p docs/{DANGEROUS_OPERATIONS,MAPPINGS,BACKEND,guides}

# Cursor IDE directories
mkdir -p .cursor/rules/.task-magic
```

### Step 2: Copy Core Files

```bash
# From governance framework directory
GOVERNANCE=/path/to/ai-project-governance

# Workflow system
cp $GOVERNANCE/core/workflow/* .ai/_WORKFLOW/

# Runtime guards
cp $GOVERNANCE/core/runtime/* .ai/runtime/

# Role definitions
cp $GOVERNANCE/core/roles/* .ai/roles/

# Templates
cp $GOVERNANCE/core/compliance/* .ai/COMPLIANCE/
cp $GOVERNANCE/core/decisions/* .ai/DECISIONS/
cp $GOVERNANCE/core/dependencies/* .ai/DEPENDENCIES/
```

### Step 3: Copy Adapters

```bash
# Choose your stack
cp $GOVERNANCE/adapters/cursorrules/typescript-express.cursorrules .cursorrules
cp $GOVERNANCE/adapters/agents/typescript.AGENTS.md AGENTS.md

# Task Magic rules
cp $GOVERNANCE/adapters/task-magic/*.mdc .cursor/rules/.task-magic/
```

### Step 4: Copy Prompts

```bash
cp -r $GOVERNANCE/prompts/* .ai/prompts/_templates/
```

### Step 5: Copy Documentation Templates

```bash
cp $GOVERNANCE/bootstrap/templates/docs/AI_PLANNER_GUARDRAILS.md docs/
```

---

## Method 3: Selective Install (Minimal)

For projects that only need core workflow support:

### Essential Files Only

```bash
GOVERNANCE=/path/to/ai-project-governance

# Create minimal structure
mkdir -p .ai/{_WORKFLOW,runtime,plans/features,tasks,CHANGELOGS}

# Core workflow (required)
cp $GOVERNANCE/core/workflow/{01_OVERVIEW,03_ROLES,04_EXECUTION_ORDER,09_ENFORCEMENT}.md .ai/_WORKFLOW/

# Workflow guard (required)
cp $GOVERNANCE/core/runtime/workflow-guard.md .ai/runtime/

# Adapters (required)
cp $GOVERNANCE/adapters/cursorrules/base.cursorrules .cursorrules
cp $GOVERNANCE/adapters/agents/base.AGENTS.md AGENTS.md

# Guardrails (recommended)
cp $GOVERNANCE/bootstrap/templates/docs/AI_PLANNER_GUARDRAILS.md docs/
```

---

## Post-Installation

### 1. Replace Placeholders

Edit `.cursorrules` and `AGENTS.md` to replace:

| Placeholder | Replace With |
|-------------|--------------|
| `{{PROJECT_NAME}}` | Your project name (e.g., `my-app`) |
| `{{PROJECT_DISPLAY_NAME}}` | Human-readable name (e.g., `My App`) |
| `{{TECH_STACK}}` | Your stack (e.g., `TypeScript + Express`) |
| `{{DATE}}` | Current date (e.g., `2026-01-01`) |

**macOS:**
```bash
sed -i '' 's/{{PROJECT_NAME}}/my-app/g' .cursorrules AGENTS.md
```

**Linux:**
```bash
sed -i 's/{{PROJECT_NAME}}/my-app/g' .cursorrules AGENTS.md
```

### 2. Create Initial TASKS.md

```bash
cat > .ai/TASKS.md << 'EOF'
# Project Tasks

**Generated**: $(date +%Y-%m-%d)
**Project**: {{PROJECT_NAME}}

---

## 📋 ACTIVE TASKS

(No tasks yet — use @workflow PLANNER to create feature plans)

---

## 📦 COMPLETED TASKS

(None yet)
EOF
```

### 3. Validate Installation

```bash
# Run validation script
/path/to/governance/bootstrap/scripts/validate.sh

# Or manual check
ls -la .ai/_WORKFLOW/
ls -la .cursorrules
ls -la AGENTS.md
```

### 4. Commit

```bash
git add .ai/ .cursor/ .cursorrules AGENTS.md docs/
git commit -m "chore: initialize AI project governance"
```

---

## Verification Checklist

After installation, verify:

| Check | Command | Expected |
|-------|---------|----------|
| Workflow files | `ls .ai/_WORKFLOW/*.md \| wc -l` | 8+ files |
| Runtime guards | `ls .ai/runtime/*.md \| wc -l` | 6+ files |
| Cursorrules | `cat .cursorrules \| head -5` | No `{{` placeholders |
| AGENTS.md | `cat AGENTS.md \| head -5` | No `{{` placeholders |
| Task Magic | `ls .cursor/rules/.task-magic/` | `tasks.mdc`, `plans.mdc` |

---

## Troubleshooting

### "Permission denied" on scripts

```bash
chmod +x /path/to/governance/bootstrap/scripts/*.sh
```

### Placeholders not replaced

Verify no placeholders remain:
```bash
grep -r "{{" .cursorrules AGENTS.md .ai/TASKS.md
```

### Cursor IDE doesn't recognize workflows

1. Restart Cursor IDE
2. Verify `.cursor/rules/` structure
3. Check Cursor settings for MDC support

---

## Next Steps

1. Read [CONFIGURATION.md](CONFIGURATION.md) for customization options
2. Read [ROLES.md](ROLES.md) to understand AI roles
3. Read [WORKFLOWS.md](WORKFLOWS.md) to learn workflow commands
4. Create your first feature: `@workflow PLANNER`

---

**See also**: [QUICK_START.md](QUICK_START.md) | [TROUBLESHOOTING.md](TROUBLESHOOTING.md)
