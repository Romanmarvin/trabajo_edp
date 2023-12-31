#!/bin/bash
if [ "$(ls *.jpg 2>/dev/null)" ]; then
  imagenes=$(ls *.jpg )
  echo "$imagenes"> imagenes.txt
  #personas=$(ls *,.jpg )
  #echo "$personas"> personas.txt

  find . -type f -name "*.jpg" | grep -E '[A-Z][a-z]+' > personas.txt

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
  mkdir "/trabajo_edp/archivos_comprimidos"
  carp="/trabajo_edp"
  #destini="/home/archivos.tar.gz
  find "$carp" -maxdepth 1 -name "*.jpg" -o -name "*.txt" | tar -czvf archivos.tar.gz -T -
  mv -u archivos.tar.gz /trabajo_edp/archivos_comprimidos
  echo "archivos comprimidos en arc.tar.gz"
else 
   echo "No hay imágenes en el directorio. Genera las imágenes primero."
fi
