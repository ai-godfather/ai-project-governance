# Feature Plan: DEVOPS_006 — Governance Framework v1.0 Completeness

**Version**: 1.0.0  
**Status**: APPROVED  
**Created**: 2026-01-01  
**Revision**: 1

---

## 🔍 EXISTING SYSTEM ANALYSIS (MANDATORY)

### Current State Summary

| Metric | Value |
|--------|-------|
| Files promised in docs | ~80 |
| Files actually present | 20 |
| Coverage | ~15% |
| BLOCKER issues | 27 |
| Production Ready claim | ❌ INVALID |

### Existing Files (What We Have)

```
ai-project-governance/
├── README.md                                    ✅
├── REPO_STRUCTURE.md                            ✅
├── governance.config.yaml.template              ✅
├── analysis/
│   ├── CLASSIFICATION.md                        ✅
│   ├── INVENTORY.md                             ✅
│   ├── UNIFICATION_REPORT.md                    ✅
│   └── REPO_AUDIT_2026-01-01.md                 ✅
├── core/workflow/
│   ├── README.md                                ✅
│   └── 03_ROLES.md                              ✅
├── adapters/
│   ├── README.md                                ✅
│   └── cursorrules/base.cursorrules             ✅
├── bootstrap/
│   ├── BOOTSTRAP_FLOW.md                        ✅
│   ├── scripts/init.sh                          ✅
│   └── templates/docs/AI_PLANNER_GUARDRAILS.md  ✅
└── docs/guides/QUICK_START.md                   ✅
```

### Source of Truth for Missing Content

All missing content will be extracted/generalized from:
- `/Users/pt/Sites/CRYPTO/superx-copytrade-analyzer/.ai/`
- `/Users/pt/Sites/CRYPTO/superx-copytrade-analyzer/.cursorrules`
- `/Users/pt/Sites/CRYPTO/superx-copytrade-analyzer/AGENTS.md`
- `/Users/pt/Sites/CRYPTO/superx-copytrade-analyzer/docs/`

### Known Failure Patterns to Avoid

| FP-ID | Pattern | How We Avoid |
|-------|---------|--------------|
| FP-006 | Documentation optimism (docs != code) | Fill ALL promised files before claiming "Production Ready" |
| FP-003 | Plan treated as system state | Verify files exist, don't assume |
| FP-004 | Fix scope expansion | Strict task-by-task implementation |
| FP-008 | Unbounded concurrency | N/A for this task |

---

## Executive Summary

This plan addresses the critical gap between documented promises and actual content in `ai-project-governance/`. The repo claims "Production Ready" status but only contains ~15% of promised artifacts.

**Chosen Strategy**: **Option A — "Fill the structure"**

We will create all missing files documented in `REPO_STRUCTURE.md`, extract/generalize content from the source HyperXAdvisor repo, and fix bootstrap scripts to be deterministic and cross-platform.

**Estimated effort**: 4-6 hours  
**Risk**: LOW (mostly mechanical extraction, no new logic)

---

## Alternatives Considered

### Option A — "Fill the structure" ✅ SELECTED

**Pros**:
- Complete, truthful repo
- README claims become valid
- Bootstrap actually works
- Users get full value immediately

**Cons**:
- More initial work (~60 files to create)
- Risk of copying project-specific content

**Risks**: LOW — source content exists and is well-documented

### Option B — "Truth-first minimal"

**Pros**:
- Fast to execute
- Honest about current state

**Cons**:
- Disappointing for users expecting full framework
- README rewrite required
- "v0.1 alpha" perception

**Risks**: MEDIUM — may lose credibility

### Option C — "Manifest-driven"

**Pros**:
- Single source of truth
- Automated validation
- Future-proof

**Cons**:
- Adds dependency (YAML parser)
- More complex bootstrap
- Doesn't solve immediate content gap

**Risks**: HIGH — scope creep, adds complexity before basics work

**Decision**: Option A selected because:
1. Source content exists and is tested
2. Users expect complete framework
3. Minimal risk — extraction, not invention

---

## Scope

### In Scope

1. **Core Workflow Files** (8 files)
   - `core/workflow/01_OVERVIEW.md`
   - `core/workflow/02_ARCHITECTURE.md`
   - `core/workflow/04_EXECUTION_ORDER.md`
   - `core/workflow/05_FAILURE_PATTERNS.md`
   - `core/workflow/06_FILE_STRUCTURE.md`
   - `core/workflow/08_COMMANDS.md`
   - `core/workflow/09_ENFORCEMENT.md`
   - `core/workflow/10_ERROR_TRACEABILITY.md`

