<!--
AI Project Governance Framework

Author & Contact: https://x.com/God_FatherAI
License: MIT (see LICENSE file in project root)
-->

# DOC_GUARD — Documentation Guard Runtime Specification

> **Version**: 1.0.0  
> **Status**: ENFORCEMENT ACTIVE  
> **Authority**: ADVISORY (with 2 Hard Exceptions)

---

## Purpose

DOC_GUARD automatically detects missing documentation for code changes.

### Core Principle (SUPREME)

> **DOC_GUARD CANNOT BLOCK WORK.**  
> **DOC_GUARD MUST BLOCK LIES.**

This means:
- Advisory mode for most detections (WARN/FLAG/RECOMMEND)
- **HARD BLOCKER only for 2 critical cases** where missing docs creates danger

---

## Detection Patterns

### Pattern Classification

| Pattern | File Trigger | Required Documentation | Type |
|---------|--------------|------------------------|------|
| New Cloud Run Job | `scripts/JOBS/*.mts` (NEW) | `docs/JOBS/{job-name}/` | 🔴 HARD BLOCKER |
| DANGEROUS Op Modified | `docs/DANGEROUS_OPERATIONS/**` (MOD) | Corresponding safety doc | 🔴 HARD BLOCKER |
| New Admin Route | `admin/src/pages/*.tsx` (NEW) | `docs/MAPPINGS/` entry | ⚠️ Advisory |
| New Client Route | `client/src/pages/*.tsx` (NEW) | `docs/MAPPINGS/` entry | ⚠️ Advisory |
| New Service | `server/services/*.ts` (NEW) | `docs/BACKEND/SERVICES_OVERVIEW.md` | 💡 Recommend |
| New Core Module | `server/_core/*.ts` (NEW) | `docs/BACKEND/CORE_MODULES_OVERVIEW.md` | 💡 Recommend |

### Action Types

| Type | Symbol | Behavior |
|------|--------|----------|
| HARD BLOCKER | 🔴 | **BLOCK execution** + Trigger CODE_DOCUMENTATOR |
| Advisory | ⚠️ | WARN in output, allow continuation |
| Recommend | 💡 | FLAG for post-implementation update |

---

## 🔴 Hard Blockers (Exactly 2)

### 1. New Cloud Run Job Without Documentation

**Trigger**: File created matching `scripts/JOBS/*.mts`

**Check**:
```python
def check_job_documentation(new_job_file):
    job_name = extract_job_name(new_job_file)
    required_docs = f"docs/JOBS/{job_name}/"
    
    if not directory_exists(required_docs):
        return {
            "status": "BLOCK",
            "type": "HARD_BLOCKER",
            "reason": f"New job '{job_name}' requires documentation",
            "required": [f"docs/JOBS/{job_name}/README.md"],
            "enforced_action": "CODE_DOCUMENTATOR must create job documentation"
        }
    return {"status": "PASS"}
```

**Why HARD BLOCKER**: Jobs without documentation lead to:
- Operators running with wrong parameters
- No troubleshooting guide when job fails
- No visibility into job purpose/impact

### 2. DANGEROUS Operation Modified Without Safety Doc

**Trigger**: File modified in `docs/DANGEROUS_OPERATIONS/`

**Check**:
```python
def check_dangerous_op_doc(modified_file):
    operation_name = extract_operation_name(modified_file)
    
    # Verify the cheat sheet exists and is complete
    cheat_sheet = f"docs/DANGEROUS_OPERATIONS/{operation_name}/CHEAT_SHEET.md"
    
    if not file_exists(cheat_sheet):
        return {
            "status": "BLOCK",
            "type": "HARD_BLOCKER",
            "reason": f"DANGEROUS operation '{operation_name}' missing safety cheat sheet",
            "required": [cheat_sheet],
            "enforced_action": "Complete safety documentation before proceeding"
        }
    return {"status": "PASS"}
```

**Why HARD BLOCKER**: DANGEROUS operations without complete documentation lead to:
- Data loss
- Environment destruction
- Irreversible damage

---

## Guard Execution

