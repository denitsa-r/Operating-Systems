#!/bin/bash

# Да се напише shell скрипт, който получава единствен аргумент директория и отпечатва списък с всички файлове и директории в нея (без скритите).
# До името на всеки файл да седи размера му в байтове, а до името на всяка директория да седи броят на елементите в нея (общ брой на файловете и директориите, без скритите).
# a) Добавете параметър -a, който указва на скрипта да проверява и скритите файлове и директории.

if [[ $# -ne 1 ]] ; then
    echo "This script expects only one argument!"
    exit 1
fi

if [[ ! -d $1 ]] ; then
    echo "First argument must be a directory!"
    exit 2
fi

find $1 -mindepth 1 -type f,d -printf "%p %s %y\n" | while read file;
    do
        filename=$(echo "${file}" | cut -d ' ' -f1 )
        filetype=$(echo "${file}" | cut -d ' ' -f3)
        size=$(echo "${file}" | cut -d ' ' -f2)
        if [[ "${filetype}" = "f" ]] ; then
            echo "${filename} ${size}"
        else
            #it is directory
            count=$(find $filename -type d,f ! -name "." | wc -l)
            echo "${filename} ${count}"
        fi
    done
