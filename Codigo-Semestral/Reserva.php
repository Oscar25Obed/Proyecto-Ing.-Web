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
    private $idUsuario;

    public function __construct($idRestaurante, $nombre, $email, $fecha, $hora, $cantidadPersonas, $sillasNinos, $comentario, $idUsuario)
    {
        $this->idRestaurante = $idRestaurante;
        $this->nombre = $nombre;
        $this->email = $email;
        $this->fecha = $fecha;
        $this->hora = $hora;
        $this->cantidadPersonas = $cantidadPersonas;
        $this->sillasNinos = $sillasNinos;
        $this->comentario = $comentario;
        $this->idUsuario = $idUsuario;
    }

    public function guardarReserva()
    {
        global $connection;

        $idRestaurante = $this->idRestaurante;
        $nombre = $this->nombre;
        $email = $this->email;
        $fecha = $this->fecha;
        $hora = $this->hora;
        $cantidadPersonas = $this->cantidadPersonas;
        $sillasNinos = $this->sillasNinos;
        $comentario = $this->comentario;
        $idUsuario = $this->idUsuario;

        try {
            // Preparar la consulta SQL con sentencia preparada
            $consulta = "INSERT INTO Reserva (idRestaurante, nombre, email, fecha, hora, cantidadPersonas, sillasNinos, comentario, idUsuario) VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?)";

            // Preparar la sentencia
            $stmt = mysqli_prepare($connection, $consulta);

            // Vincular parámetros
            mysqli_stmt_bind_param($stmt, "sssssiisi", $idRestaurante, $nombre, $email, $fecha, $hora, $cantidadPersonas, $sillasNinos, $comentario, $idUsuario);

            // Ejecutar la sentencia
            $result = mysqli_stmt_execute($stmt);

            // Devolver true si la inserción fue exitosa
            return $result;
        } catch (Exception $e) {
            // Manejar el error en caso de fallo
            echo "Error al guardar la reserva: " . $e->getMessage();
            return false;
        } finally {
            // Cerrar la sentencia
            mysqli_stmt_close($stmt);
        }
    }
}

?>

