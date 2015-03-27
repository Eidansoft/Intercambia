#!/bin/bash

# Script encargado de dado un archivo que contiene etiquetas HTML, lo limpia dejando el contenido y
# eliminando todas las etiquetas HTML excepto los enlaces, es decir las <a href="...">...</a>

# Compruebo que recibo un parametro
[ "$#" != "1" ] && echo "Error. Debes pasar como parametro el nombre del archivo a limpiar." && exit 1
archivo=$1

# Compruebo que el parametro es un archivo regular y que lo puedo leer
[ ! -f $archivo ] || [ ! -r $archivo ] && echo "Error. Debes pasar como parametro el nombre del archivo a limpiar." && exit 1

echo "Limpio el HTML..."

# Mete un intro extra entre cada registro
#cat $archivo | sed 's/),/),\n/g' > ${archivo}1
cat ${archivo} > ${archivo}1

# Elimino todas las etiquetas HTML excepto los enlaces que los salvo para luego recuperarlos
cat ${archivo}1 | sed -e "s/<\/a>/@cie@/g" | sed -e "s/\(<a[^>]*\)>/\1@ap2@/g" | sed -e "s/<a/@ap1@/g" | sed -e "s/<[^>]*>//g" > ${archivo}2

# Recuperar los enlaces
cat ${archivo}2 | sed -e "s/@ap1@/<a/g" | sed -e "s/@ap2@/>/g" | sed -e "s/@cie@/<\/a>/g" > ${archivo}3

# Elimino los archivos temporales y dejo solo el resultante.
rm ${archivo}1
rm ${archivo}2

mv ${archivo}3 LIMPIO_$archivo

echo "Archivo $archivo limpiado de HTML con exito :-)"

exit 0
