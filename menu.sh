#!/bin/bash

mostrar_menu() {
    echo "1. Generar"
    echo "2. Descomprimir"
    echo "3. Procesar"
    echo "4. Comprimir"
    echo "5. Salir"
}
ejecutar_generar() {
    echo "Ejecutando el script de generación..."
  /trabajo_edp/generar.sh
   #Marcar la opción 1 como verdadera
    generado=true
}
ejecutar_descargar() {
# Verificar si la opción 1 ha sido seleccionada previamente
    if [ "$generado" = false ]; then
        echo "Debes seleccionar la opción 1 (Generar) antes de ejecutar la opción 2 (Descomprimir)."
    else
        echo "Ejecutando el script de descarga..."
        /trabajo_edp/descomprimir.sh
        # Marcar la opción 2 como verdadera
        descargado=true
    fi
}
ejecutar_procesar() {
     # Verificar si la opción 2 ha sido seleccionada previamente
    if [ "$descargado" = false ]; then
        echo "Debes seleccionar la opción 2 (Descomprimir) antes de ejecutar la opción 3 (Procesar)."
    else
        echo "Ejecutando el script de procesamiento..."
        /trabajo_edp/procesar.sh
    fi
}
ejecutar_comprimir() {
   # Verificar si la opción 2 ha sido seleccionada previamente
    if [ "$descargado" = false ]; then
        echo "Debes seleccionar la opción 2 (Descomprimir) antes de ejecutar la opción 4 (Comprimir)."
    else
        echo "Ejecutando el script de compresión..."
        /trabajo_edp/comprimir.sh
    fi
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
