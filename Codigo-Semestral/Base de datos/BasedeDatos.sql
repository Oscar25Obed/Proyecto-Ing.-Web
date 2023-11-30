-- Crear la tabla Usuario
CREATE TABLE Usuario (
    idUsuario INT AUTO_INCREMENT PRIMARY KEY,
    nombre VARCHAR(255) NOT NULL,
    cedula VARCHAR(15) NOT NULL,
    email VARCHAR(255) NOT NULL
);

-- Crear la tabla Restaurante
CREATE TABLE Restaurante (
    idRestaurante INT AUTO_INCREMENT PRIMARY KEY,
    nombre VARCHAR(255) NOT NULL,
    capacidad_mesas INT,
    tipoComida VARCHAR(50),
    tipoRestaurante VARCHAR(50),
    ubicacion VARCHAR(255),
    categoria VARCHAR(50),
    costo DECIMAL(10,2),
    email VARCHAR(255),
    sitioWeb VARCHAR(255)
);

-- Crear la tabla Reserva
CREATE TABLE Reserva (
    idReserva INT AUTO_INCREMENT PRIMARY KEY,
    idRestaurante INT,
    nombre VARCHAR(255) NOT NULL, 
    email VARCHAR(255) NOT NULL, 
    fecha DATE NOT NULL,
    hora TIME NOT NULL,
    cantidadPersonas INT NOT NULL,
    sillasNinos INT NOT NULL,
    comentario TEXT,
    idUsuario INT,
    FOREIGN KEY (idUsuario) REFERENCES Usuario(idUsuario),
    FOREIGN KEY (idRestaurante) REFERENCES Restaurante(idRestaurante)
);

-- Crear la tabla Direccion
CREATE TABLE Direccion (
    idDireccion INT AUTO_INCREMENT PRIMARY KEY,
    provincia VARCHAR(50),
    distrito VARCHAR(50),
    corregimiento VARCHAR(50),
    calle VARCHAR(255),
    idRestaurante INT,
    FOREIGN KEY (idRestaurante) REFERENCES Restaurante(idRestaurante)
);

-- Crear la tabla Horario
CREATE TABLE Horario (
    idHorario INT AUTO_INCREMENT PRIMARY KEY,
    dia VARCHAR(20),
    horaApertura TIME,
    horaCierre TIME,
    idRestaurante INT,
    FOREIGN KEY (idRestaurante) REFERENCES Restaurante(idRestaurante)
);

-- Crear la tabla Telefono
CREATE TABLE Telefono (
    idTelefono INT AUTO_INCREMENT PRIMARY KEY,
    tipoTelefono VARCHAR(20),
    numeroTelefono VARCHAR(20),
    idRestaurante INT,
    FOREIGN KEY (idRestaurante) REFERENCES Restaurante(idRestaurante)
);

-- Crear la tabla Facilidad
CREATE TABLE Facilidad (
    idFacilidad INT AUTO_INCREMENT PRIMARY KEY,
    facilidadNombre VARCHAR(255),
    idRestaurante INT,
    FOREIGN KEY (idRestaurante) REFERENCES Restaurante(idRestaurante)
);


-- Crear la tabla Menu
CREATE TABLE Menu (
    idMenu INT AUTO_INCREMENT PRIMARY KEY,
    platosDestacados TEXT,
    carta TEXT,
    idRestaurante INT,
    FOREIGN KEY (idRestaurante) REFERENCES Restaurante(idRestaurante)
);

-- Crear la tabla Plato
CREATE TABLE Plato (
    idPlato INT AUTO_INCREMENT PRIMARY KEY,
    nombre VARCHAR(255) NOT NULL,
    descripcion TEXT,
    costo DECIMAL(10,2),
    foto VARCHAR(255),
    idMenu INT,
    FOREIGN KEY (idMenu) REFERENCES Menu(idMenu)
);

