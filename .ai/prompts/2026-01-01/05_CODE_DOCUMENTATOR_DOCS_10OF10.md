# PROMPT: Domknięcie dokumentacji frameworka do 10/10 (bez driftu)

**Docelowa rola**: `CODE_DOCUMENTATOR` (writes docs, not code)  
**Repo**: `ai-project-governance/`  
**Cel**: Urealnić i domknąć dokumentację tak, aby była kompletna, spójna i zgodna z kodem/plikami.

---

## Zasada nadrzędna

**CODE / FILES > DOCS**  
Jeśli dokumentacja nie zgadza się ze stanem repo — dokumentacja musi być poprawiona albo oznaczona jako TODO (jawnie).

---

## Input (co czytasz)

- `README.md`
- `REPO_STRUCTURE.md`
- `bootstrap/BOOTSTRAP_FLOW.md`
- `docs/guides/QUICK_START.md`
- Stan repo (co faktycznie istnieje)

---

## Zadanie

### 1) Napraw spójność instrukcji instalacji

Ujednolić:
- “Quick Start” w `README.md`
- `docs/guides/QUICK_START.md`
- sekcje w `bootstrap/BOOTSTRAP_FLOW.md`

Tak, aby:
- była jedna kanoniczna ścieżka (bootstrap),
- manual copy było opisane jako advanced (jeśli w ogóle).

### 2) Uzupełnij brakujące guide’y (jeśli plan przewiduje)

Stwórz minimalne, ale kompletne:
- `docs/guides/INSTALLATION.md`
- `docs/guides/CONFIGURATION.md`
- `docs/guides/CUSTOMIZATION.md`
- `docs/guides/ROLES.md`
- `docs/guides/WORKFLOWS.md`
- `docs/guides/TROUBLESHOOTING.md`

### 3) Cross-platform correctness

W każdym miejscu, gdzie są komendy shell:
- podaj wariant macOS vs Linux, albo
- zamień na instrukcję manualną + krótkie przykłady.

### 4) Usuń “marketing claims” bez pokrycia (truthfulness)

Jeśli `README.md` twierdzi “Production Ready”, a repo nie ma kluczowych plików (runtime guards / validate.sh / LICENSE) — dopasuj status:
- albo “Beta” z checklistą,
- albo uzupełnij brakujące pliki (to już po stronie implementera).

---

## Output (co zapisujesz)

- Aktualizacja/utworzenie plików w `docs/guides/`
- Korekty `README.md` i ewentualnie `REPO_STRUCTURE.md` **tylko w zakresie dopasowania do rzeczywistości**

Każda zmiana musi mieć:
- *dlaczego* (reason),
- *co się zmieniło* (diff summary),
- *jak zweryfikować* (validation).

---

## Acceptance Criteria

- Dokumentacja nie odwołuje się do nieistniejących plików bez TODO.
- Instrukcje bootstrap są jednoznaczne i nie mają sprzecznych kroków.
- Cross-platform: brak instrukcji, które wprost łamią się na macOS.

