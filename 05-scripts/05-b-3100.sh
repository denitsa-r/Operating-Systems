#!/bin/bash

# Да се напише shell скрипт, който приканва потребителя да въведе низ - потребителско име на потребител от си

if [[ $# -ne 0 ]] ; then
    echo "The script does not expect any arguments!"
    exit 1
fi

read -p "Please enter a username of someone in our system " name
 
ps -eo tty=,user= | grep -E "\<${name}\>"
