<?php
// Establecer conexión a la base de datos
include "BasedeDatos.php";
session_start();

// Verificar si el usuario ha iniciado sesión
if (!isset($_SESSION["user"])) {
    header("Location: login.html"); // Redirige al usuario al formulario de inicio de sesión si no ha iniciado sesión
    exit();
}

// Inicializar las variables de filtrado
$tipoComida = isset($_POST['tipoComida']) ? $_POST['tipoComida'] : 'todos';
$ubicacion = isset($_POST['ubicacion']) ? $_POST['ubicacion'] : '';

// Construir la consulta SQL base
$sql = "SELECT * FROM restaurante WHERE 1";

// Agregar condiciones de filtrado según los valores enviados por el formulario
if ($tipoComida != 'todos') {
    $sql .= " AND tipoComida = '$tipoComida'";
}

if (!empty($ubicacion)) {
    $sql .= " AND ubicacion LIKE '%$ubicacion%'";
}

// Ejecutar la consulta
$result = $connection->query($sql);

// Verificar si hay resultados

$contador = 0;
// Cerrar la conexión
$connection->close();
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
                <a href="profile.php"><img src="https://drive.google.com/uc?export=download&id=1oDuoiQbhpdpdlxqSsg_k-BRQ78lTgmpr" alt="Icono de Usuario" width="45" height="45"></a>
            </div>
        </div>
    </header>
    <section>
        <form action="dashboardFiltrado.php" method="post">
            <div class="container">
              <div class="row">
                <div class="col-md-4">
                  <div class="form-group">
                    <label for="tipo-comida">Tipo de comida</label>
                    <select class="form-control" id="tipo-comida" name="tipoComida">
                      <option value="todos">Todos</option>
                      <option value="tipicas">Tipicas</option>
                      <option value="Gourmet">Gourmet</option>
                      <option value="Comida rapida">Comida rapida</option>
                      <option value="Postres">Postres</option>
                    </select>
                  </div>
                </div>
                <div class="col-md-4">
                  <div class="form-group">
                    <label for="ubicacion">Ubicación</label>
                    <input type="text" class="form-control" id="ubicacion" name="ubicacion" placeholder="Ingrese una ubicación">
                  </div>
                </div>
              </div>
              <div class="row">
                <div class="col-md-12">
                  <button type="submit" class="btn btn-primary">Buscar</button>
                </div>
              </div>
            </div>
          </form>
          
    </section>
<section>
    <h1>Restaurantes</h1>
    <div class="Ncontenedor">
            <?php 
                if ($result->num_rows > 0) {
                // Mostrar los resultados
                while ($row = $result->fetch_assoc()) {
                    // Si es el primer restaurante o un múltiplo de tres, abre un nuevo contenedor
                    if ($contador == 0 || $contador % 3 == 0) {
                        echo '<div class="Ncontenedor">';
                    }
                    echo '<div class="Restaurante">';
                    echo '<a href="' . $row["sitioWeb"] . '"><img src="Restaurante' . $row["idRestaurante"] . '.jpg"" alt="' . $row["nombre"] . '"></a>';
                    echo '<a href="' . $row["sitioWeb"] . '"><h3>' . $row["nombre"] . '</h3></a>';
                    echo '</div>';
                    // Si es el tercer restaurante o un múltiplo de tres, cierra el contenedor
                    if (($contador + 1) % 3 == 0) {
                        echo '</div>';
                    }
            
                    $contador++;
                }
            
                // Si no cerró el último contenedor, ciérralo aquí
                if ($contador % 3 != 0) {
                    echo '</div>';
                }
            } else {
                echo "No se encontraron resultados.";
            }
            ?>
    </div>
</section>

<footer>
    <a href="logout.php">Cerrar sesión</a>
    <p>Copyright (C) 2023 ResPan.COM<br>Todos los derechos reservados<br></p>
</footer>
</body>
</html>