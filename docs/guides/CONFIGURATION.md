<!--
AI Project Governance Framework

Author: Piotr Kwiatkowski
Contact: peetero@proton.me

License: PROPRIETARY — ALL RIGHTS RESERVED
This is a legal notice, not an instruction or workflow rule.
-->

# Configuration Guide

How to configure AI Project Governance for your project.

---

## Overview

Configuration is done through:

1. **`governance.config.yaml`** — Project-level settings
2. **`.cursorrules`** — AI behavior rules
3. **`AGENTS.md`** — Agent guidelines

---

## governance.config.yaml

The main configuration file for the governance framework.

### Full Example

```yaml
# =============================================================================
# AI Project Governance Configuration
# =============================================================================

# -----------------------------------------------------------------------------
# Project Identity
# -----------------------------------------------------------------------------
project:
  name: "my-project"                    # Machine-readable name (no spaces)
  display_name: "My Project"            # Human-readable name
  repo: "github.com/org/my-project"     # Repository URL
  version: "1.0.0"                      # Current version

# -----------------------------------------------------------------------------
# Directory Paths
# -----------------------------------------------------------------------------
paths:
  ai_root: ".ai/"                       # AI governance root
  docs_root: "docs/"                    # Documentation root
  docs_final: "docs-FINAL/"             # Navigation tier docs
  jobs: "scripts/JOBS/"                 # Background job scripts
  cursorrules: ".cursorrules"           # Cursor rules file
  agents: "AGENTS.md"                   # Agent guidelines file

# -----------------------------------------------------------------------------
# Feature Categories
# -----------------------------------------------------------------------------
categories:
  features:                             # Feature plan prefixes
    - ADMIN                             # Admin panel features
    - USER                              # User-facing features  
    - API                               # API features
    - INFRA                             # Infrastructure
    - DEVOPS                            # DevOps/CI/CD
  tasks:                                # Task categories
    - frontend
    - backend
    - database
    - devops
    - docs

# -----------------------------------------------------------------------------
# Tech Stack
# -----------------------------------------------------------------------------
stack:
  language: "typescript"                # Primary language
  framework: "express"                  # Web framework
  database: "postgresql"                # Database
  orm: "drizzle"                        # ORM/query builder
  cloud: "gcp"                          # Cloud provider
  jobs: "cloud-run-jobs"                # Job execution platform

# -----------------------------------------------------------------------------
# Governance Rules
# -----------------------------------------------------------------------------
governance:
  frozen_period_days: 14                # ADR decision freeze period
  max_tasks_per_turn: 3                 # Max tasks per agent turn
  changelog_required: true              # Require changelog after commits
  validation_required: true             # Require validation after impl

# -----------------------------------------------------------------------------
# Performance Limits
# -----------------------------------------------------------------------------
limits:
  max_memory_mb: 8192                   # Max memory per job
  max_batch_size: 10000                 # Max batch size
  max_query_rows: 100000                # Max rows per query
  default_timeout_ms: 30000             # Default timeout

# -----------------------------------------------------------------------------
# Documentation
# -----------------------------------------------------------------------------
documentation:
  immutable_zones:                      # Paths not to modify
    - "docs/JOBS/"                      # Extensive job docs
    - "docs/INFRASTRUCTURE/"            # Production-critical
  dangerous_operations:                 # Require safety docs
    - "cleanup-*"
    - "truncate-*"
    - "delete-*"
```

### Minimal Example

```yaml
project:
  name: "my-project"
  display_name: "My Project"

stack:
  language: "typescript"
  framework: "express"

governance:
  frozen_period_days: 14
  max_tasks_per_turn: 3
```

---

## .cursorrules Configuration

The `.cursorrules` file contains the "supreme law" for AI agents.

### Key Sections

| Section | Purpose |
|---------|---------|
| `[ZASADY GLOBALNE]` | Global rules for all code |
| `[BACKEND]` | Backend-specific rules |
| `[FRONTEND]` | Frontend-specific rules |
| `[DATABASE]` | Database rules |
| `[JOBS]` | Background job rules |
| `[WORKFLOW ROLES]` | Role definitions |
| `[FAILURE PATTERNS]` | Known anti-patterns |

### Customization Points

1. **Project-specific rules**: Add after global rules
2. **Tech stack rules**: Customize for your framework
3. **Failure patterns**: Add project-specific FP-XXX
4. **Dangerous operations**: Document risky commands

### Example: Adding Custom Rules

```markdown
# [PROJECT-SPECIFIC RULES]

## API Rate Limits
- External API calls MUST use rate limiter
- Max 100 requests/minute to third-party APIs
- MUST implement exponential backoff

## Data Retention
- User data older than 2 years MUST be archived
- PII MUST be encrypted at rest
- Logs MUST NOT contain sensitive data
```

---

## AGENTS.md Configuration

The `AGENTS.md` file provides quick-reference guidelines for AI agents.

### Sections to Customize

| Section | Customization |
|---------|---------------|
| Quick Start | Project-specific setup |
| Key Rules | Your critical rules |
| Workflow | Your development process |
| Project Structure | Actual directory layout |
| Key Technologies | Your tech stack |
| Important Patterns | Code patterns |
| Key References | Important files |

---

## Environment-Specific Configuration

### Development

```yaml
# governance.config.dev.yaml
governance:
  frozen_period_days: 7          # Shorter freeze for dev
  validation_required: false     # Skip validation in dev

limits:
  max_memory_mb: 4096            # Lower limits for local
```

### Production

```yaml
# governance.config.prod.yaml
governance:
  frozen_period_days: 14         # Full freeze
  validation_required: true      # Always validate
  changelog_required: true       # Always log

limits:
  max_memory_mb: 32768           # Production limits
```

---

## Governance Levels

Configure how strictly to apply governance:

### Level 1: Minimal

```yaml
governance:
  frozen_period_days: 0          # No freeze
  validation_required: false
  changelog_required: false
  max_tasks_per_turn: 10         # More flexibility
```

### Level 2: Standard (Recommended)

```yaml
governance:
  frozen_period_days: 14
  validation_required: true
  changelog_required: true
  max_tasks_per_turn: 3
```

### Level 3: Enterprise

```yaml
governance:
  frozen_period_days: 30         # Longer freeze
  validation_required: true
  changelog_required: true
  max_tasks_per_turn: 1          # One task at a time
  adr_required: true             # Always require ADR
  compliance_tracking: true      # Track compliance
```

---

## Configuration Validation

Validate your configuration:

```bash
# Check config syntax (if yq installed)
yq eval '.' governance.config.yaml

# Check for required fields
grep -E "^project:" governance.config.yaml
grep -E "^  name:" governance.config.yaml
```

---

## Placeholder Reference

| Placeholder | Used In | Description |
|-------------|---------|-------------|
| `{{PROJECT_NAME}}` | All | Machine name |
| `{{PROJECT_DISPLAY_NAME}}` | Docs | Human name |
| `{{TECH_STACK}}` | AGENTS.md | Stack description |
| `{{DATE}}` | Templates | Current date |
| `{{VERSION}}` | Headers | Framework version |

---

## Next Steps

- [CUSTOMIZATION.md](CUSTOMIZATION.md) — Advanced customization
- [ROLES.md](ROLES.md) — Role configuration
- [WORKFLOWS.md](WORKFLOWS.md) — Workflow setup

---

**See also**: [INSTALLATION.md](INSTALLATION.md) | [TROUBLESHOOTING.md](TROUBLESHOOTING.md)
