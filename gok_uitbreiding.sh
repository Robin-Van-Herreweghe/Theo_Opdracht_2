random=$((1 + RANDOM % 10))

aantalgokken=1 
read -p "Hallo welkom tot het Gok spel wat is jouw naam? " naam

echo "Hallo $name,Probeer het getal te raden tussen 1-10"


while [ $aantalgokken -le 3 ]; do 
    echo 'Gok numero #'$aantalgokken
    
    read -p "Wat gok jij? [n]: " gok 

    while [[ ! $gok =~ (^[1-9]$|^10$)  ]]; do
        read -p "Oeps Geef en getal op tussen de 1-10? [n]: " gok
    done

    if [ $gok -eq $random ]; then
        echo "Correct! Het Nummer was:" $random
        gewonnen=Ja
        break;
    else
        if [ $gok -lt $random ]; then 
            echo 'Hoger';
        elif [ $gok -gt $random ]; then
            echo 'Lager';
        fi
    fi
    
    ((aantalgokken+=1))
done

if [ $gok -ne $random ]; then
    echo 'Jammer u bent gefaald, volgende keer beter'
    gewonnen=Nee
fi

if [ $aantalgokken -eq 4 ]; then ((aantalgokken-=1)); fi;

echo '____________________________________________' >> ./score.txt
echo "Naam: $naam" >> ./score.txt  
echo "Datum: $(date)" >> ./score.txt
echo "Speler heeft gewonnen? $gewonnen" >> ./score.txt
echo "Aantal keer gegokt: $aantalgokken" >> ./score.txt
echo ' ' >> ./score.txt