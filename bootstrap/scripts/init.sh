#!/usr/bin/env bash

# =============================================================================
# AI Project Governance Framework
#
# Author: Piotr Kwiatkowski
# Contact: peetero@proton.me
#
# License: PROPRIETARY — ALL RIGHTS RESERVED
# This is a legal notice, not an instruction.
# =============================================================================


# ==============================================================================
# AI Project Governance — Bootstrap Script
# Version: 1.0.0
# ==============================================================================

set -euo pipefail

# Colors for output
RED='\033[0;31m'
GREEN='\033[0;32m'
YELLOW='\033[1;33m'
BLUE='\033[0;34m'
NC='\033[0m' # No Color

# Script directory
SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
GOVERNANCE_ROOT="$(dirname "$(dirname "$SCRIPT_DIR")")"

# Default values
SCAFFOLD_ONLY=false
CONFIG_FILE=""
FORCE=false
NON_INTERACTIVE=false
MIGRATE=false
BACKUP_DIR=""

# ==============================================================================
# Helper Functions
# ==============================================================================

log_info() {
    echo -e "${BLUE}[INFO]${NC} $1"
}

log_success() {
    echo -e "${GREEN}[SUCCESS]${NC} $1"
}

log_warn() {
    echo -e "${YELLOW}[WARN]${NC} $1"
}

log_error() {
    echo -e "${RED}[ERROR]${NC} $1"
}

usage() {
    cat << EOF
Usage: $(basename "$0") [OPTIONS]

Initialize AI Project Governance in current directory.

Options:
    --config=FILE       Path to governance.config.yaml (optional, for placeholder substitution)
    --scaffold-only     Only create directory structure, don't copy files
    --force             Overwrite existing files without backup
    --migrate           Backup existing files, then install (RECOMMENDED for existing projects)
    --non-interactive   Skip confirmation prompts (for CI/CD)
    -h, --help          Show this help message

Examples:
    # New project (no existing governance)
    $(basename "$0") --config=./governance.config.yaml

    # Existing project with .cursorrules (RECOMMENDED)
    $(basename "$0") --migrate --config=./governance.config.yaml

    # Force overwrite (dangerous)
    $(basename "$0") --force
EOF
    exit 0
}

# ==============================================================================
# Parse Arguments
# ==============================================================================

while [[ $# -gt 0 ]]; do
    case $1 in
        --config=*)
            CONFIG_FILE="${1#*=}"
            shift
            ;;
        --scaffold-only)
            SCAFFOLD_ONLY=true
            shift
            ;;
        --force)
            FORCE=true
            shift
            ;;
        --non-interactive)
            NON_INTERACTIVE=true
            shift
            ;;
        --migrate)
            MIGRATE=true
            shift
            ;;
        -h|--help)
            usage
            ;;
        *)
            log_error "Unknown option: $1"
            usage
            ;;
    esac
done

# ==============================================================================
# Pre-flight Checks
# ==============================================================================

log_info "Starting AI Project Governance initialization..."

# Check if we're in a git repository
if ! git rev-parse --git-dir > /dev/null 2>&1; then
    log_error "Not in a git repository. Please run 'git init' first."
    exit 1
fi

# ==============================================================================
# Detect Existing Configuration
# ==============================================================================

EXISTING_FILES=()
[[ -d ".ai" ]] && EXISTING_FILES+=(".ai/")
[[ -f ".cursorrules" ]] && EXISTING_FILES+=(".cursorrules")
[[ -f "AGENTS.md" ]] && EXISTING_FILES+=("AGENTS.md")
[[ -d ".cursor/rules/.task-magic" ]] && EXISTING_FILES+=(".cursor/rules/.task-magic/")
[[ -f "governance.config.yaml" ]] && EXISTING_FILES+=("governance.config.yaml")

