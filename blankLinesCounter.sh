#!/bin/bash

BLANK_LINES=$(grep -cvP '\S' $1)

#-P '\S' matchea lineas no vacías (líneas con algún tipo de información)

echo "La cantidad de líneas en blanco es:" $BLANK_LINES

exit 0


