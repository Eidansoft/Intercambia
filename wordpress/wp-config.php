<?php
/** 
 * Configuración básica de WordPress.
 *
 * Este archivo contiene las siguientes configuraciones: ajustes de MySQL, prefijo de tablas,
 * claves secretas, idioma de WordPress y ABSPATH. Para obtener más información,
 * visita la página del Codex{@link http://codex.wordpress.org/Editing_wp-config.php Editing
 * wp-config.php} . Los ajustes de MySQL te los proporcionará tu proveedor de alojamiento web.
 *
 * This file is used by the wp-config.php creation script during the
 * installation. You don't have to use the web site, you can just copy this file
 * to "wp-config.php" and fill in the values.
 *
 * @package WordPress
 */

// ** Ajustes de MySQL. Solicita estos datos a tu proveedor de alojamiento web. ** //
/** El nombre de tu base de datos de WordPress */
define('DB_NAME', 'testIntercambia');

/** Tu nombre de usuario de MySQL */
define('DB_USER', 'root');

/** Tu contraseña de MySQL */
define('DB_PASSWORD', 'Dubhe_');

/** Host de MySQL (es muy probable que no necesites cambiarlo) */
define('DB_HOST', 'localhost');

/** Codificación de caracteres para la base de datos. */
define('DB_CHARSET', 'utf8');

/** Cotejamiento de la base de datos. No lo modifiques si tienes dudas. */
define('DB_COLLATE', '');

/**#@+
 * Claves únicas de autentificación.
 *
 * Define cada clave secreta con una frase aleatoria distinta.
 * Puedes generarlas usando el {@link https://api.wordpress.org/secret-key/1.1/salt/ servicio de claves secretas de WordPress}
 * Puedes cambiar las claves en cualquier momento para invalidar todas las cookies existentes. Esto forzará a todos los usuarios a volver a hacer login.
 *
 * @since 2.6.0
 */
define('AUTH_KEY', '~)spnQmyP7g3rguIs}.$t%+%n&PC&7,XnF^Kd(6F4s1.ZKCPYTc&)t-KE/e0q9>(');
define('SECURE_AUTH_KEY', '=S)5GUtHL.s<!W !CCa`1yXF`[1E =XO95qy_/?b4`j|;B=VE}7#/^O;[EYprj*T');
define('LOGGED_IN_KEY', 'yE{A|enO%U9>L!K{#|;F+=BgxLL>4C]I8D^+<wQQ`J%y[y-?PSkp4Q@3zjKqE3y^');
define('NONCE_KEY', '/exkD>4|(:yJ@2x_MfBGKYZ]^K@?>=J=]hMjXTMo&5[)`[-+;(gv~cB<T3.XD6. ');
define('AUTH_SALT', 'M8Xxm/!lBi.k7D*:nry+O Pu]<AmJG)G.V>]D!P Ydp|?:-D :C-$7QWm)>qkfd@');
define('SECURE_AUTH_SALT', 'hjh MxAvBbAZf>9&iW*,`Kh[NVn:u/dz/y#XkUBwRCAHDu0OQ~({0~L 3& _ehle');
define('LOGGED_IN_SALT', '_~#^x-7X}y>41iP&=PKo;sBQl@;rHobfc9bhY`)z&Xl/Lg<:fw!=tEn(Ng94}5l(');
define('NONCE_SALT', 'M{V~Xh_*F0`,~0:%Ds1fS&MKs8`U@FzAVL&PXlQw|)|uyk$0lcN.[e;5hxMo4d>|');

/**#@-*/

/**
 * Prefijo de la base de datos de WordPress.
 *
 * Cambia el prefijo si deseas instalar multiples blogs en una sola base de datos.
 * Emplea solo números, letras y guión bajo.
 */
$table_prefix  = 'wp_';


/**
 * Para desarrolladores: modo debug de WordPress.
 *
 * Cambia esto a true para activar la muestra de avisos durante el desarrollo.
 * Se recomienda encarecidamente a los desarrolladores de temas y plugins que usen WP_DEBUG
 * en sus entornos de desarrollo.
 */
define('WP_DEBUG', false);

/* ¡Eso es todo, deja de editar! Feliz blogging */

/** WordPress absolute path to the Wordpress directory. */
if ( !defined('ABSPATH') )
	define('ABSPATH', dirname(__FILE__) . '/');

/** Sets up WordPress vars and included files. */
require_once(ABSPATH . 'wp-settings.php');

