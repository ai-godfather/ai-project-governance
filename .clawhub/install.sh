#!/bin/bash
#
# AI Project Governance - Cursor CLI Install Script
# Installs governance framework using Cursor CLI
#

set -e

# Colors
RED='\033[0;31m'
GREEN='\033[0;32m'
YELLOW='\033[1;33m'
BLUE='\033[0;34m'
CYAN='\033[0;36m'
NC='\033[0m' # No Color

# Configuration
FRAMEWORK_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")/.." && pwd)"
TARGET_DIR="${1:-$(pwd)}"
CONFIG_FILE="governance.config.yaml"

echo -e "${CYAN}🛡️ AI Project Governance Framework Installer${NC}"
echo -e "${BLUE}For Cursor IDE (cursor.com)${NC}"
echo "================================================"
echo ""

# Check prerequisites
echo -e "${YELLOW}Checking prerequisites...${NC}"

# Check if cursor CLI is available
if ! command -v cursor &> /dev/null; then
    echo -e "${YELLOW}⚠️ Cursor CLI not found in PATH${NC}"
    echo -e "${BLUE}Installing via npm...${NC}"
    npm install -g @cursor/cli 2>/dev/null || {
        echo -e "${YELLOW}⚠️ npm install failed, continuing with bash install${NC}"
        CURSOR_CLI_AVAILABLE=false
    }
fi

if command -v cursor &> /dev/null; then
    CURSOR_CLI_AVAILABLE=true
    echo -e "${GREEN}✓ Cursor CLI found${NC}"
else
    CURSOR_CLI_AVAILABLE=false
    echo -e "${YELLOW}⚠️ Cursor CLI not available, using bash fallback${NC}"
fi

# Check git
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

# Create .ai directory structure
mkdir -p "$TARGET_DIR/.ai"
mkdir -p "$TARGET_DIR/.ai/workflows"
mkdir -p "$TARGET_DIR/.ai/roles"
mkdir -p "$TARGET_DIR/.ai/prompts"
mkdir -p "$TARGET_DIR/.cursor/rules"

echo -e "${BLUE}→ Created .ai/ directory structure${NC}"

# Copy workflow definitions
echo -e "${BLUE}→ Copying workflows...${NC}"
if [ -d "$FRAMEWORK_DIR/core/workflows" ]; then
    cp -r "$FRAMEWORK_DIR/core/workflows/"*.md "$TARGET_DIR/.ai/workflows/" 2>/dev/null || true
fi

# Copy role definitions
echo -e "${BLUE}→ Copying roles...${NC}"
if [ -d "$FRAMEWORK_DIR/core/roles" ]; then
    cp -r "$FRAMEWORK_DIR/core/roles/"* "$TARGET_DIR/.ai/roles/" 2>/dev/null || true
fi

# Copy prompts
echo -e "${BLUE}→ Copying prompts...${NC}"
if [ -d "$FRAMEWORK_DIR/prompts" ]; then
    cp -r "$FRAMEWORK_DIR/prompts/"* "$TARGET_DIR/.ai/prompts/" 2>/dev/null || true
fi

# Copy Cursor rules
echo -e "${BLUE}→ Copying Cursor rules...${NC}"
if [ -d "$FRAMEWORK_DIR/.cursor/rules" ]; then
    cp -r "$FRAMEWORK_DIR/.cursor/rules/"* "$TARGET_DIR/.cursor/rules/" 2>/dev/null || true
fi

# Copy config template
echo -e "${BLUE}→ Setting up configuration...${NC}"
if [ ! -f "$TARGET_DIR/$CONFIG_FILE" ]; then
    if [ -f "$FRAMEWORK_DIR/governance.config.yaml.template" ]; then
        cp "$FRAMEWORK_DIR/governance.config.yaml.template" "$TARGET_DIR/$CONFIG_FILE"
    else
        # Create default config
        cat > "$TARGET_DIR/$CONFIG_FILE" << 'EOF'
