#!/bin/bash

# Напишете shell script guess, която си намисля число, което вие трябва да познате. В зависимост от вашия отговор, програмата трябва да ви казва "надолу" или "нагоре", докато не познате числото. Когато го познаете, програмата да ви казва с колко опита сте успели.
# Hint: Един начин да направите рандъм число е с $(( (RANDOM % b) + a  )), което ще генерира число в интервала [a, b]. Може да вземете a и b като параметри, но не забравяйте да направите проверката.

if [[ $# -ne 2 ]] ; then
    echo "This script expects 2 arguments!"
    exit 1
fi

if [[ ! ${1} =~ [0-9]+ || ! ${2} =~ [0-9]+ ]]; then
    echo "args must be numbers!"
    exit 1
fi

if [[ ${2} -lt ${1} ]] ; then
    a=${2}
    b=${1}
else
    a=${1}
    b=${2}
fi
num=$(( (RANDOM % $b) + $a  ))
tries=0
while read -p "Guess: " curr ; do
    if [[ ${curr} -eq ${num} ]]; then
        echo "RIGHT! Guessed ${num} in ${tries} tries!"
        exit 0
    elif [[ ${curr} -gt ${num} ]] ; then
        echo "...smaller!"
    elif [[ ${curr} -lt ${num} ]] ; then
        echo "...bigger!"
    fi
    ((tries++))
done
