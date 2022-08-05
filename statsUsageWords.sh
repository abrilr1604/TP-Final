#!/bin/bash

touch textolimpio.txt

for palabra in $(cat $1)
do 
	if [ ${#palabra} -gt 3 ]  #si es mayor a 3 (4 o más)
	then
		echo $palabra | tr -d [".",",","-",":"] >> textolimpio.txt
	fi
done

#despues de ese for, en textolimpio.txt solo quedan las palabras de 4 o más letras, sin caracteres raros.


TEXTOLIMPIO=$(cat textolimpio.txt)

echo $TEXTOLIMPIO     #solo para corroborar

echo "Las 10 palabras más usadas (de al menos 4 letras), son: "
sort textolimpio.txt | uniq -c | sort -nr | head -n 10

rm textolimpio.txt
