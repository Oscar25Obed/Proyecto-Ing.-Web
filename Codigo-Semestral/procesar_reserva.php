<?php
// Incluir la conexión a la base de datos
include "BasedeDatos.php";
include "Reserva.php";
// Verificar si se recibieron datos del formulario
if (isset($_POST['submit'])) {
    // Recuperar los datos del formulario
    $idRestaurante = $_POST["idRestaurante"];
    $nombre = $_POST["nombre"];
    $email = $_POST["email"];
    $fecha = $_POST["fecha"];
    $hora = $_POST["hora"];
    $cantidadPersonas = $_POST["cantidadPersonas"]; // Cambiado de $cantidadPersonas a $num_personas
    $sillasNinos = $_POST["sillasNinos"]; // Cambiado de $sillasNinos a $sillas_ninos
    $comentario = $_POST["comentario"]; // Cambiado de $comentario a $comentarios
    
    // Crear una instancia de la clase Reserva
    $reserva = new Reserva($idRestaurante, $nombre, $email, $fecha, $hora, $cantidadPersonas, $sillasNinos, $comentario); // Cambiado de $cantidadPersonas, $sillasNinos, $comentario a $num_personas, $sillas_ninos, $comentarios

    // Guardar la reserva en la base de datos
    if ($reserva->guardarReserva()) {
        echo "Reserva realizada con éxito.";
    } else { 
        echo "Error al realizar la reserva.";
    }
} else {
    echo "Acceso denegado.";
}
?>
