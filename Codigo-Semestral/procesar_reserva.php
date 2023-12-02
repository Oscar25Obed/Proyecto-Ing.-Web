<?php
// Incluir la conexión a la base de datos
include "BasedeDatos.php";
include "Reserva.php";
// Verificar si se recibieron datos del formulario
if (isset($_POST['submit'])) {
    // Recuperar los datos del formulario
    $idRestaurante = $_POST["idRestaurante"];
    $nombreRestaurante = $_POST["nombreRestaurante"];
    $nombre = $_POST["nombre"];
    $email = $_POST["email"];
    $fecha = $_POST["fecha"];
    $hora = $_POST["hora"];
    $cantidadPersonas = $_POST["cantidadPersonas"]; 
    $sillasNinos = $_POST["sillasNinos"]; 
    // Asignar el valor en caso de ser NULL 
    $comentario = ($_POST["comentario"] !== null && $_POST["comentario"] !== "") ? $_POST["comentario"] : "Ninguno";
    $idUsuario = $_POST["idUsuario"];
    // Crear una instancia de la clase Reserva
    $reserva = new Reserva($idRestaurante, $nombre, $email, $fecha, $hora, $cantidadPersonas, $sillasNinos, $comentario, $idUsuario);

    // Guardar la reserva en la base de datos
    $reserva->guardarReserva();
    
} else {
    echo "Acceso denegado.";
}
?>

<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="stylesheet" href="style.css">
    <title>Reserva</title>
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
            <a href="profile.php"><img src="https://drive.google.com/uc?export=download&id=1oDuoiQbhpdpdlxqSsg_k-BRQ78lTgmpr" alt="Icono de Usuario" width="45" height="45"></a>
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
            <h1>Reserva Exitosa</h1>
            <img src="Reserva.jpg">
            <div class="tabla-generales">
                <table>
                  <tr>
                    <th>Categoría</th>
                    <th>Detalle</th>
                  </tr>
                  <tr>
                    <td>Restaurante</td>
                    <td><?php echo $nombreRestaurante; ?></td> 
                  </tr>
                  <tr>
                    <td>Fecha</td>
                    <td><?php echo $fecha; ?></td>
                  </tr>
                  <tr>
                    <td>Hora</td>
                    <td><?php echo  $hora; ?></td>
                  </tr>
                  <tr>
                    <td>Cantidad de Personas</td>
                    <td><?php echo $cantidadPersonas; ?></td>
                  </tr>
                  <tr>
                    <td>Cantidad de sillas para niños</td>
                    <td><?php echo $sillasNinos; ?></td>
                  </tr>
                  <tr>
                    <td>Comentarios adicionales</td>
                    <td><?php echo $comentario; ?></td>
                  </tr>
                </table>
              </div>
            <div>
              <a href="dashboard.php" class="boton boton-reservas">Página Principal</a>
            </form>
            </div>
          </div>
    </div> 
</section>
<footer>
    <p>Copyright (C) 2023 ResPan.COM<br>Todos los derechos reservados<br></p>

</footer>
</body>
</html>
