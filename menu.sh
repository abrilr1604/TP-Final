#!/bin/bash

[ ! $# -eq 1 ] && echo "Se permite únicamente un argumento" && exit 1
[ ! -f $1 ] && echo "No existe el archivo" && exit 2

TXT=$(readlink -e $1) 

select option in "Indicador de longitud de palabras" "Indicador de uso de palabras" "Detector de nombres propios" "Indicador de longitud de oraciones" "Contador de lineas en blanco"
do
	case $option in
		"Indicador de longitud de palabras")
			./statsWords.sh $TXT
			break;;
		"Indicador de uso de palabras")
			./statsUsageWords.sh $TXT
			break;;
		"Detector de nombres propios")
			./findNames.sh $TXT
			break;;
		"Indicador de longitud de oraciones")
			./statsSentences.sh $TXT
			break;;
		"Contador de lineas en blanco")
			./blankLinesCounter.sh $TXT
			break;;
		"Salir")
			break;;
		*)
			echo "Opción no válida."
			break;;
	esac
done