# AI Project Governance Configuration
governance:
  version: "2.0.0"
  level: "standard"  # minimal | standard | enterprise
  
roles:
  enabled:
    - PLANNER
    - AUDITOR
    - IMPLEMENTER
    - VALIDATOR
    - TDD_GUIDE
  
workflows:
  quality_gate: true
  user_approval: true
  tdd_enabled: true
  
cursor:
  rules_enabled: true
  enforcement: strict
EOF
    fi
    echo -e "${GREEN}✓ Created $CONFIG_FILE${NC}"
else
    echo -e "${YELLOW}⚠ $CONFIG_FILE already exists, skipping${NC}"
fi

# Create AGENTS.md
echo -e "${BLUE}→ Creating AGENTS.md...${NC}"
if [ ! -f "$TARGET_DIR/AGENTS.md" ]; then
    cat > "$TARGET_DIR/AGENTS.md" << 'EOF'
# 🤖 AI Project Governance Framework v2.0.0

## Quick Start

Activate workflows in Cursor chat:
```
@workflow PLANNER     → Create implementation plan
@workflow AUDITOR     → Run 15-dimension quality audit  
@workflow IMPLEMENTER → Execute approved plan
@workflow VALIDATOR   → Validate implementation
@workflow TDD_GUIDE   → Test-first development
```

## Governance Levels

- [ ] **Minimal**: PLANNER → IMPLEMENTER
- [x] **Standard** ⭐: + AUDITOR, VALIDATOR, TDD, Quality Gates
- [ ] **Enterprise**: + Full audit trail, compliance reporting

## Available Roles (16)

| Category | Roles |
|----------|-------|
| **Planning** | PLANNER, ARCHITECT, AUDITOR 🆕, TDD_GUIDE 🆕 |
| **Implementation** | IMPLEMENTER, UI_BROWSER_INSPECTOR 🆕, DATA_SEMANTIC_VALIDATOR |
| **Validation** | VALIDATOR, RE_VALIDATOR, FIXATOR, EMERGENCY_ERROR |
| **Documentation** | CODE_DOCUMENTATOR, DOC_GUARD, JOB_OBSERVER |

## Quality Gates

1. ✅ AUDITOR approves plan before implementation
2. ✅ TDD_CHECK for RED phase tests
3. ✅ VALIDATOR verifies all changes
4. ✅ DOC_GUARD enforces documentation

## Resources

- Framework: `.ai/`
- Workflows: `.ai/workflows/`
- Roles: `.ai/roles/`
- Config: `governance.config.yaml`
- Author: https://x.com/God_FatherAI

---

**Start now**: Open Cursor chat and type `@workflow PLANNER`
EOF
    echo -e "${GREEN}✓ Created AGENTS.md${NC}"
fi

# Create .cursorrules
echo -e "${BLUE}→ Creating .cursorrules...${NC}"
if [ ! -f "$TARGET_DIR/.cursorrules" ]; then
    cat > "$TARGET_DIR/.cursorrules" << 'EOF'
# AI Project Governance v2.0.0 - Cursor Rules

## Workflow Commands

Activate roles with:
- `@workflow PLANNER` - Create implementation plan
- `@workflow AUDITOR` - Run quality audit (15 dimensions)
- `@workflow IMPLEMENTER` - Execute approved plan
- `@workflow VALIDATOR` - Validate changes
- `@workflow TDD_GUIDE` - Test-first development
- `@workflow FIXATOR` - Fix errors

## Quality Gates (MUST CHECK)

1. **AUDITOR Approval**: Plan must be approved before implementation
2. **TDD Check**: RED phase tests present? → Must verify before code
3. **Validation**: VALIDATOR must verify all changes
4. **Documentation**: DOC_GUARD enforces docs for public APIs

## Failure Patterns

Check `.ai/prompts/` for documented patterns:
- FP-001 to FP-069: Core patterns
- Process patterns: Semantic validation, UI inspection

