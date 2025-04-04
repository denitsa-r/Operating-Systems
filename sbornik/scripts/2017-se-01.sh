#!/bin/bash

if [[ $# -ne 3 ]] ; then
    echo "Script needs 3 arguments"
    exit 1
fi

if [[ ! -f $1 || -z $2 || -z $3 ]] ; then
    echo "First argument must be a file and second and third argument must be strings"
    exit 2
fi

first=$(cat $1 | grep -E "^$2")
second=$(cat $1 | grep -E "^$3")

if [[ ! -z ${second} ]] ; then
    new=$(diff <( echo ${first} | cut -d '=' -f2 | tr ' ' '\n' ) <( echo ${second} | cut -d '=' -f2 | tr ' ' '\n' ) | grep -E "^> .*" | cut -c 3- | tr '\n' ' ')
    sed -iE "s|^${second}$|$( echo ${second} | cut -d '=' -f1)=${new}|" $1
fi
