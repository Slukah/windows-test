$count = 0

do
{
    if (Get-Process -Name notepad -ErrorAction SilentlyContinue)
    {
        Write-Host "Notepad is running"
        $count++
        Start-Sleep -Seconds 1
    }

} while (Get-Process -Name notepad -ErrorAction SilentlyContinue)

Write-Host "Notepad is no longer running"
Write-Host "The statement was displayed $count times"