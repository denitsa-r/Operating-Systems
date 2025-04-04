#!/bin/bash

if [[ $# -ne 2 ]] ; then
    echo "Script needs 2 arguments"
    exit 1
fi

if [[ ! -f ${1} || ! ${1} =~ .*\.csv || ! ${2} =~ .*\.csv ]] ; then
    echo "Arguments must be files!"
    exit 2
fi

if [[ ! -e ${2} ]] ; then
    touch ${2}
fi

while read -r line; do
    rest=$(echo ${line} | cut -d ',' -f 2- )
    cat $2 | grep -E "^[0-9]*,${rest}$" --color
    if [[ $? -eq 0 ]] ; then
        echo "line : ${line}" |
        if [[ $(echo ${line} | cut -d ',' -f1) -lt $(cat $2 | grep -E "^[0-9]*,${rest}$" | cut -d ',' -f1 ) ]] ; then
            sed -i -E "s/^[0-9]*,${rest}$/${line}/" $2
        fi
    else
        echo ${line} >> "$2"
    fi
done < "$1"
