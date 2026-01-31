#!/usr/bin/env bash

# =============================================================================
# AI Project Governance Framework
#
# Author & Contact: https://x.com/God_FatherAI
# License: MIT (see LICENSE file in project root)
# =============================================================================

# =============================================================================
# AI Project Governance - Validation Script
# =============================================================================
# Validates that governance framework was properly installed.
#
# Usage:
#   ./validate.sh [OPTIONS]
#
# Options:
#   --verbose    Show detailed output
#   --strict     Treat warnings as errors
#   --help       Show this help message
# =============================================================================

set -euo pipefail

# Colors
RED='\033[0;31m'
GREEN='\033[0;32m'
YELLOW='\033[1;33m'
NC='\033[0m' # No Color

# Counters
PASS=0
FAIL=0
WARN=0
VERBOSE=false
STRICT=false

# =============================================================================
# Helper Functions
# =============================================================================

log_pass() {
    echo -e "${GREEN}✅ PASS${NC}: $1"
    ((PASS++))
}

log_fail() {
    echo -e "${RED}❌ FAIL${NC}: $1"
    ((FAIL++))
}

log_warn() {
    echo -e "${YELLOW}⚠️ WARN${NC}: $1"
    ((WARN++))
}

log_info() {
    if [[ "$VERBOSE" == true ]]; then
        echo -e "ℹ️  INFO: $1"
    fi
}

show_help() {
    head -25 "$0" | tail -n +2 | sed 's/^# //' | sed 's/^#//'
    exit 0
}

# =============================================================================
# Argument Parsing
# =============================================================================

while [[ $# -gt 0 ]]; do
    case $1 in
        --verbose)
            VERBOSE=true
            shift
            ;;
        --strict)
            STRICT=true
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

# =============================================================================
# Validation Checks
# =============================================================================

echo ""
echo "🔍 AI Project Governance - Validation"
echo "======================================"
echo ""

# Check required directories
echo "📁 Checking required directories..."

REQUIRED_DIRS=(
    ".ai"
    ".ai/_WORKFLOW"
    ".ai/plans"
    ".ai/plans/features"
    ".ai/tasks"
    ".ai/CHANGELOGS"
)

for dir in "${REQUIRED_DIRS[@]}"; do
    if [[ -d "$dir" ]]; then
        log_pass "Directory exists: $dir"
    else
        log_fail "Missing directory: $dir"
    fi
done

echo ""

# Check required files
echo "📄 Checking required files..."

REQUIRED_FILES=(
    ".cursorrules"
    "AGENTS.md"
    ".ai/TASKS.md"
    ".ai/_WORKFLOW/README.md"
    "docs/AI_PLANNER_GUARDRAILS.md"
)

for file in "${REQUIRED_FILES[@]}"; do
    if [[ -f "$file" ]]; then
        log_pass "File exists: $file"
    else
        log_fail "Missing file: $file"
    fi
done

echo ""

# Check for remaining placeholders in critical files
echo "🔎 Checking for unresolved placeholders..."

CRITICAL_FILES=(
    ".cursorrules"
    "AGENTS.md"
)

for file in "${CRITICAL_FILES[@]}"; do
    if [[ -f "$file" ]]; then
        # Check for {{PLACEHOLDER}} patterns
        if grep -q '{{' "$file" 2>/dev/null; then
            PLACEHOLDERS=$(grep -o '{{[^}]*}}' "$file" | sort -u | head -5)
            log_warn "Unresolved placeholders in $file: $PLACEHOLDERS"
        else
            log_pass "No unresolved placeholders in $file"
        fi
    fi
done

echo ""

# Check workflow file count
echo "📊 Checking workflow documentation..."

WORKFLOW_DIR=".ai/_WORKFLOW"
if [[ -d "$WORKFLOW_DIR" ]]; then
    FILE_COUNT=$(find "$WORKFLOW_DIR" -maxdepth 1 -name "*.md" | wc -l | tr -d ' ')
    if [[ $FILE_COUNT -ge 5 ]]; then
        log_pass "Workflow directory has $FILE_COUNT files"
    else
        log_warn "Workflow directory only has $FILE_COUNT files (expected 5+)"
    fi
else
    log_fail "Workflow directory missing"
fi

echo ""

# Check for broken internal links (basic check)
echo "🔗 Checking internal links..."

DOCS_WITH_LINKS=(
    ".ai/_WORKFLOW/README.md"
)

for doc in "${DOCS_WITH_LINKS[@]}"; do
    if [[ -f "$doc" ]]; then
        # Extract markdown links and check if files exist
        BROKEN=0
        while IFS= read -r link; do
            # Remove ./ prefix and check file existence
            TARGET=$(echo "$link" | sed 's|^\./||')
            FULL_PATH="$(dirname "$doc")/$TARGET"
            if [[ ! -f "$FULL_PATH" && ! -d "${FULL_PATH%.md}" ]]; then
                log_info "Possibly broken link in $doc: $link"
                ((BROKEN++)) || true
            fi
        done < <(grep -oE '\[.*\]\(([^)]+\.md)\)' "$doc" 2>/dev/null | grep -oE '\([^)]+\)' | tr -d '()' || true)
        
        if [[ $BROKEN -eq 0 ]]; then
            log_pass "No broken links detected in $doc"
        else
            log_warn "$BROKEN potentially broken link(s) in $doc"
        fi
    fi
done

echo ""

# =============================================================================
# Summary
# =============================================================================

echo "======================================"
echo "📋 VALIDATION SUMMARY"
echo "======================================"
echo ""
echo -e "  ${GREEN}PASS${NC}: $PASS"
echo -e "  ${RED}FAIL${NC}: $FAIL"
echo -e "  ${YELLOW}WARN${NC}: $WARN"
echo ""

if [[ $FAIL -gt 0 ]]; then
    echo -e "${RED}❌ VALIDATION FAILED${NC}"
    echo ""
    echo "Please fix the failing checks and run validation again."
    exit 1
elif [[ $STRICT == true && $WARN -gt 0 ]]; then
    echo -e "${YELLOW}⚠️ VALIDATION FAILED (strict mode)${NC}"
    echo ""
    echo "Warnings are treated as errors in strict mode."
    exit 1
else
    echo -e "${GREEN}✅ VALIDATION PASSED${NC}"
    echo ""
    if [[ $WARN -gt 0 ]]; then
        echo "Consider addressing the warnings above."
    fi
    exit 0
fi