2. **Core Runtime Files** (6 files)
   - `core/runtime/workflow-guard.md`
   - `core/runtime/origin-layer-heuristics.md`
   - `core/runtime/doc-guard.md`
   - `core/runtime/changelog-generator.md`
   - `core/runtime/prompt-builder.md`
   - `core/runtime/ui-version-resolver.md`

3. **Core Roles Files** (3 files)
   - `core/roles/CODE_DOCUMENTATOR.md`
   - `core/roles/CODE_DOCUMENTATOR_SAFEGUARDS.md`
   - `core/roles/USER_DOCUMENTATOR.md`

4. **Core Templates** (9 files)
   - `core/compliance/COMPLIANCE_STATUS.template.md`
   - `core/compliance/COMPLIANCE_METRICS.template.md`
   - `core/dependencies/FEATURE_DEPENDENCY_GRAPH.template.md`
   - `core/dependencies/IMPACT_ANALYSIS.template.md`
   - `core/decisions/README.template.md`
   - `core/decisions/FEATURE_INDEX.template.md`
   - `core/decisions/TASK_INDEX.template.md`
   - `core/decisions/CHANGELOG_INDEX.template.md`
   - `core/decisions/SNAPSHOT_INDEX.template.md`

5. **Adapters** (9 files)
   - `adapters/agents/base.AGENTS.md`
   - `adapters/agents/typescript.AGENTS.md`
   - `adapters/agents/README.md`
   - `adapters/cursorrules/typescript-express.cursorrules`
   - `adapters/task-magic/tasks.mdc`
   - `adapters/task-magic/plans.mdc`
   - `adapters/task-magic/README.md`

6. **Bootstrap Scripts** (3 files)
   - `bootstrap/scripts/validate.sh`
   - `bootstrap/scripts/upgrade.sh`
   - Fix `bootstrap/scripts/init.sh`

7. **Bootstrap Templates** (10+ files)
   - `bootstrap/templates/docs-FINAL/README.template.md`
   - `bootstrap/templates/docs-FINAL/INDEX.template.md`
   - `bootstrap/templates/docs-FINAL/DEBUGGING/WHERE_TO_LOOK.template.md`
   - `bootstrap/templates/.cursor/rules/after_each_chat.mdc`
   - `bootstrap/templates/docs/AI_SYSTEM_FAILURE_PATTERNS.template.md`

8. **Prompts** (17 files)
   - `prompts/roles/VALIDATOR_PROMPT_TEMPLATE.md`
   - `prompts/roles/FIXATOR_PROMPT_TEMPLATE.md`
   - `prompts/roles/RE_VALIDATOR_PROMPT_TEMPLATE.md`
   - `prompts/roles/PLANNER_PROMPT_TEMPLATE.md`
   - `prompts/roles/IMPLEMENTER_PROMPT_TEMPLATE.md`
   - `prompts/roles/UI_INSPECTOR_PROMPT_TEMPLATE.md`
   - `prompts/roles/DATA_SEMANTIC_VALIDATOR_PROMPT_TEMPLATE.md`
   - `prompts/roles/UI_BROWSER_VALIDATOR_PROMPT_TEMPLATE.md`
   - `prompts/roles/EMERGENCY_ERROR_PROMPT_TEMPLATE.md`
   - `prompts/roles/CODE_DOCUMENTATOR_PROMPT_TEMPLATE.md`
   - `prompts/roles/JOB_OBSERVER_PROMPT_TEMPLATE.md`
   - `prompts/documentation/CREATE.template.md`
   - `prompts/documentation/UPDATE.template.md`
   - `prompts/documentation/AUDIT.template.md`
   - `prompts/init/CODE_AUDITOR.md`
   - `prompts/init/DOC_ANALYST.md`
   - `prompts/init/PLANNER_DOCUMENTATION_REBUILD.md`

9. **Docs Guides** (6 files)
   - `docs/guides/INSTALLATION.md`
   - `docs/guides/CONFIGURATION.md`
   - `docs/guides/CUSTOMIZATION.md`
   - `docs/guides/ROLES.md`
   - `docs/guides/WORKFLOWS.md`
   - `docs/guides/TROUBLESHOOTING.md`

10. **Root Files** (1 file)
    - `LICENSE`

### Out of Scope (v1.1+)

