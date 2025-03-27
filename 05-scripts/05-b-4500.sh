#!/bin/bash

# Да се напише shell скрипт, който получава при стартиране като параметър в командния ред идентификатор на потребител. Скриптът периодично (sleep(1)) да проверява дали потребителят е log-нат, и ако да - да прекратява изпълнението си, извеждайки на стандартния изход подходящо съобщение.

if [[ $# -ne 1 ]]; then 
    echo "Script expects 1 param"
    exit 1
fi 

# ? проверка за идентификатора??? - ако е username
cat /etc/passwd | grep -q "${1}"
if [[ $? -ne 0 ]]; then 
    echo "must be a valid username"
    exit 2
fi

# while sleep 1; do 
#     who | grep -q "${1}"
#     if [[ $# -eq 0 ]]; then 
#         echo "${1} is logged"
#         exit 0
#     fi
# done
# PITAI

while sleep 1; do 
    if who | grep -q "${1}"; then
        echo "${1} is logged"
        exit 0
    fi
done

