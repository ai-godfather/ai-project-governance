# PROMPT: Uzupełnienie brakujących artefaktów (core/adapters/bootstrap/prompts)

**Docelowa rola**: `IMPLEMENTER` (WRITE, scope-locked)  
**Repo**: `ai-project-governance/`  
**Cel**: Zlikwidować braki w dystrybucji i usunąć “broken promises” (docs ↔ files).

---

## Pre-flight (MUST)

1. Plan musi istnieć i być jednoznaczny (np. `DEVOPS_006_*`).
2. Jeśli plan wymaga ADR (np. dodanie zależności do parsowania YAML) → najpierw `ARCHITECT`.
3. Implementacja ma być **truth-first**: albo dodajemy brakujące pliki, albo urealniamy docs (zgodnie z planem).

---

## Scope (zwykle BLOCKER)

### A) Core governance files (w repo framework)

Uzupełnij to, co repo obiecuje w `REPO_STRUCTURE.md` / `README.md`, m.in.:
- `core/workflow/01_OVERVIEW.md`
- `core/workflow/02_ARCHITECTURE.md`
- `core/workflow/04_EXECUTION_ORDER.md`
- `core/workflow/06_FILE_STRUCTURE.md`
- `core/workflow/08_COMMANDS.md`
- `core/workflow/09_ENFORCEMENT.md`
- `core/workflow/10_ERROR_TRACEABILITY.md`
- `core/runtime/workflow-guard.md`
- `core/runtime/origin-layer-heuristics.md`
- `core/runtime/doc-guard.md`
- `core/runtime/changelog-generator.md`
- `core/runtime/prompt-builder.md`
- `core/runtime/ui-version-resolver.md`
- `core/roles/*` (CODE_DOCUMENTATOR + safeguards, USER_DOCUMENTATOR)
- `core/compliance/*.template.md`
- `core/decisions/*.template.md`
- `core/dependencies/*.template.md`

**Zasada**: jeśli nie masz źródła do skopiowania, NIE wymyślaj zachowania — oznacz TODO i urealnij docs (tylko jeśli plan na to pozwala).

### B) Adapters (project adapters)

Uzupełnij przynajmniej:
- `adapters/agents/{base.AGENTS.md,typescript.AGENTS.md,python.AGENTS.md}`
- `adapters/cursorrules/{typescript-express.cursorrules,typescript-nextjs.cursorrules,python-fastapi.cursorrules}`
- `adapters/task-magic/{tasks.mdc,plans.mdc}` (+ README)

### C) Bootstrap templates

Uzupełnij brakujące templaty, o ile są w planie:
- `bootstrap/templates/docs-FINAL/*` (README/INDEX/DEBUGGING)
- `bootstrap/templates/docs/AI_SYSTEM_FAILURE_PATTERNS.template.md`
- `bootstrap/templates/.cursor/rules/after_each_chat.mdc`

### D) Prompts distribution

Jeśli repo ma dystrybuować prompt templates (wg `REPO_STRUCTURE.md`), dodaj:
- `prompts/roles/*`
- `prompts/documentation/*`
- `prompts/init/*`

### E) Repo hygiene

Dodaj brakujące pliki, jeśli są obiecane:
- `LICENSE.txt` (Proprietary — All Rights Reserved)
- (opcjonalnie) `CONTRIBUTING.md`

---

## Must-fix inconsistencies (dokładnie w kodzie)

1. README “Quick Start” nie może sugerować kopiowania `core/*` do `.ai/` jeśli mapping jest inny.  
   → Albo popraw instrukcję, albo zmień strukturę core (zgodnie z planem).

2. `core/workflow/README.md` nie może linkować do nieistniejących plików.

3. `REPO_STRUCTURE.md` musi odzwierciedlać realną strukturę po zmianach.

---

## Acceptance Criteria (MUST)

- `README.md` i `docs/guides/QUICK_START.md` nie mają referencji do nieistniejących plików/skryptów.
- Repo zawiera minimalny działający zestaw `core/` + `bootstrap/scripts/init.sh` + `bootstrap/scripts/validate.sh`.
- Template placeholders są konsekwentne (`{{PROJECT_NAME}}` itd.) i opisane.
- `validate.sh` wykrywa:
  - brak wymaganych plików,
  - pozostałe placeholdery,
  - broken links (min. lokalne linki do plików w repo).

---

## Output

- Zmiany w plikach repo (implementation)
- Aktualizacja dokumentacji: `README.md` / `REPO_STRUCTURE.md` / `BOOTSTRAP_FLOW.md` (tylko w zakresie planu)

