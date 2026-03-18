# Practice 5 Script

Write-Host "===== Practice 5 (i): Notepad Process ID =====" -ForegroundColor Cyan

# Show Notepad Process Name and ID (only ProcessName and Id)
Get-Process -Name notepad -ErrorAction SilentlyContinue |
    Select-Object ProcessName, Id

Write-Host "`n===== Practice 5 (ii): Folder File Information =====" -ForegroundColor Cyan

$path = "C:\Temp\Test"

# Create folder if it doesn't exist
if (-not (Test-Path $path)) {
    Write-Host "Folder does not exist. Creating $path" -ForegroundColor Yellow
    New-Item -Path $path -ItemType Directory -Force | Out-Null
}

# Total number of files
$totalFiles = (Get-ChildItem $path -File).Count
Write-Host "Total files in folder: $totalFiles"

# CSV details
Write-Host "`nCSV File Details:" -ForegroundColor Yellow

Get-ChildItem $path -File |
    Where-Object Extension -eq ".csv" |
    Select-Object Name,
        @{Name="Size (KB)"; Expression={ [math]::Round($_.Length / 1KB, 2) }},
        @{Name="Size (MB)"; Expression={ [math]::Round($_.Length / 1MB, 2) }}