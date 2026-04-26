$ErrorActionPreference = "SilentlyContinue"

$spinner = @("⠋","⠙","⠹","⠸","⠼","⠴","⠦","⠧","⠇","⠏")

function Show-Spinner($msg) {
    for ($i = 0; $i -lt 15; $i++) {
        foreach ($s in $spinner) {
            Write-Host -NoNewline "`r$s $msg"
            Start-Sleep -Milliseconds 80
        }
    }
    Write-Host ""
}

Clear-Host
Write-Host "======================================"
Write-Host "   WSL + Ubuntu Installer"
Write-Host "======================================"
Write-Host ""

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
    Write-Host "[OK] Done. Please restart system."
    Pause
    exit
}

Write-Host "[OK] WSL detected"

# ------------------------
# Check Ubuntu
# ------------------------
$ubuntu = wsl -l -q | Select-String -Pattern "Ubuntu"
if ($ubuntu) {
    Write-Host "[OK] Ubuntu already installed"
    Pause
    exit
}

Write-Host ""
Write-Host "Install Ubuntu via WSL ? (y/n)"
Write-Host ""

# ------------------------
# Input loop (y/n only)
# ------------------------
while ($true) {
    $input = Read-Host "Enter choice"

    switch ($input.ToLower()) {
        "y" {
            Clear-Host
            Write-Host "[*] Installing Ubuntu..."
            Show-Spinner "downloading Ubuntu"
            wsl --install -d Ubuntu
            Write-Host ""
            Write-Host "[OK] Installation completed"
            Write-Host "First launch will require setup (username/password)"
            break
        }

        "n" {
            Write-Host "[X] Cancelled"
            break
        }

        default {
            Write-Host "[!] Please enter y or n"
        }
    }
}

Pause
