#!/bin/bash 

find ./ -type f -printf "%n %p \n" | sort -nr -k 1 | head -n 5 | cut -d ' ' -f 2