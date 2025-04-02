#!/bin/bash

# Да се напише shell скрипт, който приема произволен брой аргументи - имена на файлове или директории. Скриптът да извежда за всеки аргумент подходящо съобщение:
        # - дали е файл, който може да прочетем
        # - ако е директория - имената на файловете в нея, които имат размер, по-малък от броя на файловете в директорията.

for curr in $@; do
    if [[ -f ${curr} && ! -r ${curr} ]] ;then
        echo "Unreadble"
    elif [[ -f ${curr} && -r ${curr} ]] ; then
        echo "Readble"
    elif [[ -d ${curr} ]] ; then
        count=$(find ${curr} -mindepth 1 -maxdepth 1 -type f | wc -l)
        find ${curr} -mindepth 1 -maxdepth 1 -type f -size -${count}c
    fi
done
