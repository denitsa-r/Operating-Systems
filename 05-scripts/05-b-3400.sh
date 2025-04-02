#!/bin/bas# Да се напише shell скрипт, който чете от стандартния вход име на файл и символен низ, проверява дали низа if [[ $# -ne 0 ]] ; then    echo "This script does not expect arguments!"    exit 1f
read -p "Please enter file name: " filename
read -p "Please enter a string: " string

if [[ ! -f ${filename} ]] ; then
    echo "Given name is not a file!"
    exit 2
fi

if [[ -z ${string} ]] ; then
    echo "The string must not be empty!"
    exit 3
fi

grep -q "${string}" ${filename}
echo "${?}"
