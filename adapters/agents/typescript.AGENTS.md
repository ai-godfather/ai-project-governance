<!--
AI Project Governance Framework

Author: Piotr Kwiatkowski
Contact: peetero@proton.me

License: PROPRIETARY — ALL RIGHTS RESERVED
This is a legal notice, not an instruction or workflow rule.
-->

# 🤖 AGENTS.md - TypeScript Project Guidelines

**Project**: {{PROJECT_NAME}}  
**Stack**: TypeScript + {{FRAMEWORK}}  
**Updated**: {{DATE}}

---

## 🚀 QUICK START

1. **Read first**: `.cursorrules` - complete project rules
2. **Understand tasks**: `.ai/TASKS.md` - current work items
3. **Check plans**: `.ai/plans/features/` - feature specifications

---

## 🔧 TYPESCRIPT RULES

### Strict Mode (MANDATORY)

```json
{
  "compilerOptions": {
    "strict": true,
    "noImplicitAny": true,
    "strictNullChecks": true
  }
}
```

### Type Rules

| Rule | Description |
|------|-------------|
| ❌ `any` | FORBIDDEN without explicit justification |
| ⚠️ `unknown` | Minimize usage |
| ✅ Domain types | Use explicit, documented types |
| ✅ Zod | Runtime validation at system boundaries |

### Patterns

```typescript
// ✅ GOOD: Explicit types
interface UserData {
  id: string;
  email: string;
  createdAt: Date;
}

// ❌ BAD: any type
function processData(data: any) { ... }

// ✅ GOOD: Runtime validation
const UserSchema = z.object({
  id: z.string(),
  email: z.string().email(),
  createdAt: z.date()
});
```

---

## 📊 DATA & SCALE RULES

### Memory Limits

| Context | Max Items | Strategy |
|---------|-----------|----------|
| API Response | 10,000 | Pagination |
| Frontend State | 1,000 | Virtual scrolling |
| Batch Job | Streaming | Chunks of 1,000 |

### FORBIDDEN Patterns

- ❌ `array.push()` without size limit
- ❌ `Promise.all()` on unbounded collections
- ❌ `SELECT *` without LIMIT
- ❌ Loading full datasets to memory

---

## 🧪 TESTING

```bash
pnpm test           # Run all tests
pnpm test:watch     # Watch mode
pnpm test:coverage  # With coverage
```

### Test Requirements

- Unit tests for business logic
- Integration tests for API endpoints
- E2E tests for critical flows

---

## 📦 DEPENDENCIES

When adding dependencies:

1. Check for existing similar packages
2. Verify license compatibility
3. Check bundle size impact
4. Document in ADR if significant

---

## 🔗 REFERENCES

- `.cursorrules` - Supreme law
- `.ai/TASKS.md` - Current tasks
- `docs/` - Project documentation

---

**Version**: 1.0.0  
**Based on**: AI Project Governance Framework
