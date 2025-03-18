#!/bin/bash 

find /home/pesho -type f -iname "* *" -printf "%T@ %i\n" | sort -nr -k 1 | head -n 1 | cut -d ' ' -f 2