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

if (isset($_GET['posts'])){
        $nuevoPost = array();

        $query = "SELECT BLOQUETEXTO_I.titulo, BLOQUETEXTO_I.texto, BLOQUETEXTO.id_itmt as idcategoria
                        FROM BLOQUETEXTO_I JOIN BLOQUETEXTO ON BLOQUETEXTO_I.id = BLOQUETEXTO.id
                        WHERE id_idioma = 0
                        AND texto IS NOT NULL
                        AND titulo IS NOT NULL";

        // Select all the rows in the query
        $result = $connection->query($query);
        if (!$result) { echo 'Invalid query: ' . $connection->connect_error; }

        //$numRegistros = $result->num_rows;

        while( $registro = $result->fetch_row() ) {

                // for ($i=0; $i < $connection->field_count; $i++)
                // {
                //         $fieldValue = $registro[$i];
                //         echo $i . " -> " . $fieldValue . "</br>";
                // }
                $titulo = $registro[0];
                $texto = $registro[1];
                $idCategoriaOri = $registro[2];
                
                $idCategoria = creaCategoriaOri($idCategoriaOri, $connection);

                $nuevoPost['post_author'] = 1;
                $nuevoPost['post_content'] = $texto;
                $nuevoPost['post_type'] = 'page'; // 'post'; // el tipo puede ser entre otros, pagina o entrada
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
                        echo "Post insertado correctamtne ;-)";
                }
        }
        $result->close();

} elseif (isset($_GET['categoria'])) {
        $res = creaCategoriaOri(1255, $connection);
        var_dump($res);
} else {
        echo '  Haz clic para iniciar el proceso
                <form action="' . $_SERVER['PHP_SELF'] . '">
                        <input type="submit" name="posts" value="Crear posts"/>
                        <input type="submit" name="categoria" value="Crear categorias"/>
                </form>';
}
?>