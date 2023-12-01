<?php

class Registro
{
    private $nombre;
    private $genero;
    private $edad;
    private $correo;
    private $contrasena;
    private $pais;

    public function __construct($nombre, $genero, $edad, $correo, $contrasena, $pais)
    {
        $this->nombre = $nombre;
        $this->genero = $genero;
        $this->edad = $edad;
        $this->correo = $correo;
        $this->contrasena = $contrasena;
        $this->pais = $pais;
    }

    public function guardarUsuario()
    {
        global $connection;
    
        $nombre = mysqli_real_escape_string($connection, $this->nombre);
        $genero = mysqli_real_escape_string($connection, $this->genero);
        $edad = mysqli_real_escape_string($connection, $this->edad);
        $correo = mysqli_real_escape_string($connection, $this->correo);
        $contrasena = mysqli_real_escape_string($connection, $this->contrasena);
        $pais = mysqli_real_escape_string($connection, $this->pais);
    
        try {
            // Preparar la consulta SQL con sentencia preparada
            $consulta = "INSERT INTO usuario (nombre, edad, correo, contrasena, genero, Pais) 
                         VALUES (?, ?, ?, ?, ?, ?)";
    
            // Preparar la sentencia
            $stmt = mysqli_prepare($connection, $consulta);
    
            // Vincular parámetros
            mysqli_stmt_bind_param($stmt, "sissis", $nombre, $edad, $correo, $contrasena, $genero, $pais);
    
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
