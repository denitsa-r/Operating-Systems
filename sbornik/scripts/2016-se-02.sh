#!/bin/bash

if [[ $# -ne 1 ]]; then
    echo "Script expects only 1 param"
    exit 1
fi

if [[ ! $1 =~ [0-9]+ ]] ; then
    echo "Param must be a number"
    exit 2
fi

if [[ $(whoami) != "root" ]]; then 
    echo "Script must be run from root"
    exit 3
fi 

users=$(ps -eo user= | sort | uniq)
for user in ${users}; do
    sum=$(ps -u ${curr} -o rss= | xargs | tr ' ' '+' | bc)
    if [[ ${sum} > ${1} ]] ; then
        ps -u ${user} -o pid=,rss= | sort -nr -k 2 | head -n 1 | awk '{print $1}' | xargs -I {} sleep {}
    fi
done;

