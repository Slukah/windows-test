function Get-ServiceCount {

    $running = (Get-Service | Where-Object {$_.Status -eq "Running"}).Count
    $stopped = (Get-Service | Where-Object {$_.Status -eq "Stopped"}).Count

    Write-Host "Running services count: $running"
    Write-Host "Stopped services count: $stopped"
}

Get-ServiceCount

Write-Host "--------------------------"

function Get-ServiceCountByStatus {

    param(
        [string]$status
    )

    $count = (Get-Service | Where-Object {$_.Status -eq $status}).Count

    Write-Host "$status services count: $count"
}

Get-ServiceCountByStatus -status Running
Get-ServiceCountByStatus -status Stopped