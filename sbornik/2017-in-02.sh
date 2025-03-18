#a
find ./pract -type f -size 0 | xargs -I {} rm {}
find ./pract -type f -size 0 -delete 

#b
find ./pract -type f -user $(id -u) -printf "%s %p \n" | sort -nr -k 1 | cut -d ' ' -f 2 | head -n 5 | xargs -I {} rm {}
