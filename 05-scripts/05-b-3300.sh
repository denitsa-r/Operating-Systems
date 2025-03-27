#!/bin/bash
# Да се напише shell скрипт, който чете от стандартния вход имената на 3 файла, обединява редовете на първите
if [[ $# -ne 0 ]] ; then
    echo "This script does not expect arguments!"
    exit 1
fi

read -p "Enter 3 file names: " file1 file2 file3

if [[ ! -f ${file1} || ! -f ${file2} || ! -f ${file3} ]] ; then
    echo "Invalid file name!"
    exit 1
fi

paste ${file1} ${file2} | sort > ${file3}
