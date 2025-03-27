  1 #!/bin/bash
  2
  3 # Да се напише shell скрипт, който чете от стандартния вход име на файл и символен низ, проверява дали низа с
  4
  5 if [[ $# -ne 0 ]] ; then
  6     echo "This script does not expect arguments!"
  7     exit 1
  8 fi
  9
 10
 11 read -p "Please enter file name: " filename
 12 read -p "Please enter a string: " string
 13
 14 if [[ ! -f ${filename} ]] ; then
 15     echo "Given name is not a file!"
 16     exit 2
 17 fi
 18
 19 if [[ -z ${string} ]] ; then
 20     echo "The string must not be empty!"
 21     exit 3
 22 fi
 23
 24 grep -q "${string}" ${filename}
 25 echo "${?}"
