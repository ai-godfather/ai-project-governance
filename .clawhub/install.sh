#!/bin/bash
#
# AI Project Governance - ClawHub Install Script
# This script installs the governance framework into the user's project
#

set -e

# Colors
RED='\033[0;31m'
GREEN='\033[0;32m'
YELLOW='\033[1;33m'
BLUE='\033[0;34m'
NC='\033[0m' # No Color

# Configuration
FRAMEWORK_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")/.." && pwd)"
TARGET_DIR="${1:-$(pwd)}"
CONFIG_FILE="governance.config.yaml"

echo -e "${BLUE}🛡️ AI Project Governance Framework Installer${NC}"
echo "================================================"
echo ""

# Check prerequisites
echo -e "${YELLOW}Checking prerequisites...${NC}"

if ! command -v git &> /dev/null; then
    echo -e "${RED}❌ Git is required but not installed.${NC}"
    exit 1
fi

echo -e "${GREEN}✓ Git found${NC}"

# Check if target directory exists
if [ ! -d "$TARGET_DIR" ]; then
    echo -e "${RED}❌ Target directory does not exist: $TARGET_DIR${NC}"
    exit 1
fi

echo -e "${GREEN}✓ Target directory: $TARGET_DIR${NC}"
echo ""

# Install governance artifacts
echo -e "${YELLOW}Installing governance artifacts...${NC}"

# Create .ai directory
mkdir -p "$TARGET_DIR/.ai"
mkdir -p "$TARGET_DIR/.ai/workflows"
mkdir -p "$TARGET_DIR/.ai/roles"
mkdir -p "$TARGET_DIR/.ai/prompts"

# Copy workflow definitions
echo -e "${BLUE}→ Copying workflows...${NC}"
cp -r "$FRAMEWORK_DIR/core/workflows/"*.md "$TARGET_DIR/.ai/workflows/" 2>/dev/null || true

# Copy role definitions
echo -e "${BLUE}→ Copying roles...${NC}"
cp -r "$FRAMEWORK_DIR/core/roles/"* "$TARGET_DIR/.ai/roles/" 2>/dev/null || true

# Copy prompts
echo -e "${BLUE}→ Copying prompts...${NC}"
cp -r "$FRAMEWORK_DIR/prompts/"* "$TARGET_DIR/.ai/prompts/" 2>/dev/null || true

# Copy config template
echo -e "${BLUE}→ Copying configuration...${NC}"
if [ ! -f "$TARGET_DIR/$CONFIG_FILE" ]; then
    cp "$FRAMEWORK_DIR/governance.config.yaml.template" "$TARGET_DIR/$CONFIG_FILE"
    echo -e "${GREEN}✓ Created $CONFIG_FILE${NC}"
else
    echo -e "${YELLOW}⚠ $CONFIG_FILE already exists, skipping${NC}"
fi

# Create AGENTS.md if not exists
if [ ! -f "$TARGET_DIR/AGENTS.md" ]; then
    cat > "$TARGET_DIR/AGENTS.md" << 'EOF'
# AGENTS.md

## AI Project Governance Framework

This project uses AI Project Governance Framework v2.0.0

### Quick Commands

```
@workflow PLANNER     - Create implementation plan
@workflow AUDITOR     - Run quality audit
@workflow IMPLEMENTER - Execute approved plan
@workflow VALIDATOR   - Validate changes
@workflow TDD_GUIDE   - Test-first development
```

### Governance Level

- [ ] Minimal (PLANNER → IMPLEMENTER)
- [x] Standard (+ AUDITOR, VALIDATOR, TDD)
- [ ] Enterprise (+ Full audit trail)

### Framework Location

`.ai/` - All governance artifacts live here

### Author

God_FatherAI (https://x.com/God_FatherAI)
EOF
    echo -e "${GREEN}✓ Created AGENTS.md${NC}"
fi

# Create .cursorrules if not exists
if [ ! -f "$TARGET_DIR/.cursorrules" ]; then
    cat > "$TARGET_DIR/.cursorrules" << 'EOF'
# AI Project Governance - Cursor Rules

## Activation Commands

Use these to activate specific roles:
- @workflow PLANNER - Start planning phase
- @workflow AUDITOR - Run quality audit
- @workflow IMPLEMENTER - Implementation phase
- @workflow VALIDATOR - Validation phase
- @workflow TDD_GUIDE - Test-first development

## Quality Gates

1. AUDITOR must approve plan before implementation
2. TDD_CHECK required if RED phase tests present
3. VALIDATOR must verify all changes
4. DOC_GUARD enforces documentation standards

## Failure Patterns

See `.ai/prompts/` for documented failure patterns (FP-001 to FP-069)
EOF
    echo -e "${GREEN}✓ Created .cursorrules${NC}"
fi

echo ""
echo -e "${GREEN}✅ Installation Complete!${NC}"
echo ""
echo -e "${BLUE}Next Steps:${NC}"
echo "1. Review and customize $CONFIG_FILE"
echo "2. Start with: @workflow PLANNER"
echo "3. Read AGENTS.md for full documentation"
echo ""
echo -e "${YELLOW}Framework Location:${NC} $TARGET_DIR/.ai/"
echo -e "${YELLOW}Config File:${NC} $TARGET_DIR/$CONFIG_FILE"
echo ""
echo -e "${BLUE}Happy coding with governance! 🛡️${NC}"