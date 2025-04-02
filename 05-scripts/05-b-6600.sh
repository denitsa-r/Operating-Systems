#!/bin/bash

# Да се напише shell скрипт, който получава единствен аргумент директория и изтрива всички повтарящи се (по съдържание) файлове в дадената директория. Когато има няколко еднакви файла, да се остави само този, чието име е лексикографски преди имената на останалите дублирани файлове.

if [[ $# -ne 1 ]]; then
    echo "Script needs only one param!"
    exit 1
fi

if [[ ! -d $1 ]] ; then
    echo "Param must be a directory!"
    exit 2
fi

files=$(find $1 -type f)

find $1 -type f | while read curr; do
    find $1 -type f ! -regex "${curr}"  | while read new; do
        lines=$(diff ${curr} ${new} 2>/dev/null | wc -l)
        if [[ $lines -eq 0 ]] ; then
            if [[ ${curr} < ${new} ]] ; then
                rm "${new}" 2>/dev/null
            else
                rm "${curr}" 2>/dev/null
                break
            fi
        fi
    done
done