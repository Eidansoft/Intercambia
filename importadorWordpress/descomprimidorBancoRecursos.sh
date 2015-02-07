#!/bin/bash

# Para cada capeta
for archivo in $(ls)
do
	if [ -d $archivo ]; then
		echo "Trabajando con la carpeta $archivo"
		# Inicializo los flags
		archivoValido=0
		xml=0
		elimina=1 # Marco un flag para que esta carpeta se borre
		pushd $archivo
			# Si contiene una carpeta llamada "zip"
			if [ -d "zip" ]; then
				pushd "zip"
					# Descomprimo el zip que haya dentro
					unzip -o *.zip
					
					# Marco un flag si contiene un PDF
					ls -1 | grep ".pdf" > /dev/null
					[ "$?" == "0" ] && archivoValido=1

					# Marco un flag si contiene un AVI
					ls -1 | grep ".avi" > /dev/null
					[ "$?" == "0" ] && archivoValido=1

					# Marco un flag si contiene un MOV
					ls -1 | grep ".mov" > /dev/null
					[ "$?" == "0" ] && archivoValido=1

					# Marco un flag si contiene un MP4
					ls -1 | grep ".mp4" > /dev/null
					[ "$?" == "0" ] && archivoValido=1

					# Marco un flag si contiene un XML
					ls -1 | grep ".xml" > /dev/null
					[ "$?" == "0" ] && xml=1
					
					# Si contiene un archivo valido y su XML quito el flag de eliminar la carpeta Y limpio el XML de caracteres raros
					if [ "$archivoValido" == 1 -a "$xml" == 1 ]; then
						elimina=0
						iconv -f ISO-8859-1 -t UTF-8 metadata.xml -o output.xml
						../../limpiaCaracteres.sh output.xml
						mv LIMPIO_output.xml metadata.xml
						rm output.xml
					fi
					#echo Archivo: $archivo PDF: $archivoValido XML: $xml ELIMINA: $elimina
					#read p
				popd
			fi
		popd
		if [ $elimina == 1 ]; then
			rm -rf $archivo
		fi
	fi
done