<?php
session_start();

// Cierra la sesión
session_destroy();

// Redirige al usuario al formulario de inicio de sesión
header("Location: index.html");
exit();
?>
