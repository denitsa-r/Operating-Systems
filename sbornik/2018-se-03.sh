#!/bin/bash  

# спрямо сегашното /etc/passwd

# Денис Цветков,,,,SI:/home/students/s0600259
# Кристина Ганова,,,,SI:/home/students/s0600147
# Найле Гавазова,,,,SI:/home/students/s0600226
# Гергана Дончева,,,,SI:/home/students/s0600189
# Деница Рашкова,,,,SI:/home/students/s0600173
# Димитър Донков,,,,SI:/home/students/s0600254

cat /etc/passwd | grep -E "^([^ ]*:){3}$(cat /etc/passwd | head -n 201 | tail -n 1 | cut -d ':' -f 4):" --color | cut -d ':' -f 5,6 | sed -E 's/,[^ ]*:\/home/:\/home/g'
