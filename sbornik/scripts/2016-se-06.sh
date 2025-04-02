#!/bin/bash

if [[ $# -ne 0 ]] ; then
    echo "This script does not need any arguments"
    exit 1
fi

cat data/books | cut -d '-' -f 2 | cut -d ' ' -f2- | awk -F '\n' '{print NR". " $0}' | sort -k2
