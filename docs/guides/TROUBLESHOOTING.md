<!--
AI Project Governance Framework

Author: Piotr Kwiatkowski
Contact: peetero@proton.me

License: PROPRIETARY — ALL RIGHTS RESERVED
This is a legal notice, not an instruction or workflow rule.
-->

# Troubleshooting Guide

Common issues and solutions for AI Project Governance.

---

## Installation Issues

### "Permission denied" on scripts

**Symptom**: Cannot run `init.sh` or `validate.sh`

**Solution**:
```bash
chmod +x /path/to/governance/bootstrap/scripts/*.sh
```

---

### Placeholders not replaced

**Symptom**: `.cursorrules` still contains `{{PROJECT_NAME}}`

**Solution**:

**macOS**:
```bash
sed -i '' 's/{{PROJECT_NAME}}/my-project/g' .cursorrules AGENTS.md
```

**Linux**:
```bash
sed -i 's/{{PROJECT_NAME}}/my-project/g' .cursorrules AGENTS.md
```

**Verify**:
```bash
grep -r "{{" .cursorrules AGENTS.md
# Should return no results
```

---

### validate.sh reports failures

**Symptom**: Validation script fails with missing directories

**Solution**:
```bash
# Check what's missing
./validate.sh --verbose

# Re-run init with force
./init.sh --force
```

---

## Workflow Issues

### "Unknown workflow command"

**Symptom**: `@workflow PLANNER` not recognized

**Possible Causes**:
1. MDC files not installed
2. Cursor IDE not recognizing rules
3. Wrong directory

**Solutions**:

1. Verify MDC files:
```bash
ls -la .cursor/rules/.task-magic/
# Should show: tasks.mdc, plans.mdc
```

2. Restart Cursor IDE

3. Check you're in project root:
```bash
pwd
ls .cursorrules
```

---

### "Feature plan not found"

**Symptom**: `@workflow IMPLEMENTER FEATURE_001` fails

**Possible Causes**:
1. Plan doesn't exist
2. Prefix doesn't match
3. Plan in wrong directory

**Solutions**:

1. Check plan exists:
```bash
ls .ai/plans/features/ | grep -i feature
```

2. Verify prefix matches:
```bash
# Plan filename: FEATURE_001_Add_Settings.md
# Command: @workflow IMPLEMENTER FEATURE_001
# Prefix must match exactly
```

3. Check directory structure:
```bash
# Plans should be in:
.ai/plans/features/FEATURE_001_*.md

# NOT in:
.ai/plans/FEATURE_001_*.md  # Wrong!
```

---

### "Ambiguous feature plan prefix"

**Symptom**: IMPLEMENTER finds multiple matching plans

**Solution**: Use more specific prefix:
```bash
# Multiple matches
ls .ai/plans/features/USER_*
# USER_001_Settings.md
# USER_001_Profile.md  # Problem!

# Fix: Use unique prefixes
# USER_001_Settings.md
# USER_002_Profile.md
```

---

### Guard failures

**Symptom**: Workflow blocked by guard

**Solution**: Read guard message carefully:

```
❌ GUARD FAILURE: workflow-guard
   Reason: VALIDATOR must run before FIXATOR
   Resolution: Run @workflow VALIDATOR first
```

Common guard failures:
- Missing prerequisite workflow
- ADR required but missing
- Changelog not updated

---

## Validation Issues

### VALIDATOR finds no issues but code is broken

**Possible Causes**:
1. VALIDATOR only checks static code
2. Runtime issues need UI_BROWSER_VALIDATOR

**Solution**: Run full validation chain:
```
@workflow VALIDATOR
@workflow UI_INSPECTOR
@workflow DATA_SEMANTIC_VALIDATOR
@workflow UI_BROWSER_VALIDATOR
```

---

### UI_BROWSER_VALIDATOR cannot connect

**Symptom**: Browser validation fails to start

**Possible Causes**:
1. Development server not running
2. Wrong URL
3. Network issues

**Solution**:
```bash
# Start dev server first
pnpm dev

# Then run validation
@workflow UI_BROWSER_VALIDATOR
```

---

### False positives in validation

**Symptom**: Validation reports issues that aren't real problems

**Solution**: 
1. Review each issue carefully
2. If false positive, document in validation report:
```markdown
## Issue #3: FP-037 False Positive

**Reported**: Missing data shown as zero
**Reality**: Zero is valid value for this metric
**Action**: No fix needed, document expected behavior
```

---

## Documentation Issues

### DOC_GUARD blocking work

**Symptom**: DOC_GUARD reports HARD BLOCKER

**Note**: DOC_GUARD only hard-blocks for:
1. New job without `docs/JOBS/`
2. Dangerous op without safety docs

