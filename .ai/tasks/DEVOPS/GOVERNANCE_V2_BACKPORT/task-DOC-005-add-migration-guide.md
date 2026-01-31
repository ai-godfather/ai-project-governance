# Task: DOC-005 — Add MIGRATION_V1_TO_V2.md Guide

> **Feature**: DEVOPS_007 (Governance V2.0 Backport)  
> **Category**: DOCUMENTATION  
> **Priority**: P0 (Critical)  
> **Status**: pending

---

## Description

Create migration guide for v1.0 → v2.0 upgrade.

---

## Output Requirements

### Files to Create

1. `docs/guides/MIGRATION_V1_TO_V2.md`

### Content Requirements

```markdown
# Migration Guide: v1.0 → v2.0

## Overview

This guide covers upgrading from AI Project Governance v1.0.0 to v2.0.0.

## What's New in v2.0

| Feature | v1.0 | v2.0 |
|---------|------|------|
| Roles | 14 | 16 (+AUDITOR, +TDD_GUIDE) |
| PLANNER | Single phase | Two-Phase |
| Quality Gate | None | AUDITOR |
| Cursor Rules | None | 7 MDC files |
| Workflow Definitions | 2 | 9 |
| Role Structure | 3 flat files | 16 folders |

## Prerequisites

- Existing v1.0 installation
- Backup of current `.ai/` directory

## Migration Steps

### 1. Backup

### 2. Run Upgrade Script

### 3. Verify New Structure

### 4. Update Custom Rules

### 5. Validate

## Breaking Changes

| Change | Impact | Action |
|--------|--------|--------|
| Role paths | References broken | Update imports |
| PLANNER workflow | Tasks not auto-generated | Wait for approval |
| ... | ... | ... |

## Rollback

If issues occur, restore from backup:

## FAQ
```

---

## Acceptance Criteria

- [ ] What's New summary
- [ ] Step-by-step migration
- [ ] Breaking changes listed
- [ ] Rollback instructions
- [ ] FAQ section
