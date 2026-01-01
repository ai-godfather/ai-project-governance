<!--
AI Project Governance Framework

Author: Piotr Kwiatkowski
Contact: peetero@proton.me

License: PROPRIETARY — ALL RIGHTS RESERVED
This is a legal notice, not an instruction or workflow rule.
-->

# AI Project Governance — Bootstrap Flow

**Version**: 1.0.0  
**Updated**: 2026-01-01  
**Purpose**: Initialize AI governance from ZERO using code as truth

---

## Overview

The bootstrap flow enables any project to adopt the AI governance framework
from scratch, using the actual codebase as the source of truth.

```
┌─────────────────────────────────────────────────────────────┐
│                    BOOTSTRAP FLOW                           │
├─────────────────────────────────────────────────────────────┤
│                                                             │
│  1. ASSESS        Analyze existing project structure        │
│       ↓                                                     │
│  2. CONFIGURE     Create governance.config.yaml             │
│       ↓                                                     │
│  3. SCAFFOLD      Create directory structure                │
│       ↓                                                     │
│  4. POPULATE      Copy core governance files                │
│       ↓                                                     │
│  5. ADAPT         Customize for project tech stack          │
│       ↓                                                     │
│  6. DOCUMENT      Generate initial documentation            │
│       ↓                                                     │
│  7. VALIDATE      Verify installation                       │
│                                                             │
└─────────────────────────────────────────────────────────────┘
```

---

## Prerequisites

Before bootstrapping, ensure you have:

- [ ] Git repository initialized
- [ ] Project with some existing code
- [ ] Understanding of your tech stack
- [ ] Cursor IDE (for MDC workflow support)

---

## Phase 1: ASSESS

### Goal
Understand the existing project structure to configure governance correctly.

### Actions

1. **Identify project type**:
   ```bash
   # Check for package.json (Node.js)
   ls package.json
   
   # Check for requirements.txt (Python)
   ls requirements.txt
   
   # Check for go.mod (Go)
   ls go.mod
   ```

2. **Identify existing patterns**:
   ```bash
   # Find existing documentation
   find . -name "*.md" -type f | head -20
   
   # Find existing tests
   find . -name "*test*" -o -name "*spec*" | head -20
   
   # Find job/script files
   find . -name "*.mts" -o -name "*.py" | head -20
   ```

3. **Check for existing AI artifacts**:
   ```bash
   # Check if .ai/ exists
   ls -la .ai/ 2>/dev/null
   
   # Check if .cursorrules exists
   ls -la .cursorrules 2>/dev/null
   ```

### Output

Assessment report noting:
- Project language and framework
- Existing documentation structure
- Job/script locations
- Existing AI artifacts (if any)

---

## Phase 2: CONFIGURE

### Goal
Create the governance configuration file.

### Actions

1. **Copy configuration template**:
   ```bash
   cp ai-project-governance/governance.config.yaml.template ./governance.config.yaml
   ```

2. **Edit configuration**:
   ```yaml
   # governance.config.yaml
   
   project:
     name: "my-project"                    # Your project name
     display_name: "My Project"            # Human-readable name
     repo: "github.com/org/my-project"     # Repository URL
     
   paths:
     ai_root: ".ai/"
     docs_root: "docs/"
     docs_final: "docs-FINAL/"
     jobs: "scripts/"                       # Your job scripts location
     cursorrules: ".cursorrules"
     agents: "AGENTS.md"
   
   categories:
     features:
       - ADMIN
       - USER
       - API
       - INFRA
     tasks:
       - frontend
       - backend
       - database
       - devops
       - docs
   
   stack:
     language: "typescript"                 # or python, go, etc.
     framework: "express"                   # or nextjs, fastapi, etc.
     database: "postgresql"                 # or mysql, mongodb, etc.
     orm: "drizzle"                         # or prisma, sqlalchemy, etc.
     cloud: "gcp"                           # or aws, azure, etc.
     jobs: "cloud-run-jobs"                 # or lambda, k8s-jobs, etc.
   
   governance:
     frozen_period_days: 14
     max_tasks_per_turn: 3
     changelog_required: true
     validation_required: true
     
   limits:
     max_memory_mb: 8192
     max_batch_size: 10000
     max_query_rows: 100000
     default_timeout_ms: 30000
   
   documentation:
     immutable_zones: []                    # Add as you identify them
     dangerous_operations: []               # Add dangerous job patterns
   ```

---

## Phase 3: SCAFFOLD

### Goal
Create the directory structure for governance artifacts.

### Actions

Run the scaffold script:

```bash
./ai-project-governance/bootstrap/scripts/init.sh --scaffold-only
```

Or manually create directories:

