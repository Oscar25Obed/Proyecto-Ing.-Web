<?php

class Reserva
{
    private $idRestaurante;
    private $nombre;
    private $email;
    private $fecha;
    private $hora;
    private $cantidadPersonas;
    private $sillasNinos;
    private $comentario;

    public function __construct($idRestaurante, $nombre, $email, $fecha, $hora, $cantidadPersonas, $sillasNinos, $comentario)
    {
        $this->idRestaurante = $idRestaurante;
        $this->nombre = $nombre;
        $this->email = $email;
        $this->fecha = $fecha;
        $this->hora = $hora;
        $this->cantidadPersonas = $cantidadPersonas;
        $this->sillasNinos = $sillasNinos;
        $this->comentario = $comentario;
    }

    public function guardarReserva()
    {
        global $connection;

        $idRestaurante = mysqli_real_escape_string($connection, $this->idRestaurante);
        $nombre = mysqli_real_escape_string($connection, $this->nombre);
        $email = mysqli_real_escape_string($connection, $this->email);
        $fecha = mysqli_real_escape_string($connection, $this->fecha);
        $hora = mysqli_real_escape_string($connection, $this->hora);
        $cantidadPersonas = mysqli_real_escape_string($connection, $this->cantidadPersonas);
        $sillasNinos = mysqli_real_escape_string($connection, $this->sillasNinos);
        $comentario = mysqli_real_escape_string($connection, $this->comentario);

        try {
            // Preparar la consulta SQL
            $consulta = "INSERT INTO Reserva (idRestaurante, nombre, email, fecha, hora, cantidadPersonas, sillasNinos, comentario) VALUES ('$idRestaurante', '$nombre', '$email', '$fecha', '$hora', '$cantidadPersonas', '$sillasNinos', '$comentario')";

            // Ejecutar la consulta
            $result = mysqli_query($connection, $consulta);

            // Devolver true si la inserción fue exitosa
            return $result;
        } catch (Exception $e) {
            // Manejar el error en caso de fallo
            echo "Error al guardar la reserva: " . $e->getMessage();
            return false;
        }
    }
}

?>
