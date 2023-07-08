#!/bin/bash
directorio="/home/marvin/trabajo_practico"

# Función para verificar si un nombre de archivo cumple con el filtro
verificar_filtro() {
    local nombre_archivo=$1
    
    # Verificar si el nombre de archivo cumple con alguno de los filtros
    case $nombre_archivo in
        *,.jpg)
            return 0 ;;
        *[ .,]a)
            return 0 ;;
        *)
            return 1 ;;
    esac
}

# Buscar todas las imágenes .jpg y generar los archivos txt
while IFS= read -r -d '' imagen; do
    nombre_archivo=$(basename "$imagen")
    
    # Verificar si el nombre de archivo cumple con el filtro
    if verificar_filtro "$nombre_archivo"; then
        echo "$nombre_archivo" >> imagenes.txt
        
        case $nombre_archivo in
            *,.jpg)
                echo "$nombre_archivo" >> imagenes_coma_punto.txt ;;
            *[ .,]a)
                echo "$nombre_archivo" >> imagenes_termina_a.txt ;;
        esac
    fi
done < <(find "$directorio" -type f -name "*.jpg" -print0)

echo "Archivos de texto generados correctamente."
