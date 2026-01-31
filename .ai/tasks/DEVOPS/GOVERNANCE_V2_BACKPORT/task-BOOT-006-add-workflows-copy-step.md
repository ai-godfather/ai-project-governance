# Task: BOOT-006 — Add Workflows Copy Step to Bootstrap

> **Feature**: DEVOPS_007 (Governance V2.0 Backport)  
> **Category**: BOOTSTRAP  
> **Priority**: P0 (Critical)  
> **Status**: pending

---

## Description

Ensure init.sh properly copies workflow definitions.

---

## Output Requirements

### Files to Modify

1. `bootstrap/scripts/init.sh`

### Specific Implementation

```bash
# ============================================================
# STEP: Install Workflow Definitions
# ============================================================
echo "Installing workflow definitions..."

mkdir -p "$TARGET/.ai/workflows/documentation"

# Copy workflow files
cp "$FRAMEWORK/core/workflows/"*.md "$TARGET/.ai/workflows/"
cp "$FRAMEWORK/core/workflows/documentation/"*.md \
   "$TARGET/.ai/workflows/documentation/"

echo "✅ Workflow definitions installed"
```

---

## Acceptance Criteria

- [ ] All workflow files copied
- [ ] Documentation subfolder created
- [ ] Success message

---

## Dependencies

- WDEF tasks: Workflow definitions exist
