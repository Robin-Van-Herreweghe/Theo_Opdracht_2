random=$((1 + RANDOM % 10))

aantalgokken=1 

echo 'Probeer het getal te raden tussen 1-10'


while [ $aantalgokken -le 3 ]; do 
    echo 'Gok numero #'$aantalgokken
    
    read -p "Wat gok jij? [n]: " guess 

    while [[ ! $guess =~ (^[1-9]$|^10$)  ]]; do
        read -p "Invalid input. Your guess? [n]: " guess
    done

    if [ $guess -eq $random ]; then
        echo "Correct! Het Nummer was:" $random
        break;
    else
        if [ $guess -lt $random ]; then 
            echo 'Hoger';
        elif [ $guess -gt $random ]; then
            echo 'Lager';
        fi
    fi
    
    ((aantalgokken+=1))
done

if [ $guess -ne $random ]; then
    echo 'Too bad! Out of attempts.'
fi

