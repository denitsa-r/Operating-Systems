#!/bin/bash

# Да се напише shell скрипт, който приема параметър - име на потребител. Скриптът да прекратява изпълненито на всички текущо работещи процеси на дадения потребител, и да извежда колко са били те.
# NB! Може да тествате по същият начин като описаният в 05-b-4300

if [[ $# -ne 1 ]] ; then
    echo "Script expects 1 param!"
    exit 1
fi
cat /etc/passwd | cut -d ':' -f1 | grep -Eq "^${1}$"

if [[ $? -ne 0 ]] ; then
    echo "First param must be username"
    exit 2
fi

count=$(ps -eo user= | grep $1 | wc -l )
echo "$(ps -eo user=,pid= | grep $1 | awk '{print $2}')"
