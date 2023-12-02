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
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="stylesheet" href="style.css">
    <link rel="stylesheet" href="styleback.css">
    <title>Reserva</title> 
</head>
<body>
    <header>
        <a href="home.html"><img src="https://drive.google.com/uc?export=download&id=13pr47WdQCDipoVwWh66nf2ml2M0ZDDiC" alt="Logo de la Pagina" class="logoContainer"></a>
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
    <button id="boton-atras">VOLVER</button>

    <script>
        document.getElementById("boton-atras").addEventListener("click", function() {
            window.history.back();
        });
    </script>   
    <section>
        <div class="NcontenedorR">
            <div class="RestauranteR">
                <div class="formulario">
                    <h2>Reservación de Restaurante</h2>
                    <form action="procesar_reserva.php" method="post">
                        <input type="hidden" name="idRestaurante" value="" id="idRestauranteField"> <!--Valor oculto para el id del restaurante-->
                        <input type="hidden" name="nombreRestaurante" value="" id="nombreRestauranteField"> <!--Valor oculto para el nombre del restaurante-->
                        <input type="hidden" name="idUsuario" value="<?php echo $user_data["idUsuario"]; ?>" id="idUsuarioField">
                        <label for="nombre">Nombre:</label>
                        <input type="text" id="nombre" name="nombre" required>
            
                        <label for="email">Correo Electrónico:</label>
                        <input type="email" id="email" name="email" required>
            
                        <label for="fecha">Fecha de Reserva:</label>
                        <input type="date" id="fecha" name="fecha" required>
                        <label for="fecha">Hora de Reserva:</label>
                        <input type="time" id="hora" name="hora" min="10:00" max="22:00">
                        <label for="personas">Número de Personas:</label>
                        <select id="personas" name="cantidadPersonas" required>
                            <option value="1">1 persona</option>
                            <option value="2">2 personas</option>
                            <option value="3">3 personas</option>
                            <option value="4">4 personas</option>
                            <option value="5">5 personas</option>
                        </select>
                        <label for="personas">Sillas para niños:</label>
                        <select id="sillas_ninos" name="sillasNinos" required>                
                            <option value="0">0 </option>                           
                            <option value="1">1 </option>
                            <option value="2">2 </option>
                            <option value="3">3 </option>
                            <option value="4">4 </option>
                            <option value="5">5 </option>
                        </select>
                        <label for="nombre">Comentarios adicionales:</label>
                        <input type="text" id="coments" name="comentario">      
                        <button type="submit" name="submit">Reservar Ahora</button>
                    </form>                   
                </div>
                </div>
              </div>
        </div> 
    </section>
    <footer>
        <p>Copyright (C) 2023 ResPan.COM<br>Todos los derechos reservados<br></p>
    </footer>
    <script>
        // Recuperar el valor de idRestaurante almacenado en localStorage
        var idRestaurante = localStorage.getItem('idRestaurante');
        // Verificar si idRestaurante tiene un valor
        if (idRestaurante) {
            // Asignar el valor del idRestaurante al campo oculto
            document.getElementById("idRestauranteField").value = idRestaurante;
        } else {
            console.error("Error: idRestaurante no está definido en localStorage.");
            // Redirigir al usuario a una página de error o tomar otra acción apropiada
        }

        var nombreRestaurante = localStorage.getItem('nombreRestaurante');
        // Verificar si nombreRestaurante tiene un valor
        if (nombreRestaurante) {
            // Asigna el valor de nombreRestaurante al campo oculto
            document.getElementById("nombreRestauranteField").value = nombreRestaurante;
        } else {
            console.error("Error: nombreRestaurante no está definido en localStorage.");
        }
    
        document.getElementById("boton-atras").addEventListener("click", function() {
            window.history.back();
        });
    </script>
    <a href="logout.php">Cerrar sesión</a>
</body>
</html>
 
