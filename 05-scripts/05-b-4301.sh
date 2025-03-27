#!/bin/bash

#Напишете shell script, който автоматично да попълва файла указател от предната задача по подадени аргументи: име на файла указател, пълно име на човека (това, което очакваме да е в /etc/passwd) и избран за него nickname.
#Файлът указател нека да е във формат:
#<nickname, който лесно да запомните> <username в os-server>
#// може да сложите и друг delimiter вместо интервал

if [[ $# -ne 3 ]]; then 
    echo "Script needs 3 arguments!"
    exit 1
fi

if [[ ! -f $1 ]]; then 
    echo "First param must be file!"
    exit 2
fi 

line=$(cat /etc/passwd | grep "${2}")

if [[ $? -ne 0 ]]; then 
    echo "Second param must be a valid full name in /etc/passwd"
    exit 3
fi 


echo "${3} $(echo ${line} | cut -d ':' -f 1" > $1

#тука бонуса няма да го мъча сега 