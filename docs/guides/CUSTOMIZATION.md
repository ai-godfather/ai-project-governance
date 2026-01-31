<!--
AI Project Governance Framework

Author & Contact: https://x.com/God_FatherAI
License: MIT (see LICENSE file in project root)
-->

# Customization Guide

How to customize AI Project Governance for your specific needs.

---

## Overview

Customization levels:

| Level | What | How |
|-------|------|-----|
| **Placeholders** | Project identity | Replace `{{...}}` |
| **Configuration** | Settings | Edit `governance.config.yaml` |
| **Adapters** | Tech stack | Modify `.cursorrules`, `AGENTS.md` |
| **Extensions** | New features | Add rules, patterns, roles |

---

## Level 1: Placeholder Replacement

### Required Placeholders

| Placeholder | Example | Where |
|-------------|---------|-------|
| `{{PROJECT_NAME}}` | `my-app` | `.cursorrules`, `AGENTS.md`, templates |
| `{{PROJECT_DISPLAY_NAME}}` | `My App` | Documentation |
| `{{TECH_STACK}}` | `TypeScript + Express` | `AGENTS.md` |
| `{{DATE}}` | `2026-01-01` | Templates, changelogs |

### Automated Replacement

Using config file with `init.sh`:

```bash
# Create config
cat > governance.config.yaml << 'EOF'
project:
  name: "my-app"
  display_name: "My Application"
stack:
  language: "typescript"
EOF

# Run init with config
./init.sh --config=governance.config.yaml
```

### Manual Replacement

**macOS:**
```bash
sed -i '' 's/{{PROJECT_NAME}}/my-app/g' .cursorrules AGENTS.md
sed -i '' 's/{{PROJECT_DISPLAY_NAME}}/My Application/g' .cursorrules AGENTS.md
```

**Linux:**
```bash
sed -i 's/{{PROJECT_NAME}}/my-app/g' .cursorrules AGENTS.md
sed -i 's/{{PROJECT_DISPLAY_NAME}}/My Application/g' .cursorrules AGENTS.md
```

---

## Level 2: Adapter Selection

### Available Adapters

| Adapter | Stack | File |
|---------|-------|------|
| Base | Any | `base.cursorrules`, `base.AGENTS.md` |
| TypeScript + Express | Node.js API | `typescript-express.cursorrules` |
| TypeScript | General TS | `typescript.AGENTS.md` |

### Creating Custom Adapters

1. **Start from base**:
   ```bash
   cp adapters/cursorrules/base.cursorrules adapters/cursorrules/python-fastapi.cursorrules
   ```

2. **Add stack-specific rules**:
   ```markdown
   # [PYTHON + FASTAPI RULES]
   
   ## Type Hints
   - All functions MUST have type hints
   - Use Pydantic models for request/response
   
   ## Async
   - Prefer async endpoints
   - Use asyncio for I/O operations
   ```

3. **Register in adapters README**:
   ```markdown
   | Python + FastAPI | `python-fastapi.cursorrules` |
   ```

---

## Level 3: Adding Custom Rules

### Adding to .cursorrules

Add project-specific sections after framework rules:

```markdown
# =============================================================================
# PROJECT-SPECIFIC RULES ({{PROJECT_NAME}})
# =============================================================================

# [AUTHENTICATION]

- All API endpoints MUST require authentication (except /health, /metrics)
- JWT tokens expire after 24 hours
- Refresh tokens expire after 7 days
- FORBIDDEN: Storing passwords in plain text

# [EXTERNAL APIS]

- Third-party API calls MUST use circuit breaker
- Max retry attempts: 3
- Backoff: exponential (1s, 2s, 4s)
- MUST log all external API failures

# [COMPLIANCE]

- PII data MUST be encrypted
- Audit logs MUST be retained for 7 years
- User data exports MUST complete within 30 days
```

### Adding Custom Failure Patterns

Add to `.cursorrules` or create `docs/AI_SYSTEM_FAILURE_PATTERNS.md`:

```markdown
# [PROJECT-SPECIFIC FAILURE PATTERNS]

## FP-100: External API Timeout Not Handled

**Symptom**: Silent failure when external API times out
**Root Cause**: Missing timeout configuration
**Prevention**: 
- MUST set explicit timeout on all HTTP clients
- MUST catch timeout exceptions
- MUST return meaningful error to user

## FP-101: Cache Stampede on Cold Start

**Symptom**: Database overload after cache clear
**Root Cause**: All requests hitting DB simultaneously
**Prevention**:
- Use cache warming on deploy
- Implement request coalescing
- Add jitter to cache TTL
```

---

## Level 4: Role Customization

### Adding Custom Roles

