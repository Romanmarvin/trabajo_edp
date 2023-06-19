#!/bin/bash

carpeta_salida="/home/marvin/Escritorio/Hugo/"
comrpesion=$(basename "$carpeta")
tar -czvf "$carpeta_salida.tar.gz" "$carpeta_salida"
mv "$carpeta_salida.tar.gz" "$carpeta_salida/$compresion.tar.gz"
echo "carpeta comprimida : $carpeta_salida/$compresion.tar.gz"
