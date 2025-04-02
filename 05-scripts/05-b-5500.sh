#!/bin/bash

# Да се напише shell script, който генерира HTML таблица съдържаща описание на
# потребителите във виртуалката ви. Таблицата трябва да има:
# - заглавен ред с имената нa колоните
# - колони за username, group, login shell, GECOS field (https://en.wikipedia.org/wiki/Gecos_field)

if [[ $# -ne 0 ]] ; then
    echo "This script does not need any arguments!exit 1"
fi

printf "<table>\n
\t<tr>\n
\t\t<th>Username</th>\n
\t\t<th>group</th>\n
\t\t<th>login shell</th>\n
\t\t<th>GECOS</th>\n
\t</tr>\n"

cat /etc/passwd | cut -d ':' -f 1,4,5,7 | \
    while read line; do
        printf "\t<tr>\n
                \t\t<td>$(echo ${line} | cut -d ':' -f1)</td>\n
                \t\t<td>$(echo ${line} | cut -d ':' -f2)</td>\n
                \t\t<td>$(echo ${line} | cut -d ':' -f4)</td>\n
                \t\t<td>$(echo ${line} | cut -d ':' -f3 )</td>\n
                \t</tr>\n"
   done
echo "</table>"