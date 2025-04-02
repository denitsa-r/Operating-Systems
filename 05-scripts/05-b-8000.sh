#!/bin/bash

# Напишете shell script, който получава като единствен аргумент име на потребител и за всеки негов процес изписва съобщение за съотношението на RSS към VSZ. Съобщенията да са сортирани, като процесите с най-много заета виртуална памет са най-отгоре.
# Hint:
# Понеже в Bash няма аритметика с плаваща запетая, за смятането на съотношението използвайте командата bc. За да сметнем нампример 24/7, можем да: echo "scale=2; 24/7" | bc
# Резултатът е 3.42 и има 2 знака след десетичната точка, защото scale=2.
# Алтернативно, при липса на bc ползвайте awk.

if [[ $# -ne 1 ]] ; then
    echo "This script expects only one argument"
    exit 1
fi

cat /etc/passwd | cut -d ':' -f1 | grep -Eq "^${1}$"
if [[ $? -ne 0 ]] ; then
    echo "The argument must be a valid username"
    exit 2
fi

lines=$(ps -eo vsz=,rss= | sort -nr -k1)
while read line ; do
    vsz=$(echo ${line} | cut -d ' ' -f1)
    rss=$(echo ${line} | cut -d ' ' -f2)
    if [[ $rss -eq 0 ]] ; then
        continue
    fi
    echo "scale=2; ${vsz}/${rss}" | bc
done < <(echo "${lines}")
