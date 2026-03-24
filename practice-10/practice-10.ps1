$count = 0

do {
    $process = Get-Process -Name notepad -ErrorAction SilentlyContinue

    if ($process) {
        Write-Host "Notepad is running"
        $count++
        Start-Sleep -Seconds 1
    }

} until (-not $process)

Write-Host "Notepad is no longer running"
Write-Host "The statement was displayed $count times"