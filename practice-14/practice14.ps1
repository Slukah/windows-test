# 1. KASUTAJA SISEND
$userName   = Read-Host "Sisesta oma nimi"
$greetCount = [int](Read-Host "Mitu korda soovid tervitust kuvada")

# 2. TSÜKKEL – tervituse kuvamine
for ($i = 1; $i -le $greetCount; $i++) {
    Write-Host "Tere, $userName! ($i)"
}

# 3. SÜSTEEMIINFO
$computerName   = $env:COMPUTERNAME
$loggedInUser   = $env:USERNAME
$psVersion      = $PSVersionTable.PSVersion.Major

Write-Host ""
Write-Host "--- Süsteemiinfo ---"
Write-Host "Arvuti nimi           : $computerName"
Write-Host "Sisselogitud kasutaja : $loggedInUser"
Write-Host "PowerShelli versioon  : $psVersion"

# 4. CMDLET'IDE KASUTAMINE
Write-Host ""
Write-Host "--- 3 töötavat protsessi ---"
Get-Process | Select-Object -First 3 | Format-Table Name, Id, CPU -AutoSize

Write-Host "--- 3 teenust ---"
Get-Service | Select-Object -First 3 | Format-Table Name, Status -AutoSize

# 5. TINGIMUSLAUSE – PowerShelli versiooni kontroll
Write-Host ""
Write-Host "--- Versiooni kontroll ---"
if ($psVersion -lt 5) {
    Write-Host "HOIATUS: PowerShelli versioon ($psVersion) on alla 5. Palun uuenda!" -ForegroundColor Yellow
} else {
    Write-Host "PowerShelli versioon ($psVersion) on sobiv." -ForegroundColor Green
}

# 6. VÄLJUNDI SALVESTAMINE FAILI
$reportFile = "report.txt"

$report = @"
============================================================
SÜSTEEMIARUANNE
Kuupäev ja kellaaeg : $(Get-Date)
============================================================

Kasutaja nimi        : $userName
Arvuti nimi          : $computerName
Sisselogitud kasutaja: $loggedInUser
PowerShelli versioon : $psVersion

--- Tervitused ---
"@

for ($i = 1; $i -le $greetCount; $i++) {
    $report += "`nTere, $userName! ($i)"
}

$report += "`n`n--- 3 töötavat protsessi ---`n"
$report += (Get-Process | Select-Object -First 3 | Format-Table Name, Id, CPU -AutoSize | Out-String)

$report += "`n--- 3 teenust ---`n"
$report += (Get-Service | Select-Object -First 3 | Format-Table Name, Status -AutoSize | Out-String)

$report += "`n--- Versiooni kontroll ---`n"
if ($psVersion -lt 5) {
    $report += "HOIATUS: PowerShelli versioon ($psVersion) on alla 5!"
} else {
    $report += "PowerShelli versioon ($psVersion) on sobiv."
}

$report += "`n`n===========================`nScript finished successfully`n==========================="

$report | Out-File -FilePath $reportFile -Encoding UTF8

Write-Host ""
Write-Host "Aruanne salvestatud faili: $reportFile"

# 7. VORMINDATUD LÕPPTEADE
Write-Host ""
Write-Host "==========================="
Write-Host "Script finished successfully"
Write-Host "==========================="