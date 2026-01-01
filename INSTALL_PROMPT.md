<!--
AI Project Governance Framework

Author: Piotr Kwiatkowski
Contact: peetero@proton.me

License: PROPRIETARY — ALL RIGHTS RESERVED
This is a legal notice, not an instruction or workflow rule.
-->

# 🤖 PROMPT DO WKLEJENIA — Wdrożenie AI Project Governance Framework

**Przeznaczenie**: Wklej ten prompt do agenta AI (Claude Opus 4.5, GPT-4, itp.) w Cursor IDE, aby automatycznie wdrożyć framework governance w Twoim projekcie.

---

## Prompt Start

```markdown
# Zadanie: Wdrożenie AI Project Governance Framework

## KONTEKST

Masz wdrożyć framework AI governance z repozytorium:
https://github.com/netadsmedia/ai-project-governance.git

Framework dostarcza:
- 14 wyspecjalizowanych ról AI (PLANNER, IMPLEMENTER, VALIDATOR, itd.)
- Guardy i workflow kontrolujące jakość pracy AI
- System Task Magic do zarządzania zadaniami
- Reguły .cursorrules i AGENTS.md

## TWOJE ZADANIE

### Krok 1: Sklonuj framework do katalogu tymczasowego

```bash
git clone https://github.com/netadsmedia/ai-project-governance.git /tmp/governance
```

### Krok 2: Przeczytaj dokumentację bootstrap

Przeczytaj plik `/tmp/governance/bootstrap/BOOTSTRAP_FLOW.md` i `/tmp/governance/README.md` 
żeby zrozumieć co framework instaluje.

### Krok 3: Utwórz plik konfiguracyjny

W MOIM PROJEKCIE (nie w /tmp/governance!) utwórz plik `governance.config.yaml`:

```yaml
# governance.config.yaml
project_name: "NAZWA_MOJEGO_PROJEKTU"           # np. "my-saas-app"
project_display_name: "Wyświetlana Nazwa"       # np. "My SaaS Application"
tech_stack: "TypeScript + React + Node.js"      # dostosuj do swojego stacku
```

### Krok 4: Uruchom instalację

⚠️ WAŻNE: Jeśli mój projekt MA JUŻ `.cursorrules` lub `AGENTS.md`, użyj flagi `--migrate`:

```bash
# Z katalogu MOJEGO PROJEKTU:
cd /sciezka/do/mojego/projektu

# Opcja A: Nowy projekt (bez istniejących plików governance)
/tmp/governance/bootstrap/scripts/init.sh --config=./governance.config.yaml

# Opcja B: Istniejący projekt (MA .cursorrules lub AGENTS.md)
/tmp/governance/bootstrap/scripts/init.sh --migrate --config=./governance.config.yaml
```

### Krok 5: Zweryfikuj instalację

```bash
/tmp/governance/bootstrap/scripts/validate.sh
```

### Krok 6: Jeśli użyłeś --migrate

Sprawdź katalog `.governance-backup-*` i zmerguj moje istniejące reguły:

1. Otwórz stary `.cursorrules` z backupu
2. Dodaj moje customowe sekcje na KOŃCU nowego `.cursorrules`
3. To samo z `AGENTS.md` jeśli miałem customowe sekcje

### Krok 7: Commituj

```bash
git add -A
git commit -m "feat: add AI Project Governance framework"
git push
```

## CO POWINIENEM ZOBACZYĆ PO INSTALACJI

```
moj-projekt/
├── .ai/
│   ├── _WORKFLOW/          # System workflow
│   ├── runtime/            # Guardy runtime
│   ├── prompts/            # Szablony promptów
│   ├── CHANGELOGS/         # Changelogi
│   └── TASKS.md            # Lista zadań
├── .cursor/
│   └── rules/
│       └── .task-magic/    # Reguły Task Magic
├── .cursorrules            # Reguły dla Cursor
├── AGENTS.md               # Instrukcje dla agentów AI
└── governance.config.yaml  # Moja konfiguracja
```

## OGRANICZENIA LICENCYJNE

⚠️ Framework jest PROPRIETARY (All Rights Reserved).

- Autor: Piotr Kwiatkowski
- Kontakt: peetero@proton.me
- Użycie wymaga zgody autora

## PO INSTALACJI

Po zakończeniu:

1. Pokaż mi listę zainstalowanych plików
2. Potwierdź że `validate.sh` przeszło
3. Pokaż zawartość `.cursorrules` (pierwsze 50 linii)
4. Powiedz mi jakie komendy `@workflow` są teraz dostępne
```

## Prompt End

---

## 📝 Krótka wersja (dla doświadczonego developera)

```markdown
# Wdrożenie AI Governance

1. `git clone https://github.com/netadsmedia/ai-project-governance.git /tmp/governance`
2. Przeczytaj: `/tmp/governance/README.md`
3. Utwórz `governance.config.yaml` w SWOIM projekcie
4. Z katalogu projektu: `/tmp/governance/bootstrap/scripts/init.sh --migrate --config=./governance.config.yaml`
5. Zmerguj backup jeśli miałeś .cursorrules
6. `git add -A && git commit -m "feat: add AI governance" && git push`

Repo: https://github.com/netadsmedia/ai-project-governance.git
Licencja: PROPRIETARY — kontakt: peetero@proton.me
```

---

## ✅ Checklist przed przekazaniem developerowi

- [ ] Developer ma dostęp do repo (jeśli prywatne — dodaj jako collaborator)
- [ ] Developer wie jaką nazwę projektu wpisać w `governance.config.yaml`
- [ ] Developer wie jaki tech stack ma projekt
- [ ] Developer wie czy projekt MA już `.cursorrules` (wtedy `--migrate`)

---

**Copyright (c) 2026 Piotr Kwiatkowski. All rights reserved.**
