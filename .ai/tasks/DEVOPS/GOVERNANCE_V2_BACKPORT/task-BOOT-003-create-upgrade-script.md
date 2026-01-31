# Task: BOOT-003 — Create upgrade.sh v1→v2

> **Feature**: DEVOPS_007 (Governance V2.0 Backport)  
> **Category**: BOOTSTRAP  
> **Priority**: P0 (Critical)  
> **Status**: pending

---

## Description

Create upgrade script for migrating v1.0 projects to v2.0.

---

## Output Requirements

### Files to Create/Modify

1. `bootstrap/scripts/upgrade.sh`

### Script Content

```bash
#!/bin/bash
# Upgrade AI Project Governance from v1.0 to v2.0

# Usage: upgrade.sh --from=v1.0.0 --to=v2.0.0

# 1. Backup current governance
backup_dir=".governance-backup-$(date +%Y%m%d-%H%M%S)"
mkdir -p "$backup_dir"
cp -r .ai "$backup_dir/"
cp -r .cursor "$backup_dir/" 2>/dev/null || true

# 2. Add new directories
mkdir -p .cursor/rules
mkdir -p .ai/workflows/documentation
mkdir -p .ai/roles/{AUDITOR,TDD_GUIDE,UI_BROWSER_INSPECTOR}

# 3. Copy new files (from framework source)
# ... cursor rules
# ... workflow definitions
# ... new role folders

# 4. Migrate existing roles to modular structure
# CODE_DOCUMENTATOR.md → CODE_DOCUMENTATOR/README.md

# 5. Update workflow files
# 03_ROLES.md, 04_EXECUTION_ORDER.md, 05_FAILURE_PATTERNS.md

# 6. Preserve customizations
# Merge user's custom rules

# 7. Validate upgrade
./validate.sh --strict

echo "Upgrade complete. Review changes in $backup_dir"
```

---

## Acceptance Criteria

- [ ] Backup step
- [ ] New directories created
- [ ] New files copied
- [ ] Existing content migrated
- [ ] Customizations preserved
- [ ] Validation at end