- `examples/typescript-express/` (full working example)
- `examples/python-fastapi/` (full working example)
- `docs/examples/*.md` (example configurations)
- `adapters/cursorrules/typescript-nextjs.cursorrules`
- `adapters/cursorrules/python-fastapi.cursorrules`
- `adapters/agents/python.AGENTS.md`
- `bootstrap/scripts/init.ps1` (Windows PowerShell)

---

## Design / Architecture

### File Mapping Strategy

| Source (hyperxadvisor) | Target (ai-project-governance) | Transformation |
|------------------------|--------------------------------|----------------|
| `.ai/_WORKFLOW/*.md` | `core/workflow/*.md` | Remove project-specific refs |
| `.ai/runtime/*.md` | `core/runtime/*.md` | Generalize |
| `.ai/roles/*.md` | `core/roles/*.md` | Generalize |
| `.ai/prompts/_templates/*.md` | `prompts/roles/*.md` | Add placeholders |
| `.cursorrules` | `adapters/cursorrules/*.cursorrules` | Extract universal sections |
| `AGENTS.md` | `adapters/agents/*.md` | Generalize roles |
| `.cursor/rules/.task-magic/*.mdc` | `adapters/task-magic/*.mdc` | Generalize paths |

### Generalization Rules

1. **Project names**: Replace `HyperXAdvisor`, `SuperX`, `superx-*` → `{{PROJECT_NAME}}`
2. **Paths**: Replace specific paths → `{{PATHS.*}}` or generic patterns
3. **Tech stack**: Replace `tRPC`, `Drizzle`, `Cloud Run` → `{{TECH_STACK}}` references
4. **Database**: Replace PostgreSQL-specific → `{{DATABASE}}`
5. **Cloud**: Replace GCP-specific → `{{CLOUD_PROVIDER}}`

### Bootstrap Architecture

```
init.sh
├── Phase 1: Directory scaffold
├── Phase 2: Copy core/* → .ai/
├── Phase 3: Copy prompts/* → .ai/prompts/_templates/
├── Phase 4: Copy adapters (selected) → root
├── Phase 5: Generate initial files (TASKS.md, changelog)
└── Phase 6: Placeholder replacement (if --config provided)

validate.sh
├── Check required directories exist
├── Check required files exist
├── Check no remaining {{PLACEHOLDER}} in key files
├── Check no broken internal links
└── Report pass/fail with details
```

---

## Configuration Strategy

### `governance.config.yaml` Usage

**Decision**: Config file is OPTIONAL for v1.0.

- **Without config**: Placeholders remain, user must manually replace
- **With config**: `init.sh` reads and substitutes placeholders

**Why optional**:
- Reduces barrier to entry
- Avoids YAML parser dependency in bash
- Matches current behavior of source repo

**Implementation**:
```bash
# In init.sh
if [[ -f "$CONFIG_FILE" ]]; then
    # Simple grep-based extraction (no yq/jq dependency)
    PROJECT_NAME=$(grep 'name:' "$CONFIG_FILE" | head -1 | cut -d'"' -f2)
    # ... substitute in files
else
    log_warn "No config file. Remember to replace {{PLACEHOLDERS}} manually."
fi
```

---

## Cross-Platform Strategy

### macOS + Linux (MUST)

- `init.sh` uses POSIX-compatible bash
- `sed -i` replaced with portable pattern:
  ```bash
  sed_inplace() {
      if [[ "$(uname)" == "Darwin" ]]; then
          sed -i '' "$@"
      else
          sed -i "$@"
      fi
  }
  ```
- All paths use `/` (no Windows backslashes)

### Windows (SHOULD — v1.1)

- `init.ps1` deferred to v1.1
- README will note: "Windows: Use WSL or Git Bash"

---

## Testing Strategy

### Bootstrap Smoke Test

```bash
# Create temp directory
mkdir -p /tmp/test-project && cd /tmp/test-project
git init

# Run bootstrap
/path/to/ai-project-governance/bootstrap/scripts/init.sh --force

# Verify
/path/to/ai-project-governance/bootstrap/scripts/validate.sh
```

### Placeholder Check

```bash
# Should return no matches after manual config
grep -r '{{' .cursorrules AGENTS.md
```

### Link Check

```bash
# Check all markdown links resolve
# (validate.sh will implement this)
```

### Expected Validation Output

```
✅ Directory .ai/_WORKFLOW/ exists with 10 files
✅ Directory .ai/runtime/ exists with 6 files
✅ File .cursorrules exists
✅ File AGENTS.md exists
✅ No remaining {{PLACEHOLDER}} in .cursorrules
✅ All internal links resolve
RESULT: PASS
```

