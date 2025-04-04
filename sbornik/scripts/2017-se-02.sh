#!/bin/bash

if [[ $# -ne 3 ]] ; then
    echo "Script needs 3 arguments!"
    exit 1
fi

if [[ ! -d $1 || ! -d $2 || -z $3 ]] ; then
    echo "First and Second must be directories, Third must be a string!"
    exit 2
fi

if [[ $(find $2 -type f | wc -l) -ne 0 ]] ; then
    echo "Directory must be empty!"
    exit 3
fi

if [[ $(whoami) = "root" ]] ; then
    echo "You must be root to run the script!"
    exit 4
fi

src=${1}
dst=${2}
abc=${3}

while read -r file; do
    dirs=$(echo "${file}" | cut -d '/' -f 2- | awk -F '/' '{for (i=1; i<NF; i++) printf "/" $i} {printf "\n"}')
    echo "${dirs}"
    if [[ ! -z ${dirs} ]] ; then
       mkdir -p ${dst}${dirs}
    fi
    mv "${file}" "${dst}${dirs}"
done < <( find $src -type f -name "*${abc}*" )
