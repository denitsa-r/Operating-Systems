find /home/students -type d -printf "%C@ %p \n" 2>dev/null | awk '{if ($1 >= 1551168000 && $1 <= 1551176100) print $2}'
find /home/students -type d -printf "%C@ %p \n" 2>dev/null | awk '{if ($1 >= 1741392655 && $1 <= 1742392655) print $2}'

#спрямо сегашното /etc/passwd 
find /home/students -type d -printf "%C@ %p \n" 2>/dev/null | awk '{if ($1 >= 1741392655 && $1 <= 1742392655) print $2}' | cut -d '/' -f 4 | sort | uniq | xargs -I {} grep {} /etc/passwd | sed -E 's:,+[^ ]*\:/home:\:home:g' | awk -F ':' '{print $1 "\t" $5}' | cut -c 2-