```bash
# Create .ai/ structure
mkdir -p .ai/{_WORKFLOW,runtime,workflows,roles,prompts/_templates,plans/features,tasks,ADR,CHANGELOGS,COMPLIANCE,DECISIONS,DEPENDENCIES,_PLANS_VALIDATIONS,memory,reports}

# Create docs structure
mkdir -p docs-FINAL/DEBUGGING
mkdir -p docs/{DANGEROUS_OPERATIONS,MAPPINGS,BACKEND}

# Create cursor rules structure
mkdir -p .cursor/rules/.task-magic
```

### Verify Structure

```bash
tree -d .ai/ | head -20
tree -d docs-FINAL/
tree -d .cursor/
```

---

## Phase 4: POPULATE

### Goal
Copy core governance files from the framework.

### Actions

1. **Copy workflow system**:
   ```bash
   cp ai-project-governance/core/workflow/* .ai/_WORKFLOW/
   ```

2. **Copy runtime guards**:
   ```bash
   cp ai-project-governance/core/runtime/* .ai/runtime/
   ```

3. **Copy role definitions**:
   ```bash
   cp ai-project-governance/core/roles/* .ai/roles/
   ```

4. **Copy prompt templates**:
   ```bash
   cp -r ai-project-governance/prompts/* .ai/prompts/_templates/
   ```

5. **Copy compliance templates**:
   ```bash
   cp ai-project-governance/core/compliance/* .ai/COMPLIANCE/
   cp ai-project-governance/core/decisions/* .ai/DECISIONS/
   cp ai-project-governance/core/dependencies/* .ai/DEPENDENCIES/
   ```

6. **Copy guardrails**:
   ```bash
   cp ai-project-governance/bootstrap/templates/docs/AI_PLANNER_GUARDRAILS.md docs/
   cp ai-project-governance/bootstrap/templates/docs/AI_SYSTEM_FAILURE_PATTERNS.template.md docs/AI_SYSTEM_FAILURE_PATTERNS.md
   ```

---

## Phase 5: ADAPT

### Goal
Customize governance files for your project's tech stack.

### Actions

1. **Select and customize .cursorrules**:
   ```bash
   # Choose your stack template
   cp ai-project-governance/adapters/cursorrules/typescript-express.cursorrules .cursorrules
   
   # Or start with base and customize
   cp ai-project-governance/adapters/cursorrules/base.cursorrules .cursorrules
   ```

2. **Replace placeholders**:
   
   **Linux**:
   ```bash
   sed -i 's/{{PROJECT_NAME}}/my-project/g' .cursorrules
   sed -i 's/{{PROJECT_DISPLAY_NAME}}/My Project/g' .cursorrules
   ```
   
   **macOS**:
   ```bash
   sed -i '' 's/{{PROJECT_NAME}}/my-project/g' .cursorrules
   sed -i '' 's/{{PROJECT_DISPLAY_NAME}}/My Project/g' .cursorrules
   ```
   
   **Or use config file (recommended)**:
   ```bash
   /path/to/init.sh --config=./governance.config.yaml
   ```

3. **Select and customize AGENTS.md**:
   ```bash
   cp ai-project-governance/adapters/agents/typescript.AGENTS.md AGENTS.md
   
   # Replace placeholders
   sed -i 's/{{PROJECT_NAME}}/my-project/g' AGENTS.md
   ```

4. **Copy task magic rules**:
   ```bash
   cp ai-project-governance/adapters/task-magic/*.mdc .cursor/rules/.task-magic/
   ```

5. **Customize chat rules**:
   ```bash
   cp ai-project-governance/bootstrap/templates/.cursor/rules/after_each_chat.mdc .cursor/rules/
   ```

---

## Phase 6: DOCUMENT

### Goal
Generate initial documentation from code analysis.

### Actions

1. **Create docs-FINAL navigation**:
   ```bash
   # Copy templates
   cp ai-project-governance/bootstrap/templates/docs-FINAL/*.template.md docs-FINAL/
   
   # Rename and customize
   for f in docs-FINAL/*.template.md; do
     mv "$f" "${f%.template.md}.md"
   done
   ```

2. **Create initial TASKS.md**:
   ```markdown
   # Project Tasks
   
   **Generated**: YYYY-MM-DD
   **Project**: My Project
   
   ---
   
   ## 📋 ACTIVE TASKS
   
   ### High Priority
   
   (No tasks yet - use @workflow PLANNER to create feature plans)
   
   ### Medium Priority
   
   (Empty)
   
   ### Low Priority
   
   (Empty)
   
   ---
   
   ## 📦 COMPLETED TASKS
   
   (None yet)
   ```

