<!--
AI Project Governance Framework

Author & Contact: https://x.com/God_FatherAI
License: MIT (see LICENSE file in project root)
-->

# Quick Start Guide

Get AI Project Governance running in your project in 5 minutes.

---

## Prerequisites

- Git repository initialized
- Bash shell (macOS, Linux, or WSL)
- Cursor IDE (recommended) or VS Code

---

## Installation

### Option 1: Clone and Init (Recommended)

```bash
# Clone the governance framework
git clone https://github.com/your-org/ai-project-governance.git /tmp/governance

# Navigate to your project
cd /path/to/your/project

# Run init script
/tmp/governance/bootstrap/scripts/init.sh

# Clean up
rm -rf /tmp/governance
```

### Option 2: Manual Copy

```bash
# Copy core files to your project
cp -r governance/core/* .ai/
cp governance/adapters/agents/base.AGENTS.md AGENTS.md
cp governance/adapters/cursorrules/typescript-express.cursorrules .cursorrules
```

---

## Post-Installation

### 1. Replace Placeholders

Edit `.cursorrules` and `AGENTS.md` to replace:

| Placeholder | Replace With |
|-------------|--------------|
| `{{PROJECT_NAME}}` | Your project name |
| `{{TECH_STACK}}` | Your tech stack |

Or use a config file:

```bash
./init.sh --config=governance.config.yaml
```

### 2. Validate Installation

```bash
# From governance clone location
/tmp/governance/bootstrap/scripts/validate.sh
```

### 3. Commit

```bash
git add .ai/ .cursor/ .cursorrules AGENTS.md docs/
git commit -m "chore: initialize AI project governance"
```

---

## First Feature

Create your first feature plan:

```
@workflow PLANNER
```

Then implement it:

```
@workflow IMPLEMENTER FEATURE_001
```

---

## Key Concepts

### Roles

| Role | Purpose |
|------|---------|
| PLANNER | Create feature plans |
| IMPLEMENTER | Execute plans |
| VALIDATOR | First-pass validation |
| FIXATOR | Fix reported issues |

### Source of Truth

```
CODE > SNAPSHOT > DOCUMENTATION > FEATURE PLANS
```

### Failure Patterns

89 documented failure patterns help prevent common mistakes.
See `core/workflow/05_FAILURE_PATTERNS.md`.

---

## Next Steps

1. Read `docs/AI_PLANNER_GUARDRAILS.md`
2. Explore `core/workflow/` for workflow documentation
3. Check `adapters/` for stack-specific templates

---

## Getting Help

- Check [TROUBLESHOOTING.md](TROUBLESHOOTING.md) guide
- Review failure patterns in `core/workflow/05_FAILURE_PATTERNS.md`
- See [WORKFLOWS.md](WORKFLOWS.md) for command reference
- Open an issue on GitHub
