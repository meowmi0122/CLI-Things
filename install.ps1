$ErrorActionPreference = "SilentlyContinue"

function Show-Menu {
    param([int]$index)

    Clear-Host
    Write-Host "======================================"
    Write-Host "   WSL + Ubuntu Installer"
    Write-Host "======================================"
    Write-Host ""

    if ($index -eq 0) {
        Write-Host "> YES"
        Write-Host "  NO"
    } else {
        Write-Host "  YES"
        Write-Host "> NO"
    }

    Write-Host ""
    Write-Host "Use ↑ ↓ to move, Enter to select"
}

# ------------------------
# Check WSL
# ------------------------
wsl --status | Out-Null
if ($LASTEXITCODE -ne 0) {
    Write-Host "[X] WSL not installed"
    Write-Host "Installing WSL..."
    wsl --install
    Write-Host ""
    Write-Host "Restart system and run again"
    Pause
    exit
}

Write-Host "[OK] WSL detected"
Start-Sleep -Seconds 1

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
if ($index -eq 0) {
    Clear-Host
    Write-Host "[*] Installing Ubuntu via WSL..."
    wsl --install -d Ubuntu
    Write-Host ""
    Write-Host "[OK] Installation completed"
    Write-Host "First launch will require setup (username/password)"
} else {
    Write-Host ""
    Write-Host "[X] Cancelled"
}

Pause