3. **Create initial changelog**:
   ```bash
   # Create today's snapshot
   cat > .ai/CHANGELOGS/$(date +%Y-%m-%d).snapshot.md << 'EOF'
   # Changelog Snapshot: YYYY-MM-DD
   
   **Generated**: YYYY-MM-DD
   **System**: My Project
   
   ---
   
   ## AI Governance Bootstrap
   
   **Status**: ✅ COMPLETE
   **Type**: Configuration
   
   ### Summary
   
   Initialized AI project governance framework.
   
   ### Files Created
   
   - `.ai/` directory structure
   - `.cursorrules`
   - `AGENTS.md`
   - `docs-FINAL/` navigation
   - `docs/AI_PLANNER_GUARDRAILS.md`
   
   ---
   EOF
   ```

4. **Run CODE_AUDITOR for initial analysis** (optional):
   ```
   @workflow CODE_DOCUMENTATOR --mode=AUDIT
   ```

---

## Phase 7: VALIDATE

### Goal
Verify the governance installation is correct.

### Actions

1. **Run validation script**:
   ```bash
   ./ai-project-governance/bootstrap/scripts/validate.sh
   ```

2. **Manual validation checklist**:

   ```markdown
   ## Installation Validation Checklist
   
   ### Directory Structure
   - [ ] `.ai/_WORKFLOW/` exists with 10+ files
   - [ ] `.ai/runtime/` exists with 6+ files
   - [ ] `.ai/roles/` exists
   - [ ] `.ai/prompts/_templates/` exists with templates
   - [ ] `.ai/COMPLIANCE/` exists
   - [ ] `.ai/DECISIONS/` exists
   - [ ] `docs-FINAL/` exists with README.md
   - [ ] `docs/` contains AI_PLANNER_GUARDRAILS.md
   
   ### Configuration Files
   - [ ] `.cursorrules` exists and has no {{placeholders}}
   - [ ] `AGENTS.md` exists and has no {{placeholders}}
   - [ ] `governance.config.yaml` exists and is valid
   
   ### Cursor Integration
   - [ ] `.cursor/rules/after_each_chat.mdc` exists
   - [ ] `.cursor/rules/.task-magic/tasks.mdc` exists
   - [ ] `.cursor/rules/.task-magic/plans.mdc` exists
   
   ### Workflow Test
   - [ ] Run `@workflow PLANNER` - should not error
   - [ ] Run `@workflow VALIDATOR` - should request context
   ```

3. **Test a workflow**:
   ```
   @workflow PLANNER
   
   Create a feature plan for: Add health check endpoint
   ```

---

## Quick Bootstrap (One-Liner)

For experienced users:

```bash
# Clone governance, run init, validate
git clone https://github.com/org/ai-project-governance.git /tmp/gov && \
  /tmp/gov/bootstrap/scripts/init.sh --config=./governance.config.yaml && \
  /tmp/gov/bootstrap/scripts/validate.sh
```

---

## Post-Bootstrap Steps

After successful bootstrap:

1. **Commit governance files**:
   ```bash
   git add .ai/ .cursor/ .cursorrules AGENTS.md docs-FINAL/ docs/AI_*.md governance.config.yaml
   git commit -m "chore: bootstrap AI project governance v1.0.0"
   ```

2. **Create first feature plan**:
   ```
   @workflow PLANNER
   ```

3. **Start using workflows**:
   ```
   @workflow IMPLEMENTER FEATURE_001
   @workflow VALIDATOR
   @workflow FIXATOR
   ```

4. **Evolve failure patterns**:
   - Document incidents in `docs/AI_SYSTEM_FAILURE_PATTERNS.md`
   - Add project-specific guardrails to `.cursorrules`

---

## Troubleshooting

### Workflow not recognized

```
Error: Unknown workflow command
```

**Fix**: Ensure `.cursor/rules/.task-magic/` contains MDC files.

### Placeholders not replaced

```
Error: {{PROJECT_NAME}} found in .cursorrules
```

**Fix**: Run placeholder replacement:

**Linux**:
```bash
sed -i 's/{{PROJECT_NAME}}/actual-name/g' .cursorrules
```

**macOS**:
```bash
sed -i '' 's/{{PROJECT_NAME}}/actual-name/g' .cursorrules
```

### Missing templates

```
Error: Template file not found
```

**Fix**: Verify governance framework was cloned correctly.

---

## Upgrading Governance

To upgrade to a newer version:

```bash
./ai-project-governance/bootstrap/scripts/upgrade.sh --from=v1.0.0 --to=v1.1.0
```

This will:
1. Backup current governance files
2. Copy new core files
3. Preserve project-specific customizations
4. Validate the upgrade

---

**End of Bootstrap Flow**
