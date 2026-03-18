import random  # impordime random mooduli, et saaks kasutada juhuslikkust

# loome nimekirja võimalikest gruppidest (värvidest)
varvid = ["Red", "Green", "Yellow", "Blue"]

# prindime tabeli päise
print("RollNumber\tGroup")

# käime läbi rollinumbrid 1 kuni 20
for roll in range(1, 21):
    # valime juhuslikult ühe värvi nimekirjast
    grupp = random.choice(varvid)
    
    # prindime rollinumbri ja määratud grupi
    print(f"{roll}\t\t{grupp}")