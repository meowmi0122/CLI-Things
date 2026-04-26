$ErrorActionPreference = "SilentlyContinue"

$digits = @{
"0"=" **** `n*    *`n*    *`n*    *`n*    *`n*    *`n **** "
"1"="   *  `n  **  `n   *  `n   *  `n   *  `n   *  `n *****"
"2"=" **** `n     *`n     *`n **** `n*     `n*     `n******"
"3"=" **** `n     *`n     *`n **** `n     *`n     *`n **** "
"4"="*    *`n*    *`n*    *`n******`n     *`n     *`n     *"
"5"="******`n*     `n*     `n***** `n     *`n     *`n***** "
"6"=" **** `n*     `n*     `n***** `n*    *`n*    *`n **** "
"7"="******`n     *`n    * `n   *  `n  *   `n  *   `n  *   "
"8"=" **** `n*    *`n*    *`n **** `n*    *`n*    *`n **** "
"9"=" **** `n*    *`n*    *`n *****`n     *`n     *`n **** "
":"="      `n  **  `n  **  `n      `n  **  `n  **  `n      "
}

while ($true) {
    Clear-Host

    $time = (Get-Date).ToString("HH:mm:ss")

    $rows = 0..6 | ForEach-Object { "" }

    foreach ($c in $time.ToCharArray()) {

        $g = $digits[$c]
        if (-not $g) { continue }

        $lines = $g -split "`n"

        for ($i=0; $i -lt 7; $i++) {
            $rows[$i] += $lines[$i] + "  "
        }
    }

    $rows | ForEach-Object { Write-Host $_ }

    Start-Sleep -Milliseconds 500
}
