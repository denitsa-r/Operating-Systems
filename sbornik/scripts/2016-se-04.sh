#!/bin/bash

if [[ $# -ne 2 ]] ; then
    echo "Script needs 2 arguments!"
    exit 1
fi

if [[ ! $1 =~ [0-9]+ || ! $2 =~ [0-9]+ ]] ; then
    echo "Script expects only numbers!"
    exit 2
fi

mkdir {a,b,c}

while read -r file; do
    lines=$(echo ${file} | wc -l)
    if [[ ${lines} -lt $1 ]] ; then
        mv ${file} a
    elif [[ (${lines} -gt $1 && ${lines} -lt $2) || (${lines} -lt $1 && ${lines} -gt $2) ]] ; then
        mv ${file} b
    else
        mv ${file} c
    fi
done < <( find ./ -maxdepth 1 -type f  )
