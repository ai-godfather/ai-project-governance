# PROMPT: Utwardzenie bootstrap (init/validate/upgrade) + cross-platform

**Docelowa rola**: `IMPLEMENTER` (WRITE, scope-locked)  
**Repo**: `ai-project-governance/`  
**Cel**: Sprawić, żeby bootstrap był deterministyczny, przenośny i spójny z dokumentacją.

---

## Dlaczego to jest BLOCKER

Aktualny `bootstrap/scripts/init.sh`:
- parsuje `--config`, ale go nie używa,
- ma interaktywne potwierdzenia (złe dla CI),
- zapisuje literalne `$(date ...)` do plików (błąd heredoc quoting),
- zostawia placeholdery bez mechanizmu ich podmiany,
- a dokumentacja odwołuje się do `validate.sh`, którego nie ma.

---

## Scope (MUST)

### 1) `bootstrap/scripts/init.sh`

Wprowadź minimalne wymagania jakości:
- **No interactive prompts** (wszystko przez flagi: `--force`, `--dry-run`).
- **Config usage**:
  - albo realnie używaj `--config` do podmiany placeholderów,
  - albo usuń opcję z CLI i dokumentacji (ale to zmiana kontraktu — tylko jeśli plan pozwala).
- **Heredoc correctness**:
  - daty i zmienne, które mają się rozwijać, muszą się rozwijać,
  - placeholdery `{{...}}` nie mogą być przypadkowo rozwinięte.
- **Idempotency**:
  - ponowne uruchomienie skryptu nie może uszkodzić instalacji.

### 2) `bootstrap/scripts/validate.sh` (NOWY)

Skrypt walidacji instalacji (min.):
- sprawdza istnienie wymaganych katalogów i plików,
- wykrywa pozostałe `{{PLACEHOLDER}}` w `.cursorrules` i `AGENTS.md`,
- wykrywa “broken links” w `README.md` i `docs/guides/QUICK_START.md` (linki do plików w repo),
- wypisuje jasny PASS/FAIL + listę błędów.

### 3) `bootstrap/scripts/upgrade.sh` (SHOULD)

Bezpieczna aktualizacja “core”:
- kopia zapasowa (timestamp),
- nadpisuje tylko “core”,
- nie dotyka adapterów użytkownika (jeśli framework jest użyty w projekcie),
- uruchamia `validate.sh`.

### 4) `bootstrap/scripts/init.ps1` (SHOULD)

Minimalny odpowiednik Windows:
- tworzy katalogi,
- kopiuje core/templates,
- informuje o manualnych krokach, jeśli coś jest nieobsługiwane.

---

## Cross-platform wymagania (MUST)

- **Nie używaj** `sed -i` w dokumentacji bez wariantu macOS + Linux.
- Preferuj:
  - “edytuj ręcznie” jako default,
  - albo skrypt w czystym bash bez GNU-only opcji,
  - albo alternatywne instrukcje per OS.

---

## Acceptance Criteria (MUST)

- `init.sh` działa na macOS i Linux bez interakcji:
  - `./init.sh --scaffold-only`
  - `./init.sh --force`
- `validate.sh` istnieje i wykrywa:
  - brakujące pliki,
  - placeholdery,
  - broken links.
- Dokumentacja (`README.md`, `docs/guides/QUICK_START.md`, `BOOTSTRAP_FLOW.md`) jest zgodna z realnym zachowaniem skryptów.

