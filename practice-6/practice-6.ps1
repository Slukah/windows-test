# Failiteed
$inputPath  = "C:\Temp\students.csv"
$outputPath = "C:\Temp\students_school.csv"

# Impordi ja teisenda
$result = Import-Csv $inputPath | Select-Object `
    Name, `
    @{Name="School"; Expression={
        $age = [int]$_.Age
        if ($age -ge 4 -and $age -le 10) { "Junior" }
        elseif ($age -ge 11 -and $age -le 17) { "Senior" }
        else { "OutOfRange" }  # igaks juhuks, kui vanus ei sobi vahemikku
    }}

# Kuva tabelina ekraanile
$result | Format-Table -AutoSize