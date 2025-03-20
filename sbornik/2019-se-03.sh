#!/bin/bash

find ~velin -type f -inum $(find ~velin -type f -printf "%T@:%i\n" 2>/dev/null | sort -nrk 1 | head -n 1 | cut -d ':' -f 2 ) -printf "%d \n" 2>/dev/null | sort -n | head -n 1