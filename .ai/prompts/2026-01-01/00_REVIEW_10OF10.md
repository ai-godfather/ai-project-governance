# AI Project Governance — 10/10 Review Notes + Prompt Pack Index

**Generated**: 2026-01-01  
**Repo**: `ai-project-governance/`  
**Cel**: zebrać konkretne uwagi + gotowe prompty, które doprowadzą projekt do poziomu **10/10** (spójność, kompletność, przenośność, brak “doc-lies”).

---

## TL;DR (stan na dziś)

- Repo ma **dobry szkielet** (analiza, struktura, guardrails, role) ale jest w stanie **“skeleton + obietnice”**: dokumentacja i bootstrap wskazują na pliki/skrypty, których jeszcze nie ma.
- Największe ryzyko to **rozjazd: docs ↔ rzeczywistość**, co w systemie governance jest krytycznym antywzorcem (**FP-006: Documentation optimism**).

---

## 🔴 Blockery (zanim nazwiemy to “Production Ready”)

### 1) Doc-lies / broken references

- `README.md` referuje do skryptów, plików i artefaktów, których repo nie zawiera (np. `bootstrap/scripts/validate.sh`, `LICENSE`, pełny zestaw `core/runtime/*`, itd.).
- `REPO_STRUCTURE.md` opisuje strukturę i pliki, które **nie są faktycznie obecne**.

**Skutek**: użytkownik instalujący framework według README natychmiast wpada w błędy i traci zaufanie.

### 2) Instalacja jest sprzeczna z docelowym mappingiem `.ai/*`

- README sugeruje kopiowanie `core/*` do `your-project/.ai/`, co tworzy `.ai/workflow/` zamiast oczekiwanego `.ai/_WORKFLOW/`.
- W praktyce jedyną sensowną ścieżką jest **jedna kanoniczna metoda** (bootstrap), a “manual copy” tylko jeśli jest precyzyjnie zmapowany.

### 3) `bootstrap/scripts/init.sh` jest niespójny i częściowo błędny

- `--config` jest parsowany, ale nieużywany.
- Skrypt ma interaktywny prompt overwrite (złe dla CI / automatyzacji).
- Heredoc z `'EOF'` powoduje zapisanie literalnego `$(date ...)` w `TASKS.md`.
- Skrypt tworzy pliki z placeholderami `{{PROJECT_NAME}}`, ale nie ma mechanizmu ich podmiany.

### 4) Cross-platform

- Instrukcje używają `sed -i` w stylu GNU, co **łamie się na macOS** (BSD sed).
- Brakuje realnego `init.ps1` dla Windows.

### 5) Stack-specific content w “core”

- `AI_PLANNER_GUARDRAILS.md` zawiera elementy specyficzne dla TS/Drizzle/pnpm (np. checklisty migracji) — powinno to być:
  - albo przeniesione do adapterów (stack-specific),
  - albo uogólnione placeholderami + warianty per stack.

---

## ✅ Definicja “10/10” dla tego repo

### Must-have

- **0 dangling references**: README/BOOTSTRAP_FLOW/REPO_STRUCTURE nie mogą odwoływać się do nieistniejących plików bez jawnego oznaczenia TODO.
- **Jedna kanoniczna instalacja** (bootstrap), reszta jako opcjonalne/zaawansowane.
- **Bootstrap + validate**:
  - `init.sh` działa nieinteraktywnie (`--force`, `--dry-run`),
  - `validate.sh` weryfikuje kompletność i placeholdery,
  - (min.) macOS + Linux.
- **Manifest jako Source of Truth**:
  - lista wymaganych plików (per “core/adapters/bootstrap/prompts”) + check w `validate.sh`.

### Nice-to-have

- `upgrade.sh` (bezpieczne aktualizacje core bez nadpisania adapterów).
- Minimalne “examples/” które faktycznie mają pliki (nie tylko puste foldery).
- CI w GitHub Actions: “no placeholders”, “no broken links”, “manifest check”.

---

## 🔁 Kolejność wykonania (prompty w tym folderze)

1. `01_AUDIT_GAPS_AND_DRIFT.md` — read-only audyt różnic i driftu
2. `02_PLANNER_PLAN_FOR_V1_COMPLETENESS.md` — plan/ADR dla domknięcia v1.0
3. `03_IMPLEMENTER_FILL_MISSING_CORE_AND_TEMPLATES.md` — uzupełnienie brakujących artefaktów
4. `04_IMPLEMENTER_BOOTSTRAP_HARDENING.md` — utwardzenie bootstrap i cross-platform
5. `05_CODE_DOCUMENTATOR_DOCS_10OF10.md` — domknięcie docs + usunięcie sprzeczności

---

## Non-goals (żeby nie przepalić scope)

- Nie budujemy “runtime engine” workflow — to repo to **framework dokumentów, kontraktów i szablonów**.
- Nie dodajemy ciężkich zależności tylko po to, by parsować YAML (chyba że ADR to uzasadni).

