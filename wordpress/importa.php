<?php
include ('./wp-config.php');
include ('./wp-admin/includes/taxonomy.php');

//Configuracion de la BD con los datos
$host="localhost";
$username="root";
$password="Dubhe_";
$database="datosIntercambia";

// Opens a connection to a MySQL server
$connection = new mysqli($host, $username, $password, $database);
if ($connection->connect_errno) { echo 'Not connected : ' . $connection->connect_error; }

echo "<h1>SCRIPT de importacion</h1>";

/** Funcion para comprobar si una cadena comienza con unos caracteres o no
 *  Ejemplo str_startsWith('http://www.eidansoft.com', 'http://') -> true
 *          str_startsWith('http://www.eidansoft.com', 'eidan') -> false
*/
function str_startsWith($cadena, $inicioEsperado) {
    // search backwards starting from cadena length characters from the end
    return $inicioEsperado === "" || strrpos($cadena, $inicioEsperado, -strlen($cadena)) !== FALSE;
}

/** Funcion para comprobar si una cadena termina con unos caracteres o no
 *  Ejemplo str_endsWith('http://www.eidansoft.com', '.com') -> true
 *          str_endsWith('http://www.eidansoft.com', 'eidan') -> false
*/
function str_endsWith($cadena, $finalEsperado) {
    // search forward starting from end minus finalEsperado length characters
    return $finalEsperado === "" || strpos($cadena, $finalEsperado, strlen($cadena) - strlen($finalEsperado)) !== FALSE;
}

/** Crea la categoria en el WP
 *  Recibe el ID(original) de la categoria, busca su nombre entre las categorias de WP, si no existe, mira si tiene
 *  categoria padre que crear primero, despues la crea. Si si existe, mira si tiene categoria padre, para obtener el
 *  ID(wp), al final del proceso la funcion devolvera un array de enteros con los ID de las categorias a las que 
 *  pertenece la categoria, es decir, el ID (de WP) de ella misma y de sus categorias padre.
*/
function creaCategoriaOri($idCategoriaOri, $conn){
        $res = array();
        $query = "SELECT ITMT.id, ITMT_I.titulo, ITMT.id_anterior AS idPadre
                         FROM ITMT JOIN ITMT_I ON ITMT.id = ITMT_I.id
                         WHERE ITMT.id = " . $idCategoriaOri . "
                         AND ITMT_I.id_idioma = 0";


        // Select all the rows in the query
        $result = $conn->query($query);
        if (!$result) { echo 'Invalid query: ' . $conn->connect_error; }

        $numRegistros = $result->num_rows;

        if ($numRegistros > 0){
                $registro = $result->fetch_row();

                $id = $registro[0];
                $nombre = $registro[1];
                $idPadre = $registro[2];

                if (trim($nombre) != "") {
                        $res = creaCategoriaOri( $idPadre, $conn );

                        $padre = end($res);

                        if ($padre){
                                $nuevaCat = wp_create_category( $nombre, $padre );
                                //echo "Creo la categoria '" . $nombre . "' hija de '" . $padre . "'";
                        } else {
                                $nuevaCat = wp_create_category( $nombre );
                                //echo "Creo la categoria '" . $nombre . "'";
                        }
                        $res[] = $nuevaCat;
                }
        }

        $result->close();
        return $res;
}

/** Crea la categoria en el WP
 *  Recibe un nombre de categoria, busca este nombre entre las categorias de WP, si no existe, la crea y devuelve su ID.
 *  Si ya existia, devuelve su ID en un array
*/
function creaCategoria($nombreCategoria, $conn){
        $res = array();
        $term = term_exists($nombreCategoria, 'category');
        if ($term !== 0 && $term !== null) {
            // La categoria ya existe
            // term_exists(cat, tax) -> Returns an array if the pairing exists. (format: array('term_id'=>term id, 'term_taxonomy_id'=>taxonomy id))
            $res[] = $term['term_id'];
        } else {
            //La categoria NO existe
            $res[] = wp_create_category( $nombreCategoria );
        }
        return $res;

        // LO MISMO PERO PARA LAS ETIQUETAS
        // $term = term_exists('Untagged', 'post_tag');
        // if ($term !== 0 && $term !== null) {
        //   echo "'Untagged' post_tag exists!";
        // }
}

