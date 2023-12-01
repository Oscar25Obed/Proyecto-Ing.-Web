<?php
session_start();

// Verificar si el usuario ha iniciado sesión
if (!isset($_SESSION["user"])) {
    header("Location: index.html"); // Redirige al usuario al formulario de inicio de sesión si no ha iniciado sesión
    exit();
}


$conn = mysqli_connect('localhost', 'root', '', 'semestralweb');

// Verificar la conexión
if ($conn->connect_error) {
    die("Error de conexión: " . $conn->connect_error);
}

// Obtener la información del usuario
$user_email = $_SESSION["user"];
$sql = "SELECT * FROM usuario WHERE correo = '$user_email'";
$result = $conn->query($sql);

// Verificar si se encontró el usuario
if ($result->num_rows == 1) {
    $user_data = $result->fetch_assoc();
} else {
    // No se encontró el usuario (esto no debería ocurrir si la sesión está configurada correctamente)
    die("Error: No se encontró la información del usuario.");
}

// Cerrar la conexión
$conn->close();
?>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Perfil de Usuario</title>
</head>
<body>
    <h2>Perfil de Usuario</h2>
    <p><strong>Email:</strong> <?php echo $user_data["correo"]; ?></p>
    <p><strong>Nombre:</strong> <?php echo $user_data["nombre"]; ?></p>
    <p><strong>Género:</strong> <?php echo $user_data["genero"]; ?></p>
    <p><strong>Edad:</strong> <?php echo $user_data["edad"]; ?></p>
    <p><strong>País:</strong> <?php echo $user_data["pais"]; ?></p>

    <a href="dashboard.php">Volver al Panel de Control</a>
</body>
</html>
