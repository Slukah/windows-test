while (Get-Process -Name notepad -ErrorAction SilentlyContinue)
{
    Write-Host "Notepad is running"
    Start-Sleep -Seconds 2
}

Write-Host "All Notepad instances are closed"