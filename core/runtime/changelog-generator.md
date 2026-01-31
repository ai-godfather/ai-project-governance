<!--
AI Project Governance Framework

Author & Contact: https://x.com/God_FatherAI
License: MIT (see LICENSE file in project root)
-->

# Changelog Generator — Automated Entry Creation

> **Version**: 1.0.0  
> **Status**: AUTOMATION ACTIVE  
> **Trigger**: After git push or significant work completion

---

## Purpose

Automatically generate changelog skeleton entries from:
1. Git commit history
2. Files modified
3. Feature codes detected

This reduces manual effort and ensures consistent changelog format.

---

## Algorithm

```
1. GET latest commits since last changelog update
2. PARSE commit messages (Conventional Commits format)
3. EXTRACT feature codes from commits/files
4. GROUP by feature
5. GENERATE structured entry
6. APPEND to daily snapshot
```

---

## Git Parsing Rules

### Conventional Commit Format

```
<type>(<scope>): <description>

[optional body]

[optional footer]
```

### Type Mapping

| Type | Category | Changelog Section |
|------|----------|-------------------|
| `feat` | Feature | New Features |
| `fix` | Bug Fix | Bug Fixes |
| `docs` | Documentation | Documentation |
| `refactor` | Refactor | Code Changes |
| `perf` | Performance | Performance |
| `test` | Testing | Testing |
| `chore` | Maintenance | Maintenance |
| `build` | Build | Infrastructure |
| `ci` | CI/CD | Infrastructure |

### Feature Code Extraction

```python
def extract_feature_code(commit_message, changed_files):
    # Pattern 1: From commit message
    # "feat(ADMIN_001): Add alerts panel"
    match = re.search(r'\(([A-Z]+_\d+)\)', commit_message)
    if match:
        return match.group(1)
    
    # Pattern 2: From file paths
    for file in changed_files:
        match = re.search(r'(ADMIN_\d+|FEATURE_\d+)', file)
        if match:
            return match.group(1)
    
    # Pattern 3: From task file references
    task_match = re.search(r'task(\d{5})', commit_message)
    if task_match:
        task_id = task_match.group(1)
        return f"TASK_{task_id[:3]}"
    
    return "GENERAL"
```

---

## Output Format

### Git Activity Summary

```markdown
## [AUTO-GENERATED] Git Activity Summary

**Period**: YYYY-MM-DD HH:MM to YYYY-MM-DD HH:MM
**Commits**: N
**Files Changed**: M

### Commits by Type

| Type | Count |
|------|-------|
| feat | 3 |
| fix | 2 |
| docs | 1 |

### Commits by Feature

| Feature | Commits | Description |
|---------|---------|-------------|
| ADMIN_001 | 2 | Feature implementation |
| ADMIN_002 | 1 | Bug fix |
| GENERAL | 1 | Dependency update |

### Detailed Commits

| Commit | Type | Scope | Description |
|--------|------|-------|-------------|
| abc1234 | feat | ADMIN_001 | Add feature panel |
| def5678 | fix | ADMIN_001 | Fix null handling |
| ghi9012 | docs | WORKFLOW | Update enforcement rules |

### Files Changed Summary

**By Category**:
- Frontend: 8 files
- Backend: 3 files
- Documentation: 5 files
- Configuration: 2 files

**Notable Changes**:
- NEW: `admin/src/components/FeaturePanel.tsx`
- MODIFIED: `server/routers.ts` (+150 lines)
- DELETED: None
```

---

## Generation Commands

### Manual Trigger

```bash
# Generate changelog from last 24 hours
pnpm tsx scripts/generate-changelog.mts --since="24 hours ago"

# Generate changelog from specific commit
pnpm tsx scripts/generate-changelog.mts --since=abc1234

# Generate and append to today's snapshot
pnpm tsx scripts/generate-changelog.mts --append
```

### Git Commands Used

```bash
# Get commits since last changelog
git log --oneline --since="$(date -d 'yesterday' +%Y-%m-%d)" --format="%h|%s|%an|%ai"

# Get files changed in commits
git diff --name-status <from-commit>..<to-commit>

# Get commit details
git show --stat --format="%H|%s|%b" <commit>
```

---

## Integration with after_each_chat.mdc

Add to `.cursor/rules/after_each_chat.mdc`:

```markdown
## AUTO-CHANGELOG GENERATION

After detecting `git push` in chat:

1. Parse git log for new commits
2. Generate structured summary
3. Append to `.ai/CHANGELOGS/YYYY-MM-DD.snapshot.md`
```

---

## Merge with Manual Entries

When both auto-generated and manual entries exist:

```markdown
## [MANUAL] ADMIN_001 Feature Implementation

**Status**: ✅ COMPLETE
**Type**: Feature Implementation
...detailed manual entry...

---

## [AUTO-GENERATED] Git Activity Summary (15:30 UTC)

| Commit | Type | Scope | Description |
...auto-generated summary...
```

**Rules**:
- Manual entries come FIRST (more detail)
- Auto-generated entries are SUPPLEMENTARY
- Auto-generated provides commit-level traceability
- Manual provides context and status

---

## Validation

Auto-generated entry MUST include:
- [ ] Timestamp of generation
- [ ] Period covered (from-to)
- [ ] Commit count
- [ ] Files changed count
- [ ] Feature code mapping
- [ ] Type categorization

---

**Canonical Reference**: This file  
**Related**: `.cursor/rules/after_each_chat.mdc`