INSERT INTO Restaurante (nombre, capacidad_mesas, tipoComida, tipoRestaurante, ubicacion, categoria, email, sitioWeb)
VALUES
('Gelarti Helado Gourmet', 30, 'Postres', 'Heladería', 'Casco Antiguo', 'Familiar', 'sugerencias@gelarti.comcorreo1@example.com', 'https://www.gelarti.com/'),
('Athens Pizza', 40, 'Comida rapida', 'Pizzería', 'Obarrio', 'Familiar', 'athenspizza@gmail.com', 'https://www.athenspizzapanama.com/'),
('Panda House', 25, 'Gourmet', 'Comida china', 'Marbella', 'Familiar', 'info@pandahousepty.com', 'https://pandahousepty.com/'),
('Ichiban', 25, 'Gourmet', 'Comida japonesa', 'Costa del Este', 'Familiar', 'ichibanjapanesefood@gmail.com', 'https://www.instagram.com/ichiban_panama/?hl=es'),
('Maguro Japanese BBQ & Sushi', 25, 'Gourmet', 'Comida japonesa', 'Marbella', 'Familiar', 'maguro@gmail.com', 'https://www.instagram.com/maguropty/?hl=es'),
('tacontento Panamá', 25, 'Gourmet', 'Comida mexicana', 'Multiplaza', 'Familiar', 'tacontentopanama@gmail.com', 'https://www.tacontentopanama.com/'),
('Slabón', 25, 'Comida rapida', 'Hamburguesas', 'Obarrio', 'Familiar', 'info@slabonpanama.com', 'https://slabonpanama.com/'),
('Ohtoro Ramén & Sushi', 25, 'Gourmet', 'Comida japonesa', 'Condado del Rey', 'Familiar', 'ohtotoramen@gmail.com', 'https://linktr.ee/oh_toro01'),
('Casco BURGER', 25, 'Comida rapida', 'Hamburguesas', 'San Francisco', 'Familiar','cascoburger@gmail.com', 'https://linktr.ee/CascoBurger'),
('Roadsters DINNER', 25, 'Comida rapida', 'Hamburguesas', 'Vía Israel', 'Familiar', 'roadsterdinnerpty@gmail.com', 'https://www.instagram.com/roadstersdinerpty/?hl=es'),
('Wah Kee Dimsum Palace', 25, 'Gourmet', 'Comida china', 'El Dorado', 'Familiar', 'wahkeepty@gmail.com', 'https://wahkeepty.com/'),
('Moocha Gelato', 25, 'Postres', 'Bubble  tea', 'Costa del Este', 'Familiar', 'mochagelato@gmail.com', 'https://www.instagram.com/moochapty/?hl=es'),
('Ajisen Ramen', 25, 'Gourmet', 'Comida japonesa', 'El Dorado', 'Familiar', 'info@ajisenramenpanama.com', 'https://ajisenramenpanama.com/'), 
('Tayami Japan Cuisine & more', 25, 'Gourmet', 'Comida japonesa', 'San Francisco', 'Familiar', 'tayamijapancousine@gmail.com', 'https://linktr.ee/tayamisushi'),
('Cantina del Tigre', 25, 'Gourmet', 'Comida antillana', 'San Francisco', 'Familiar', 'Admin@cantinadeltigre.com', 'https://www.cantinadeltigre.com/'),
('Yoi korean fried chicken', 25, 'Gourmet', 'Comida coreana', 'El Dorado', 'Familiar', 'yoikoreanfriedchicken@gmail.com', 'https://www.yoikoreanfriedchicken.com/'),
('Misawa Premium Bakery', 25, 'Postres', 'Panadería', 'El Dorado', 'Familiar', 'misawapremiumbakery@gmail.com', 'https://misawabakery.com/'),
('Don Lee', 25, 'Comida rapida', 'Comida china', 'Marbella', 'Familiar', 'donleeapp@gmail.com', 'https://www.donleepanama.com/'),
('Leños & Carbón', 25, 'Gourmet', 'Asados', 'Multiplaza', 'Familiar', 'lenosycarbon@gmail.com', 'https://linktr.ee/lenospanama'),
('Kotowa', 25, 'Postres', 'Cafetería', 'El Dorado', 'Familiar', 'kotowafarms@cwpanama.net', 'https://www.kotowa.com/'),
('Korean Street Food', 25, 'Comida rapida', 'Comida coreana', 'Familiar', 'Cincuentenario', 'koreanstreetfoodpty@gmail.com', 'https://lnk.bio/kostreetpanama');


DECLARE @id_restaurante_verificar INT = 1;
DECLARE @fecha_verificar DATE = '2023-11-25';
DECLARE @hora_verificar TIME = '19:00';

-- Contar el número de mesas reservadas para el restaurante en la fecha y hora específicas
DECLARE @mesas_reservadas INT;
SELECT @mesas_reservadas = COUNT(*)
FROM Reservas
WHERE id_restaurante = @id_restaurante_verificar
  AND fecha_reserva = @fecha_verificar
  AND hora_reserva = @hora_verificar;

-- Obtener la capacidad total de mesas del restaurante
DECLARE @capacidad_total_mesas INT;
SELECT @capacidad_total_mesas = capacidad_mesas
FROM Restaurantes
WHERE id_restaurante = @id_restaurante_verificar;

-- Verificar si hay mesas disponibles
IF @mesas_reservadas >= @capacidad_total_mesas
    PRINT 'El restaurante está lleno en el momento especificado';
ELSE
    PRINT 'Hay disponibilidad de mesas en el restaurante en el momento especificado';
