#!/bin/bash

<<-comment
Genera imágenes utilizando algún servicios web. Se debe
poder indicar por argumento cuantas imagenes generar y se deben asignar
nombres de archivo al azar de una lista de nombres de personas. Tener
en cuenta que al descargar de una página conviene usar un sleep entre
descarga y descarga para no saturar el servicio y evitar problemas. Luego
se deben comprimir las imágenes, y generar un archivo con su suma de
verificación.
comment

# Cantidad de imágenes a descargar (ingresada por el usuario)
echo "Ingrese la cantidad de imágenes a descargar:"
read cantidad_imagenes

# dos obciones o descargo el archivo o lo meto en el repositorio directo
csv_file=0
# Ruta del directorio , aca nose si crear un nuevo directorio o se pone el directorio de docker
directorio_destino="/trabajo_edp"
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






