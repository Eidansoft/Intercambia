# Intercambia
Migracion del portal antiguo al portal nuevo

# Pasos para la instalación:

* Descomprimir el Worpress (wordpress-4.1-es_ES.zip) en el servidor.
* Descomprimir los temas en wordpress/wp-content/themes (themeResponsiveOriginal.zip y theme-responsive-intercambia.zip).
* Copiar los archivos del portal antiguo en wordpress/wp-content/uploads (oldIntercambia).

* En el MySQL crear una nueva BD llamada "datosIntercambia".
* En la BD datosIntercambia ejecutar los SQLs para crear las tablas y importar los datos del antiguo portal (bloqueTexto_y_ITMs.sql, contenidoAgenda.sql, listaDescarga.sql, lom_langstring.sql, paginasEstaticas.sql, publicaciones.sql)
* Copiar el Script de Importacion a WP en wordpress/importa.php

* Ejecutar la instalación normal del WP accediendo con el navegador a wordpress/wp-admin/install.php se rellenan los datos y se procede con la instalación.
* Acceder desde el navegador a wordpress/importa.php marcar la opcion de "Datos reales" y lanzar la importación haciendo clic en "Importar TODO"

* Acceder al panel de administración del WP en wordpress/wp-admin
* En el panel de administracion, "Apariencia -> Temas" Selecionamos y activamos el tema "Responsive-child"
* En el panel de administracion, "Apariencia -> Personalizar -> Portada estática" seleccionamos la opción "Una página estatica" y en "Portada" elegimos "Presentación". Por último clic en "Guardar y Publicar"
* En el panel de administracion, "Apariencia -> Personalizar -> Imagen de Cabecera" Añadimos las imagenes de cabecera que están en wordpress/wp-content/uploads/oldIntercambia/cabeceras, habrá que selecionarlas una por una y al final elegir que las muestre al azar. Y clic en Guardar y Publicar.
********* En el panel de administracion, "Apariencia -> Opciones del tema -> Página de Inicio" Desmarca la opcion de sobreescribir
* En el panel de administracion, "Apariencia -> Opciones del tema -> Página de Inicio" poner la pagina de inicio en el campo de "Llamada a la acción (URL)"
* En el panel de administracion, "Apariencia -> Opciones del tema -> Scripts" Pegamos el codigo del GoogleAnalytics que esta en googleAnalytics.js Y hacemos clic en Guardar Opciones.
* En el panel de administracion, "Apariencia -> Opciones del tema -> Distribuciones por defecto" Para las paginas estaticas seleccionamos "Pagina de ancho completo"
* En el panel de administracion, "Apariencia -> Menús" Añadimos un nuevo menu, marcamos la opción de "Menú de la Cabecera" y le incluimos los elementos de:
** (Página) Intercambia
** (Enlace) Recursos -> #
*** (Categoría) 
** (Página) Comunidades Autónomas
** (Página) Igualdad en el Mundo
** (Categoría) Agenda



