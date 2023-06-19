#!/bin/bash

# Ruta de la carpeta que contiene las imágenes de entrada
carpeta_entrada="/home/marvin/Escritorio/Hugo/"
mkdir /home/marvin/Escritorio/Hugo/carpeta_salida
# aca hay un problema la carpeta de salida tiene que ser creada dentro del docker
carpeta_salida="/home/marvin/Escritorio/Hugo/carpeta_salida"

# Crear la carpeta de salida si no existe
mkdir -p "$carpeta_salida"

# Iterar sobre cada imagen en la carpeta de entrada
for imagen_entrada in "$carpeta_entrada"/*.jpg; do
    # Obtener el nombre base de la imagen sin la extensión
    nombre_base=$(basename "$imagen_entrada" .jpg)
    
    # Eliminar los números del nombre utilizando expresiones regulares
    nuevo_nombre=$(echo "$nombre_base" | sed 's/[0-9]*//g')
    
    # Ruta de la imagen de salida
    imagen_salida="$carpeta_salida/$nuevo_nombre.jpg"
    
    # Ejecutar la conversión utilizando la línea de código
    convert "$imagen_entrada" -gravity center -resize 512x512+0+0 -extent 512x512 "$imagen_salida"
    
    echo "Imagen convertida: $imagen_entrada -> $imagen_salida"
done
