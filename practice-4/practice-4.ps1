read -r -p "Sisestage esimene number: " n1
read -r -p "Sisestage teine number number: " n2

if ! [[ "$n1" =~ ^-?[0-9]+$ ]] || ! [[ "$n2" =~ ^-?[0-9]+$ ]]; then
  echo "Error: Ainult sobilikud nimetajad."
  exit 1
fi

if [ "$n1" -gt "$n2" ]; then
  echo "Suurem number : $n1"
elif [ "$n2" -gt "$n1" ]; then
  echo "The higher number is : $n2"
else
  echo "Suurem number on : $n1 (sama suured)"
fi

echo

echo "Vali riik:"
echo "1) Eesti"
echo "2) Soome"
echo "3) Rootsi"
echo "4) Norra"

read -r -p "Tee valik(1-4): " choice

case "$choice" in
  1) echo "Pealinn: Tallinn" ;;
  2) echo "Pealinn: Helsinki" ;;
  3) echo "Pealinn: Stockholm" ;;
  4) echo "Pealinn: Oslo" ;;
  *) echo "Vale valik, palun vali arv 1-4." ;;
esac