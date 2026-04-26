$ErrorActionPreference = "SilentlyContinue"

$spinner = @("⠋","⠙","⠹","⠸","⠼","⠴","⠦","⠧","⠇","⠏")

function Show-Menu {
    param([int]$index)

    Clear-Host
    Write-Host "======================================"
    Write-Host "   WSL + Ubuntu Installer"
    Write-Host "======================================"
    Write-Host ""

    if ($index -eq 0) {
        Write-Host "> install"
        Write-Host "  no"
    } else {
        Write-Host "  install"
        Write-Host "> no"
    }

    Write-Host ""
    Write-Host "Use ↑ ↓ to move, Enter to select"
}

function Show-Spinner($msg) {
    for ($i = 0; $i -lt 20; $i++) {
        foreach ($s in $spinner) {
            Write-Host -NoNewline "`r$s $msg"
            Start-Sleep -Milliseconds 80
        }
    }
    Write-Host ""
}

# ------------------------
# Check WSL
# ------------------------
wsl --status | Out-Null
if ($LASTEXITCODE -ne 0) {
    Write-Host "[X] WSL not installed"
    Write-Host "Installing WSL..."
    Show-Spinner "installing WSL"
    wsl --install
    Write-Host ""
    Write-Host "[OK] Done. Restart required."
    Pause
    exit
}

Write-Host "[OK] WSL detected"
Start-Sleep -Milliseconds 500

# ------------------------
# Check Ubuntu
# ------------------------
$ubuntu = wsl -l -q | Select-String -Pattern "Ubuntu"
if ($ubuntu) {
    Write-Host "[OK] Ubuntu already installed"
    Pause
    exit
}

# ------------------------
# Menu (arrow keys)
# ------------------------
$index = 0

while ($true) {
    Show-Menu $index

    $key = [System.Console]::ReadKey($true)

    switch ($key.Key) {
        "UpArrow"   { $index = 0 }
        "DownArrow" { $index = 1 }
        "Tab"       { $index = 1 - $index }
        "Enter"     { break }
    }
}

# ------------------------
# Action
# ------------------------
Clear-Host

if ($index -eq 0) {
    Write-Host "[*] installing Ubuntu..."
    Show-Spinner "downloading Ubuntu via WSL"
    wsl --install -d Ubuntu
    Write-Host ""
    Write-Host "[OK] installation completed"
    Write-Host "first setup will ask username/password"
} else {
    Write-Host "[X] cancelled"
}

Pause
