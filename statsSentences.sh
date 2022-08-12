#!/bin/bash

FIN_ORACION='[.!?]'

touch oracionesSueltas.txt  #archivo auxiliar

#este cat hace que en oracionesSueltas.txt haya UNA oración por línea.
cat $1 | tr "." "\n" | tr "?" "\n" | tr "!" "\n" | sed '/^ *$/d ; s/^[ \t]*//' >> oracionesSueltas.txt

FRASECORTA=""
FRASELARGA=""
CANT_ORACIONES=0
P_FRASE_LARGA=0
P_FRASE_CORTA=1000 #inicializo en un número grande
CANT_PALABRAS_TOTALES=0

while read -r line;
do
	CANT_ORACIONES=$(($CANT_ORACIONES + 1))  #por cada oración, suma 1
	CANT_PALABRAS=$(echo $line | wc -w)   #cant de palabras de c/ oracion
	CANT_PALABRAS_TOTALES=$(($CANT_PALABRAS_TOTALES + $CANT_PALABRAS)) #acumulador
	if [[ $CANT_PALABRAS -gt $P_FRASE_LARGA ]]; then
		P_FRASE_LARGA=$CANT_PALABRAS
		FRASELARGA=$line
	fi
	if [[ $CANT_PALABRAS -lt $P_FRASE_CORTA ]]; then
		P_FRASE_CORTA=$CANT_PALABRAS
		FRASECORTA=$line
	fi
done < oracionesSueltas.txt

PROMEDIO=$(($CANT_PALABRAS_TOTALES / $CANT_ORACIONES))

echo "Total de oraciones:" $CANT_ORACIONES
echo "La frase más larga es: " $FRASELARGA ", y tiene" $P_FRASE_LARGA "palabras"
echo "La frase más corta es: " $FRASECORTA ", y tiene" $P_FRASE_CORTA "palabras"
echo "El promedio de longitud es" $PROMEDIO "palabras por oracion"

#cat oracionesSueltas.txt  #para corroborar

rm oracionesSueltas.txt

