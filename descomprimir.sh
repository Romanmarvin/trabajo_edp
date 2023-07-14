#!/bin/bash
#direccion donde esta el .tar
imagenes="/trabajo_edp/imagenes.tar.gz"
#direccion del txt
sum="/trabajo_edp/suma.txt"
#descomprimir , con -c cambiar al directorio final 
tar -xzvf "$imagenes" 
carpeta_imagenes=$(tar -tzf "$imagenes")
if md5sum -c suma.txt | grep -q "OK"; then
    echo "igualitos"
else
    echo "ocurrio un error" 
fi 
#RTFM 


