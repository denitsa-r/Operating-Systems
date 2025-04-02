#!/bin/bash

# Да се напише shell скрипт, който получава произволен брой аргументи файлове, които изтрива.
# Ако бъде подадена празна директория, тя бива изтрита. Ако подадения файл е директория с поне 1 файл, тя не се изтрива.
# За всеки изтрит файл (директория) скриптът добавя ред във log файл с подходящо съобщение.

# а) Името на log файла да се чете от shell environment променлива, която сте конфигурирали във вашия .bashrc.
# б) Добавете параметър -r на скрипта, който позволява да се изтриват непразни директории рекурсивно.
# в) Добавете timestamp на log съобщенията във формата: 2018-05-01 22:51:36

for file in $@ ; do
    if [[ ! -f "${file}" && ! -d "${file}" && "${file}" != "-r" ]] ; then
        echo "All arguments must be files, directories or '-r'!"
        exit 1
    elif [[ -f "${file}" ]] ; then
        rm ${file}
        echo "[$(date +'%Y-%m-%d %H:%M:%S')] Removed file ${file}" >> ${RMLOG_FILE}
    elif [[ "${file}" = "-r" ]] ; then
        continue
    else
        # is a directory
        files=$(find ${file} -mindepth 1 -type f | wc -l)
        if [[ ${files} -eq 0 ]] ; then
                rm -r ${file}
                echo "[$(date +'%Y-%m-%d %H:%M:%S')] Removed file ${file}" >> ${RMLOG_FILE}
        fi
    fi
done
