#!/bin/bash
#Да се напише shell скрипт, който приканва потребителя да въведе пълното име на директория и извежда на станд
if [[ $# -ne 0 ]] ; then
    echo "This script does not expect arguments!"
    exit 1
fi

read -p "Please enter a full directory name: " name_dir

if [[ ! -d ${name_dir} ]] ; then
     echo "Given string is not a directory"
     exit 2
fi

printf "Files in ${name_dir}: $(find ${name_dir} -type f | wc -l) \nDirectories in ${name_dir}: $(find ${name_dir} -type d | wc -l)"