#!/bin/bash

#Имате компилируем (a.k.a няма синтактични грешки) source file на езика C. Напишете shell script, който да по if [[ $# -ne 1 ]] ; then     echo "One argument expected!"     exit 1 fi

if [[ ! -f $1 ]] ; then
    echo "Argument must be a file"
    exit
fi

lines=$(cat $1 | wc -l)
i=1
maxDepth=0
currDepth=0

while [[ $i -le $lines ]]; do
    line=$(cat $1 | head -n $i | tail -n 1)
    echo ${line} |  grep -q '{'
    if [[ $? -eq 0 ]]; then
        ((currDepth++))
    else
        echo ${line} | grep -q '}'
        if [[ $? -eq 0 ]]; then
            ((currDepth--))
            if [[ $currDepth -gt $maxDepth ]]; then
                maxDepth=$currDepth
            fi
        fi
    fi
    ((i++))
done

echo ${maxDepth}
