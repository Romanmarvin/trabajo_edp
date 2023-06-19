#!/bin/bash

# Cantidad de imágenes a descargar (ingresada por el usuario)
echo "Ingrese la cantidad de imágenes a descargar:"
read cantidad_imagenes

# dos obciones o descargo el archivo o lo meto en el repositorio directo
csv_file=0
# Ruta del directorio , aca nose si crear un nuevo directorio o se pone el directorio de docker
directorio_destino="/home/marvin/Escritorio/Hugo"
base_url="https://source.unsplash.com/random/900%C3%97700/?person"
wget "https://raw.githubusercontent.com/fernandezpablo85/name_suggestions/master/assets/dict.csv" -O "$csv_file"
mapfile -t nombres < "$csv_file"
cd "$directorio_destino" || exit
for ((i=1; i<=cantidad_imagenes; i++))
do
    # lo hice en python y lo pase con chatgpt
    indice=$((RANDOM % ${#nombres[@]}))
    nombre=${nombres[$indice]}
    # Eliminar el nombre utilizado para evitar repeticiones
    nombres=("${nombres[@]:0:$indice}" "${nombres[@]:$((indice + 1))}")
    nombre_archivo="${nombre}.jpg"
    url="${base_url}&${i}"
    wget -O "$nombre_archivo" "$url"
    echo "Imagen descargada: $nombre_archivo"
done

rm "$csv_file"






