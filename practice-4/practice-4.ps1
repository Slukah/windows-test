$n1Input = Read-Host "Sisestage esimene number"
$n2Input = Read-Host "Sisestage teine number"

if ($n1Input -notmatch '^-?\d+$' -or $n2Input -notmatch '^-?\d+$') {
    Write-Host "Error: Ainult sobilikud nimetajad." -ForegroundColor Red
    exit 1
}

$n1 = [int]$n1Input
$n2 = [int]$n2Input

if ($n1 -gt $n2) {
    Write-Host "Suurem number: $n1"
} elseif ($n2 -gt $n1) {
    Write-Host "The higher number is: $n2"
} else {
    Write-Host "Suurem number on: $n1 (sama suured)"
}

Write-Host ""
Write-Host "Vali riik:"
Write-Host "1) Eesti"
Write-Host "2) Soome"
Write-Host "3) Rootsi"
Write-Host "4) Norra"

$choice = Read-Host "Tee valik (1-4)"

switch ($choice) {
    "1" { Write-Host "Pealinn: Tallinn" }
    "2" { Write-Host "Pealinn: Helsinki" }
    "3" { Write-Host "Pealinn: Stockholm" }
    "4" { Write-Host "Pealinn: Oslo" }
    default { Write-Host "Vale valik, palun vali arv 1-4." -ForegroundColor Red }
}