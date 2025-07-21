# Windows Install Script for ee3 CLI
# Save this as install.ps1

# Check if running as Administrator
$isAdmin = ([Security.Principal.WindowsPrincipal] [Security.Principal.WindowsIdentity]::GetCurrent()).IsInRole([Security.Principal.WindowsBuiltInRole]::Administrator)
if (-not $isAdmin) {
    Write-Host "This script requires Administrator privileges. Restarting with elevated permissions..." -ForegroundColor Yellow
    Start-Process powershell.exe "-NoProfile -ExecutionPolicy Bypass -File `"$($MyInvocation.MyCommand.Path)`"" -Verb RunAs
    exit
}

# Colors
$ErrorActionPreference = "Stop"
$ProgressPreference = "SilentlyContinue"
$host.UI.RawUI.WindowTitle = "ee3 CLI Installer"

# Configuration
$installDir = "$env:ProgramFiles\ee3"
$binPath = "$installDir\ee3.exe"
$startMenuDir = [System.Environment]::GetFolderPath('Programs') + "\ee3"
$startMenuShortcut = "$startMenuDir\ee3.lnk"

function Write-ColorOutput {
    param(
        [string]$Message,
        [string]$Color = "White"
    )
    Write-Host $Message -ForegroundColor $Color
}

try {
    # Create installation directory
    if (-not (Test-Path $installDir)) {
        New-Item -ItemType Directory -Path $installDir -Force | Out-Null
    }

    # Check for local binary first
    $localBinary = ".\target\release\ee3.exe"
    if (Test-Path $localBinary) {
        Write-ColorOutput "✅ Found local binary. Using it for installation..." "Green"
        Copy-Item -Path $localBinary -Destination $binPath -Force
    }
    else {
        # Download the binary (update URL when you have a release)
        $downloadUrl = "https://github.com/ee3lol/ee3-cli/releases/latest/download/ee3-x86_64-pc-windows-msvc.exe"
        Write-ColorOutput "⬇️  Downloading ee3 binary..." "Yellow"
        
        try {
            Invoke-WebRequest -Uri $downloadUrl -OutFile $binPath -UseBasicParsing
        }
        catch {
            Write-ColorOutput "❌ Failed to download ee3 binary. Please check your internet connection." "Red"
            Write-ColorOutput "You can build the binary locally with: cargo build --release" "Yellow"
            exit 1
        }
    }

    # Add to PATH
    $currentPath = [Environment]::GetEnvironmentVariable('Path', 'Machine')
    if ($currentPath -notlike "*$installDir*") {
        [Environment]::SetEnvironmentVariable('Path', "$currentPath;$installDir", 'Machine')
        $env:Path = [System.Environment]::GetEnvironmentVariable("Path","Machine") + ";" + [System.Environment]::GetEnvironmentVariable("Path","User")
    }

    # Create Start Menu shortcut
    if (-not (Test-Path $startMenuDir)) {
        New-Item -ItemType Directory -Path $startMenuDir -Force | Out-Null
    }
    $WshShell = New-Object -comObject WScript.Shell
    $Shortcut = $WshShell.CreateShortcut($startMenuShortcut)
    $Shortcut.TargetPath = $binPath
    $Shortcut.Save()

    # Initialize ee3
    Write-ColorOutput "`n🔄 Initializing ee3..." "Yellow"
    & $binPath init

    Write-ColorOutput "`n🎉 ee3 has been successfully installed!" "Green"
    Write-ColorOutput "`nTo start using ee3, open a new PowerShell window and run:" "White"
    Write-Host "  ee3 --version" -ForegroundColor Cyan
    Write-Host "  ee3 mkcd test_directory" -ForegroundColor Cyan

    Write-ColorOutput "`nPress any key to exit..." "White"
    $null = $Host.UI.RawUI.ReadKey("NoEcho,IncludeKeyDown")
}
catch {
    Write-ColorOutput "`n❌ An error occurred:" "Red"
    Write-ColorOutput $_.Exception.Message "Red"
    Write-ColorOutput "`nPress any key to exit..." "White"
    $null = $Host.UI.RawUI.ReadKey("NoEcho,IncludeKeyDown")
    exit 1
}