## Governance Rules

- Always start with PLANNER
- AUDITOR gates implementation
- VALIDATOR gates completion
- Document breaking changes
EOF
    echo -e "${GREEN}✓ Created .cursorrules${NC}"
fi

# Cursor CLI Integration
echo ""
echo -e "${CYAN}🚀 Cursor CLI Integration${NC}"

if [ "$CURSOR_CLI_AVAILABLE" = true ]; then
    echo -e "${BLUE}→ Registering governance commands with Cursor...${NC}"
    
    # Create cursor commands file
    mkdir -p "$TARGET_DIR/.cursor"
    cat > "$TARGET_DIR/.cursor/governance.json" << EOF
{
  "commands": [
    {
      "name": "governance-init",
      "title": "Initialize AI Governance",
      "description": "Set up governance for this project",
      "command": "echo 'AI Governance Framework v2.0.0 initialized. Use @workflow PLANNER to start.'"
    },
    {
      "name": "governance-status",
      "title": "Check Governance Status",
      "description": "Show current governance configuration",
      "command": "cat governance.config.yaml"
    }
  ]
}
EOF
    
    echo -e "${GREEN}✓ Cursor commands registered${NC}"
    
    # Open Cursor with welcome message
    echo ""
    echo -e "${CYAN}💡 To activate in Cursor:${NC}"
    echo -e "   1. Open: ${YELLOW}cursor $TARGET_DIR${NC}"
    echo -e "   2. In chat type: ${YELLOW}@workflow PLANNER${NC}"
    echo ""
    
else
    echo -e "${YELLOW}⚠️ Cursor CLI not available${NC}"
    echo -e "${BLUE}Manual setup:${NC}"
    echo -e "   1. Open Cursor IDE"
    echo -e "   2. Open folder: ${YELLOW}$TARGET_DIR${NC}"
    echo -e "   3. In chat type: ${YELLOW}@workflow PLANNER${NC}"
    echo ""
fi

# Final summary
echo ""
echo -e "${GREEN}✅ Installation Complete!${NC}"
echo "================================================"
echo ""
echo -e "${CYAN}📁 Installed in:${NC} $TARGET_DIR"
echo ""
echo -e "${CYAN}📂 Structure:${NC}"
echo -e "   ${YELLOW}.ai/workflows/${NC} - Workflow definitions"
echo -e "   ${YELLOW}.ai/roles/${NC}     - 16 specialized roles"
echo -e "   ${YELLOW}.ai/prompts/${NC}   - Failure patterns & templates"
echo -e "   ${YELLOW}.cursor/rules/${NC} - Cursor enforcement rules"
echo ""
echo -e "${CYAN}📄 Key files:${NC}"
echo -e "   ${YELLOW}AGENTS.md${NC}           - AI instructions"
echo -e "   ${YELLOW}.cursorrules${NC}       - Cursor rules"
echo -e "   ${YELLOW}governance.config.yaml${NC} - Configuration"
echo ""
echo -e "${CYAN}🚀 Next Steps:${NC}"
echo -e "   1. Open project in Cursor: ${YELLOW}cursor $TARGET_DIR${NC}"
echo -e "   2. Start chat and type: ${YELLOW}@workflow PLANNER${NC}"
echo -e "   3. Or use: ${YELLOW}@workflow AUDITOR${NC} to audit existing code"
echo ""
echo -e "${CYAN}📖 Documentation:${NC} https://github.com/ai-godfather/ai-project-governance"
echo -e "${CYAN}👤 Author:${NC} https://x.com/God_FatherAI"
echo ""
echo -e "${GREEN}🛡️ Happy governed coding!${NC}"
echo ""

# Optionally open Cursor
if [ "$CURSOR_CLI_AVAILABLE" = true ] && [ "$2" == "--open" ]; then
    echo -e "${BLUE}Opening Cursor...${NC}"
    cursor "$TARGET_DIR"
fi