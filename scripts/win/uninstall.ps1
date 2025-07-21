# Windows Uninstall Script for ee3 CLI
# Run as Administrator

# Check if running as Administrator
$isAdmin = ([Security.Principal.WindowsPrincipal] [Security.Principal.WindowsIdentity]::GetCurrent()).IsInRole([Security.Principal.WindowsBuiltInRole]::Administrator)
if (-not $isAdmin) {
    Write-Host "This script requires Administrator privileges. Restarting with elevated permissions..." -ForegroundColor Yellow
    Start-Process powershell.exe "-NoProfile -ExecutionPolicy Bypass -File `"$($MyInvocation.MyCommand.Path)`"" -Verb RunAs
    exit
}

$ErrorActionPreference = "Stop"
$ProgressPreference = "SilentlyContinue"
$host.UI.RawUI.WindowTitle = "ee3 CLI Uninstaller"

function Write-ColorOutput {
    param([string]$Message, [string]$Color = "White")
    Write-Host $Message -ForegroundColor $Color
}

try {
    $installDir = "$env:ProgramFiles\ee3"
    $startMenuDir = [System.Environment]::GetFolderPath('Programs') + "\ee3"
    
    # Remove from PATH
    $paths = [System.Environment]::GetEnvironmentVariable('Path', 'Machine') -split ';' | 
             Where-Object { $_ -ne $installDir -and $_ -ne "$installDir\" } -join ';'
    [System.Environment]::SetEnvironmentVariable('Path', $paths, 'Machine')
    
    # Remove installation directory
    if (Test-Path $installDir) {
        Write-ColorOutput "🗑️  Removing installation directory..." "Yellow"
        Remove-Item -Path $installDir -Recurse -Force
    }
    
    # Remove Start Menu shortcut
    if (Test-Path $startMenuDir) {
        Write-ColorOutput "🗑️  Removing Start Menu shortcut..." "Yellow"
        Remove-Item -Path $startMenuDir -Recurse -Force
    }
    
    # Remove from user PATH
    $userPath = [System.Environment]::GetEnvironmentVariable('Path', 'User') -split ';' | 
                Where-Object { $_ -ne $installDir -and $_ -ne "$installDir\" } -join ';'
    [System.Environment]::SetEnvironmentVariable('Path', $userPath, 'User')
    
    Write-ColorOutput "`n✅ ee3 has been successfully uninstalled!" "Green"
    
    # Clean up environment variables in current session
    $env:Path = [System.Environment]::GetEnvironmentVariable("Path","Machine") + ";" + 
                [System.Environment]::GetEnvironmentVariable("Path","User")
    
    Write-ColorOutput "`nPlease close and reopen any open terminal windows to complete the uninstallation." "Yellow"
}
catch {
    Write-ColorOutput "`n❌ An error occurred during uninstallation:" "Red"
    Write-ColorOutput $_.Exception.Message "Red"
}

# Keep the window open
Write-Host "`nPress any key to exit..."
$null = $Host.UI.RawUI.ReadKey("NoEcho,IncludeKeyDown")