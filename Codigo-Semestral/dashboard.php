<?php
session_start();

// Verificar si el usuario ha iniciado sesión
if (!isset($_SESSION["user"])) {
    header("Location: login.html"); // Redirige al usuario al formulario de inicio de sesión si no ha iniciado sesión
    exit();
}
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
                      <option value="mexicana">Tipicas</option>
                      <option value="italiana">Gourmet</option>
                      <option value="japonesa">Comida rapida</option>
                      <option value="vegetariana">Postres</option>
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
        <div class="Restaurante">
            <a href="Restaurante1.html"><img src="Restaurante1.jpg" alt="Logo de Gelarti"></a>
            <a href="Restaurante1.html"><h3>Gelarti Helado Gourmet</h3></a>
            <p>Gelarti es famoso por sus helados artesanales y postres con ingredientes frescos y sabores innovadores en Panamá.</p>
        </div>
        <div class="Restaurante">
            <a href="Restaurante2.html"><img src="Restaurante2.jpg" alt="Logo de Athen's Pizza"></a>
            <a href="Restaurante2.html"><h3>Athen's Pizza</h3></a>
            <p>Athen's Pizza ofrece auténtica pizza griega y platos mediterráneos en un ambiente acogedor en el corazón de la ciudad.</p>
        </div>
        <div class="Restaurante">
            <a href="Restaurante3.html"><img src="Restaurante3.jpg"></a>
            <a href="Restaurante3.html"><h3>Panda House</h3></a>
            <p>Panda House es un destino popular para la cocina china en Panamá, conocido por sus platos sabrosos y variados.</p>
        </div>
    </div>
    <div class="Ncontenedor">
        <div class="Restaurante">
            <a href="Restaurante4.html"><img src="Restaurante4.jpg" alt="Logo de Ichiban"></a>
            <a href="Restaurante4.html"><h3>Ichiban</h3></a>
            <p>En Ichiban, puedes disfrutar de una deliciosa combinación de sushi y parrilla japonesa, ofreciendo opciones frescas y asadas.</p>
        </div>
        <div class="Restaurante">
            <a href="Restaurante5.html"></a><img src="Restaurante5.jpg"></a>
            <a href="Restaurante5.html"><h3>Maguro Japanese BBQ & Sushi</h3></a>
            <p>Este restaurante es conocido por su sushi fresco y experiencia de parrilla japonesa en un entorno moderno y elegante.</p>
        </div>
        <div class="Restaurante">
            <a href="Restaurante6.html"></a><img src="Restaurante6.jpg"></a>
            <a href="Restaurante6.html"><h3>tacontento Panamá</h3></a>
            <p>Tacontento ofrece auténtica comida mexicana en Panamá, con tacos y otras delicias en un ambiente festivo.</p>
        </div>
    </div>
    <div class="Ncontenedor">
        <div class="Restaurante">
            <a href="Restaurante7.html"></a><img src="Restaurante7.jpg"></a>
            <a href="Restaurante7.html"><h3>tacontento Panamá</h3></a>
            <p>Slabon Café Burger Distro es un lugar donde puedes saborear jugosas hamburguesas y platos casuales con un toque especial.</p>
        </div>
        <div class="Restaurante">
            <a href="Restaurante8.html"></a><img src="Restaurante8.jpg"></a>
            <a href="Restaurante8.html"><h3>Ohtoro Ramén & Sushi</h3></a>
            <p>Ohtoro es un restaurante que combina ramen y sushi de alta calidad, proporcionando una experiencia culinaria japonesa única.</p>
        </div>
        <div class="Restaurante">
            <a href="Restaurante9.html"></a><img src="Restaurante9.jpg"></a>
            <a href="Restaurante9.html"><h3>Casco BURGER</h3></a>
            <p>Casco Burger es conocido por sus hamburguesas gourmet y opciones creativas de comida rápida en el encantador Casco Antiguo de la ciudad.</p>
        </div>
    </div>
    <div class="Ncontenedor">
        <div class="Restaurante">
            <a href="Restaurante10.html"></a><img src="Restaurante10.jpg"></a>
            <a href="Restaurante10.html"><h3>Roadster's DINNER</h3></a>
            <p>Roadster's DINNER ofrece una variedad de platillos internacionales en un ambiente acogedor, desde hamburguesas hasta platos de pasta.</p>
        </div>
        <div class="Restaurante">
            <a href="Restaurante11.html"></a><img src="Restaurante11.jpg"></a>
            <a href="Restaurante11.html"><h3>Wah Kee Dimsum Palace</h3></a>
            <p>Wah Kee es conocido por su auténtica dim sum y cocina cantonesa en Panamá, ofreciendo una experiencia culinaria china tradicional.</p>
        </div>
        <div class="Restaurante">
            <a href="Restaurante12.html"></a><img src="Restaurante12.png"></a>
            <a href="Restaurante12.html"><h3>Moocha Gelato•Bubble tea•Waffle</h3></a>
            <p>Moocha es un lugar perfecto para los amantes del postre, con gelato, bubble tea y waffles frescos en su menú.</p>
        </div>
    </div>
    <div class="Ncontenedor">
        <div class="Restaurante">
            <a href="Restaurante13.html"></a><img src="Restaurante13.jpg"></a>
            <a href="Restaurante13.html"><h3>Ajisen Ramen</h3></a>
            <p>Ajisen Ramen es un restaurante que sirve deliciosos platos de ramen japoneses en un ambiente cómodo en Panamá.</p>
        </div>
        <div class="Restaurante">
            <a href="Restaurante14.html"><img src="Restaurante14.jpg"></a>
            <a href="Restaurante14.html"><h3>Tayami Japan Cuisine & more</h3></a>
            <p>Tayami ofrece una variedad de platos japoneses y otras opciones asiáticas, proporcionando una experiencia culinaria diversa.</p>
        </div>
        <div class="Restaurante">
            <img src="Restaurante15.jpg"></a>
            <h3>Cantina del Tigre</h3>
            <p>La Cantina del Tigre es un lugar para disfrutar de la comida y bebida panameña en un ambiente animado y festivo.</p>
        </div>
    </div>
    <div class="Ncontenedor">
        <div class="Restaurante">
            <img src="Restaurante16.jpg"></a>
            <h3>Yoi korean fried chicken</h3>
            <p>Yoi Korean Fried Chicken es famoso por su pollo frito estilo coreano, conocido por su crujiente textura y sabores únicos.</p>
        </div>
        <div class="Restaurante">
            <img src="Restaurante17.jpg"></a>
            <h3>Misawa Premium Bakery</h3>
            <p>Misawa ofrece productos de panadería premium y pasteles deliciosos en Panamá.</p>
        </div>
        <div class="Restaurante">
            <a href="Restaurante18.html"><img src="Restaurante18.jpg"></a>
            <a href="Restaurante18.html"><h3>Don Lee</h3></a>
            <p>Don Lee es un restaurante que ofrece opciones de comida china auténtica en un ambiente tradicional, perfecto para quienes buscan sabores orientales en Panamá.</p>
        </div>
    </div>
    <div class="Ncontenedor">
        <div class="Restaurante">
            <img src="Restaurante19.jpg">
            <a><h3>Leños & Carbón</h3></a>
            <p>Leños & Carbón es un restaurante que se especializa en platos de parrilla y carnes a la brasa, proporcionando una experiencia culinaria sabrosa.</p>
        </div>
        <div class="Restaurante">
            <img src="Restaurante20.png">
            <a><h3>Kotowa</h3></a>
            <p>Kotowa Premium Bakery es un destino para los amantes del café y los productos de panadería frescos en Panamá.</p>
        </div>
        <div class="Restaurante">
            <img src="Restaurante21.jpg">
            <a><h3>Korean Street Food</h3></a>
            <p>Este lugar se dedica a ofrecer auténtica comida callejera coreana, con una variedad de platos sabrosos y rápidos.</p>
        </div>
    </div>
</section>

<footer>
    <a href="logout.php">Cerrar sesión</a>
    <p>Copyright (C) 2023 ResPan.COM<br>Todos los derechos reservados<br></p>
</footer>
</body>
</html>
