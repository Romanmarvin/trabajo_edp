#!/bin/bash
# Directorio de búsqueda
if [ "$(ls *.jpg 2>/dev/null)" ]; then
    directorio="/trabajo_edp"
    #se usa el find buscar , el grep para filtrar  
    find "$directorio" -type f -name "*.jpg" | grep -E '[A-Z][a-z]+' | while IFS= read -r archivo; do
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

else
  echo "No hay imágenes en el directorio. Genera las imágenes primero."
fi
#nose como pero anda