/** Metodo encagado de recorrer la tabla de ITMT_I adecuadamente en busca de aquellas entradas que tienen una URL
 *  en el campo link_externo asociado de la tabla ITMT. Para cada uno de ellos, crea un post cuyo titulo es el de
 *  la ITMT_I.titulo y el contenido es el mismo pero con un enlace HTML a la URL especificada.
 */
function creaPostDeURLsEnITMT($conn){
        $nuevoPost = array();

        $query = "SELECT ITMT_I.titulo, ITMT.link_externo, ITMT.id_anterior
                        FROM ITMT JOIN ITMT_I ON ITMT.id = ITMT_I.id
                        WHERE ITMT.link_externo is not null
                        AND ITMT_I.titulo is not null
                        AND ITMT_I.id_idioma = 0
                        AND ITMT_I.id IN (1886, 1742, 2238)";

        // Select all the rows in the query
        $result = $conn->query($query);
        if (!$result) { echo 'Invalid query: ' . $conn->connect_error; }

        //$numRegistros = $result->num_rows;
        $contadorPost = 0;
        while( $registro = $result->fetch_row() ) {

                $titulo = $registro[0];
                $url = $registro[1];
                $idCategoriaOri = $registro[2];
                
                $idCategoria = creaCategoria("Enlaces", $conn);

                $texto = '<a href="' . $url . '" target="_blank">' . $titulo . '</a>';

                $nuevoPost['post_author'] = 1;
                $nuevoPost['post_content'] = identificaContenidoPostAntiguo($texto);
                $nuevoPost['post_type'] = 'post'; // 'page'; // el tipo puede ser entre otros, pagina o entrada
                $nuevoPost['post_status'] = 'publish';
                $nuevoPost['post_title'] = $titulo;
                $nuevoPost['post_category'] = $idCategoria; // array(8,39);

                wp_insert_post($nuevoPost,true);
                if ( is_wp_error($result) ) {
                        echo $result->get_error_message();
                        echo "Titulo -> " . $titulo . "</br>";
                        echo "Texto  -> " . $texto . "</br>";
                        echo "idCategoriaOri  -> " . $idCategoriaOri . "</br>";
                } else {
                        $contadorPost++;
                }
        }
        $result->close();
        echo $contadorPost . " posts(URL) guardados en el WP correctamente.</br>";
}

/** Esta funcion recibe como parametro lo que va a ser el contenido del post y le introduce un HTML
 *  para identificarlo posteriormente y poder aplicarle estilos CSS sin afectar al resto de contenidos.
 */
function identificaContenidoPostAntiguo($texto){
    return "<div class='postAntiguo'>" . $texto . '</div>';
}

/** Metodo encagado de recorrer la tabla de BLOQUETEXTO adecuadamente e ir creado los post
 *  en su respectiva categoria (tambien creandola si es necesario)
 */
function creaPostDeBloqueTexto($conn){
        $nuevoPost = array();

        $query = "SELECT BLOQUETEXTO_I.titulo, BLOQUETEXTO_I.texto, BLOQUETEXTO.id_itmt as idcategoria
                        FROM BLOQUETEXTO_I JOIN BLOQUETEXTO ON BLOQUETEXTO_I.id = BLOQUETEXTO.id
                        WHERE id_idioma = 0
                        AND texto IS NOT NULL
                        AND titulo IS NOT NULL
                        AND BLOQUETEXTO_I.id IN (4092, 3791, 3251)";

        // Select all the rows in the query
        $result = $conn->query($query);
        if (!$result) { echo 'Invalid query: ' . $conn->connect_error; }

        //$numRegistros = $result->num_rows;
        $contadorPost = 0;
        while( $registro = $result->fetch_row() ) {

                // for ($i=0; $i < $conn->field_count; $i++)
                // {
                //         $fieldValue = $registro[$i];
                //         echo $i . " -> " . $fieldValue . "</br>";
                // }
                $titulo = $registro[0];
                $texto = $registro[1];
                $idCategoriaOri = $registro[2];
                
                $idCategoria = creaCategoria("Intercambia", $conn);

                $nuevoPost['post_author'] = 1;
                $nuevoPost['post_content'] = identificaContenidoPostAntiguo($texto);
                $nuevoPost['post_type'] = 'post'; // 'page'; // el tipo puede ser entre otros, pagina o entrada
                $nuevoPost['post_status'] = 'publish';
                $nuevoPost['post_title'] = $titulo;
                $nuevoPost['post_category'] = $idCategoria; // array(8,39);

                wp_insert_post($nuevoPost,true);
                if ( is_wp_error($result) ) {
                        echo $result->get_error_message();
                        echo "Titulo -> " . $titulo . "</br>";
                        echo "Texto  -> " . $texto . "</br>";
                        echo "idCategoriaOri  -> " . $idCategoriaOri . "</br>";
                } else {
                        $contadorPost++;
                }
        }
        $result->close();
        echo $contadorPost . " posts de BloqueDeTexto guardados en el WP correctamente.</br>";
}