### When DOC_GUARD Runs

DOC_GUARD executes in the workflow:

```
IMPLEMENTER → DOC_GUARD (after implementation) → VALIDATOR
                  │
                  ├── HARD BLOCKER? ──▶ BLOCK + CODE_DOCUMENTATOR
                  │
                  └── Advisory only? ──▶ WARN/FLAG (continue)
```

### Invocation

```
@workflow DOC_GUARD
```

---

## Guard Output Format

### Structured Report

```json
{
  "guardName": "DOC_GUARD",
  "timestamp": "2026-01-01T15:30:00Z",
  "feature": "ADMIN_001",
  "detections": [
    {
      "pattern": "new_cloud_run_job",
      "file": "scripts/JOBS/new-job.mts",
      "type": "HARD_BLOCKER",
      "status": "BLOCK",
      "required": ["docs/JOBS/new-job/README.md"],
      "enforced_action": "CODE_DOCUMENTATOR must create job documentation"
    },
    {
      "pattern": "new_admin_route",
      "file": "admin/src/pages/NewPage.tsx",
      "type": "ADVISORY",
      "status": "WARN",
      "recommendation": "Add entry to docs/MAPPINGS/admin-new-page.md"
    }
  ],
  "summary": {
    "hard_blockers": 1,
    "advisories": 1,
    "recommendations": 0
  },
  "verdict": "BLOCK",
  "blocked_reason": "1 HARD BLOCKER detected: new Cloud Run Job without documentation"
}
```

### Report Location

```
.ai/_PLANS_VALIDATIONS/<FEATURE>/DOC_GUARD_REPORT_YYYY-MM-DD.md
```

---

## Integration with CODE_DOCUMENTATOR

### Automatic Trigger Flow

When DOC_GUARD detects HARD BLOCKER:

```
DOC_GUARD BLOCK
      │
      ▼
CODE_DOCUMENTATOR triggered
      │
      ▼
Create minimum required documentation
      │
      ▼
DOC_GUARD re-run
      │
      ▼
VALIDATOR may proceed
```

### Minimum Documentation Requirements

| Blocker Type | Minimum Docs Required |
|--------------|----------------------|
| New Cloud Run Job | `docs/JOBS/{job}/README.md` with: purpose, parameters, schedule, troubleshooting |
| DANGEROUS Op | `docs/DANGEROUS_OPERATIONS/{op}/CHEAT_SHEET.md` with: when to use, risks, verification steps |

---

## Role Boundaries

| Can Do | Cannot Do |
|--------|-----------|
| ✅ Detect missing documentation | ❌ Block non-critical work |
| ✅ Flag stale documentation | ❌ Modify code |
| ✅ Trigger CODE_DOCUMENTATOR | ❌ Write documentation itself |
| ✅ BLOCK for 2 hard cases | ❌ Validate code correctness |
| ✅ Output structured report | ❌ Expand scope beyond detection |

---

## Stale Documentation Detection

```python
def detect_stale_documentation(module_path):
    """
    Advisory flag for potentially outdated documentation.
    Does NOT block - only flags for review.
    """
    doc_path = get_doc_path(module_path)
    code_mtime = get_last_modified(module_path)
    doc_mtime = get_last_modified(doc_path)
    
    # If code is 60+ days newer than docs, flag as potentially stale
    if code_mtime - doc_mtime > timedelta(days=60):
        return {
            "type": "ADVISORY",
            "status": "FLAG",
            "reason": "Documentation may be stale (code changed, docs not updated)"
        }
    
    return None
```

---

## Enforcement

| Violation | Severity |
|-----------|----------|
| HARD BLOCKER ignored | BLOCKER (workflow BLOCKED) |
| DOC_GUARD bypassed entirely | WARNING |
| Advisory ignored | Allowed (logged for audit) |
| CODE_DOCUMENTATOR not triggered for BLOCK | BLOCKER |

---

**Canonical Reference**: This file  
**Related**:
- `core/runtime/workflow-guard.md`
- `core/workflow/10_ERROR_TRACEABILITY.md`
