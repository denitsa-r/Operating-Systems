#!/bin/bash

if [[ $# -ne 1 ]]; then
    echo "Script expects 1 param!"
    exit 1
fi

if [[ ! -d $1 ]] ; then
    echo "Param must be a directory"
    exit 2
fi

while read -r file; do
    if [[ ! -e ${file} ]] ; then
        echo "${file}"
    fi
done < <(find "${1}" -type l)