1. **Create role definition** in `.ai/roles/`:

```markdown
# SECURITY_AUDITOR

**Purpose**: Audit code for security vulnerabilities.

| Aspect | Detail |
|--------|--------|
| **Mode** | READ-ONLY |
| **Input** | Code changes, PRs |
| **Output** | Security audit report |
| **Command** | `@workflow SECURITY_AUDITOR` |

**Detects**:
- SQL injection risks
- XSS vulnerabilities
- Hardcoded secrets
- Insecure dependencies

**FP Coverage**: FP-SEC-001 to FP-SEC-020
```

2. **Add to role index** in `core/workflow/03_ROLES.md`

3. **Create prompt template** in `prompts/roles/`:

```markdown
# SECURITY_AUDITOR Prompt Template

## Purpose
Audit code for security vulnerabilities.

## Inputs
- [ ] Code diff or file list
- [ ] Previous audit report (if exists)

## Checklist
- [ ] Check for SQL injection
- [ ] Check for XSS
- [ ] Check for hardcoded secrets
- [ ] Check dependencies for CVEs
```

---

## Level 5: Workflow Customization

### Custom Workflow Sequence

Modify execution order for your needs:

```markdown
# Standard Flow
PLANNER → IMPLEMENTER → VALIDATOR → FIXATOR → RE_VALIDATOR

# Security-Enhanced Flow
PLANNER → SECURITY_AUDITOR → IMPLEMENTER → VALIDATOR → SECURITY_AUDITOR → FIXATOR → RE_VALIDATOR

# Documentation-Heavy Flow
PLANNER → IMPLEMENTER → DOC_GUARD → CODE_DOCUMENTATOR → VALIDATOR → FIXATOR
```

### Custom Guards

Add project-specific guards in `.ai/runtime/`:

```markdown
# project-specific-guard.md

## API Contract Guard

Before any API change:
1. Check OpenAPI spec exists
2. Verify backward compatibility
3. Check version bump if breaking

## Block Conditions
- Breaking change without major version bump
- Missing OpenAPI spec update
- Undocumented endpoint
```

---

## Level 6: Documentation Customization

### Custom Immutable Zones

Define areas that shouldn't be modified by AI:

```yaml
# governance.config.yaml
documentation:
  immutable_zones:
    - "docs/API/"              # API docs
    - "docs/LEGAL/"            # Legal documents
    - "docs/COMPLIANCE/"       # Compliance docs
    - "migrations/"            # DB migrations
```

### Custom Dangerous Operations

Define operations requiring extra documentation:

```yaml
documentation:
  dangerous_operations:
    - "scripts/cleanup-*.sh"
    - "scripts/migrate-*.sh"
    - "scripts/delete-*.sh"
    - "gcloud * delete"
    - "kubectl delete"
```

---

## Best Practices

### 1. Start Minimal

Begin with base adapters, add rules as needed:

```bash
# Week 1: Base only
cp adapters/cursorrules/base.cursorrules .cursorrules

# Week 2: Add first custom rules
echo "# [PROJECT RULES]" >> .cursorrules

# Week 3+: Evolve based on incidents
```

### 2. Document Decisions

When adding custom rules, document why:

```markdown
# [CUSTOM RULE: No ORM for Analytics]

> Added: 2026-01-15
> Reason: ORM generates N+1 queries on large datasets
> Incident: FP-PROJ-001

- Analytics queries MUST use raw SQL
- MUST include EXPLAIN ANALYZE for queries > 10k rows
```

### 3. Version Control Customizations

Tag customization milestones:

```bash
git tag -a "governance-v1.1-custom" -m "Added security audit role"
```

### 4. Review Periodically

Schedule quarterly reviews:
- Remove obsolete rules
- Update failure patterns
- Align with framework updates

---

## Upgrade Considerations

When upgrading the framework:

1. **Protected files** (never overwritten):
   - `.cursorrules` (your customizations)
   - `AGENTS.md` (your customizations)
   - `governance.config.yaml`

2. **Upgraded files** (may be overwritten):
   - `.ai/_WORKFLOW/*`
   - `.ai/runtime/*`
   - `.ai/prompts/_templates/*`

3. **Merge strategy**:
   - Backup before upgrade
   - Review diff after upgrade
   - Re-apply project-specific changes if needed

---

## Next Steps

- [ROLES.md](ROLES.md) — Understand role system
- [WORKFLOWS.md](WORKFLOWS.md) — Master workflows
- [TROUBLESHOOTING.md](TROUBLESHOOTING.md) — Common issues

---

**See also**: [CONFIGURATION.md](CONFIGURATION.md) | [INSTALLATION.md](INSTALLATION.md)
