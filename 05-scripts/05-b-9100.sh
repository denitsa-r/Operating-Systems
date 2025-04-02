#!/bin/bash

# Опишете поредица от команди или напишете shell скрипт, които/който при известни две директории SOURCE и DESTINATION:
# - намира уникалните "разширения" на всички файлове, намиращи се някъде под SOURCE. (За простота приемаме, че в имената на файловете може да се среща символът точка '.' максимум веднъж.)
# - за всяко "разширение" създава по една поддиректория на DESTINATION със същото име
# - разпределя спрямо "разширението" всички файлове от SOURCE в съответните поддиректории в DESTINATION

if [[ $# -ne 2 ]] ; then
     echo "Script needs 2 arguments!"
     exit 1
fi

if [[ ! -d $1 || ! -d $2 ]] ; then
    echo "The 2 arguments must be directories!"
    exit 2
fi

src=${1}
dest=${2}

endings=$(find "${src}" -type f -regex "^[^\.]*\.[^\.]*" | cut -d '.' -f2 | sort | uniq)
while read -r end ; do
    mkdir "${dest}/${end}"
done < <(echo "${endings}")

files=$(find "${src}" -type f -regex "^[^\.]*\.[^\.]*")
while read -r file; do
    end=$(echo "${file}" | cut -d '.' -f2)
    mv "${file}" "${dest}/${end}"
done < <(echo "${files}")