**Solution**: Create required documentation:
```bash
# For new job
mkdir -p docs/JOBS/my-new-job/
echo "# My New Job" > docs/JOBS/my-new-job/README.md

# For dangerous operation  
mkdir -p docs/DANGEROUS_OPERATIONS/my-operation/
echo "# Safety Guide" > docs/DANGEROUS_OPERATIONS/my-operation/README.md
```

---

### CODE_DOCUMENTATOR rewrites too much

**Symptom**: Documentation completely rewritten

**Solution**: Use safeguards:
1. Add path to immutable zones:
```yaml
# governance.config.yaml
documentation:
  immutable_zones:
    - "docs/API/"  # Protect this
```

2. Use UPDATE mode instead of CREATE:
```
@workflow CODE_DOCUMENTATOR --mode=UPDATE module-name
```

---

## Configuration Issues

### Config file not being used

**Symptom**: `--config` flag has no effect

**Solution**: Verify config format:
```yaml
# governance.config.yaml
# Must have these keys:
project:
  name: "my-project"      # Required
  display_name: "My Project"
```

Check YAML syntax:
```bash
# If yq installed
yq eval '.' governance.config.yaml

# Or use online YAML validator
```

---

### Wrong tech stack rules applied

**Symptom**: Rules don't match your stack

**Solution**: Choose correct adapter:
```bash
# For TypeScript + Express
cp adapters/cursorrules/typescript-express.cursorrules .cursorrules

# For base/generic
cp adapters/cursorrules/base.cursorrules .cursorrules

# Then customize as needed
```

---

## Performance Issues

### Workflows running slowly

**Possible Causes**:
1. Large codebase
2. Many files to analyze
3. Complex validation rules

**Solutions**:
1. Use targeted validation:
```
@workflow VALIDATOR --scope=server/services/
```

2. Skip UI validation for backend-only changes:
```
# Backend only - skip UI validators
@workflow VALIDATOR
# Skip: UI_INSPECTOR, UI_BROWSER_VALIDATOR
```

---

### Memory issues during validation

**Symptom**: Validation crashes or hangs

**Solution**: Increase limits or scope down:
```yaml
# governance.config.yaml
limits:
  max_memory_mb: 16384  # Increase if needed
```

---

## Upgrade Issues

### Upgrade script fails

**Symptom**: `upgrade.sh` errors out

**Solution**:
1. Backup first:
```bash
cp -r .ai/ .ai.backup/
```

2. Run with verbose:
```bash
./upgrade.sh --verbose
```

3. Manual upgrade if needed:
```bash
# Copy only core files
cp new-governance/core/workflow/* .ai/_WORKFLOW/
cp new-governance/core/runtime/* .ai/runtime/
```

---

### Lost customizations after upgrade

**Symptom**: Custom rules gone after upgrade

**Prevention**: Protected files should never be overwritten:
- `.cursorrules`
- `AGENTS.md`
- `governance.config.yaml`

**Recovery**:
```bash
# If backed up
cp .ai.backup/.cursorrules .cursorrules

# If in git
git checkout .cursorrules
```

---

## Getting Help

### 1. Check Core Documentation

```bash
# Workflow system
cat .ai/_WORKFLOW/README.md

# Specific role
cat .ai/_WORKFLOW/03_ROLES.md

# Failure patterns
cat .ai/_WORKFLOW/05_FAILURE_PATTERNS.md
```

### 2. Run Diagnostic

```bash
# Validate installation
./validate.sh --verbose

# Check structure
tree -d .ai/ | head -20
```

### 3. Check Logs

If using Task Magic:
```bash
ls .ai/reports/
cat .ai/reports/latest-validation.md
```

### 4. Reset to Clean State

If all else fails:
```bash
# Backup customizations
cp .cursorrules .cursorrules.backup
cp AGENTS.md AGENTS.md.backup

# Remove governance
rm -rf .ai/ .cursor/rules/.task-magic/

# Re-install
./init.sh --force

# Restore customizations
cat .cursorrules.backup >> .cursorrules
```

---

## Common Error Messages

| Error | Cause | Fix |
|-------|-------|-----|
| `HARD FAIL: NO FEATURE PLAN` | Plan missing | Create with PLANNER |
| `AMBIGUOUS PREFIX` | Multiple plan matches | Use unique prefix |
| `GUARD FAILURE` | Prerequisite missing | Run required workflow first |
| `ORIGIN_LAYER: FEATURE_PLAN` | Plan error | Update plan, re-implement |
| `FIXATOR REFUSED` | Wrong error origin | Use PLANNER instead |

---

**See also**: [INSTALLATION.md](INSTALLATION.md) | [CONFIGURATION.md](CONFIGURATION.md)
