<?php

class Registro
{
    private $nombre;
    private $genero;
    private $edad;
    private $correo;
    private $contrasena;

    public function __construct($nombre, $edad, $correo, $contrasena, $genero)
    {
        $this->nombre = $nombre;
        $this->genero = $genero;
        $this->edad = $edad;
        $this->correo = $correo;
        $this->contrasena = $contrasena;
    }

    public function guardarUsuario()
    {
        global $connection;
    
        $nombre = mysqli_real_escape_string($connection, $this->nombre);
        $genero = mysqli_real_escape_string($connection, $this->genero);
        $edad = mysqli_real_escape_string($connection, $this->edad);
        $correo = mysqli_real_escape_string($connection, $this->correo);
        $contrasena = mysqli_real_escape_string($connection, $this->contrasena);
    
        try {
            // Preparar la consulta SQL con sentencia preparada
            $consulta = "INSERT INTO usuario (nombre, email, edad, contrasena, genero) VALUES (?, ?, ?, ?, ?)";

    
            // Preparar la sentencia
            $stmt = mysqli_prepare($connection, $consulta);
    
            // Vincular parámetros
            mysqli_stmt_bind_param($stmt, "ssiss", $nombre, $edad, $correo, $contrasena, $genero);
    
            // Ejecutar la sentencia
            $result = mysqli_stmt_execute($stmt);
    
            // Devolver true si la inserción fue exitosa
            return $result;
        } catch (Exception $e) {
            // Manejar el error en caso de fallo
            echo "Error al guardar el usuario: " . $e->getMessage();
            return false;
        }
    }
    
}
?>
