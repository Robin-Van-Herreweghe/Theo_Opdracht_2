random=$((1 + RANDOM % 10))

aantalgokken=1 

echo 'Probeer het getal te raden tussen 1-10'


while [ $aantalgokken -le 3 ]; do 
    echo 'Gok numero #'$aantalgokken
    
    read -p "Wat gok jij? [n]: " gok 

    while [[ ! $gok =~ (^[1-9]$|^10$)  ]]; do
        read -p "Oeps Geef en getal op tussen de 1-10? [n]: " gok
    done

    if [ $gok -eq $random ]; then
        echo "Correct! Het Nummer was:" $random
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

if [ $guess -ne $random ]; then
    echo 'Jammer u bent gefaald, volgende keer beter'
fi

