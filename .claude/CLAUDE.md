{
  "config": {
    "name": ".claude",
    "path": "~/.claude",
    "type": "config",
    "desc": "Claude Code configuration repository containing global environment schema (CLAUDE.md), Pydantic validator, custom skills, hooks, and settings",
    "github": "ariperez/.claude",
    "stack": ["python", "json"]
  },
  "CLI": {
    "cli_framework": {
      "name": "cli_framework",
      "path": "~/cli_framework",
      "type": "library",
      "desc": "Declarative infrastructure library providing metadata-driven command discovery, routing, execution, and output management with integrated HTTP clients, error handling, and configuration",
      "github": "coa-solutions/cli_framework",
      "stack": ["python", "uv", "pyenv"],
      "tool_clis": [
        {
          "name": "tools",
          "path": "~/tools",
          "type": "cli",
          "desc": "API-based GitHub PR management and Vercel deployment automation without external CLI dependencies",
          "github": "coa-solutions/tools",
          "stack": ["python", "uv", "pyenv"]
        },
        {
          "name": "docs",
          "path": "~/docs",
          "type": "cli",
          "desc": "Documentation sync tool that converts API docs (React, Vite, GitHub, Vercel, Google Slides, Oracle FHIR) to markdown using Claude with streaming progress and cost tracking",
          "github": "coa-solutions/docs",
          "stack": ["python", "react", "vite", "vercel", "tailwind"]
        }
      ],
      "coa_clis": [
        {
          "name": "ops",
          "path": "~/ops",
          "type": "cli",
          "desc": "Business operations interface managing accounting, payroll, people records, and documents through Mercury (banking) and Gusto (HR/payroll) integrations",
          "github": "coa-solutions/ops",
          "stack": ["python", "uv", "pyenv"]
        },
        {
          "name": "pathlens",
          "path": "~/pathlens",
          "type": "cli",
          "desc": "EHR-embedded diagnostic intelligence platform for veteran pathology and lab results, with Google Slides presentation management and Oracle FHIR healthcare data access",
          "github": "coa-solutions/pathlens",
          "stack": ["python", "uv", "pyenv"]
        },
        {
          "name": "va",
          "path": "~/va",
          "type": "cli",
          "desc": "Generic HTTP interface for VA Lighthouse API providing authenticated access to veteran healthcare, benefits, facilities, and forms data in sandbox and production environments",
          "github": "coa-solutions/va",
          "stack": ["python", "uv", "pyenv"]
        },
        {
          "name": "vr-recovery",
          "path": "~/vr-recovery",
          "type": "cli",
          "desc": "Veteran recovery case management interface for tracking recovery cases with status and client information",
          "github": "coa-solutions/vr-recovery",
          "stack": ["python", "uv", "pyenv"]
        }
      ],
      "ari_clis": [
        {
          "name": "home",
          "path": "~/home",
          "type": "cli",
          "desc": "[PRIVATE] Residential property management cataloging floors, rooms, systems (HVAC, plumbing, electrical), exterior components, and multimedia documentation with React frontend",
          "github": "ariperez/home",
          "stack": ["python", "uv", "pyenv", "react", "vite"]
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
  },
  "env": {
    "python_version": "3.11.11",
    "python_manager": "pyenv",
    "package_manager": "uv",
    "install_mode": "editable",
    "venv_disabled": true,
    "uv_project_environment": "/Users/ariperez/.pyenv/versions/3.11.11"
  }
}
