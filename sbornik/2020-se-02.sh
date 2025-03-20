#!/bin/bash

grep $(cat pract/spacex.txt | tail -n +2 |sort -nr -t '|' -k 1 | grep "Failure" | cut -d '|' -f 2 | uniq -c | sort -nrk 1 | head -n 1 | awk '{print $2}') pract/spacex.txt | sort -nr -k 1 -t '|' | head -n 1 | awk -F '|' '{print $3":"$4}'
