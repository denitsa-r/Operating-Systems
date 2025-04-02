#!/bin/bash

# Да се напише shell скрипт, който приема два параметъра - име на директория и число. Скриптът да извежда на стандартния изход имената на всички обикновени файлове във директорията, които имат размер, по-голям от подаденото число.

if [[ $# -ne 2 ]] ; then
    echo "This script needs 2 params"
    exit 1
fi

if [[ ! -d $1 || ! $2 =~ [0-9]+ ]] ; then
    echo "First param must be a directory and second - a number"
    exit 2
fi

find $1 -type f -size +${2}c
