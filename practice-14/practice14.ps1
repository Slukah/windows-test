#!/bin/bash
# practice14.sh
# Kokkuvõttev skript – Practice 14 (Git Bash)
 
 
# 1. KASUTAJA SISEND
 
# Küsi kasutaja nime
read -p "Sisesta oma nimi: " userName
 
# Küsi, mitu korda tervitust kuvada
read -p "Mitu korda soovid tervitust kuvada: " greetCount
 
 
# 2. TSÜKKEL – tervituse kuvamine
 
# Kasuta for-tsüklit tervituste kuvamiseks
for (( i=1; i<=greetCount; i++ )); do
    echo "Tere, $userName! ($i)"
done
 
 
# 3. SÜSTEEMIINFO
 
# Kogu süsteemiinfo muutujatesse
computerName=$(hostname)
loggedInUser=$(whoami)
psVersion=$(powershell.exe -NoProfile -Command '$PSVersionTable.PSVersion.Major' 2>/dev/null | tr -d '\r')
 
# Kuva süsteemiinfo ekraanile
echo ""
echo "--- Süsteemiinfo ---"
echo "Arvuti nimi           : $computerName"
echo "Sisselogitud kasutaja : $loggedInUser"
echo "PowerShelli versioon  : $psVersion"
 
 
# 4. CMDLET'IDE KASUTAMINE
 
# Kuva 3 töötavat protsessi
echo ""
echo "--- 3 töötavat protsessi ---"
powershell.exe -NoProfile -Command 'Get-Process | Select-Object -First 3 | Format-Table Name, Id, CPU -AutoSize' 2>/dev/null
 
# Kuva 3 teenust koos nende olekuga
echo "--- 3 teenust ---"
powershell.exe -NoProfile -Command 'Get-Service | Select-Object -First 3 | Format-Table Name, Status -AutoSize' 2>/dev/null
 
 
# 5. TINGIMUSLAUSE – PowerShelli versiooni kontroll
 
echo ""
echo "--- Versiooni kontroll ---"
 
# Kontrolli, kas PowerShelli põhiversioon on alla 5
if [ "$psVersion" -lt 5 ] 2>/dev/null; then
    echo "HOIATUS: PowerShelli versioon ($psVersion) on alla 5. Palun uuenda!"
else
    echo "PowerShelli versioon ($psVersion) on sobiv."
fi
 
 
# 6. VÄLJUNDI SALVESTAMINE FAILI
 
reportFile="report.txt"
 
# Kirjuta kogu aruanne faili
{
    echo "============================================================"
    echo "SÜSTEEMIARUANNE"
    echo "Kuupäev ja kellaaeg : $(date)"
    echo "============================================================"
    echo ""
    echo "Kasutaja nimi        : $userName"
    echo "Arvuti nimi          : $computerName"
    echo "Sisselogitud kasutaja: $loggedInUser"
    echo "PowerShelli versioon : $psVersion"
    echo ""
    echo "--- Tervitused ---"
    for (( i=1; i<=greetCount; i++ )); do
        echo "Tere, $userName! ($i)"
    done
    echo ""
    echo "--- 3 töötavat protsessi ---"
    powershell.exe -NoProfile -Command 'Get-Process | Select-Object -First 3 | Format-Table Name, Id, CPU -AutoSize' 2>/dev/null
    echo ""
    echo "--- 3 teenust ---"
    powershell.exe -NoProfile -Command 'Get-Service | Select-Object -First 3 | Format-Table Name, Status -AutoSize' 2>/dev/null
    echo ""
    echo "--- Versiooni kontroll ---"
    if [ "$psVersion" -lt 5 ] 2>/dev/null; then
        echo "HOIATUS: PowerShelli versioon ($psVersion) on alla 5!"
    else
        echo "PowerShelli versioon ($psVersion) on sobiv."
    fi
    echo ""
    echo "==========================="
    echo "Script finished successfully"
    echo "==========================="
} > "$reportFile"
 
echo ""
echo "Aruanne salvestatud faili: $reportFile"
 
 
# 7. VORMINDATUD LÕPPTEADE
 
echo ""
echo "==========================="
echo "Script finished successfully"
echo "==========================="