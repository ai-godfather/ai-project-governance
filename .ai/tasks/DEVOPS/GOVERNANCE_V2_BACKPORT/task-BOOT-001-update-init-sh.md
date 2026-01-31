# Task: BOOT-001 — Update init.sh for v2.0

> **Feature**: DEVOPS_007 (Governance V2.0 Backport)  
> **Category**: BOOTSTRAP  
> **Priority**: P0 (Critical)  
> **Status**: pending

---

## Description

Update init.sh bootstrap script to handle new v2.0 files and directories.

---

## Input Requirements

- Read existing: `bootstrap/scripts/init.sh`

---

## Output Requirements

### Files to Modify

1. `bootstrap/scripts/init.sh`

### Changes to Make

1. **Add Cursor Rules Copy**:
   ```bash
   mkdir -p "$TARGET/.cursor/rules"
   cp "$FRAMEWORK/adapters/cursor-rules/"*.mdc "$TARGET/.cursor/rules/"
   ```

2. **Add Workflows Copy**:
   ```bash
   mkdir -p "$TARGET/.ai/workflows/documentation"
   cp "$FRAMEWORK/core/workflows/"*.md "$TARGET/.ai/workflows/"
   cp "$FRAMEWORK/core/workflows/documentation/"*.md "$TARGET/.ai/workflows/documentation/"
   ```

3. **Add Modular Roles Copy**:
   ```bash
   cp -r "$FRAMEWORK/core/roles/"* "$TARGET/.ai/roles/"
   ```

4. **Update Placeholder Replacement** for new files

5. **Add Validation Steps** for new structure

---

## Acceptance Criteria

- [ ] Cursor rules copy step
- [ ] Workflows copy step
- [ ] Modular roles copy step
- [ ] Placeholder replacement for new files
- [ ] Validation steps updated

---

## Dependencies

- All CRULE tasks
- All WDEF tasks
- All MOD tasks