/** Metodo encagado de recorrer la tabla de Publicaciones adecuadamente e ir creado los post
 *  en su respectiva categoria (tambien creandola si es necesario) siempre y cuando el archivo
 *  PDF al que haga referencia exista o tenga una URL. Ademas si tiene imagen y existe
 *  la incluye al post
 */
function creaPostDePublicaciones($conn){
        $nuevoPost = array();

//TODO esta query es de prueba hasta que me manden los archivos que necesito

        $query = "SELECT PUBLICACIONES_I.titulo, PUBLICACIONES_I.resenia, PUBLICACIONES.autor, PUBLICACIONES.editorial, PUBLICACIONES.anio, PUBLICACIONES.isbn, PUBLICACIONES.url, PUBLICACIONES.imagen, PUBLICACIONES.pdf, PUBLICACIONES_TIPOS_I.nombre categoria
                    FROM PUBLICACIONES_I JOIN PUBLICACIONES
                            ON PUBLICACIONES_I.id = PUBLICACIONES.id
                         JOIN PUBLICACIONES_TIPOS_I ON PUBLICACIONES_TIPOS_I.id = PUBLICACIONES.id_tipo
                    WHERE PUBLICACIONES.id IN (81, 50, 51, 16)";

        // Select all the rows in the query
        $result = $conn->query($query);
        if (!$result) { echo 'Invalid query: ' . $conn->connect_error; }

        //$numRegistros = $result->num_rows;
        $contadorPost = 0;
        while( $registro = $result->fetch_row() ) {

                $titulo = $registro[0];
                $resenia = $registro[1];
                $autor = $registro[2];
                $editorial = $registro[3];
                $anio = $registro[4];
                $isbn = $registro[5];
                $url = $registro[6];
                $imagen = $registro[7];
                $pdf = $registro[8];
                $categoria = $registro[9];

                $idCategoria = creaCategoria($categoria, $conn);

                //Creo el texto del POST
                if ($resenia){
                    $texto = $resenia . "</br>";
                } else {
                    $texto = $titulo . "</br>";
                }
                if ($autor){
                    $texto .= "Autor: " . $autor . "</br>";
                }
                if ($editorial){
                    $texto .= "Editorial: " . $editorial . "</br>";
                }
                if ($anio){
                    $texto .= "A&ntilde;o de publicaci&oacute;n: " . $anio . "</br>";
                }
                if ($isbn){
                    $texto .= "ISBN: " . $isbn . "</br>";
                }
                if ($url && str_startsWith($url, 'http://')){
                    $texto .= "Enlace: <a href='" . $url . "' target='_blank'>" . $url . "</a></br>";
                }
                if ($imagen && file_exists ( $imagen )){ // Las rutas de las imagenes son "/imagenes/publicaciones/....jpg"
                    $texto .= "<img src='" . $imagen . "'\></br>";
                }
                if ($pdf && file_exists( $pdf )){ // Las rutas de los PDF son "/pdf/publicaciones/....jpg"
                    $texto .= "PDF disponible: <a href='" . $pdf . "' target='_blank'>" . $pdf . "</a></br>";
                }

                //Compongo el POST
                $nuevoPost['post_author'] = 1;
                $nuevoPost['post_content'] = identificaContenidoPostAntiguo($texto);
                $nuevoPost['post_type'] = 'post'; // 'page'; // el tipo puede ser entre otros, pagina o entrada
                $nuevoPost['post_status'] = 'publish';
                $nuevoPost['post_title'] = $titulo;
                $nuevoPost['post_category'] = $idCategoria; // array(8,39);
                //$nuevoPost['tags_input'] = 

                wp_insert_post($nuevoPost,true);
                if ( is_wp_error($result) ) {
                        echo $result->get_error_message();
                        echo "Titulo -> " . $titulo . "</br>";
                        echo "Texto  -> " . $texto . "</br>";
                } else {
                        $contadorPost++;
                }
        }
        $result->close();
        echo $contadorPost . " posts (de Publicaciones) guardados en el WP correctamente.</br>";
}

