#!/bin/bash

if [[ $# -ne 3 ]] ; then
    echo "Script expects 3 params"
    exit 4
fi

if [[ ! $1 =~ ^-?[0-9]+$ || ! $2 =~ ^-?[0-9]+$ || ! $3 =~ ^-?[0-9]+$ ]]; then
    exit 3
fi

if [[ $2 -gt $3 ]]; then
    exit 2
fi

if [[ $1 -gt $2 && $1 -lt $3 ]] ; then
    exit 0
else
    exit 1
fi
