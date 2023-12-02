<?php
session_start();

// Conexión a la base de datos

$conn = mysqli_connect('localhost', 'root', '', 'semestralweb');

// Verificar la conexión
if ($conn->connect_error) {
    die("Error de conexión: " . $conn->connect_error);
}
// Verificar si se envió el formulario
if ($_SERVER["REQUEST_METHOD"] == "POST") {
    $input_email = $_POST["correo"];
    $input_password = $_POST["contrasena"];

    // Consultar la base de datos para verificar las credenciales
    $sql = "SELECT * FROM usuario WHERE email = '$input_email' AND contrasena = '$input_password'";
    $result = $conn->query($sql);

    if ($result->num_rows == 1) {
        // Inicio de sesión exitoso
        $_SESSION["user"] = $input_email;
        header("Location: dashboard.php"); // Redirige a la página de inicio después del inicio de sesión
        exit();
    } else {
        // Credenciales incorrectas
        echo '<script>alert("Error al iniciar sesion, credenciales incorrectas");</script>';
  
    }
}

// Cerrar la conexión
$conn->close();
?>
<!DOCTYPE html>
<html lang="es">
<head>
  <title>login</title>
  <link rel="stylesheet" href="login.css" />
  <link rel="stylesheet" href="styleback.css">
  <meta charset="UTF-8">
</head>
<body>
<div class="container">
    <div class="logo-container">
      <img src="https://drive.google.com/uc?export=download&id=13pr47WdQCDipoVwWh66nf2ml2M0ZDDiC" alt="Logo de Reserva de restaurante " class="logoB">
    </div>
  </div>
    <div class="login-form">
        <div class="login-box">
            <h1>Iniciar sesion</h1>
            <form action="login.php" method="post">
              <label>Correo</label>
              <input type="email" placeholder="Correo" name="correo" />
              <label>Contrasena</label>
              <input type="password" placeholder="********" name="contrasena" />
              <input type="submit" name="submit"> 
            </form>
            <p>¿No tienes una cuenta? <button class="toggle-btn">Registro</button></p>
          </div>
    </div>
    <div class="register-form">
        <div class="signup-box">
            <h1>Registro</h1>
            <form action="procesar_registro.php" method="post">
              <label>Nombre</label>
              <input type="text" placeholder="Nombre" name="nombre" />
              <label for="genero">Género</label>
              <select class="form-control" id="genero" name="genero">
                <option value="masculino">Masculino</option>
                <option value="femenino">Femenino</option>
              </select>
              <label>Edad</label>
              <input type="number" min="1" placeholder="Edad" name="edad"/>
              <label>Correo Electrónico</label>
              <input type="email" placeholder="correo@example.com" name="correo" required />
              <label>Contrasena</label>
              <input type="password" placeholder="********" name="contrasena"/>
              <label for="pais">País</label>
              <input type="text" class="form-control" id="pais" name="pais" placeholder="País">
              <input type="submit" name="submit"> 
            </form>
            <p>¿Ya tienes una cuenta? <button class="toggle-btn">Iniciar sesion</button></p>
          </div>
    </div>
    <section class="herobgcolor"></section>
  </div>

  <script>
    const loginForm = document.querySelector('.login-form');
    const registerForm = document.querySelector('.register-form');
    const toggleBtns = document.querySelectorAll('.toggle-btn');

    // Ocultar formulario de registro al cargar la pÃ¡gina
    registerForm.style.display = 'none';

    // Alternar entre formularios al hacer clic en los botones 
    toggleBtns.forEach(btn => {
      btn.addEventListener('click', () => {
        loginForm.style.display = loginForm.style.display === 'none' ? 'block' : 'none';
        registerForm.style.display = registerForm.style.display === 'none' ? 'block' : 'none';
      });
    });
  </script>
<div class="wrapper">
  <span></span>
  <span></span>
  <span></span>
  <span></span>
  <span></span>
  <span></span>
  <span></span>
  <span></span>
  <span></span>
  <span></span>
</div>
<div class="wrapperer">
  <span></span>
  <span></span>
  <span></span>
  <span></span>
  <span></span>
  <span></span>
  <span></span>
  <span></span>
  <span></span>
  <span></span>
</div>
<div class="wrapperblue">
  <span></span>
  <span></span>
  <span></span>
  <span></span>
  <span></span>
  <span></span>
  <span></span>
  <span></span>
  <span></span>
  <span></span>
</div>

</body>
</html>
