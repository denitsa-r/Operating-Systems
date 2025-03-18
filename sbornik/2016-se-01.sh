#!/bin/bash

#echo "123abv123
#123zz123
#MMU_2.4
#" >  philip-j-fry.txt

cat philip-j-fry.txt | grep -E "^[^a-w]*[2,4,6,8][^a-w]*$" | wc -l
