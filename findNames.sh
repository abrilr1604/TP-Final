#!/bin/bash

touch textolimpio.txt  #archivo auxiliar
touch mayus.txt

for PALABRA in $(cat $1)
do
	echo $PALABRA | tr -d [",",".",":"] >> textolimpio.txt
done

grep '\<[A-Z][a-z]*\>' textolimpio.txt >> mayus.txt

#cat mayus.txt   #para corroborar

echo "Las palabras que comienzan con mayúsculas son: "
sort --uniq mayus.txt

rm textolimpio.txt
rm mayus.txt
