#!/bin/bash 

# Да се напише shell скрипт, който форматира големи числа, за да са по-лесни за четене.
# Като пръв аргумент на скрипта се подава цяло число.
# Като втори незадължителен аргумент се подава разделител. По подразбиране цифрите се разделят с празен интервал.

if [[  $# -lt 1 ]]; then 
    echo "Script expects at least 1 param"
    exit 1
fi

if [[ ! $1 =~ [0-9]+ ]]; then 
    echo "First param must be an integer"
    exit 2
fi

sep=" "
if [[ $# -eq 2 ]]; then 
    sep="${2}"
fi

count=$(echo ${1} | wc -m)
remainder=$(echo ${count}%3 | bc)
i=1
end=$((($i+2-$remainder)))
curr=$(echo ${1} | cut -c ${i}-${end})
printf "${curr}${sep}"
i=$(((${end}+1)))
while [[ $i -lt $count ]]; do
    end=$((($i+2)))
    curr=$(echo "${1}" | cut -c ${i}-${end})
    printf "${curr}${sep}"
    ((i+=3))
done
printf "\n"
