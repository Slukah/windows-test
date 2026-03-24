$varvid = @("Red", "Green", "Yellow", "Blue")

Write-Host "RollNumber`tGroup"

for ($roll = 1; $roll -le 20; $roll++) {
    $grupp = $varvid | Get-Random
    Write-Host "$roll`t`t$grupp"
}