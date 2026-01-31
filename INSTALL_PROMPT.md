<!--
AI Project Governance Framework

Author & Contact: https://x.com/God_FatherAI
License: MIT (see LICENSE file in project root)
-->

# 🤖 INSTALLATION PROMPT — Deploy AI Project Governance Framework

**Purpose**: Paste this prompt into an AI agent (Claude Opus 4.5, GPT-4, etc.) in Cursor IDE to automatically deploy the governance framework to your project.

---

## Prompt Start

```markdown
# Task: Deploy AI Project Governance Framework

## CONTEXT

You need to deploy the AI governance framework from repository:
https://github.com/netadsmedia/ai-project-governance.git

The framework provides:
- 16 specialized AI roles (PLANNER, AUDITOR, IMPLEMENTER, VALIDATOR, etc.)
- Guards and workflows controlling AI work quality
- Task Magic system for task management
- .cursorrules and AGENTS.md rules
- Two-Phase PLANNER with approval gate
- Quality Gate (AUDITOR) before implementation

## YOUR TASK

### Step 1: Clone the framework to a temporary directory

```bash
git clone https://github.com/netadsmedia/ai-project-governance.git /tmp/governance
```

### Step 2: Read the bootstrap documentation

Read `/tmp/governance/bootstrap/BOOTSTRAP_FLOW.md` and `/tmp/governance/README.md` 
to understand what the framework installs.

### Step 3: Create configuration file

In MY PROJECT (not in /tmp/governance!) create file `governance.config.yaml`:

```yaml
# governance.config.yaml
project_name: "MY_PROJECT_NAME"              # e.g., "my-saas-app"
project_display_name: "Display Name"         # e.g., "My SaaS Application"
tech_stack: "TypeScript + React + Node.js"   # adjust to your stack
```

### Step 4: Run installation

⚠️ IMPORTANT: If my project ALREADY HAS `.cursorrules` or `AGENTS.md`, use the `--migrate` flag:

```bash
# From MY PROJECT directory:
cd /path/to/my/project

# Option A: New project (no existing governance files)
/tmp/governance/bootstrap/scripts/init.sh --config=./governance.config.yaml

# Option B: Existing project (HAS .cursorrules or AGENTS.md)
/tmp/governance/bootstrap/scripts/init.sh --migrate --config=./governance.config.yaml
```

### Step 5: Verify installation

```bash
/tmp/governance/bootstrap/scripts/validate.sh
```

### Step 6: If you used --migrate

Check the `.governance-backup-*` directory and merge your existing rules:

1. Open the old `.cursorrules` from backup
2. Add your custom sections at the END of the new `.cursorrules`
3. Same with `AGENTS.md` if you had custom sections

### Step 7: Commit

```bash
git add -A
git commit -m "feat: add AI Project Governance framework"
git push
```

## WHAT YOU SHOULD SEE AFTER INSTALLATION

```
my-project/
├── .ai/
│   ├── _WORKFLOW/          # Workflow system
│   ├── runtime/            # Runtime guards
│   ├── roles/              # Role definitions (16 folders)
│   ├── workflows/          # Workflow definitions
│   ├── prompts/            # Prompt templates
│   ├── CHANGELOGS/         # Changelogs
│   └── TASKS.md            # Task list
├── .cursor/
│   └── rules/
│       └── .task-magic/    # Task Magic rules
├── .cursorrules            # Rules for Cursor
├── AGENTS.md               # Instructions for AI agents
└── governance.config.yaml  # Your configuration
```

## LICENSE

✅ The framework is available under the **MIT License**.

- Author: God_FatherAI
- Contact: https://x.com/God_FatherAI
- Free to use with attribution

## AFTER INSTALLATION

When finished:

1. Show me the list of installed files
2. Confirm that `validate.sh` passed
3. Show contents of `.cursorrules` (first 50 lines)
4. Tell me which `@workflow` commands are now available
```

## Prompt End

---

## 📝 Short Version (for experienced developers)

```markdown
# Deploy AI Governance

1. `git clone https://github.com/netadsmedia/ai-project-governance.git /tmp/governance`
2. Read: `/tmp/governance/README.md`
3. Create `governance.config.yaml` in YOUR project
4. From project directory: `/tmp/governance/bootstrap/scripts/init.sh --migrate --config=./governance.config.yaml`
5. Merge backup if you had .cursorrules
6. `git add -A && git commit -m "feat: add AI governance" && git push`

Repo: https://github.com/netadsmedia/ai-project-governance.git
License: MIT — contact: https://x.com/God_FatherAI
```

---

## ✅ Checklist before handing to developer

- [ ] Developer has access to repo (if private — add as collaborator)
- [ ] Developer knows which project name to enter in `governance.config.yaml`
- [ ] Developer knows the project tech stack
- [ ] Developer knows if project ALREADY HAS `.cursorrules` (then use `--migrate`)

---

**Copyright (c) 2026 God_FatherAI. Licensed under MIT.**
