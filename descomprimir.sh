#!/bin/bash
#direccion donde esta el .tar
imagenes="/trabajo_edp/imagenes.tar.gz"
#direccion del txt
sum="/trabajo_edp/suma.txt"
#descomprimir , con -c cambiar al directorio final 
tar -xzvf "$imagenes" 
carpeta_imagenes =$(tar -tzf "$imagenes"| head -1 | xargs dirname)

md5sum "$carpeta_imagenes "/* > "$suma2"
if cmp -s "$suma2" "$sum"; then
    echo "la verificacion es igual"
else 
    echo "ocurrio un error"
fi 

rm "$suma2"
