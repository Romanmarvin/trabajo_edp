#!/bin/bash
<<-comment
    comprimir.sh: Una vez procesadas las imágenes se debe generar un
    archivo con la lista de todas las personas, un total de personas femeninas
    y masculinas; y luego comprimir todo en un solo archivo. Entiéndase por
    persona femenina aquella cuya ultima letra del primer nombre es una letra
    “a”. El archivo generado debe poder accederse fuera del contenedor."""!
comment
#aca tengo un problema porque las imagenes tienen que estar donde este este script
# de esto se ocupa el hugo del futuro , despues del jpg /directorio de las imagenes 
imagenes=$(ls *.jpg )
echo "$imagenes"> lista_de_nombres.txt
femeninas=0
masculinos=0
while IFS= read -r imagenes;do
    if [[$imagenes == *a,.jpg]]; them
        femeninas=$((femeninas +1))
    else 
        masculinas=$((masculinas + 1))
    fi 
done <lista_de_nombres.txt
echo "total de fotos femeninas : $femeninas"> lista_de nombres.txt
echo "total de fotos masculinas : $masculinas" >lista_de_nombres.txt

#el archivo se tiene que mover a la carpeta de descarga
#ayudaaaa como saco los archivos del contenedor!!! <3