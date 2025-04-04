#!/bin/bash

if [[ $# -eq 0 ]] ; then
    echo "Script needs some params"
    exit 1
fi

N=10
if [[ $1 = "-n" ]] ; then
    if [[ ! $2 =~ [0-9]+ ]] ; then
        echo "Second param must be a number"
        exit 2
    fi
    N=${2}
fi

shift
shift

for file in $@; do
    if [[ ! -f ${file} || ! ${file} =~ [.*\.log] ]] ; then
        echo "All additional params must be '.log' files"
        exit 3
    fi
done

for file in $@; do
    base=$(echo "${file}" | sed -E "s:(/?[^ ]*/)*([^ ]*).log:\2:")
    while read -r line; do
        date=$(echo "${line}" | cut -d ' ' -f1,2)
        data=$(echo "${line}" | cut -d ' ' -f3-)
        echo "${date} ${base} ${data}"
    done < <( tail -n ${N} ${file} )
done
