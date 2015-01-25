CREATE TABLE ITMT 
   (	ID INT, 
	ID_ANTERIOR INT, 
	IMAGEN VARCHAR(4000), 
	FLAG_MODO INT, 
	ORDEN INT, 
	VISIBLE INT, 
	LINK_A_SECCION INT, 
	LINK_EXTERNO VARCHAR(4000), 
	FLAG_EMERGENTE INT, 
	ANCHO INT, 
	ALTO INT, 
	URL_TEXTO VARCHAR(4000), 
	FLAG_INDICE INT, 
	FLAG_RESIZABLE VARCHAR(4000), 
	PRIMERO VARCHAR(4000), 
	FLAG_PORTADA INT DEFAULT 0
   );

CREATE TABLE ITMT_I 
   (	ID INT, 
	ID_IDIOMA INT, 
	TITULO VARCHAR(4000), 
	ENTRADILLA VARCHAR(4000), 
	ALTIMAGEN VARCHAR(4000), 
	ENTRADILLA_LISTA_DESCARGA VARCHAR(4000)
   );

CREATE TABLE BLOQUETEXTO 
   (	ID INT, 
	ID_ITMT INT, 
	IMAGEN VARCHAR(4000), 
	URL VARCHAR(4000), 
	TITULO_VISIBLE VARCHAR(4000), 
	PLANTILLA VARCHAR(4000), 
	ORDEN INT, 
	ANCHO INT, 
	ALTO INT, 
	FLAG_RESIZABLE VARCHAR(1000), 
	FLAG_EMERGENTE VARCHAR(1000)
   );

CREATE TABLE BLOQUETEXTO_I 
   (	ID INT, 
	ID_IDIOMA INT, 
	TITULO VARCHAR(4000), 
	TEXTO VARCHAR(4000), 
	ALTIMAGEN VARCHAR(4000)
   );

CREATE TABLE PUBLICACIONES 
   (	ID INT, 
	ID_SECCION INT, 
	ID_TIPO INT, 
	AUTOR VARCHAR(500), 
	EDITORIAL VARCHAR(500), 
	LUGAR_PUBLICACION VARCHAR(4000), 
	ANIO INT, 
	ISBN VARCHAR(200), 
	NIPO VARCHAR(200), 
	REFERENCIA VARCHAR(4000), 
	URL VARCHAR(4000), 
	IMAGEN VARCHAR(1000), 
	PDF VARCHAR(4000), 
	ORDEN INT, 
	NUMERO INT
   );

CREATE TABLE PUBLICACIONES_I 
   (	ID INT, 
	ID_IDIOMA INT, 
	TITULO VARCHAR(1000), 
	TEXTO_URL VARCHAR(4000), 
	TEXTO_IMAGEN VARCHAR(4000), 
	RESENIA VARCHAR(4000)
   );

CREATE TABLE PUBLICACIONES_TIPOS_I 
   (	ID INT, 
	ID_IDIOMA INT, 
	NOMBRE VARCHAR(100)
   );

CREATE TABLE CONTENIDO_AGENDA 
   (	ID INT, 
	ID_TIPO_CONTENIDO INT, 
	PLANTILLA INT, 
	IMAGEN VARCHAR(400), 
	FECHA DATE, 
	DESTACADO INT, 
	URL VARCHAR(4000), 
	ID_SECCION INT, 
	LUGAR VARCHAR(100), 
	FECHA_INICIO DATE, 
	FECHA_CADUCIDAD DATE
   );

CREATE TABLE CONTENIDO_AGENDA_I 
   (	ID_CONTENIDO INT, 
	ID_IDIOMA INT, 
	TITULO VARCHAR(400), 
	CONTENIDO VARCHAR(4000), 
	SUBTITULO VARCHAR(4000), 
	LUGAR VARCHAR(100)
   );

CREATE TABLE LISTA_DESCARGA 
   (	ID INT, 
	ID_ITMT INT, 
	URL VARCHAR(4000), 
	ORDEN INT, 
	FLAG_EMERGENTE VARCHAR(400), 
	FLAG_RESIZABLE VARCHAR(400), 
	ANCHO VARCHAR(400), 
	ALTO VARCHAR(400), 
	DESCARGA_DIRECTA VARCHAR(4000), 
	TIPO_DESCARGA VARCHAR(400), 
	URL_TITULO VARCHAR(4000)
   );

CREATE TABLE LISTA_DESCARGA_I 
   (	ID INT, 
	ID_IDIOMA INT, 
	TITULO VARCHAR(400), 
	TEXTO VARCHAR(4000)
   );

CREATE TABLE LOMD_LANGSTRING 
   (	ID INT, 
	ID_LANG INT, 
	STRING VARCHAR(4000)
   );

CREATE TABLE LOM_GENERAL_DESCRIPTION 
   (	ID INT, 
	ID_LANGSTRINGLISTA INT
   );

CREATE TABLE LOM_TECH_LOCATION 
   (	ID INT, 
	LOCATION VARCHAR(4000)
   );