---

## Implementation Task Breakdown

### Phase 1: Core Workflow (BLOCKER)

| Task | File | Source | Priority |
|------|------|--------|----------|
| 1.1 | `core/workflow/01_OVERVIEW.md` | `.ai/_WORKFLOW/01_OVERVIEW.md` | 🔴 |
| 1.2 | `core/workflow/02_ARCHITECTURE.md` | `.ai/_WORKFLOW/02_ARCHITECTURE.md` | 🔴 |
| 1.3 | `core/workflow/04_EXECUTION_ORDER.md` | `.ai/_WORKFLOW/04_EXECUTION_ORDER.md` | 🔴 |
| 1.4 | `core/workflow/05_FAILURE_PATTERNS.md` | `.ai/_WORKFLOW/05_FAILURE_PATTERNS.md` | 🟠 |
| 1.5 | `core/workflow/06_FILE_STRUCTURE.md` | `.ai/_WORKFLOW/06_FILE_STRUCTURE.md` | 🟠 |
| 1.6 | `core/workflow/08_COMMANDS.md` | `.ai/_WORKFLOW/08_COMMANDS.md` | 🔴 |
| 1.7 | `core/workflow/09_ENFORCEMENT.md` | `.ai/_WORKFLOW/09_ENFORCEMENT.md` | 🔴 |
| 1.8 | `core/workflow/10_ERROR_TRACEABILITY.md` | `.ai/_WORKFLOW/10_ERROR_TRACEABILITY.md` | 🔴 |

### Phase 2: Core Runtime (BLOCKER)

| Task | File | Source | Priority |
|------|------|--------|----------|
| 2.1 | `core/runtime/workflow-guard.md` | `.ai/runtime/workflow-guard.md` | 🔴 |
| 2.2 | `core/runtime/origin-layer-heuristics.md` | `.ai/runtime/origin-layer-heuristics.md` | 🔴 |
| 2.3 | `core/runtime/doc-guard.md` | `.ai/runtime/doc-guard.md` | 🔴 |
| 2.4 | `core/runtime/changelog-generator.md` | `.ai/runtime/changelog-generator.md` | 🟠 |
| 2.5 | `core/runtime/prompt-builder.md` | `.ai/runtime/prompt-builder.md` | 🟠 |
| 2.6 | `core/runtime/ui-version-resolver.md` | `.ai/runtime/ui-version-resolver.md` | 🟡 |

### Phase 3: Core Roles & Templates (HIGH)

| Task | File | Priority |
|------|------|----------|
| 3.1 | `core/roles/CODE_DOCUMENTATOR.md` | 🔴 |
| 3.2 | `core/roles/CODE_DOCUMENTATOR_SAFEGUARDS.md` | 🟠 |
| 3.3 | `core/roles/USER_DOCUMENTATOR.md` | 🔴 |
| 3.4 | `core/compliance/*.template.md` (2 files) | 🟠 |
| 3.5 | `core/dependencies/*.template.md` (2 files) | 🟡 |
| 3.6 | `core/decisions/*.template.md` (5 files) | 🟠 |

### Phase 4: Adapters (BLOCKER)

| Task | File | Priority |
|------|------|----------|
| 4.1 | `adapters/agents/base.AGENTS.md` | 🔴 |
| 4.2 | `adapters/agents/typescript.AGENTS.md` | 🟠 |
| 4.3 | `adapters/agents/README.md` | 🟡 |
| 4.4 | `adapters/cursorrules/typescript-express.cursorrules` | 🟠 |
| 4.5 | `adapters/task-magic/tasks.mdc` | 🔴 |
| 4.6 | `adapters/task-magic/plans.mdc` | 🔴 |
| 4.7 | `adapters/task-magic/README.md` | 🟡 |

### Phase 5: Bootstrap Scripts (BLOCKER)

| Task | File | Priority |
|------|------|----------|
| 5.1 | Fix `init.sh` heredoc bug | 🔴 |
| 5.2 | Fix `init.sh` cross-platform sed | 🟠 |
| 5.3 | Implement `--config` usage or remove | 🟠 |
| 5.4 | Add `--non-interactive` flag | 🟠 |
| 5.5 | Create `validate.sh` | 🔴 |
| 5.6 | Create `upgrade.sh` | 🟠 |

### Phase 6: Bootstrap Templates (HIGH)

