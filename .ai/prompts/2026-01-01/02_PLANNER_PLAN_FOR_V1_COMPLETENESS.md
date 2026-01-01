# PROMPT: Plan domknięcia v1.0 (kompletność + prawdomówność) — 10/10

**Docelowa rola**: `PLANNER` (READ-ONLY)  
**Repo**: `ai-project-governance/`  
**Cel**: Stworzyć BINDING feature plan, który doprowadzi framework do spójnej, kompletnej wersji v1.0.

---

## Input

- Wynik audytu z: `analysis/REPO_AUDIT_2026-01-01.md`
- `analysis/CLASSIFICATION.md` i `analysis/UNIFICATION_REPORT.md`
- Aktualny stan plików w repo

---

## Problem statement (do użycia w planie)

Repo deklaruje “Production Ready” i pełną strukturę governance, ale:
- ma liczne broken references i brakujące artefakty,
- bootstrap nie jest deterministyczny i nie wykorzystuje configu,
- część “core” zawiera stack-specific elementy, które powinny być adapterami.

To generuje brak zaufania i łamie FP-006.

---

## Wymagania (MUST)

Plan MUSI doprowadzić do:

1. **Truthfulness**: README/REPO_STRUCTURE/BOOTSTRAP_FLOW nie mogą obiecywać nieistniejących plików (albo pliki powstają, albo docs są urealnione).
2. **Completeness**: Minimalny, działający zestaw dystrybucyjny:
   - `core/workflow/*` (komplet wymagany przez README i init.sh)
   - `core/runtime/*` (workflow-guard, doc-guard, origin heuristics, itp.)
   - `adapters/*` (co najmniej base + 1 przykładowy stack)
   - `bootstrap/scripts/{init.sh,validate.sh}` (min.)
   - `LICENSE`
3. **Jedna kanoniczna instalacja**:
   - bootstrap jako primary,
   - manual copy tylko jako advanced i z poprawnym mappingiem.
4. **Cross-platform plan**:
   - macOS + Linux jako MUST,
   - Windows jako SHOULD (init.ps1 lub jasny fallback).

---

## Alternatywy (MIN. 3) — REQUIRED

Plan MUSI rozważyć i porównać (pros/cons/risks):

### Option A — “Fill the structure”
- Uzupełniamy brakujące pliki dokładnie wg `REPO_STRUCTURE.md`.

### Option B — “Truth-first minimal”
- Minimalny zestaw plików + docs urealnione, reszta jako roadmapa v1.1+.

### Option C — “Manifest-driven”
- Wprowadzamy `MANIFEST.yaml` jako jedyne źródło prawdy dla plików,
  a `validate.sh` i docs mogą być generowane/porównywane do manifestu.

Wybierz jedną opcję i uzasadnij.

---

## Plan Output (MUST)

Wygeneruj feature plan do:

- `.ai/plans/features/DEVOPS/DEVOPS_006_GOVERNANCE_FRAMEWORK_V1_COMPLETENESS.md`

Plan MUSI zawierać (minimum):

1. **🔍 EXISTING SYSTEM ANALYSIS** (z pathami do istniejących plików)
2. **Executive Summary**
3. **Scope** (In/Out)
4. **Failure Patterns to avoid** (min. FP-006, FP-003, FP-004, FP-008)
5. **Design / Architecture** (jak mapujemy core/adapters/bootstrap)
6. **Configuration strategy** (jak i czy używamy `governance.config.yaml`)
7. **Cross-platform strategy**
8. **Testing strategy** (bootstrap smoke test + placeholder check + link check)
9. **Implementation task breakdown** (konkretne pliki do utworzenia / poprawy)
10. **Acceptance criteria** (jednoznaczne, testowalne)

---

## Zasady

- ❌ PLANNER nie implementuje kodu.
- ✅ Plan ma być deterministyczny i wykonalny.
- ✅ Jeśli w planie pojawia się “dodaj zależność” (np. parser YAML), to wymaga rozważenia i trade-offów (min. 3 opcje).

