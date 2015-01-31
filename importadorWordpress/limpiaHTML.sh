#!/bin/bash

# Script encargado de dado un archivo que contiene etiquetas HTML, lo limpia dejando el contenido y
# eliminando todas las etiquetas HTML excepto los enlaces, es decir las <a href="...">...</a>

# Compruebo que recibo un parametro
[ "$#" != "1" ] && echo "Error. Debes pasar como parametro el nombre del archivo a limpiar." && exit 1
archivo=$1

# Compruebo que el parametro es un archivo regular y que lo puedo leer
[ ! -f $archivo ] || [ ! -r $archivo ] && echo "Error. Debes pasar como parametro el nombre del archivo a limpiar." && exit 1

echo "Limpio tildes, enies y demas..." # minusculas y mayusculas
cat $archivo        | sed -e "s/á/\&aacute;/g" | sed -e "s/é/\&eacute;/g" | sed -e "s/í/\&iacute;/g" | sed -e "s/ó/\&oacute;/g" | sed -e "s/ú/\&uacute;/g" | sed -e "s/ñ/\&ntilde;/g" > ${archivo}minus
cat ${archivo}minus | sed -e "s/Á/\&Aacute;/g" | sed -e "s/É/\&Eacute;/g" | sed -e "s/Í/\&Iacute;/g" | sed -e "s/Ó/\&Oacute;/g" | sed -e "s/Ú/\&Uacute;/g" | sed -e "s/Ñ/\&Ntilde;/g" > ${archivo}mayus

echo "Limpio dieresis..." # minusculas y mayusculas
cat ${archivo}mayus | sed -e "s/ä/\&auml;/g" | sed -e "s/ë/\&euml;/g" | sed -e "s/ï/\&iuml;/g" | sed -e "s/ö/\&ouml;/g" | sed -e "s/ü/\&uuml;/g" | sed -e "s/ç/\&ccedil;/g" > ${archivo}dieresismin
cat ${archivo}dieresismin | sed -e "s/Ä/\&Auml;/g" | sed -e "s/Ë/\&Euml;/g" | sed -e "s/Ï/\&Iuml;/g" | sed -e "s/Ö/\&Ouml;/g" | sed -e "s/Ü/\&Uuml;/g" | sed -e "s/Ç/\&Ccedil;/g" > ${archivo}dieresismay

#cat ${archivo}dieresismay | sed -e "s/[1234567890qQwWeErRtTyYuUiIoOpPaAsSdDfFgGhHjJkKlLzZxXcCvVbBnNmM,\.\(\)'&#;_-:+=]//g" | sed -e 's/[ "]//g' | sed -e 's/\///g' | tr -d '\r' | tr -d '\n'

echo "Limpio ordinales y comillas «»"
cat ${archivo}dieresismay | sed -e "s/º/\&deg;/g" | sed -e "s/ª/\&ordf;/g" | sed -e 's/«/\"/g' | sed -e 's/»/\"/g' > ${archivo}tildes

echo "limpio algunos simbolos"
cat ${archivo}tildes | sed -e "s/\?/\&#63;/g" | sed -e "s/¿/\&iquest;/g" | sed -e "s/[\!]/&#33;/g" | sed -e "s/[¡]/&iexcl;/g" | sed -e "s/[%]/&#37;/g" > ${archivo}simbolos

echo "Limpio tabuladores"
cat ${archivo}simbolos | sed -e "s/\t//g" > ${archivo}tabuladores

echo "Limpio otros caracteres raros"
cat ${archivo}tabuladores | sed -e "s/[Ã³©±àèâ]//g" > ${archivo}0

rm ${archivo}minus
rm ${archivo}mayus
rm ${archivo}dieresismin
rm ${archivo}dieresismay
rm ${archivo}tildes
rm ${archivo}tabuladores
rm ${archivo}simbolos

echo "Limpio el HTML..."

# Mete un intro extra entre cada registro
#cat $archivo | sed 's/),/),\n/g' > ${archivo}1
cat ${archivo}0 > ${archivo}1

# Elimino todas las etiquetas HTML excepto los enlaces que los salvo para luego recuperarlos
cat ${archivo}1 | sed -e "s/<\/a>/@cie@/g" | sed -e "s/\(<a[^>]*\)>/\1@ap2@/g" | sed -e "s/<a/@ap1@/g" | sed -e "s/<[^>]*>//g" > ${archivo}2

# Recuperar los enlaces
cat ${archivo}2 | sed -e "s/@ap1@/<a/g" | sed -e "s/@ap2@/>/g" | sed -e "s/@cie@/<\/a>/g" > ${archivo}3

# Elimino los archivos temporales y dejo solo el resultante.
rm ${archivo}0
rm ${archivo}1
rm ${archivo}2

mv ${archivo}3 SIN_HTML_$archivo

echo "Archivo $archivo limpiado de HTML con exito :-)"

echo ""
echo "Secuencia de caracteres raros que quedan en el archivo:"
cat SIN_HTML_$archivo | sed -e "s/[0-9]//g" | sed -e "s/[a-Z]//g" | sed -e "s/[,\.\(\)'&#;_-:+=]//g" | sed -e 's/[ "]//g' | sed -e 's/\///g' | tr -d '\r' | tr -d '\n'
echo ""

exit 0
