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

# =============================================================================
# AI Project Governance - Upgrade Script
# =============================================================================
# Upgrades governance framework to a new version while preserving customizations.
#
# Usage:
#   ./upgrade.sh [OPTIONS]
#
# Options:
#   --from=PATH     Path to new governance repo (required)
#   --dry-run       Show what would be done without making changes
#   --force         Overwrite even if local modifications exist
#   --help          Show this help message
# =============================================================================

set -euo pipefail

# Colors
RED='\033[0;31m'
GREEN='\033[0;32m'
YELLOW='\033[1;33m'
BLUE='\033[0;34m'
NC='\033[0m' # No Color

# Options
SOURCE_PATH=""
DRY_RUN=false
FORCE=false

# =============================================================================
# Helper Functions
# =============================================================================

log_info() {
    echo -e "${BLUE}ℹ️  INFO${NC}: $1"
}

log_success() {
    echo -e "${GREEN}✅ SUCCESS${NC}: $1"
}

log_warn() {
    echo -e "${YELLOW}⚠️ WARN${NC}: $1"
}

log_error() {
    echo -e "${RED}❌ ERROR${NC}: $1"
}

show_help() {
    head -18 "$0" | tail -n +2 | sed 's/^# //' | sed 's/^#//'
    exit 0
}

# =============================================================================
# Argument Parsing
# =============================================================================

while [[ $# -gt 0 ]]; do
    case $1 in
        --from=*)
            SOURCE_PATH="${1#*=}"
            shift
            ;;
        --dry-run)
            DRY_RUN=true
            shift
            ;;
        --force)
            FORCE=true
            shift
            ;;
        --help)
            show_help
            ;;
        *)
            echo "Unknown option: $1"
            show_help
            ;;
    esac
done

# Validate required arguments
if [[ -z "$SOURCE_PATH" ]]; then
    log_error "--from=PATH is required"
    echo ""
    show_help
fi

if [[ ! -d "$SOURCE_PATH" ]]; then
    log_error "Source path does not exist: $SOURCE_PATH"
    exit 1
fi

# =============================================================================
# Upgrade Process
# =============================================================================

echo ""
echo "🔄 AI Project Governance - Upgrade"
echo "======================================"
echo ""
echo "Source: $SOURCE_PATH"
echo "Dry Run: $DRY_RUN"
echo "Force: $FORCE"
echo ""

# Files that should NEVER be overwritten (project-specific)
PROTECTED_FILES=(
    ".cursorrules"
    "AGENTS.md"
    ".ai/TASKS.md"
    ".ai/CHANGELOGS/"
    ".ai/plans/features/"
    ".ai/tasks/"
    "docs/AI_PLANNER_GUARDRAILS.md"  # May have project customizations
)

# Files that should be upgraded (core governance)
UPGRADEABLE_PATHS=(
    ".ai/_WORKFLOW/"
    ".ai/runtime/"
    ".ai/prompts/_templates/"
)

log_info "Checking for local modifications..."

# Check if git is available and project is a repo
if git rev-parse --git-dir > /dev/null 2>&1; then
    # Check for uncommitted changes in upgradeable paths
    DIRTY_FILES=""
    for path in "${UPGRADEABLE_PATHS[@]}"; do
        if [[ -e "$path" ]]; then
            CHANGES=$(git status --porcelain "$path" 2>/dev/null || true)
            if [[ -n "$CHANGES" ]]; then
                DIRTY_FILES="$DIRTY_FILES\n$CHANGES"
            fi
        fi
    done
    
    if [[ -n "$DIRTY_FILES" && "$FORCE" != true ]]; then
        log_error "Uncommitted changes detected in governance files:"
        echo -e "$DIRTY_FILES"
        echo ""
        echo "Please commit or stash changes before upgrading."
        echo "Or use --force to overwrite."
        exit 1
    fi
else
    log_warn "Not a git repository. Cannot check for local modifications."
fi

# Perform upgrade
log_info "Upgrading governance files..."

for path in "${UPGRADEABLE_PATHS[@]}"; do
    SOURCE="$SOURCE_PATH/core/${path#.ai/}"
    if [[ ! -e "$SOURCE" ]]; then
        SOURCE="$SOURCE_PATH/$path"
    fi
    
    if [[ -e "$SOURCE" ]]; then
        if [[ "$DRY_RUN" == true ]]; then
            echo "  Would copy: $SOURCE → $path"
        else
            mkdir -p "$(dirname "$path")"
            if [[ -d "$SOURCE" ]]; then
                cp -r "$SOURCE"/* "$path/" 2>/dev/null || true
            else
                cp "$SOURCE" "$path"
            fi
            log_success "Updated: $path"
        fi
    else
        log_warn "Source not found: $SOURCE"
    fi
done

echo ""

if [[ "$DRY_RUN" == true ]]; then
    log_info "Dry run complete. No changes made."
else
    log_success "Upgrade complete!"
    echo ""
    echo "Next steps:"
    echo "  1. Review changes: git diff"
    echo "  2. Run validation: ./validate.sh"
    echo "  3. Commit changes: git commit -am 'chore: upgrade governance framework'"
fi
