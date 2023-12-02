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
$sql = "SELECT * FROM usuario WHERE email = '$user_email'";
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
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="stylesheet" href="style.css">
    <title>Restaurantes Panamá</title>
</head>
<body>
    <header>
        <a href="dashboard.php"><img src="https://drive.google.com/uc?export=download&id=13pr47WdQCDipoVwWh66nf2ml2M0ZDDiC" alt="Logo de la Pagina" class="logoContainer"></a>
        <div class="socialContainer">
            <form>
                <input type="search" id="inputsearch" name="b" placeholder="Buscar...">
            </form>
            <div >
                <a href="https://instagram.com/solociencia.com23?igshid=MzNlNGNkZWQ4Mg=="><img src="https://drive.google.com/uc?export=download&id=18MNUF86hwCrd4VSzZbHKqDzJpxdO9Ydv" alt="Icono de Instagram" width="45" height="45"></a> 
            </div>
            <div>
                <a href="https://www.facebook.com/profile.php?id=100093560545559&mibextid=LQQJ4d"><img src="https://drive.google.com/uc?export=download&id=1Nz4QobNnuNJX0PT49t_hcGdX8TlbRxaB" alt="Icono de Facebook" width="45" height="45"></a>
            </div>
            <div>
                <a href="usuario.html"><img src="https://drive.google.com/uc?export=download&id=1oDuoiQbhpdpdlxqSsg_k-BRQ78lTgmpr" alt="Icono de Usuario" width="45" height="45"></a>
            </div>
        </div>
    </header>
    <section>
        <div class="NcontenedorR">
            <div class="RestauranteR">
                <div class="formulario">
                    <h2>Datos del usuario</h2>
                    <div class="usuario">
                        <img src="https://cdn-icons-png.flaticon.com/512/3135/3135768.png" alt="Imagen redonda">
                    </div>
                    <p><strong>Email:</strong> <?php echo $user_data["email"]; ?></p>
                    <p><strong>Nombre:</strong> <?php echo $user_data["nombre"]; ?></p>
                    <p><strong>Género:</strong> <?php echo $user_data["genero"]; ?></p>
                    <p><strong>Edad:</strong> <?php echo $user_data["edad"]; ?></p>

                </div>
                </div>
              </div>
        </div> 
    </section>
<footer>
    <p>Copyright (C) 2023 ResPan.COM<br>Todos los derechos reservados<br></p>
    <a href="dashboard.php">Volver al Panel de Control</a>
</footer>
</body>
</html>
