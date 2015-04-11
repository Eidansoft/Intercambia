# Intercambia
Migracion del portal antiguo al portal nuevo

# Pasos para la instalación:

* Descomprimir el Worpress (wordpress-4.1-es_ES.zip) en el servidor.
* Descomprimir los temas en wordpress/wp-content/themes (theme-responsive-intercambia.zip).
* Descomprimir el Widget de la Agenda/Calendario en wordpress/wp-content/plugins (my-calendar.2.3.28.zip)
* Copiar los archivos del portal antiguo en wordpress/wp-content/uploads (oldIntercambia).

* En el MySQL crear una nueva BD llamada "datosIntercambia".
* En la BD datosIntercambia ejecutar los SQLs para crear las tablas Intercambia/paraMySql/creacionTablas.sql
* En la BD datosIntercambia ejecutar los SQLs para importar los datos del antiguo portal (bloqueTexto_y_ITMs.sql, contenidoAgenda.sql, listaDescarga.sql, lom_langstring.sql, paginasEstaticas.sql) todos comprimidos en dos archivos situados en "Intercambia/paraMySql/" llamados datosIntercambia1.sql.zip y datosIntercambia2.sql.zip.
* Copiar el Script de Importacion a WP en wordpress/importa.php
* Configurar el WP para que acceda a la Base de Datos en el archivo wordpress/wp-config.php

* Ejecutar la instalación normal del WP accediendo con el navegador a wordpress/wp-admin/install.php se rellenan los datos y se procede con la instalación.
* Acceder al panel de administración del WP en wordpress/wp-admin y dentro del Panel de Administración, en Entradas, eliminamos la entrada "¡Hola Mundo!" y en Paginas, eliminamos la "Pagina de Ejemplo"
* Acceder desde el navegador a wordpress/importa.php marcar la opcion de "Datos reales" y lanzar la importación haciendo clic en "Importar TODO"

* Acceder al panel de administración del WP en wordpress/wp-admin
* En el panel de administracion, "Apariencia -> Temas" Selecionamos y activamos el tema "Responsive-child"
* En el panel de administracion, "Apariencia -> Personalizar -> Portada estática" seleccionamos la opción "Una página estatica" y en "Portada" elegimos "Presentación". Por último clic en "Guardar y Publicar"
* En el panel de administracion, "Apariencia -> Personalizar -> Imagen de Cabecera" Añadimos las imagenes de cabecera que están en wordpress/wp-content/uploads/oldIntercambia/cabeceras, habrá que selecionarlas una por una y al final elegir que las muestre al azar. Y clic en Guardar y Publicar.
* En el panel de administracion, "Apariencia -> Opciones del tema -> Scripts personalizados" Pegamos el codigo del GoogleAnalytics que esta en googleAnalytics.js Y hacemos clic en Guardar Opciones.
* En el panel de administracion, "Apariencia -> Menús" Añadimos un nuevo menu, marcamos la opción de "Menú de la Cabecera" y le incluimos los elementos de:
* * (Página) Intercambia
* * (Enlace) Recursos -> #
* * * (Categoría) Banco de Recursos TIC
* * * (Categoría) Recursos
* * * (Página) Estadísticas
* * (Página) Comunidades Autónomas
* * (Página) Igualdad en el Mundo
* * (Categoría) Agenda
* En el panel de administracion, "Apariencia -> Widget" Quitamos el de "Entradas Recientes", "Comentarios recientes", "Archivos" y "Meta"
* En el panel de administracion, "Plugins" Activamos el plugin de MyCalendar
* En el panel de administracion, "Apariencia -> Widget" Añadimos el Widget de "My Calendar: Proximos eventos" Con el nombre de "Agenda" y lo configuramos con 10 dias futuros y 2 pasados, bajo el nombre de Agenda. (NOTA para que salga el widget hay que crear al menos un evento)



