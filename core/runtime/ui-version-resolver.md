<!--
CORE GOVERNANCE COMPONENT — PROPRIETARY

Author: Piotr Kwiatkowski
Contact: peetero@proton.me

This file is part of a proprietary governance framework.
NO LICENSE IS GRANTED for use, copying, or modification.
-->

# UI Version Resolver — Specification

> **Version**: 1.0.0  
> **Status**: PRODUCTION

---

## Purpose

Automatically determine the current UI version for documentation workflows.
Ensures documentation is bound to a **verifiable, concrete UI state**.

---

## Resolution Algorithm (Priority Order)

### 🥇 PRIMARY: Git Commit Hash (Preferred)

```bash
git rev-parse --short HEAD
```

**Format**: `git:<short-hash>`  
**Example**: `git:9f3c2a1`

**Conditions**:
- Repository is a git repo
- `.git` directory exists
- `git` command available

---

### 🥈 SECONDARY: Build ID / App Version

Check environment variables:

```
UI_BUILD_ID || APP_VERSION || npm_package_version
```

**Format**: `build:<value>`  
**Example**: `build:dashboard-help-v1`

**Conditions**:
- Git not available OR
- Explicit override via env var

---

### 🥉 LAST RESORT: Timestamp Snapshot

```javascript
new Date().toISOString().slice(0, 19)
```

**Format**: `snapshot:<ISO-timestamp>`  
**Example**: `snapshot:2026-01-01T14:32:00`

**⚠️ WARNING**: Using timestamp MUST emit warning:

```
[WARN] UI version resolved via timestamp fallback. 
       Git commit hash preferred for reproducibility.
```

---

## Resolution Function

```typescript
interface UIVersionResult {
  version: string;
  source: 'git' | 'build' | 'snapshot';
  warning?: string;
}

function resolveUIVersion(): UIVersionResult {
  // 1. Try git
  try {
    const hash = execSync('git rev-parse --short HEAD', { encoding: 'utf8' }).trim();
    if (hash) {
      return { version: `git:${hash}`, source: 'git' };
    }
  } catch {}

  // 2. Try build ID
  const buildId = process.env.UI_BUILD_ID || 
                  process.env.APP_VERSION || 
                  process.env.npm_package_version;
  if (buildId) {
    return { version: `build:${buildId}`, source: 'build' };
  }

  // 3. Fallback to timestamp
  const timestamp = new Date().toISOString().slice(0, 19);
  return {
    version: `snapshot:${timestamp}`,
    source: 'snapshot',
    warning: 'UI version resolved via timestamp fallback. Git commit hash preferred.'
  };
}
```

---

## Injection Points

### Workflow Context Enrichment

Before executing any USER_DOCUMENTATOR workflow:

```typescript
const workflowContext = {
  route: params.route,
  baseline: params.baseline,
  // AUTO-INJECTED:
  uiVersion: resolveUIVersion().version,
  uiVersionSource: resolveUIVersion().source
};
```

### Manual Override

If `--ui-version` is provided explicitly:

```bash
@run USER_DOCUMENTATOR CREATE --route="/dashboard" --ui-version="git:abc1234"
```

**Rule**: Explicit value OVERRIDES auto-resolved value.

---

## Output Enforcement

### PageHelpConfig (MANDATORY)

Every generated help config MUST include:

```typescript
export const dashboardHelp: PageHelpConfig = {
  pageId: 'dashboard',
  title: 'Dashboard',
  lastReviewedAt: '2026-01-01',
  reviewedAgainstUIVersion: 'git:9f3c2a1',  // ← MANDATORY
  sections: [...]
};
```

### User Guide Markdown (MANDATORY)

Every generated user guide MUST include frontmatter:

```yaml
---
route: /dashboard
createdAt: 2026-01-01
reviewedAgainstUIVersion: git:9f3c2a1
---
```

---

## Validation Rules

### VALIDATOR Check

If documentation artifact is missing `reviewedAgainstUIVersion`:

```
❌ FAIL: Missing reviewedAgainstUIVersion in PageHelpConfig
   File: client/src/lib/help/pages/dashboard.ts
```

### AUDIT Drift Detection

```typescript
function detectUIVersionDrift(): DriftResult {
  const currentUI = resolveUIVersion().version;
  const docVersion = helpConfig.reviewedAgainstUIVersion;
  
  if (currentUI === docVersion) {
    return { status: 'OK', message: 'Documentation matches current UI' };
  }
  
  // Same source but different version
  if (currentUI.split(':')[0] === docVersion.split(':')[0]) {
    return { 
      status: 'DRIFT', 
      message: `UI changed since documentation was created`,
      current: currentUI,
      documented: docVersion
    };
  }
  
  // Different sources
  return {
    status: 'WARN',
    message: 'Cannot reliably compare versions (different sources)',
    current: currentUI,
    documented: docVersion
  };
}
```

---

## Governance Rules

| Rule | Enforcement |
|------|-------------|
| UI version MUST be immutable per workflow run | Runtime |
| No role may modify resolved version | Contract |
| Resolver logic MUST live in ONE place | This file |
| Resolution failure MUST be explicit | Logging |
| Missing version = VALIDATOR FAIL | Hard |

---

## Integration with Workflows

### CREATE Mode

```
1. resolveUIVersion()
2. Inject into context
3. Execute CREATE
4. Write to PageHelpConfig.reviewedAgainstUIVersion
5. Write to UserGuide frontmatter
```

### UPDATE Mode

```
1. resolveUIVersion()
2. Compare with existing doc version
3. If different → document the change
4. Update reviewedAgainstUIVersion
```

### AUDIT Mode

```
1. resolveUIVersion()
2. Load all help configs
3. Compare each reviewedAgainstUIVersion
4. Classify: OK | DRIFT | WARN
5. Report drift summary
```

---

## CLI Examples

```bash
# Auto-resolved (recommended)
@run USER_DOCUMENTATOR CREATE --route="/dashboard"

# Explicit override (rare)
@run USER_DOCUMENTATOR CREATE --route="/dashboard" --ui-version="git:abc1234"

# Audit with drift detection
@run USER_DOCUMENTATOR AUDIT --route="/dashboard"
```

---

## Logging

```
[INFO] Resolved UI version: git:9f3c2a1 (source: git)
[INFO] Injecting uiVersion into workflow context
[WARN] UI version resolved via timestamp fallback (no git available)
```

---

**Canonical Reference**: This file  
**Related**: `core/runtime/prompt-builder.md`
