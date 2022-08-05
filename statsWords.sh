#!/bin/bash

CANT_LETRAS_L=0  #Aquí almacenaré la cantidad de letras de la palabra más larga
CANT_LETRAS_C=5000 #inicilizo esta variable con un número alto.
CANT_TOTAL_PALABRAS=0
CANT_TOTAL_LETRAS=0

touch textolimpio.txt

for PALABRA in $(cat $1)
do
  echo $PALABRA | tr -d [".",",",":"] >> textolimpio.txt #elimino caracteres
done

TEXTOLIMPIO=$(cat textolimpio.txt) 

for PALABRA in $TEXTOLIMPIO
do
	CANT=${#PALABRA}
	CANT_TOTAL_LETRAS=$(($CANT_TOTAL_LETRAS + $CANT))

	if [ $CANT -gt $CANT_LETRAS_L ]  #si es mayor
	then
		PALABRA_LARGA=$PALABRA
		CANT_LETRAS_L=$CANT
	fi
	if [ $CANT -lt $CANT_LETRAS_C ]
	then 
		PALABRA_CORTA=$PALABRA
		CANT_LETRAS_C=$CANT
	fi
done

TOTAL_PALABRAS=$(wc -w < textolimpio.txt)

echo "Total palabras $TOTAL_PALABRAS"
echo "Total letras $CANT_TOTAL_LETRAS"

PROMEDIO=$(($CANT_TOTAL_LETRAS/$TOTAL_PALABRAS))

echo "La palabra más larga es $PALABRA_LARGA y tiene $CANT_LETRAS_L letras"
echo "La palabra más corta es $PALABRA_CORTA y tiene $CANT_LETRAS_C letras"
echo "En promedio, las palabras tienen $PROMEDIO letras"

rm textolimpio.txt
