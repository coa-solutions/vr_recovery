# VR Recovery

VR Recovery case management interface built with the COA CLI framework.

## Components

- **CLI**: Python-based command-line interface for case management
- **Website**: Static website for VR recovery information

## Setup

```bash
# Install dependencies
uv pip install --system -e .

# Run CLI
vr-recovery cases list
```

## Website

The website is deployed to Vercel at: https://vr-recovery-website.vercel.app

To deploy:
```bash
cd website
npx vercel deploy
```
