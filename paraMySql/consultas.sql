
# Categorias PADRE

SELECT titulo
FROM ITMT_I JOIN ITMT ON ITMT.id = ITMT_I.id
WHERE ITMT_I.id_idioma = 0
AND ITMT.id_anterior NOT IN (
    SELECT ID FROM ITMT_I
    );

# Todos los post de bloqueTexto que me interesan (en castellano)
SELECT BLOQUETEXTO_I.titulo, BLOQUETEXTO_I.texto, BLOQUETEXTO.id_itmt as idcategoria
FROM BLOQUETEXTO_I JOIN BLOQUETEXTO ON BLOQUETEXTO_I.id = BLOQUETEXTO.id
WHERE id_idioma = 0
AND texto IS NOT NULL
AND titulo IS NOT NULL;

#Obtener los datos que me interesan para una categoria dada
SELECT ITMT.id, ITMT_I.titulo, ITMT.id_anterior AS idPadre
FROM ITMT JOIN ITMT_I ON ITMT.id = ITMT_I.id
WHERE ITMT.id = " . $idCategoriaOri . "
AND ITMT_I.id_idioma = 0;

#Obtener las publicaciones que tienen asociado un PDF o un enlace; O aquellas que tienen una reseña valida
SELECT PUBLICACIONES_I.titulo, PUBLICACIONES_I.resenia, PUBLICACIONES.autor, PUBLICACIONES.editorial, PUBLICACIONES.anio, PUBLICACIONES.isbn, PUBLICACIONES.url, PUBLICACIONES.imagen, PUBLICACIONES.pdf, PUBLICACIONES_TIPOS_I.nombre categoria
FROM PUBLICACIONES_I JOIN PUBLICACIONES
		ON PUBLICACIONES_I.id = PUBLICACIONES.id
     JOIN PUBLICACIONES_TIPOS_I ON PUBLICACIONES_TIPOS_I.id = PUBLICACIONES.id_tipo
WHERE ((PUBLICACIONES.url IS null OR PUBLICACIONES.url = 'NO')
       AND PUBLICACIONES.pdf IS null)
       AND PUBLICACIONES_I.resenia IS NOT null

UNION

SELECT PUBLICACIONES_I.titulo, PUBLICACIONES_I.resenia, PUBLICACIONES.autor, PUBLICACIONES.editorial, PUBLICACIONES.anio, PUBLICACIONES.isbn, PUBLICACIONES.url, PUBLICACIONES.imagen, PUBLICACIONES.pdf, PUBLICACIONES_TIPOS_I.nombre categoria
FROM PUBLICACIONES_I JOIN PUBLICACIONES
		ON PUBLICACIONES_I.id = PUBLICACIONES.id
     JOIN PUBLICACIONES_TIPOS_I ON PUBLICACIONES_TIPOS_I.id = PUBLICACIONES.id_tipo
WHERE ((PUBLICACIONES.url IS NOT null
       		AND PUBLICACIONES.url != 'NO')
       OR PUBLICACIONES.pdf IS NOT null)

# Obtener todos los contenidos de Agenda. Agrupo por URL porque en la aplicacion original repetian la misma entrada para que apareciera varias veces en diferentes fechas
# Le añado tambien las que aunque no tienen URL, pero tienen una buena explicacion en el contenido o en el subtitulo.
SELECT CONTENIDO_AGENDA_I.titulo, CONTENIDO_AGENDA_I.contenido, CONTENIDO_AGENDA_I.subtitulo, CONTENIDO_AGENDA_I.lugar, CONTENIDO_AGENDA.fecha, CONTENIDO_AGENDA.url
FROM CONTENIDO_AGENDA JOIN CONTENIDO_AGENDA_I
	   ON CONTENIDO_AGENDA.id = CONTENIDO_AGENDA_I.id_contenido
WHERE CONTENIDO_AGENDA_I.titulo IS NOT null
	   AND CONTENIDO_AGENDA.url IS NOT null
GROUP BY CONTENIDO_AGENDA.url

UNION

SELECT CONTENIDO_AGENDA_I.titulo, CONTENIDO_AGENDA_I.contenido, CONTENIDO_AGENDA_I.subtitulo, CONTENIDO_AGENDA_I.lugar, CONTENIDO_AGENDA.fecha, CONTENIDO_AGENDA.url
FROM CONTENIDO_AGENDA JOIN CONTENIDO_AGENDA_I
	   ON CONTENIDO_AGENDA.id = CONTENIDO_AGENDA_I.id_contenido
WHERE CONTENIDO_AGENDA_I.titulo IS NOT null
		AND CONTENIDO_AGENDA.url IS null
        AND (CONTENIDO_AGENDA_I.contenido IS NOT null
             OR CONTENIDO_AGENDA_I.subtitulo IS NOT null)

# Obtener las LISTA_DESCARGA
SELECT LISTA_DESCARGA_I.titulo, LISTA_DESCARGA_I.texto, LISTA_DESCARGA.id_itmt, LISTA_DESCARGA.url, LISTA_DESCARGA.url_titulo
FROM LISTA_DESCARGA JOIN LISTA_DESCARGA_I
	 ON LISTA_DESCARGA.id = LISTA_DESCARGA_I.id
WHERE LISTA_DESCARGA_I.id_idioma = 0
AND NOT (LISTA_DESCARGA_I.texto IS null
		 AND LISTA_DESCARGA.url IS null
		 AND LISTA_DESCARGA.url_titulo IS null)



