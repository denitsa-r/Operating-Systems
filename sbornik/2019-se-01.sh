#!/bin/bash 

# echo "name;type;distance;mass;volume;density;speed
# earth;T;1.00000011;1;1;5.52;29.7859
# mars;T;1.52366231;0.107;0.151;3.94;24.1309
# saturn;G;9.53707032;95;763.62;0.7;9.6724
# mercury;T;0.38709893;0.055;0.056;5.43;47.8725
# venus;T;0.72333199;0.815;0.857;5.24;35.0214
# jupiter;G;5.20336301;318;1321.3;1.33;13.0697
# neptune;I;30.06896348;17;57.747;1.76;5.4778
# uranus;I;19.19126393;14.5;63.102;1.3;6.8352" > pract/planets.txt

cat pract/planets.txt | tail -n +2 | sort -n -t ';' -k 3 | grep -E "^[^ ]*;$(cat pract/planets.txt | tail -n +2 | sort -n -t ';' -k 3 | tail -n 1 | cut -d ';' -f 2);" | head -n 1 | awk -F ';' '{print $1 "\t" $4}'