| Task | File | Priority |
|------|------|----------|
| 6.1 | `bootstrap/templates/docs-FINAL/*.template.md` | 🟠 |
| 6.2 | `bootstrap/templates/.cursor/rules/after_each_chat.mdc` | 🟠 |
| 6.3 | `bootstrap/templates/docs/AI_SYSTEM_FAILURE_PATTERNS.template.md` | 🟠 |

### Phase 7: Prompts (HIGH)

| Task | Files | Priority |
|------|-------|----------|
| 7.1 | `prompts/roles/*.md` (11 files) | 🔴 |
| 7.2 | `prompts/documentation/*.md` (3 files) | 🟠 |
| 7.3 | `prompts/init/*.md` (3 files) | 🟠 |

### Phase 8: Docs Guides (HIGH)

| Task | File | Priority |
|------|------|----------|
| 8.1 | `docs/guides/CONFIGURATION.md` | 🔴 |
| 8.2 | `docs/guides/INSTALLATION.md` | 🟠 |
| 8.3 | `docs/guides/ROLES.md` | 🟠 |
| 8.4 | `docs/guides/WORKFLOWS.md` | 🟠 |
| 8.5 | `docs/guides/CUSTOMIZATION.md` | 🟡 |
| 8.6 | `docs/guides/TROUBLESHOOTING.md` | 🟡 |

### Phase 9: Finalization (MEDIUM)

| Task | Action | Priority |
|------|--------|----------|
| 9.1 | Add `LICENSE.txt` (Proprietary) | ✅ |
| 9.2 | Update `README.md` — fix broken links | 🟠 |
| 9.3 | Update `QUICK_START.md` — fix sed, verify counts | 🟠 |
| 9.4 | Update `REPO_STRUCTURE.md` — sync with reality | 🟠 |
| 9.5 | Run `validate.sh` and confirm PASS | 🔴 |

---

## Acceptance Criteria

### MUST (v1.0 release blockers)

- [ ] `bootstrap/scripts/init.sh` runs without errors on empty git repo
- [ ] `bootstrap/scripts/validate.sh` exists and returns PASS after init
- [ ] `core/workflow/` contains 10 files (README + 9 numbered)
- [ ] `core/runtime/` contains 6 files
- [ ] `core/roles/` contains 3 files
- [ ] `adapters/agents/base.AGENTS.md` exists
- [ ] `adapters/task-magic/tasks.mdc` and `plans.mdc` exist
- [ ] `prompts/roles/` contains 11 prompt templates
- [ ] All links in `README.md` resolve to existing files
- [ ] No `$(date ...)` literal in generated files
- [ ] `grep -r '{{' .cursorrules AGENTS.md` returns matches (placeholders present, not broken)
- [ ] Cross-platform: init.sh works on macOS and Linux

### SHOULD (v1.0 nice-to-have)

- [ ] `docs/guides/CONFIGURATION.md` exists with complete options
- [ ] `bootstrap/scripts/upgrade.sh` exists with basic functionality
- [ ] `--config` flag in init.sh actually substitutes placeholders

### COULD (v1.1)

- [ ] `examples/typescript-express/` complete working example
- [ ] `bootstrap/scripts/init.ps1` for Windows
- [ ] Automated link checker in validate.sh

---

## Execution Order Summary

```
1. Phase 1-2: Core (workflow + runtime) — BLOCKER
2. Phase 4: Adapters (agents, task-magic) — BLOCKER
3. Phase 5: Bootstrap scripts (init fix, validate) — BLOCKER
4. Phase 3: Core roles & templates — HIGH
5. Phase 7: Prompts — HIGH
6. Phase 6: Bootstrap templates — HIGH
7. Phase 8: Docs guides — HIGH
8. Phase 9: Finalization — MEDIUM
```

---

## Guardrails Compliance Checklist

| Guardrail | Compliant? | Evidence |
|-----------|------------|----------|
| No unbounded arrays | ✅ | N/A — no code logic |
| No COUNT(DISTINCT) on >1M rows | ✅ | N/A — no DB queries |
| Limits have budget comments | ✅ | N/A — documentation only |
| Existing system analyzed | ✅ | Section 1 of this plan |
| FP-006 addressed | ✅ | Fill all promised files |
| FP-003 addressed | ✅ | Verify files exist in acceptance |
| FP-004 addressed | ✅ | Strict phase-by-phase |

---

**End of Feature Plan**

**Next Step**: `@workflow IMPLEMENTER DEVOPS_006`
