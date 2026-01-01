# PROMPT: Audyt kompletności i “doc drift” (10/10)

**Docelowa rola**: `VALIDATOR` (READ-ONLY)  
**Repo**: `ai-project-governance/`  
**Cel**: Wykryć i zmapować wszystkie rozjazdy “to co repo obiecuje” vs “to co repo ma”.

---

## Kontekst / Dlaczego

To repo jest frameworkiem governance. Dla governance, **doc-lies = krytyczny błąd** (FP-006).  
Zanim zaczniemy dopisywać nowe funkcje, musimy urealnić stan: **CODE/FILES are truth**.

---

## Input (co masz przeczytać)

- `README.md`
- `REPO_STRUCTURE.md`
- `analysis/CLASSIFICATION.md`
- `analysis/UNIFICATION_REPORT.md`
- `bootstrap/scripts/init.sh`
- `docs/guides/QUICK_START.md`
- Zawartość katalogów: `core/`, `adapters/`, `bootstrap/`, `prompts/`, `docs/`, `examples/`

---

## Zadanie (READ-ONLY)

### 1) “Repo Reality Map”

Zrób tabelę:

| Oczekiwane (z docs) | Faktycznie istnieje? | Gdzie? | Severity | ORIGIN_LAYER | Notatka |
|---------------------|----------------------|--------|----------|--------------|--------|

Źródła oczekiwań:
- `REPO_STRUCTURE.md` (lista plików)
- `README.md` (referencje do skryptów i plików)
- `init.sh` (kopiowane ścieżki)

### 2) Broken links / broken instructions

Wypisz:
- instrukcje w README/QUICK_START, które tworzą złą strukturę lub odwołują się do nieistniejących plików,
- linki do plików, które nie istnieją,
- skrypty wspomniane, ale brakujące.

### 3) Bootstrap correctness audit

Sprawdź `bootstrap/scripts/init.sh` pod kątem:
- argumenty “parsowane, ale nieużywane” (np. `--config`),
- zachowania interaktywnego (nie-automatyzowalne),
- heredoc/quoting (czy generuje literalne `$(date ...)`),
- placeholderów `{{...}}` pozostawionych bez mechanizmu podmiany,
- spójności ze strukturą z `REPO_STRUCTURE.md`.

### 4) Cross-platform audit

Wypisz wszystkie miejsca, które są:
- Linux-only (np. `sed -i`),
- macOS-incompatible,
- Windows-incompatible.

---

## Klasyfikacja issue (MANDATORY)

Każdy problem oznacz:

### Severity
- 🔴 **BLOCKER** — uniemożliwia instalację / tworzy kłamliwą dokumentację / psuje bootstrap
- 🟠 **HIGH** — duże ryzyko błędnego wdrożenia / utraty zaufania
- 🟡 **MEDIUM** — poprawki jakości, ale nie blokują
- 🟢 **LOW** — polish

### ORIGIN_LAYER
Użyj dokładnie jednej:
- `IMPLEMENTATION` (braki w repo/artefaktach)
- `DOCUMENTATION_DRIFT` (docs obiecują nieistniejące rzeczy)
- `FEATURE_PLAN` (jeśli drift wynika z planu/założeń)
- `EXTERNAL_DEPENDENCY` (np. brak narzędzi, platform-specific)

---

## Output (artefakt)

Zapisz raport do:

- `analysis/REPO_AUDIT_2026-01-01.md`

Raport MUSI mieć sekcje:

1. Executive Summary (5–10 zdań)
2. Blockers (lista + evidence)
3. High priority fixes
4. Medium / low
5. Recommended execution order (maks 5 kroków)

---

## Zasady

- ❌ Nie naprawiaj nic w tym kroku (READ-ONLY).
- ✅ Evidence-based: cytuj konkretne pliki i linie.
- ✅ Jeśli coś jest “TODO” w docs — traktuj to jako drift dopóki nie jest jawnie oznaczone jako TODO w repo.

