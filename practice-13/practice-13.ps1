function Show-SubMenu {
    while ($true) {
        Write-Host ""
        Write-Host "Please select the next option"
        Write-Host ""
        Write-Host "1: Return to Main Menu"
        Write-Host "2: Exit"
        Write-Host ""
        $subChoice = Read-Host "Enter your choice"
        switch ($subChoice) {
            "1" { Show-MainMenu; return }
            "2" { Write-Host "Exiting..."; exit 0 }
            default { Write-Host "Enter correct option" -ForegroundColor Red }
        }
    }
}

function Get-AreaSquare {
    Clear-Host
    Write-Host "         Area of Square" -ForegroundColor Yellow
    Write-Host ""
    $side = [double](Read-Host "Enter the side of the square")
    $area = $side * $side
    Write-Host "Area of the square : $area" -ForegroundColor Green
    Show-SubMenu
}

function Get-AreaRectangle {
    Clear-Host
    Write-Host "         Area of Rectangle" -ForegroundColor Yellow
    Write-Host ""
    $length = [double](Read-Host "Enter the length of the rectangle")
    $width  = [double](Read-Host "Enter the width of the rectangle")
    $area = $length * $width
    Write-Host "Area of the rectangle : $area" -ForegroundColor Green
    Show-SubMenu
}

function Get-AreaCircle {
    Clear-Host
    Write-Host "         Area of Circle" -ForegroundColor Yellow
    Write-Host ""
    $radius = [double](Read-Host "Enter the radius of the circle")
    $area = [math]::Round(3.14159 * $radius * $radius, 2)
    Write-Host "Area of the circle : $area" -ForegroundColor Green
    Show-SubMenu
}

function Get-AreaTriangle {
    Clear-Host
    Write-Host "         Area of Triangle" -ForegroundColor Yellow
    Write-Host ""
    $base   = [double](Read-Host "Enter the base of the triangle")
    $height = [double](Read-Host "Enter the height of the triangle")
    $area = [math]::Round(0.5 * $base * $height, 2)
    Write-Host "Area of the triangle : $area" -ForegroundColor Green
    Show-SubMenu
}

function Show-MainMenu {
    Clear-Host
    Write-Host "         Area Calculator" -ForegroundColor Yellow
    Write-Host ""
    Write-Host "           Main Menu" -ForegroundColor Yellow
    Write-Host ""
    Write-Host "Please select the option to perform the respective task" -ForegroundColor Green
    Write-Host ""
    Write-Host "1: Area of Square" -ForegroundColor Green
    Write-Host "2: Area of Rectangle" -ForegroundColor Green
    Write-Host "3: Area of Circle" -ForegroundColor Green
    Write-Host "4: Area of Triangle" -ForegroundColor Green
    Write-Host "5: Exit" -ForegroundColor Green
    Write-Host ""
    $choice = Read-Host "Enter your choice"
    switch ($choice) {
        "1" { Get-AreaSquare }
        "2" { Get-AreaRectangle }
        "3" { Get-AreaCircle }
        "4" { Get-AreaTriangle }
        "5" { Write-Host "Exiting..."; exit 0 }
        default { Write-Host "Enter correct option" -ForegroundColor Red; Start-Sleep -Seconds 1; Show-MainMenu }
    }
}

Show-MainMenu