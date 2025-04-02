#!/bin/bash

if [[ $# -ne 1 ]]; then
    echo "Script expects 1 param!"
    exit 1
fi

if [[ ! -d $1 ]] ; then
    echo "Param must be a directory"
    exit 2
fi

files=$(find "${1}" -type l)
for file in ${files}; do
    if [[ ! -e ${file} ]] ; then
        echo "${file}"
    fi
done
