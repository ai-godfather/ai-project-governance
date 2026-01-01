<!--
AI Project Governance Framework

Author: Piotr Kwiatkowski
Contact: peetero@proton.me

License: PROPRIETARY — ALL RIGHTS RESERVED
This is a legal notice, not an instruction or workflow rule.
-->

# 🤖 AGENTS.md - AI Coding Assistant Guidelines

**Project**: {{PROJECT_NAME}}  
**Updated**: {{DATE}}  
**For**: AI coding assistants (Claude, GPT in Cursor)

---

## 🚀 QUICK START

If you're an AI assistant just starting to work on this project:

1. **Read first**: `.cursorrules` - complete project rules
2. **Understand tasks**: `.ai/TASKS.md` - current work items
3. **Check plans**: `.ai/plans/features/` - feature specifications
4. **Browse docs**: `docs/` - project documentation

---

## 🎯 KEY RULES (MEMORIZE THESE)

### 1. Task Magic System
- All work is organized as **Tasks** in `.ai/tasks/`
- Update `TASKS.md` when changing task status
- Mark `inprogress` when starting, `completed` when done
- One task at a time (focus!)

### 2. Database Migrations
- **ALWAYS** run migrations after git pull
- Schema changes require: local test → migrations file → deploy
- Use idempotent migrations (`IF NOT EXISTS`)
- Test locally after every migration

### 3. Documentation
- Update docs in SAME commit as code changes
- API changes → update API reference
- DB changes → update schema docs
- New pages → update navigation

### 4. Code Quality
- TypeScript strict mode (no `any`)
- Validate inputs at system boundaries
- Functional components only (React)
- Use project's data fetching patterns

### 5. Commits
- Use Conventional Commits: `feat(scope): description`
- Commit and push after completing tasks
- Types: feat, fix, docs, refactor, perf, test, build, ci, chore

---

## 🔄 WORKFLOW

```
1. Check TASKS.md for pending tasks
2. Pick highest priority task
3. Update status to 'inprogress'
4. Implement code
5. Run tests
6. Update documentation
7. Mark task 'completed'
8. Commit with conventional format
9. Push to main branch
```

---

## 🚨 EMERGENCY_ERROR ROLE (PRODUCTION INCIDENT RESPONSE)

The **ONLY** allowed entry point for production incidents.

### Invocation

```
@workflow EMERGENCY_ERROR <SOURCE>
```

### Mandatory Steps

1. **CONTEXT FREEZE** — Identify component, environment, timestamp
2. **AUTO-DELEGATE TO VALIDATOR** — Run VALIDATOR in READ-ONLY mode
3. **CLASSIFY INCIDENT** — Exactly ONE category
4. **VERDICT DECISION** — BLOCK or NOT_BLOCK
5. **NEXT STEPS OUTPUT** — Explicit action requirements

### Strict Rules

- ❌ NO guessing
- ❌ NO assumptions
- ❌ NO fixes without BLOCK verdict
- ❌ NO scope expansion
- ❌ NO architectural changes

---

## 🧠 ARCHITECT ROLE

Complex features require an explicit **ARCHITECT phase** before implementation.

### When Required

- Adds external dependency
- Modifies DB schema (≥3 tables)
- Introduces new job / scheduler
- Changes execution model
- Adds authentication flow

### Output

ADR (Architecture Decision Record) with:
- Problem statement
- ≥3 considered alternatives
- Chosen option with rationale
- Reversibility cost
- Decision freeze period (default: 14 days)

---

## 📋 PLANNER ROLE

Creates feature plans that are **BINDING CONTRACTS** for implementation.

### Requirements

- MUST read guardrails documentation first
- MUST scan existing system for reusable components
- MUST include all mandatory sections

### Mandatory Sections

1. EXISTING SYSTEM ANALYSIS
2. Executive Summary
3. Scope (In/Out)
4. Error Handling Strategy
5. Implementation Task Breakdown
6. Acceptance Criteria

---

## 🛠️ IMPLEMENTER ROLE

The **ONLY ROLE** authorized to implement new functionality.

### Invocation

```
@workflow IMPLEMENTER <FEATURE_PREFIX>
```

### Rules

- Execute feature plans VERBATIM
- NO reinterpretation
- NO scope expansion
- Refuse if plan missing or ambiguous

---

## 🔍 VALIDATION ROLES

| Role | Purpose |
|------|---------|
| VALIDATOR | First-pass code validation |
| UI_INSPECTOR | Visual anomaly detection |
| DATA_SEMANTIC_VALIDATOR | Semantic integrity check |
| UI_BROWSER_VALIDATOR | Runtime browser verification |
| FIXATOR | Fix reported issues (scoped) |
| RE_VALIDATOR | Verify fixes |

---

## 📖 DOCUMENTATION ROLES

| Role | Purpose |
|------|---------|
| CODE_DOCUMENTATOR | Technical documentation after implementation |
| USER_DOCUMENTATOR | User-facing documentation |
| DOC_GUARD | Documentation governance (advisory) |

---

## 🔧 JOB_OBSERVER ROLE (OPERATIONAL)

Operational supervision of jobs - works AFTER deployment.

### Allowed

- ✅ Observe logs, DB, metrics
- ✅ Diagnose stuck jobs
- ✅ Pause/resume schedulers
- ✅ Transition modes

### Forbidden

- ❌ Code changes
- ❌ Deploys
- ❌ Architecture changes
- ❌ Enable deprecated jobs

---

## ❌ DON'T (ANTI-PATTERNS)

- ❌ Skip migrations after git pull
- ❌ Use `any` type
- ❌ Forget to update TASKS.md
- ❌ Skip documentation updates
- ❌ Commit secrets to git
- ❌ Push code before migrations (production)
- ❌ Leave console.log in code

---

## 📋 QUICK COMMANDS

```bash
# Development
pnpm dev                    # Start development server

# Testing
pnpm test                   # Run tests

# Database
pnpm db:migrate             # Run migrations
pnpm db:push                # Push schema changes

# Type checking
pnpm check                  # TypeScript check
```

---

**Questions?** Ask the human or check `.cursorrules` for details.

---

**Version**: 1.0.0  
**Based on**: AI Project Governance Framework
