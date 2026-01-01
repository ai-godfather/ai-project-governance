# Adapters — Project-Specific Templates

Adapters are template files that need customization for your specific project
and technology stack.

---

## Directory Structure

```
adapters/
├── cursorrules/              # .cursorrules templates
│   ├── base.cursorrules      # Universal base (start here)
│   ├── typescript-express.cursorrules
│   ├── typescript-nextjs.cursorrules
│   └── python-fastapi.cursorrules
│
├── agents/                   # AGENTS.md templates
│   ├── base.AGENTS.md        # Universal base
│   ├── typescript.AGENTS.md
│   └── python.AGENTS.md
│
└── task-magic/               # Task management rules
    ├── tasks.mdc
    └── plans.mdc
```

---

## Choosing an Adapter

### Step 1: Identify Your Stack

| Stack | .cursorrules | AGENTS.md |
|-------|--------------|-----------|
| TypeScript + Express | `typescript-express.cursorrules` | `typescript.AGENTS.md` |
| TypeScript + Next.js | `typescript-nextjs.cursorrules` | `typescript.AGENTS.md` |
| Python + FastAPI | `python-fastapi.cursorrules` | `python.AGENTS.md` |
| Other | `base.cursorrules` | `base.AGENTS.md` |

### Step 2: Copy and Customize

```bash
# Example for TypeScript + Express
cp adapters/cursorrules/typescript-express.cursorrules your-project/.cursorrules
cp adapters/agents/typescript.AGENTS.md your-project/AGENTS.md

# Replace placeholders
sed -i 's/{{PROJECT_NAME}}/my-project/g' your-project/.cursorrules
sed -i 's/{{PROJECT_NAME}}/my-project/g' your-project/AGENTS.md
```

---

## Placeholders

All templates use `{{PLACEHOLDER}}` syntax. Replace these with your values:

| Placeholder | Description | Example |
|-------------|-------------|---------|
| `{{PROJECT_NAME}}` | Lowercase project ID | `my-project` |
| `{{PROJECT_DISPLAY_NAME}}` | Human-readable name | `My Project` |
| `{{TECH_STACK}}` | Technology description | `TypeScript + Express + PostgreSQL` |
| `{{DATABASE}}` | Database type | `PostgreSQL` |
| `{{CLOUD_PROVIDER}}` | Cloud platform | `GCP` |
| `{{JOB_SYSTEM}}` | Job execution system | `Cloud Run Jobs` |
| `{{JOBS_PATH}}` | Job scripts location | `scripts/JOBS/` |

---

## Customization Guide

### .cursorrules Customization

The `.cursorrules` file has these sections:

| Section | Customizable? | Notes |
|---------|---------------|-------|
| SUPREME PRINCIPLES | ❌ Immutable | Core governance |
| BACKEND RULES | ✅ Extend | Add framework-specific rules |
| FRONTEND RULES | ✅ Extend | Add framework-specific rules |
| PROJECT-SPECIFIC | ✅ Full control | Your custom rules |
| FAILURE PATTERNS | ✅ Add new | Keep core, add project FPs |

**Adding project-specific rules**:

```
# ==============================================================================
# [PROJECT-SPECIFIC RULES]
# ==============================================================================

# Add your custom rules here

# [YOUR FRAMEWORK RULES]
- Rule 1
- Rule 2

# [YOUR INFRASTRUCTURE RULES]
- Database-specific rules
- Cloud-specific rules
```

### AGENTS.md Customization

| Section | Customizable? | Notes |
|---------|---------------|-------|
| Quick Start | ✅ Update paths | Project-specific paths |
| Key Rules | ✅ Extend | Add project rules |
| Workflow | ❌ Keep | Standard workflow |
| Roles | ❌ Keep | Standard roles |
| References | ✅ Update | Project docs paths |
| Tech Stack | ✅ Update | Your technologies |

---

## Creating New Adapters

To create an adapter for a new tech stack:

1. **Start with base**:
   ```bash
   cp base.cursorrules my-stack.cursorrules
   ```

2. **Add stack-specific sections**:
   ```
   # [FRAMEWORK-SPECIFIC RULES]
   - Framework rule 1
   - Framework rule 2
   ```

3. **Test with a project**:
   - Initialize a test project
   - Run workflows
   - Validate behavior

4. **Submit PR** (if contributing back)

---

## Task Magic Configuration

The `task-magic/` templates define task and plan management:

### tasks.mdc

Configurable elements:
- Task types: `["frontend", "backend", "database", "devops", "docs"]`
- ID format: `task{NNNNN}_{slug}.md`
- Category prefixes
- Archive paths

### plans.mdc

Configurable elements:
- Feature categories
- Required plan sections
- ADR triggers
- Migration checklist

---

## Validation

After customization, validate your adapters:

```bash
# Check for remaining placeholders
grep -r "{{" .cursorrules AGENTS.md

# Should return no matches
```

---

**Version**: 1.0.0
