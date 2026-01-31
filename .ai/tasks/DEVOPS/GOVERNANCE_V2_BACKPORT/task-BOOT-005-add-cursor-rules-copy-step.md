# Task: BOOT-005 — Add Cursor Rules Copy Step to Bootstrap

> **Feature**: DEVOPS_007 (Governance V2.0 Backport)  
> **Category**: BOOTSTRAP  
> **Priority**: P0 (Critical)  
> **Status**: pending

---

## Description

Ensure init.sh properly copies cursor rules with placeholder replacement.

---

## Output Requirements

### Files to Modify

1. `bootstrap/scripts/init.sh`

### Specific Implementation

```bash
# ============================================================
# STEP: Install Cursor Rules
# ============================================================
echo "Installing cursor rules..."

mkdir -p "$TARGET/.cursor/rules"

# Copy MDC files
for file in "$FRAMEWORK/adapters/cursor-rules/"*.mdc; do
  filename=$(basename "$file")
  cp "$file" "$TARGET/.cursor/rules/$filename"
done

# Handle template file
if [ -f "$TARGET/.cursor/rules/05-project-context.mdc.template" ]; then
  mv "$TARGET/.cursor/rules/05-project-context.mdc.template" \
     "$TARGET/.cursor/rules/05-project-context.mdc"
  
  # Replace placeholders
  sed -i "s/{{PROJECT_NAME}}/$PROJECT_NAME/g" \
    "$TARGET/.cursor/rules/05-project-context.mdc"
  sed -i "s/{{TECH_STACK}}/$TECH_STACK/g" \
    "$TARGET/.cursor/rules/05-project-context.mdc"
fi

echo "✅ Cursor rules installed"
```

---

## Acceptance Criteria

- [ ] All MDC files copied
- [ ] Template renamed
- [ ] Placeholders replaced
- [ ] Success message

---

## Dependencies

- CRULE tasks: Cursor rules exist
