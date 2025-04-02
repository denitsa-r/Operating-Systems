#!/bin/bash

# Да се напише shell скрипт, който приема файл и директория. Скриптът проверява в подадената директория и нейните под-директории дали съществува копие на подадения файл и отпечатва имената на намерените копия, ако съществуват такива.

# NB! Под 'копие' разбираме файл със същото съдържание.

if [[ $# -ne 2 ]]; then 
    echo "Script expects 2 params"
    exit 1
fi

if [[ ! -f $1 ]]; then 
    echo "First param must be a file"
    exit 2
fi 

if [[ ! -d $2 ]]; then
    echo "Second param must be a directory"
    exit 3
fi

files=$(find $2 -type f)
for file in $files; do
    count=$(diff $1 $file | wc -l)
    if [[ count -eq 0 ]]; then
        echo "${file}"
    fi
done
