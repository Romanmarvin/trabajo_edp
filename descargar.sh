#!/bin/bash
<< comment
    descargar.sh: Descarga un archivo comprimido de imágenes. De debe
    poder indicar por argumento dos archivos (uno con las imágenes y otro
    con una suma de verificación). Si ocurrió algún error se debe informar al
    usuario de lo contrario se procede a descomprimir.
comment
#aca tengo que cambiar la carperta de salida por la que voy a poner en el docker.

carpeta_salida="/trabajo_edp"
comrpesion=$(basename "$carpeta")
tar -czvf "$carpeta_salida.tar.gz" "$carpeta_salida"
mv "$carpeta_salida.tar.gz" "$carpeta_salida/$compresion.tar.gz"
echo "carpeta comprimida : $carpeta_salida/$compresion.tar.gz"

#no entiendo como sacar las cosas del contenedor