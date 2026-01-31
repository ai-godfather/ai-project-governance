<!--
AI Project Governance Framework

Author & Contact: https://x.com/God_FatherAI
License: MIT (see LICENSE file in project root)
-->

# Prompt Builder — Runtime Template Expansion

> **Version**: 1.0.0  
> **Status**: AUTOMATION ACTIVE  
> **Purpose**: Expand prompt templates with runtime parameters

---

## Overview

The Prompt Builder takes a template and context, and produces an expanded prompt
ready for execution by an AI agent role.

---

## Input Parameters

| Parameter | Type | Description |
|-----------|------|-------------|
| `template` | string | Path to template file |
| `mode` | string | Operation mode (CREATE, UPDATE, AUDIT, etc.) |
| `routeUrl` | string | Target route URL |
| `routePath` | string | Target route path |
| `uiVersion` | string | Resolved UI version |
| `applicationName` | string | Project/application name |
| `featureCode` | string | Feature code (e.g., ADMIN_001) |

---

## Template Loading

```python
def load_template(role: str, mode: str) -> str:
    """
    Load template from standard location.
    """
    template_paths = [
        f".ai/prompts/_templates/{role}_{mode}.template.md",
        f".ai/prompts/_templates/{role}/{mode}.template.md",
        f".ai/prompts/_templates/{role}_PROMPT_TEMPLATE.md"
    ]
    
    for path in template_paths:
        if file_exists(path):
            return read_file(path)
    
    raise TemplateNotFoundError(f"No template found for {role}/{mode}")
```

---

## Placeholder Injection

### Standard Placeholders

| Placeholder | Source |
|-------------|--------|
| `{{ROUTE_URL}}` | routeUrl parameter |
| `{{ROUTE_PATH}}` | routePath parameter |
| `{{UI_VERSION}}` | uiVersion (auto-resolved) |
| `{{APPLICATION_NAME}}` | applicationName parameter |
| `{{FEATURE_CODE}}` | featureCode parameter |
| `{{EXECUTION_TIMESTAMP}}` | Current ISO timestamp |
| `{{WORKFLOW_ID}}` | Unique execution ID |
| `{{CALLING_ROLE}}` | Role that invoked this role |

### Injection Algorithm

```python
def inject_placeholders(template: str, context: dict) -> str:
    """
    Replace all {{PLACEHOLDER}} with values from context.
    """
    result = template
    
    for key, value in context.items():
        placeholder = f"{{{{{key.upper()}}}}}"
        result = result.replace(placeholder, str(value))
    
    # Add runtime metadata
    result = result.replace("{{EXECUTION_TIMESTAMP}}", datetime.now().isoformat())
    result = result.replace("{{WORKFLOW_ID}}", generate_uuid())
    
    return result
```

---

## Runtime Metadata Injection

```python
def inject_runtime_metadata(template: str, calling_role: str) -> str:
    """
    Inject runtime-specific metadata.
    """
    metadata = {
        "EXECUTION_TIMESTAMP": datetime.now().isoformat(),
        "WORKFLOW_ID": generate_uuid(),
        "CALLING_ROLE": calling_role,
        "SYSTEM_VERSION": get_workflow_version()
    }
    
    for key, value in metadata.items():
        template = template.replace(f"{{{{{key}}}}}", value)
    
    return template
```

---

## Build Process

### Complete Build Flow

```python
def build_prompt(role: str, mode: str, context: dict) -> str:
    """
    Complete prompt build process.
    """
    # 1. Load template
    template = load_template(role, mode)
    
    # 2. Inject parameters
    expanded = inject_placeholders(template, context)
    
    # 3. Inject runtime metadata
    expanded = inject_runtime_metadata(expanded, context.get('calling_role', 'DIRECT'))
    
    # 4. Validate (no remaining placeholders)
    remaining = find_remaining_placeholders(expanded)
    if remaining:
        raise PlaceholderError(f"Unresolved placeholders: {remaining}")
    
    return expanded
```

---

## Example: USER_DOCUMENTATOR CREATE

### Input

```python
context = {
    "mode": "CREATE",
    "route_url": "/admin/dashboard",
    "route_path": "admin/src/pages/AdminDashboard.tsx",
    "ui_version": "git:abc1234",
    "application_name": "MyProject"
}
```

### Template Load

```
.ai/prompts/_templates/USER_DOCUMENTATOR/CREATE.template.md
```

### Output

Fully expanded prompt with all placeholders resolved.

---

## Persistence

**IMPORTANT**: Expanded prompts are **EPHEMERAL**.

- No file is persisted with the expanded prompt
- Prompts are generated on-demand
- Templates are the source of truth
- Execution logs may capture the expanded prompt for debugging

---

## Error Handling

| Error | Handling |
|-------|----------|
| Template not found | Raise `TemplateNotFoundError` |
| Unresolved placeholder | Raise `PlaceholderError` |
| Invalid context | Raise `ContextValidationError` |

---

## Integration

### Workflow Invocation

```markdown
@workflow USER_DOCUMENTATOR CREATE --route="/dashboard"

↓ Prompt Builder executes ↓

1. Load CREATE.template.md
2. Inject --route into {{ROUTE_URL}}
3. Resolve UI version
4. Execute role with expanded prompt
```

---

**Canonical Reference**: This file  
**Related**: 
- `core/runtime/ui-version-resolver.md`
- `.ai/prompts/_templates/`