/** Metodo encagado de recorrer la tabla de Contenido_Agenda adecuadamente e ir creado los post
 *  en su respectiva categoria (tambien creandola si es necesario) y en la fecha aduecuada
 */
function creaPostDeContenidoAgenda($conn){
        $nuevoPost = array();

        $query = "SELECT CONTENIDO_AGENDA_I.titulo, CONTENIDO_AGENDA_I.contenido, CONTENIDO_AGENDA_I.subtitulo, CONTENIDO_AGENDA_I.lugar, CONTENIDO_AGENDA.fecha, CONTENIDO_AGENDA.url
                    FROM CONTENIDO_AGENDA JOIN CONTENIDO_AGENDA_I
                           ON CONTENIDO_AGENDA.id = CONTENIDO_AGENDA_I.id_contenido
                    WHERE CONTENIDO_AGENDA.id IN (26, 36, 399, 414, 129, 165, 360)";

        // Select all the rows in the query
        $result = $conn->query($query);
        if (!$result) { echo 'Invalid query: ' . $conn->connect_error; }

        //$numRegistros = $result->num_rows;
        $contadorPost = 0;
        while( $registro = $result->fetch_row() ) {

                $titulo = $registro[0];
                $contenido = $registro[1];
                $subtitulo = $registro[2];
                $lugar = $registro[3];
                $fecha = $registro[4];
                $url = $registro[5];

                $idCategoria = creaCategoria('Agenda', $conn);

                //Creo el texto del POST
                if ($contenido){
                    $texto = $contenido . "</br>";
                } else {
                    $texto = $titulo . "</br>";
                }
                if ($subtitulo){
                    $texto .= $subtitulo . "</br>";
                }
                if ($lugar){
                    $texto .= "Lugar: " . $lugar . "</br>";
                }
                if ($fecha){
                    $texto .= "Fecha: " . $fecha . "</br>";
                }
                if ($url && str_startsWith($url, 'http://')){
                    $texto .= "Enlace: <a href='" . $url . "' target='_blank'>" . $url . "</a></br>";
                }

                //Compongo el POST
                $nuevoPost['post_author'] = 1;
                $nuevoPost['post_content'] = identificaContenidoPostAntiguo($texto);
                $nuevoPost['post_type'] = 'post'; // 'page'; // el tipo puede ser entre otros, pagina o entrada
                $nuevoPost['post_status'] = 'publish';
                $nuevoPost['post_title'] = $titulo;
                $nuevoPost['post_category'] = $idCategoria; // array(8,39);
                //$nuevoPost['tags_input'] = 

                wp_insert_post($nuevoPost,true);
                if ( is_wp_error($result) ) {
                        echo $result->get_error_message();
                        echo "Titulo -> " . $titulo . "</br>";
                        echo "Texto  -> " . $texto . "</br>";
                } else {
                        $contadorPost++;
                }
        }
        $result->close();
        echo $contadorPost . " posts (de ContenidoAgenda) guardados en el WP correctamente.</br>";
}

if (isset($_GET['BloqueTexto'])){
    creaPostDeBloqueTexto($connection);

} elseif (isset($_GET['URLsEnITMT'])){
    creaPostDeURLsEnITMT($connection);

} elseif (isset($_GET['Publicaciones'])){
    //creaPostDePublicaciones($connection);
    echo "Aun no tengo estos archivos.";

} elseif (isset($_GET['ContenidoAgenda'])){
    creaPostDeContenidoAgenda($connection);

} elseif (isset($_GET['categorias'])) {
    $res = creaCategoriaOri(1255, $connection);
    var_dump($res);

} elseif (isset($_GET['unaCategoria'])) {
    $res = creaCategoria( "MiCategoria", $connection);
    var_dump($res);

} else {
    echo '  Haz clic para iniciar el proceso
            <form action="' . $_SERVER['PHP_SELF'] . '">
                    <input type="submit" name="BloqueTexto" value="Crear posts de BloqueTexto"/>
                    <input type="submit" name="URLsEnITMT" value="Crear posts de URLsEnITMT"/>
                    <input type="submit" name="Publicaciones" value="Crear posts de Publicaciones"/>
                    <input type="submit" name="ContenidoAgenda" value="Crear posts de ContenidoAgenda"/>
                    <input type="submit" name="categorias" value="Crear categorias"/>
                    <input type="submit" name="unaCategoria" value="Crear una categoria de prueba"/>
            </form>';
}
?>