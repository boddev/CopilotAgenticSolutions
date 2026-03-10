# Copilot Agentic Solutions

This repository is the central installer hub for **Microsoft 365 Copilot Agentic Solutions** — a collection of industry-specific multi-agent systems built on the Microsoft 365 Copilot platform.

Use the interactive installer to select and deploy any of the available solutions to your Microsoft 365 tenant.

## Quick Start

```powershell
.\Install-CopilotSolution.ps1
```

The installer presents a menu to choose which solution to deploy, then seamlessly launches the corresponding solution's install script.

## Available Solutions

| Solution | Description | Repository |
|---|---|---|
| **Copilot for Financial Services (FSI)** | 20 declarative agents for investment banking — comparable analysis, DCF modelling, due diligence, earnings analysis, and more. | [boddev/CopilotFSI](https://github.com/boddev/CopilotFSI) |
| **Copilot for Health & Life Sciences (HLS)** | Multi-agent solution for regulated life-sciences teams — literature review, bioinformatics, regulatory compliance, protocol drafting, and scientific knowledge integration. | [boddev/CopilotHLS](https://github.com/boddev/CopilotHLS) |
| **Copilot for Legal** | 8 agents for legal operations — contract review, NDA triage, compliance & privacy, briefing, response drafting, matter operations, and risk escalation. | [boddev/CopilotLegal](https://github.com/boddev/CopilotLegal) |
| **Copilot for Retail** | 7-agent retail solution with a custom-engine orchestrator — merchandising, store ops, supply chain, workforce, customer engagement, and pricing analytics. *(Still in development)* | [boddev/CopilotRetail](https://github.com/boddev/CopilotRetail) |

## Prerequisites

- **PowerShell 7+**
- **Microsoft 365 Agents Toolkit CLI (`atk`)** — required by most solution installers
- **Teams App CLI (`teamsapp`)** — required for sideloading
- A Microsoft 365 tenant with Copilot licensing

Each solution may have additional prerequisites; refer to the individual repository README for details.

## Repository Structure

```
CopilotAgentSolutions/
├── Install-CopilotSolution.ps1   # Interactive solution selector & installer
├── README.md                     # This file
├── CopilotFSI/                   # git submodule → boddev/CopilotFSI
├── CopilotHLS/                   # git submodule → boddev/CopilotHLS
├── CopilotLegal/                 # git submodule → boddev/CopilotLegal
└── CopilotRetail/                # git submodule → boddev/CopilotRetail
```

> **Note:** The solution subdirectories are separate Git repositories. This umbrella repo contains only the installer script and this README. Clone the individual repos (or add them as submodules) to use the installer.

## License

See individual solution repositories for license details.
