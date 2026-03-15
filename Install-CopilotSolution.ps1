<#
.SYNOPSIS
    Copilot Agent Solutions — interactive installer selector.

.DESCRIPTION
    Presents a menu of available Copilot solutions and launches the
    corresponding install script for the selected solution.
#>

[CmdletBinding()]
param()

$ErrorActionPreference = 'Stop'
$ScriptRoot = $PSScriptRoot

# ── Solution registry ────────────────────────────────────────────────────────
$Solutions = @(
    @{
        Key         = '1'
        Name        = 'Copilot for Financial Services (FSI)'
        ScriptPath  = Join-Path $ScriptRoot 'CopilotFSI\install\Install-FSICopilot.ps1'
        Available   = $true
    },
    @{
        Key         = '2'
        Name        = 'Copilot for Health & Life Sciences (HLS)'
        ScriptPath  = Join-Path $ScriptRoot 'CopilotHLS\CopilotHLS\scripts\Install-CopilotHLS.ps1'
        Available   = $true
    },
    @{
        Key         = '3'
        Name        = 'Copilot for Legal'
        ScriptPath  = Join-Path $ScriptRoot 'CopilotLegal\install\Install-LegalCopilot.ps1'
        Available   = $true
    },
    @{
        Key         = '4'
        Name        = 'Copilot for Retail'
        ScriptPath  = Join-Path $ScriptRoot 'CopilotRetail\install\Install-RetailCopilot.ps1'
        Available   = $true
    }
)

# ── Banner ───────────────────────────────────────────────────────────────────
function Show-Banner {
    Write-Host ""
    Write-Host " ╔═══════════════════════════════════════════════════════════════════════════════╗" -ForegroundColor Cyan
    Write-Host " ║                                                                               ║" -ForegroundColor Cyan
    Write-Host " ║             ██████╗ ██████╗ ██████╗ ██╗██╗      ██████╗ ████████╗             ║" -ForegroundColor Cyan
    Write-Host " ║            ██╔════╝██╔═══██╗██╔══██╗██║██║     ██╔═══██╗╚══██╔══╝             ║" -ForegroundColor Cyan
    Write-Host " ║            ██║     ██║   ██║██████╔╝██║██║     ██║   ██║   ██║                ║" -ForegroundColor Cyan
    Write-Host " ║            ██║     ██║   ██║██╔═══╝ ██║██║     ██║   ██║   ██║                ║" -ForegroundColor Cyan
    Write-Host " ║            ╚██████╗╚██████╔╝██║     ██║███████╗╚██████╔╝   ██║                ║" -ForegroundColor Cyan
    Write-Host " ║             ╚═════╝ ╚═════╝ ╚═╝     ╚═╝╚══════╝ ╚═════╝    ╚═╝                ║" -ForegroundColor Cyan
    Write-Host " ║                                                                               ║" -ForegroundColor Cyan
    Write-Host " ║             █████╗  ██████╗ ███████╗███╗   ██╗████████╗██╗ ██████╗            ║" -ForegroundColor Cyan
    Write-Host " ║            ██╔══██╗██╔════╝ ██╔════╝████╗  ██║╚══██╔══╝██║██╔════╝            ║" -ForegroundColor Cyan
    Write-Host " ║            ███████║██║  ███╗█████╗  ██╔██╗ ██║   ██║   ██║██║                 ║" -ForegroundColor Cyan
    Write-Host " ║            ██╔══██║██║   ██║██╔══╝  ██║╚██╗██║   ██║   ██║██║                 ║" -ForegroundColor Cyan
    Write-Host " ║            ██║  ██║╚██████╔╝███████╗██║ ╚████║   ██║   ██║╚██████╗            ║" -ForegroundColor Cyan
    Write-Host " ║            ╚═╝  ╚═╝ ╚═════╝ ╚══════╝╚═╝  ╚═══╝   ╚═╝   ╚═╝ ╚═════╝            ║" -ForegroundColor Cyan
    Write-Host " ║                                                                               ║" -ForegroundColor Cyan
    Write-Host " ║   ███████╗ ██████╗ ██╗     ██╗   ██╗████████╗██╗ ██████╗ ███╗   ██╗███████╗   ║" -ForegroundColor Cyan
    Write-Host " ║   ██╔════╝██╔═══██╗██║     ██║   ██║╚══██╔══╝██║██╔═══██╗████╗  ██║██╔════╝   ║" -ForegroundColor Cyan
    Write-Host " ║   ███████╗██║   ██║██║     ██║   ██║   ██║   ██║██║   ██║██╔██╗ ██║███████╗   ║" -ForegroundColor Cyan
    Write-Host " ║   ╚════██║██║   ██║██║     ██║   ██║   ██║   ██║██║   ██║██║╚██╗██║╚════██║   ║" -ForegroundColor Cyan
    Write-Host " ║   ███████║╚██████╔╝███████╗╚██████╔╝   ██║   ██║╚██████╔╝██║ ╚████║███████║   ║" -ForegroundColor Cyan
    Write-Host " ║   ╚══════╝ ╚═════╝ ╚══════╝ ╚═════╝    ╚═╝   ╚═╝ ╚═════╝ ╚═╝  ╚═══╝╚══════╝   ║" -ForegroundColor Cyan
    Write-Host " ║                                                                               ║" -ForegroundColor Cyan
    Write-Host " ║                              Solution Installer                               ║" -ForegroundColor Cyan
    Write-Host " ║                                                                               ║" -ForegroundColor Cyan
    Write-Host " ╚═══════════════════════════════════════════════════════════════════════════════╝" -ForegroundColor Cyan
    Write-Host ""
}

# ── Menu ─────────────────────────────────────────────────────────────────────
function Show-Menu {
    Write-Host "  Select a solution to install:" -ForegroundColor White
    Write-Host ""
    foreach ($s in $Solutions) {
        $label = $s.Name
        Write-Host "    [$($s.Key)] $label" -ForegroundColor White
    }
    Write-Host "    [Q] Quit" -ForegroundColor White
    Write-Host ""
}

# ── Main loop ────────────────────────────────────────────────────────────────
Clear-Host
Show-Banner

while ($true) {
    Show-Menu

    $choice = Read-Host "  Enter selection"
    Write-Host ""

    if ($choice -eq 'Q' -or $choice -eq 'q') {
        Write-Host "  Goodbye!" -ForegroundColor Green
        Write-Host ""
        break
    }

    $selected = $Solutions | Where-Object { $_.Key -eq $choice }

    if (-not $selected) {
        Write-Host "  ❌  Invalid selection. Please try again." -ForegroundColor Red
        Write-Host ""
        continue
    }

    if (-not $selected.Available) {
        Write-Host "  ⚠️  $($selected.Name) is still in development." -ForegroundColor Yellow
        Write-Host ""
        continue
    }

    # Verify the install script exists
    if (-not (Test-Path $selected.ScriptPath)) {
        Write-Host "  ❌  Install script not found: $($selected.ScriptPath)" -ForegroundColor Red
        Write-Host ""
        continue
    }

    Write-Host "  🚀  Launching $($selected.Name) installer..." -ForegroundColor Green
    Write-Host ("  " + "─" * 75) -ForegroundColor DarkGray
    Write-Host ""

    try {
        & $selected.ScriptPath
    }
    catch {
        Write-Host ""
        Write-Host "  ❌  The installer encountered an error: $_" -ForegroundColor Red
    }

    Write-Host ""
    Write-Host ("  " + "─" * 75) -ForegroundColor DarkGray
    Write-Host "  ✅  Returned to Copilot Agent Solutions selector." -ForegroundColor Green
    Write-Host ""
}
