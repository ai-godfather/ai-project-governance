# Task: CRULE-010 — Update Bootstrap to Copy Cursor Rules

> **Feature**: DEVOPS_007 (Governance V2.0 Backport)  
> **Category**: CURSOR_RULES  
> **Priority**: P0 (Critical)  
> **Status**: pending

---

## Description

Update init.sh bootstrap script to copy cursor rules to target project.

---

## Input Requirements

- Read existing: `bootstrap/scripts/init.sh`

---

## Output Requirements

### Files to Modify

1. `bootstrap/scripts/init.sh`

### Content Requirements

1. **Add Cursor Rules Copy Step**:
   ```bash
   # Copy cursor rules
   mkdir -p "$TARGET/.cursor/rules"
   cp "$FRAMEWORK/adapters/cursor-rules/"*.mdc "$TARGET/.cursor/rules/"
   
   # Rename template
   mv "$TARGET/.cursor/rules/05-project-context.mdc.template" \
      "$TARGET/.cursor/rules/05-project-context.mdc"
   ```

2. **Add Placeholder Replacement** for 05-project-context.mdc:
   - Replace `{{PROJECT_NAME}}`
   - Replace `{{TECH_STACK}}`
   - etc.

3. **Add Validation**: Verify cursor rules copied

---

## Acceptance Criteria

- [ ] Cursor rules copy step added
- [ ] Template renamed
- [ ] Placeholders replaced
- [ ] Validation step

---

## Dependencies

- CRULE-001 to CRULE-008: Cursor rules exist
