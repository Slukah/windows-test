$DaysWorked = @{
    "John" = 12
    "Joe"  = 20
    "Mary" = 18
}

$SalaryPerDay = @{
    "John" = 100
    "Joe"  = 120
    "Mary" = 150
}

$Salary = @{}

foreach ($name in $DaysWorked.Keys) {
    $Salary[$name] = $DaysWorked[$name] * $SalaryPerDay[$name]
}

# Print results
Write-Host "Name`tSalary"
foreach ($name in $Salary.Keys) {
    Write-Host "$name`t$($Salary[$name])"
}