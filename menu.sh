#!/bin/bash

mostrar_menu() {
    echo "1. Generar"
    echo "2. Descargar"
    echo "3. Procesar"
    echo "4. Comprimir"
    echo "5. Salir"
}
ejecutar_generar() {
    echo "Ejecutando el script de generación..."
  /home/marvin/trabajo_practico/generar.sh
}
ejecutar_descargar() {
    echo "Ejecutando el script de descarga..."
  /home/marvin/trabajo_practico/descomprimir.sh
}
ejecutar_procesar() {
    echo "Ejecutando el script de procesamiento..."
  /home/marvin/trabajo_practico/procesar.sh
}
ejecutar_comprimir() {
    echo "Ejecutando el script de compresión..."
  /home/marvin/trabajo_practico/comprimir.sh
}
while true; do
    mostrar_menu
    read -p "Selecciona una opción: " opcion

    case $opcion in
        1) ejecutar_generar ;;
        2) ejecutar_descargar ;;
        3) ejecutar_procesar ;;
        4) ejecutar_comprimir ;;
        5) echo "Saliendo...." ; exit ;;
        *) echo "Opción inválida. Por favor, selecciona una opción válida." ;;
    esac
done

#eso es todo amigos