if [[ ${#EXISTING_FILES[@]} -gt 0 ]]; then
    log_warn "Existing governance files detected:"
    for f in "${EXISTING_FILES[@]}"; do
        echo "  - $f"
    done
    echo ""
    
    if [[ "$MIGRATE" == "true" ]]; then
        # Create backup
        BACKUP_DIR=".governance-backup-$(date +%Y%m%d-%H%M%S)"
        log_info "Creating backup in $BACKUP_DIR/"
        mkdir -p "$BACKUP_DIR"
        
        for f in "${EXISTING_FILES[@]}"; do
            if [[ -e "$f" ]]; then
                cp -r "$f" "$BACKUP_DIR/"
                log_success "Backed up: $f"
            fi
        done
        
        echo ""
        log_info "Backup complete. Proceeding with installation..."
        log_info "After installation, review:"
        echo "  1. Compare $BACKUP_DIR/.cursorrules with new .cursorrules"
        echo "  2. Merge any custom rules you want to keep"
        echo "  3. Delete backup when satisfied: rm -rf $BACKUP_DIR"
        echo ""
        
    elif [[ "$FORCE" == "true" ]]; then
        log_warn "Force mode: existing files will be OVERWRITTEN without backup!"
        
    else
        # Interactive mode
        if [[ "$NON_INTERACTIVE" == "true" ]]; then
            log_error "Existing files detected. Use --migrate (recommended) or --force."
            exit 1
        fi
        
        echo ""
        echo "Options:"
        echo "  1. --migrate  : Backup existing files, then install (RECOMMENDED)"
        echo "  2. --force    : Overwrite without backup (DANGEROUS)"
        echo "  3. Cancel     : Exit and review existing files first"
        echo ""
        read -p "Proceed with backup and install? (y/N): " confirm
        if [[ "$confirm" == "y" || "$confirm" == "Y" ]]; then
            MIGRATE=true
            BACKUP_DIR=".governance-backup-$(date +%Y%m%d-%H%M%S)"
            mkdir -p "$BACKUP_DIR"
            for f in "${EXISTING_FILES[@]}"; do
                [[ -e "$f" ]] && cp -r "$f" "$BACKUP_DIR/"
            done
            log_success "Backup created: $BACKUP_DIR/"
        else
            log_info "Aborted. Review existing files or use --migrate."
            exit 0
        fi
    fi
fi

# Check for existing .ai directory (legacy check for non-migrate mode)
if [[ -d ".ai" ]] && [[ "$FORCE" != "true" ]] && [[ "$MIGRATE" != "true" ]]; then
    log_warn ".ai/ directory already exists."
    if [[ "$NON_INTERACTIVE" == "true" ]]; then
        log_error "Use --force to overwrite in non-interactive mode."
        exit 1
    fi
    read -p "Overwrite? (y/N): " confirm
    if [[ "$confirm" != "y" && "$confirm" != "Y" ]]; then
        log_info "Aborted."
        exit 0
    fi
fi

# ==============================================================================
# Cross-Platform Helpers
# ==============================================================================

# Cross-platform sed -i (BSD vs GNU)
sed_inplace() {
    if [[ "$(uname)" == "Darwin" ]]; then
        sed -i '' "$@"
    else
        sed -i "$@"
    fi
}

# Simple YAML value extraction (no yq dependency)
get_yaml_value() {
    local file="$1"
    local key="$2"
    grep "^${key}:" "$file" 2>/dev/null | head -1 | sed 's/^[^:]*:[[:space:]]*//' | sed 's/^"//' | sed 's/"$//' | sed "s/^'//" | sed "s/'$//"
}

# ==============================================================================
# Phase 1: Create Directory Structure
# ==============================================================================

log_info "Creating directory structure..."

# .ai directories
mkdir -p .ai/_WORKFLOW
mkdir -p .ai/runtime
mkdir -p .ai/workflows/documentation
mkdir -p .ai/roles/CODE_DOCUMENTATOR
mkdir -p .ai/roles/USER_DOCUMENTATOR
mkdir -p .ai/prompts/_templates
mkdir -p .ai/plans/features
mkdir -p .ai/tasks
mkdir -p .ai/ADR
mkdir -p .ai/CHANGELOGS
mkdir -p .ai/COMPLIANCE
mkdir -p .ai/DECISIONS
mkdir -p .ai/DEPENDENCIES
mkdir -p .ai/_PLANS_VALIDATIONS
mkdir -p .ai/memory
mkdir -p .ai/reports/documentation

# docs directories
mkdir -p docs-FINAL/DEBUGGING
mkdir -p docs/DANGEROUS_OPERATIONS
mkdir -p docs/MAPPINGS
mkdir -p docs/BACKEND

# cursor directories
mkdir -p .cursor/rules/.task-magic

log_success "Directory structure created."

if [[ "$SCAFFOLD_ONLY" == "true" ]]; then
    log_success "Scaffold complete. Run without --scaffold-only to copy files."
    exit 0
fi

# ==============================================================================
# Phase 2: Copy Core Governance Files
# ==============================================================================

log_info "Copying core governance files..."

# Workflow system
if [[ -d "$GOVERNANCE_ROOT/core/workflow" ]]; then
    cp "$GOVERNANCE_ROOT/core/workflow/"* .ai/_WORKFLOW/ 2>/dev/null || true
    log_success "Workflow system copied to .ai/_WORKFLOW/"
fi

# Runtime guards
if [[ -d "$GOVERNANCE_ROOT/core/runtime" ]]; then
    cp "$GOVERNANCE_ROOT/core/runtime/"* .ai/runtime/ 2>/dev/null || true
    log_success "Runtime guards copied to .ai/runtime/"
fi

# Role definitions
if [[ -d "$GOVERNANCE_ROOT/core/roles" ]]; then
    cp "$GOVERNANCE_ROOT/core/roles/"* .ai/roles/ 2>/dev/null || true
    log_success "Role definitions copied to .ai/roles/"
fi

# Prompt templates
if [[ -d "$GOVERNANCE_ROOT/prompts" ]]; then
    cp -r "$GOVERNANCE_ROOT/prompts/"* .ai/prompts/_templates/ 2>/dev/null || true
    log_success "Prompt templates copied to .ai/prompts/_templates/"
fi

# Compliance templates
if [[ -d "$GOVERNANCE_ROOT/core/compliance" ]]; then
    cp "$GOVERNANCE_ROOT/core/compliance/"* .ai/COMPLIANCE/ 2>/dev/null || true
fi

# Decision templates
if [[ -d "$GOVERNANCE_ROOT/core/decisions" ]]; then
    cp "$GOVERNANCE_ROOT/core/decisions/"* .ai/DECISIONS/ 2>/dev/null || true
fi

# Dependency templates
if [[ -d "$GOVERNANCE_ROOT/core/dependencies" ]]; then
    cp "$GOVERNANCE_ROOT/core/dependencies/"* .ai/DEPENDENCIES/ 2>/dev/null || true
fi

# ==============================================================================
# Phase 3: Copy Bootstrap Templates
# ==============================================================================

log_info "Copying bootstrap templates..."

# docs-FINAL templates
if [[ -d "$GOVERNANCE_ROOT/bootstrap/templates/docs-FINAL" ]]; then
    for f in "$GOVERNANCE_ROOT/bootstrap/templates/docs-FINAL/"*.template.md; do
        if [[ -f "$f" ]]; then
            basename_f=$(basename "$f")
            new_name="${basename_f%.template.md}.md"
            cp "$f" "docs-FINAL/$new_name"
        fi
    done
    log_success "docs-FINAL templates copied."
fi

# docs templates
if [[ -d "$GOVERNANCE_ROOT/bootstrap/templates/docs" ]]; then
    cp "$GOVERNANCE_ROOT/bootstrap/templates/docs/"*.md docs/ 2>/dev/null || true
    log_success "docs templates copied."
fi

# cursor rules
if [[ -f "$GOVERNANCE_ROOT/bootstrap/templates/.cursor/rules/after_each_chat.mdc" ]]; then
    cp "$GOVERNANCE_ROOT/bootstrap/templates/.cursor/rules/after_each_chat.mdc" .cursor/rules/
fi

# ==============================================================================
# Phase 4: Create Adapter Files
# ==============================================================================

log_info "Creating adapter files..."

# Check for existing .cursorrules
if [[ ! -f ".cursorrules" ]] || [[ "$FORCE" == "true" ]] || [[ "$MIGRATE" == "true" ]]; then
    if [[ -f "$GOVERNANCE_ROOT/adapters/cursorrules/base.cursorrules" ]]; then
        cp "$GOVERNANCE_ROOT/adapters/cursorrules/base.cursorrules" .cursorrules
        log_success ".cursorrules created from base template."
        if [[ -n "$BACKUP_DIR" ]] && [[ -f "$BACKUP_DIR/.cursorrules" ]]; then
            log_warn "⚠️  Your previous .cursorrules is in $BACKUP_DIR/"
            log_warn "   Review and merge any custom rules you want to keep."
        fi
    fi
else
    log_info ".cursorrules exists — skipping (use --migrate to backup and replace)."
fi

# Check for existing AGENTS.md
if [[ ! -f "AGENTS.md" ]] || [[ "$FORCE" == "true" ]] || [[ "$MIGRATE" == "true" ]]; then
    if [[ -f "$GOVERNANCE_ROOT/adapters/agents/base.AGENTS.md" ]]; then
        cp "$GOVERNANCE_ROOT/adapters/agents/base.AGENTS.md" AGENTS.md
        log_success "AGENTS.md created from base template."
        if [[ -n "$BACKUP_DIR" ]] && [[ -f "$BACKUP_DIR/AGENTS.md" ]]; then
            log_warn "⚠️  Your previous AGENTS.md is in $BACKUP_DIR/"
            log_warn "   Review and merge any custom sections you want to keep."
        fi
    fi
else
    log_info "AGENTS.md exists — skipping (use --migrate to backup and replace)."
fi

# Task magic
if [[ -d "$GOVERNANCE_ROOT/adapters/task-magic" ]]; then
    if [[ -d ".cursor/rules/.task-magic" ]] && [[ -n "$(ls -A .cursor/rules/.task-magic 2>/dev/null)" ]]; then
        if [[ "$FORCE" != "true" ]] && [[ "$MIGRATE" != "true" ]]; then
            log_warn ".cursor/rules/.task-magic/ has existing files — will be merged."
        fi
    fi
    cp "$GOVERNANCE_ROOT/adapters/task-magic/"* .cursor/rules/.task-magic/ 2>/dev/null || true
    log_success "Task magic rules copied to .cursor/rules/.task-magic/"
    if [[ -n "$BACKUP_DIR" ]] && [[ -d "$BACKUP_DIR/.cursor/rules/.task-magic" ]]; then
        log_warn "⚠️  Your previous task-magic files are in $BACKUP_DIR/.cursor/rules/.task-magic/"
    fi
fi

# ==============================================================================
# Phase 5: Create Initial Files
# ==============================================================================

log_info "Creating initial files..."

# Create TASKS.md
if [[ ! -f ".ai/TASKS.md" ]]; then
    cat > .ai/TASKS.md << EOF
# Project Tasks

**Generated**: $(date +%Y-%m-%d)
**Project**: {{PROJECT_NAME}}

---

## 📋 ACTIVE TASKS

### High Priority

(No tasks yet - use @workflow PLANNER to create feature plans)

### Medium Priority

(Empty)

### Low Priority

(Empty)

---

## 📦 COMPLETED TASKS

(None yet)
EOF
    log_success "TASKS.md created."
fi

# Create initial changelog
TODAY=$(date +%Y-%m-%d)
if [[ ! -f ".ai/CHANGELOGS/${TODAY}.snapshot.md" ]]; then
    cat > ".ai/CHANGELOGS/${TODAY}.snapshot.md" << EOF
# Changelog Snapshot: ${TODAY}

**Generated**: ${TODAY}
**System**: {{PROJECT_NAME}}

---

## AI Governance Bootstrap

**Status**: ✅ COMPLETE
**Type**: Configuration

### Summary

Initialized AI project governance framework v1.0.0.

### Files Created

- \`.ai/\` directory structure
- \`.cursorrules\`
- \`AGENTS.md\`
- \`docs-FINAL/\` navigation
- \`docs/AI_PLANNER_GUARDRAILS.md\`

---
EOF
    log_success "Initial changelog created."
fi

# ==============================================================================
# Phase 6: Config-Based Placeholder Replacement (Optional)
# ==============================================================================

if [[ -n "$CONFIG_FILE" && -f "$CONFIG_FILE" ]]; then
    log_info "Applying configuration from $CONFIG_FILE..."
    
    # Extract values from config
    PROJECT_NAME=$(get_yaml_value "$CONFIG_FILE" "name")
    PROJECT_DISPLAY_NAME=$(get_yaml_value "$CONFIG_FILE" "display_name")
    TECH_STACK=$(get_yaml_value "$CONFIG_FILE" "stack")
    
    if [[ -n "$PROJECT_NAME" ]]; then
        # Replace in .cursorrules
        if [[ -f ".cursorrules" ]]; then
            sed_inplace "s/{{PROJECT_NAME}}/$PROJECT_NAME/g" .cursorrules
            log_success "Replaced {{PROJECT_NAME}} in .cursorrules"
        fi
        
        # Replace in AGENTS.md
        if [[ -f "AGENTS.md" ]]; then
            sed_inplace "s/{{PROJECT_NAME}}/$PROJECT_NAME/g" AGENTS.md
            log_success "Replaced {{PROJECT_NAME}} in AGENTS.md"
        fi
        
        # Replace in TASKS.md
        if [[ -f ".ai/TASKS.md" ]]; then
            sed_inplace "s/{{PROJECT_NAME}}/$PROJECT_NAME/g" .ai/TASKS.md
        fi
        
        # Replace in changelog
        for f in .ai/CHANGELOGS/*.md; do
            if [[ -f "$f" ]]; then
                sed_inplace "s/{{PROJECT_NAME}}/$PROJECT_NAME/g" "$f"
            fi
        done
    fi
    
    if [[ -n "$PROJECT_DISPLAY_NAME" ]]; then
        if [[ -f ".cursorrules" ]]; then
            sed_inplace "s/{{PROJECT_DISPLAY_NAME}}/$PROJECT_DISPLAY_NAME/g" .cursorrules
        fi
    fi
    
    if [[ -n "$TECH_STACK" ]]; then
        if [[ -f ".cursorrules" ]]; then
            sed_inplace "s/{{TECH_STACK}}/$TECH_STACK/g" .cursorrules
        fi
    fi
    
    log_success "Configuration applied."
else
    if [[ -n "$CONFIG_FILE" ]]; then
        log_warn "Config file not found: $CONFIG_FILE"
    fi
    log_info "No config file provided. Remember to replace {{PLACEHOLDERS}} manually."
fi

# ==============================================================================
# Phase 7: Summary
# ==============================================================================

echo ""
log_success "=========================================="
log_success "AI Project Governance initialized!"
log_success "=========================================="
echo ""
if [[ -n "$CONFIG_FILE" && -f "$CONFIG_FILE" ]]; then
    log_info "Placeholders replaced from config. Verify with:"
    echo "  grep -r '{{' .cursorrules AGENTS.md"
else
    log_info "Next steps:"
    echo "  1. Edit .cursorrules and replace {{PLACEHOLDERS}}"
    echo "  2. Edit AGENTS.md and replace {{PLACEHOLDERS}}"
    echo "  3. Or: Re-run with --config=governance.config.yaml"
fi
echo ""
echo "  4. Commit: git add .ai/ .cursor/ .cursorrules AGENTS.md docs-FINAL/ docs/"
echo "  5. Run: @workflow PLANNER to create your first feature plan"
echo ""
log_info "Validation: Run $GOVERNANCE_ROOT/bootstrap/scripts/validate.sh"
echo ""
