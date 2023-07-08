#!/bin/bash
echo "Ingrese la cantidad de imágenes a descargar:"
read -r cantidad_imagenes
csv_file=0
directorio_destino="/home/marvin"
base_url="https://source.unsplash.com/random/900%C3%97700/?person"
# Descargar el archivo CSV con los nombres
wget -O "$directorio_destino/$csv_file" "https://raw.githubusercontent.com/adalessandro/EdP-2023-TP-Final/main/dict.csv"
# Leer los nombres del archivo CSV en un array
mapfile -t nombres < "$directorio_destino/$csv_file"
# Crear directorio de imágenes
for ((i=1; i<=cantidad_imagenes; i++))
do
    # Generar un nombre aleatorio a partir de los nombres disponibles
    indice=$((RANDOM % ${#nombres[@]}))
    nombre=${nombres[$indice]}

    # Eliminar el nombre utilizado para evitar repeticiones
    nombres=("${nombres[@]:0:$indice}" "${nombres[@]:$((indice + 1))}")

    nombre_archivo="${nombre}.jpg"
    url="${base_url}&${i}"

    # Descargar la imagen
    wget -O "$nombre_archivo" "$url"
    echo "Imagen descargada: $nombre_archivo"
done
#comprimimos
carpeta=$(pwd)
#imagenes = $(find "$carpeta" -type f -name "*.jpg")
#tar -czvf imagenes.tar.gz "$carpeta" $imagenes
find . -type f -name "*.jpg" -exec tar -czvf "$carpeta/imagenes.tar.gz" {} +

if [ $? -eq 0 ]; then
# Crear directorio para comprimir imágenes
md5sum "$carpeta/imagenes.tar.gz" > "$carpeta/suma.txt"
fi
find . -type  f -name "*.jpg" -delete
