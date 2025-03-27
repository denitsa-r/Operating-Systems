#!/bin/bash

#Да се напише shell скрипт, който приема точно един параметър и проверява дали подаденият му параметър се със

if [[ $# -ne 1 ]]; then
    echo "Invalid number of arguments!"
fi

echo "$1" | grep -qE '^[[:alnum:]]+$'
 
if [[ "$?" -eq 0 ]]; then
    echo "Yes"
else
    echo "No"
fi
