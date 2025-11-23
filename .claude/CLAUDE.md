{
  "dev": {
    "python": "3.11.11",
    "manager": "uv",
    "install": "cd ~/<cli> && uv pip install --python $UV_PROJECT_ENVIRONMENT/bin/python3.11 -e .",
    "uv_env": "/Users/ariperez/.local/share/uv/python/cpython-3.11.11-macos-aarch64-none",
    "pattern": "<cli> <command> (e.g., ops accounting ledger --period ytd)",
    "structure": "src/<name>/__main__.py \u2192 CLI_METADATA, commands in src/<name>/_<namespace>/",
    "framework": "All CLIs import ~/cli_framework as editable dependency (../cli_framework in pyproject.toml)",
    "notes": "be a good maintainer, if something is clearly broke, fix it"
  },
  "docs": {
    "index": "~/docs/DOCS.json",
    "provider_docs": "~/docs/{provider}/DOCS.json",
    "stack_to_provider": {
      "claude-code": "claude-code",
      "mercury": "api/mercury",
      "oracle-fhir": "api/oracle-fhir",
      "google-slides": "api/google-slides",
      "va-lighthouse": "api/va-lighthouse",
      "anthropic": "api/anthropic",
      "vercel": "infra/vercel",
      "github": "infra/github",
      "uv": "python/uv",
      "xterm": "javascript/xterm",
      "react": "javascript/react",
      "tailwind": "css/tailwind",
      "vite": "frontend-build/vite"
    }
  },
  "vscode_extensions": {
    "docs-json-links": "~/vscode-extensions/docs-json-links/ - Makes DOCS.json paths clickable"
  },
  "config": {
    "name": ".claude",
    "path": "~/.claude",
    "type": "config",
    "desc": "Claude Code configuration repository containing global environment schema (CLAUDE.md), Pydantic validator, custom skills, hooks, and settings",
    "github": "ariperez/.claude",
    "stack": [
      "python",
      "json"
    ]
  },
  "CLI": {
    "cli_framework": {
      "name": "cli_framework",
      "path": "~/cli_framework",
      "type": "library",
      "desc": "Declarative infrastructure library providing metadata-driven command discovery, routing, execution, and output management with integrated HTTP clients, error handling, and configuration",
      "scaffold": "cli_scaffold new <name> - Generate new CLI projects with proper structure",
      "github": "coa-solutions/cli_framework",
      "tool_clis": [
        {
          "name": "tools",
          "path": "~/tools",
          "type": "cli",
          "desc": "API-based GitHub PR management and Vercel deployment automation without external CLI dependencies",
          "github": "coa-solutions/tools"
        },
        {
          "name": "docs",
          "path": "~/docs",
          "type": "cli",
          "desc": "Documentation sync tool that converts API docs (React, Vite, GitHub, Vercel, Google Slides, Oracle FHIR) to markdown using Claude with streaming progress and cost tracking",
          "github": "coa-solutions/docs",
          "stack": [
            "react",
            "vite",
            "vercel",
            "tailwind"
          ]
        }
      ],
      "coa_clis": [
        {
          "name": "ops",
          "path": "~/ops",
          "type": "cli",
          "desc": "Business operations interface managing accounting, payroll, people records, and documents through Mercury (banking) and Gusto (HR/payroll) integrations",
          "github": "coa-solutions/ops"
        },
        {
          "name": "pathlens",
          "path": "~/pathlens",
          "type": "cli",
          "desc": "EHR-embedded diagnostic intelligence platform for veteran pathology and lab results, with Google Slides presentation management and Oracle FHIR healthcare data access",
          "github": "coa-solutions/pathlens"
        },
        {
          "name": "va",
          "path": "~/va",
          "type": "cli",
          "desc": "Generic HTTP interface for VA Lighthouse API providing authenticated access to veteran healthcare, benefits, facilities, and forms data in sandbox and production environments",
          "github": "coa-solutions/va"
        },
        {
          "name": "vr-recovery",
          "path": "~/vr-recovery",
          "type": "cli",
          "desc": "Veteran recovery case management interface for tracking recovery cases with status and client information",
          "github": "coa-solutions/vr-recovery"
        }
      ],
      "ari_clis": [
        {
          "name": "home",
          "path": "~/home",
          "type": "cli",
          "desc": "[PRIVATE] Residential property management cataloging floors, rooms, systems (HVAC, plumbing, electrical), exterior components, and multimedia documentation with React frontend",
          "github": "ariperez/home",
          "stack": [
            "react",
            "vite"
          ]
        },
        {
          "name": "medical",
          "path": "~/medical",
          "type": "data",
          "desc": "[PRIVATE] Personal medical records archive extracting and analyzing scanned military medical documents (West Point 2001-2002) into structured markdown with clinical encounters, lab results, and diagnostics",
          "github": "ariperez/medical"
        }
      ]
    }
  }
}
