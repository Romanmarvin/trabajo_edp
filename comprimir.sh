#!/bin/bash
imagenes=$(ls *.jpg )
echo "$imagenes"> imagenes.txt
personas=$(ls.*,jpg)
echo "$personas> personas.txt

archivo="/trabajo_edp/imagenes.txt"
salida="/trabajo_edp/femeninas.txt"
while IFS= read -r linea; do
    palabras=($linea)
        
    palabra_terminada_en_a=false
    
    # Recorrer las palabras
    for palabra in "${palabras[@]}"; do
        # Verificar si la palabra termina en a seguida de un espacio o una coma
        if [[ $palabra =~ [aA]$ || $palabra =~ [aA],[[:space:]] ]]; then
            palabra_terminada_en_a=true
            break
        fi
    done
    
    # Copiar la línea completa si se encuentra una palabra terminada en "a"
    if $palabra_terminada_en_a; then
        echo "$linea" >> "$salida"
    fi
done < "$archivo"

#echo "Proceso completado $salida"
mkdir "/trabajo_edp/arcchivos_comprimidos"
carp="/trabajo_edp"
#destini="/home/archivos.tar.gz
find "$carp" -type f ! -name "*.sh" -exec tar -czvf archivos.tar.gz {} +
mv -u archivos.tar.gz /trabajo_edp/arcchivos_comprimidos
#tar -czvf arc.tar.gz $arc
#docker cp <trabajo_edp>:/trabajo_edp/archivos.tar.gz "$destini"
echo "archivos comprimidos en arc.tar.gz"
