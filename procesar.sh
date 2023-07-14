#!/bin/bash
# Directorio de búsqueda
directorio="/trabajo_edp"
#se usa el find buscar , el grep para filtrar  
# find "$directorio" -type f -name "*.jpg" | grep -E '[A-Z][a-z]+' | while IFS= read -r archivo; do
for archivo in $(find "$directorio" -type f -name "*.jpg" | grep -E '[A-Z][a-z]+');do
    # Obtener la ruta completa del archivo
    ruta_archivo=$(dirname "$archivo")
    nombre=$(basename "$archivo")
    # le saco los numeros
    salida=$(echo "$nombre" | sed 's/[0-9]*//g')

    ruta_salida="$ruta_archivo/$salida"

    convert "$archivo" -gravity center -resize 512x512+0+0 -extent 512x512 "$ruta_salida"

    #echo "Transformación aplicada a: $archivo"
    #echo "Imagen transformada guardada en: $ruta_salida"
done

echo "Transformación completa."

#nose como pero anda
