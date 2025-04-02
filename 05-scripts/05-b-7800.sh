#!/bin/bash

# Да се напише shell скрипт, който намира броя на изпълнимите файлове в PATH.
# Hint: Предполага се, че няма спейсове в имената на директориите
# Hint2: Ако все пак искаме да се справим с този случай, да се разгледа IFS променливата и констуркцията while read -d

if [[ $# -ne 0 ]]; then
    echo "This script does not expect arguments"
    exit 1
fi

count=0
while read -d ':' directory; do
    while read -r file; do
        if [[ -x ${file} ]] ; then
            ((count++))
        fi
    done < <(find ${directory} -type f)
done < <(echo ${PATH})

echo "${count}"
