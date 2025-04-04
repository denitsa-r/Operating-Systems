#!/bin/bash

if [[ $# -ne 2 ]] ; then
    echo "Script needs 2 arguments!"
    exit 1
fi

if [[ ! -d $1 || -z $2 ]] ; then
    echo "First param must be a directory and second - a string"
    exit 2
fi

find $1 -type f | cut -d '/' -f2 | grep -E "vmlinuz-[0-9]+.[0-9]+.[0-9]+-${2}" | sort -r | head -n 1
