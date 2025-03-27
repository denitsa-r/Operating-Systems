#!/bin/bash

#Напишете shell script, който да приема параметър име на директория, от която взимаме файлове, и опционално експлицитно име на директория, в която ще копираме файлове. Скриптът да копира файловете със съдържание, променено преди по-малко от 45 мин, от първата директория във втората директория. Ако втората директория не е подадена по име, нека да получи такова от днешната дата във формат, който ви е удобен. При желание новосъздадената директория да се архивира.

if [[ $# -lt 1 ]]; then 
    echo "Script expects at least one param!"
    exit 1
fi

if [[ ! -d $1 ]]; then 
    echo "First param must be a directory!"
    exit 2
fi

if [[ $# -eq 2 && ! -d $2 ]]; then 
    echo "Second param must be a directory"
    exit 3
fi 

if [[ $# -eq 1 ]] ; then
    dir=$(date +%s)
    mkdir "${dir}"
else
    dir=${2}
fi

find $1 -type f -mmin -45 -exec cp {} ${dir} ';'
