CREATE DATABASE semestralweb;

-- Crear la tabla Usuario
CREATE TABLE Usuario (
    idUsuario INT AUTO_INCREMENT PRIMARY KEY,
    nombre VARCHAR(255) NOT NULL,
    email VARCHAR(255) NOT NULL,
    edad INT NOT NULL,
    contrasena VARCHAR(20) NOT NULL,
    genero VARCHAR(20) NOT NULL
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

-- Inserciones en la tabla Restaurante
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

-- Inserciones en la tabla Direccion
INSERT INTO Direccion (provincia, distrito, corregimiento, calle, idRestaurante)
VALUES 
('Panamá', 'Ciudad de Panamá', 'San Felipe', 'Av. A', 1),
('Panamá', 'Ciudad de Panamá', 'Obarrio', 'Calle 57', 2),
('Panamá', 'Ciudad de Panamá', 'Marbella', 'Calle 53 Este', 3),
('Panamá', 'Ciudad de Panamá', 'Costa del Este', 'Av. Vista del Pacífico', 4),
('Panamá', 'Ciudad de Panamá', 'Marbella', 'Financial Park L-5', 5),
('Panamá', 'Ciudad de Panamá', 'Multiplaza', 'Vía Israel', 6),
('Panamá', 'Ciudad de Panamá', 'Obarrio', 'Calle 58 Este', 7),
('Panamá', 'Ciudad de Panamá', 'Condado del Rey', 'Av. Miguel A. Brostella', 8),
('Panamá', 'Ciudad de Panamá', 'San Francisco', 'Calle 70', 9),
('Panamá', 'Ciudad de Panamá', 'Vía Israel', 'Vía Israel', 10),
('Panamá', 'Ciudad de Panamá', 'El Dorado', 'Av. Miguel A. Brostella', 11),
('Panamá', 'Ciudad de Panamá', 'Costa del Este', 'Calle Nueva 1664', 12),
('Panamá', 'Ciudad de Panamá', 'El Dorado', 'Av. 17B Norte', 13),
('Panamá', 'Ciudad de Panamá', 'San Francisco', 'Calle 77 Plaza Container', 14),
('Panamá', 'Ciudad de Panamá', 'San Francisco', 'Calle 68 Este', 15),
('Panamá', 'Ciudad de Panamá', 'El Dorado', 'Av. Ricardo J. Alfaro', 16),
('Panamá', 'Ciudad de Panamá', 'El Dorado', 'Av. Miguel A. Brostella', 17),
('Panamá', 'Ciudad de Panamá', 'Marbella', 'Calle 49 Este', 18),
('Panamá', 'Ciudad de Panamá', 'Multiplaza', 'Calle 60', 19),
('Panamá', 'Ciudad de Panamá', 'El Dorado', 'Av. Miguel A. Brostella', 20),
('Panamá', 'Ciudad de Panamá', 'Cincuentenario', 'Av. Cincuentenario', 21);

-- Inserciones en la tabla Facilidad
INSERT INTO Facilidad (facilidadNombre, idRestaurante) VALUES
('Estacionamiento', 1),
('Acceso para personas con discapacidad', 2),
('Sillas para bebés', 3),
('Entrega a domicilio', 4),
('Descuento de cliente frecuente', 5),
('Estacionamiento', 6),
('Acceso para personas con discapacidad', 7),
('Sillas para bebés', 8),
('Entrega a domicilio', 9),
('Descuento de cliente frecuente', 10),
('Estacionamiento', 11),
('Acceso para personas con discapacidad', 12),
('Sillas para bebés', 13),
('Entrega a domicilio', 14),
('Descuento de cliente frecuente', 15),
('Estacionamiento', 16),
('Acceso para personas con discapacidad', 17),
('Sillas para bebés', 18),
('Entrega a domicilio', 19),
('Descuento de cliente frecuente', 20),
('Estacionamiento', 21);

-- Inserciones en la tabla Horario
INSERT INTO Horario (dia, horaApertura, horaCierre, idRestaurante) VALUES
    ('Lunes', '09:00:00', '20:00:00', 1),
    ('Martes', '09:00:00', '20:00:00', 1),
    ('Miércoles', '09:00:00', '20:00:00', 1),
    ('Jueves', '09:00:00', '20:00:00', 1),
    ('Viernes', '09:00:00', '20:00:00', 1),
    ('Sábado', '10:00:00', '18:00:00', 1),
    ('Domingo', '10:00:00', '18:00:00', 1),
    ('Lunes', '09:00:00', '21:00:00', 2),
    ('Martes', '09:00:00', '21:00:00', 2),
    ('Miércoles', '09:00:00', '21:00:00', 2),
    ('Jueves', '09:00:00', '21:00:00', 2),
    ('Viernes', '09:00:00', '21:00:00', 2),
    ('Sábado', '10:00:00', '19:00:00', 2),
    ('Domingo', '10:00:00', '19:00:00', 2),
    ('Lunes', '09:30:00', '21:30:00', 3),
    ('Martes', '09:30:00', '21:30:00', 3),
    ('Miércoles', '09:30:00', '21:30:00', 3),
    ('Jueves', '09:30:00', '21:30:00', 3),
    ('Viernes', '09:30:00', '21:30:00', 3),
    ('Sábado', '10:30:00', '20:30:00', 3),
    ('Domingo', '10:30:00', '20:30:00', 3),
    ('Lunes', '10:00:00', '22:00:00', 4),
    ('Martes', '10:00:00', '22:00:00', 4),
    ('Miércoles', '10:00:00', '22:00:00', 4),
    ('Jueves', '10:00:00', '22:00:00', 4),
    ('Viernes', '10:00:00', '22:00:00', 4),
    ('Sábado', '11:00:00', '21:00:00', 4),
    ('Domingo', '11:00:00', '21:00:00', 4),
    ('Lunes', '10:00:00', '22:00:00', 5),
    ('Martes', '10:00:00', '22:00:00', 5),
    ('Miércoles', '10:00:00', '22:00:00', 5),
    ('Jueves', '10:00:00', '22:00:00', 5),
    ('Viernes', '10:00:00', '22:00:00', 5),
    ('Sábado', '11:00:00', '21:00:00', 5),
    ('Domingo', '11:00:00', '21:00:00', 5),
    ('Lunes', '10:00:00', '22:00:00', 6),
    ('Martes', '10:00:00', '22:00:00', 6),
    ('Miércoles', '10:00:00', '22:00:00', 6),
    ('Jueves', '10:00:00', '22:00:00', 6),
    ('Viernes', '10:00:00', '22:00:00', 6),
    ('Sábado', '11:00:00', '21:00:00', 6),
    ('Domingo', '11:00:00', '21:00:00', 6),
    ('Lunes', '10:00:00', '22:00:00', 7),
    ('Martes', '10:00:00', '22:00:00', 7),
    ('Miércoles', '10:00:00', '22:00:00', 7),
    ('Jueves', '10:00:00', '22:00:00', 7),
    ('Viernes', '10:00:00', '22:00:00', 7),
    ('Sábado', '11:00:00', '21:00:00', 7),
    ('Domingo', '11:00:00', '21:00:00', 7),
    ('Lunes', '10:00:00', '22:00:00', 8),
    ('Martes', '10:00:00', '22:00:00', 8),
    ('Miércoles', '10:00:00', '22:00:00', 8),
    ('Jueves', '10:00:00', '22:00:00', 8),
    ('Viernes', '10:00:00', '22:00:00', 8),
    ('Sábado', '11:00:00', '21:00:00', 8),
    ('Domingo', '11:00:00', '21:00:00', 8),
    ('Lunes', '10:00:00', '22:00:00', 9),
    ('Martes', '10:00:00', '22:00:00', 9),
    ('Miércoles', '10:00:00', '22:00:00', 9),
    ('Jueves', '10:00:00', '22:00:00', 9),
    ('Viernes', '10:00:00', '22:00:00', 9),
    ('Sábado', '11:00:00', '21:00:00', 9),
    ('Domingo', '11:00:00', '21:00:00', 9),
    ('Lunes', '10:00:00', '22:00:00', 10),
    ('Martes', '10:00:00', '22:00:00', 10),
    ('Miércoles', '10:00:00', '22:00:00', 10),
    ('Jueves', '10:00:00', '22:00:00', 10),
    ('Viernes', '10:00:00', '22:00:00', 10),
    ('Sábado', '11:00:00', '21:00:00', 10),
    ('Domingo', '11:00:00', '21:00:00', 10),
    ('Lunes', '10:00:00', '22:00:00', 11),
    ('Martes', '10:00:00', '22:00:00', 11),
    ('Miércoles', '10:00:00', '22:00:00', 11),
    ('Jueves', '10:00:00', '22:00:00', 11),
    ('Viernes', '10:00:00', '22:00:00', 11),
    ('Sábado', '11:00:00', '21:00:00', 11),
    ('Domingo', '11:00:00', '21:00:00', 11),
    ('Lunes', '10:00:00', '22:00:00', 12),
    ('Martes', '10:00:00', '22:00:00', 12),
    ('Miércoles', '10:00:00', '22:00:00', 12),
    ('Jueves', '10:00:00', '22:00:00', 12),
    ('Viernes', '10:00:00', '22:00:00', 12),
    ('Sábado', '11:00:00', '21:00:00', 12),
    ('Domingo', '11:00:00', '21:00:00', 12),
    ('Lunes', '10:00:00', '22:00:00', 13),
    ('Martes', '10:00:00', '22:00:00', 13),
    ('Miércoles', '10:00:00', '22:00:00', 13),
    ('Jueves', '10:00:00', '22:00:00', 13),
    ('Viernes', '10:00:00', '22:00:00', 13),
    ('Sábado', '11:00:00', '21:00:00', 13),
    ('Domingo', '11:00:00', '21:00:00', 13),
    ('Lunes', '10:00:00', '22:00:00', 14),
    ('Martes', '10:00:00', '22:00:00', 14),
    ('Miércoles', '10:00:00', '22:00:00', 14),
    ('Jueves', '10:00:00', '22:00:00', 14),
    ('Viernes', '10:00:00', '22:00:00', 14),
    ('Sábado', '11:00:00', '21:00:00', 14),
    ('Domingo', '11:00:00', '21:00:00', 14),
    ('Lunes', '10:00:00', '22:00:00', 15),
    ('Martes', '10:00:00', '22:00:00', 15),
    ('Miércoles', '10:00:00', '22:00:00', 15),
    ('Jueves', '10:00:00', '22:00:00', 15),
    ('Viernes', '10:00:00', '22:00:00', 15),
    ('Sábado', '11:00:00', '21:00:00', 15),
    ('Domingo', '11:00:00', '21:00:00', 15),
    ('Lunes', '10:00:00', '22:00:00', 16),
    ('Martes', '10:00:00', '22:00:00', 16),
    ('Miércoles', '10:00:00', '22:00:00', 16),
    ('Jueves', '10:00:00', '22:00:00', 16),
    ('Viernes', '10:00:00', '22:00:00', 16),
    ('Sábado', '11:00:00', '21:00:00', 16),
    ('Domingo', '11:00:00', '21:00:00', 16),
    ('Lunes', '10:00:00', '22:00:00', 17),
    ('Martes', '10:00:00', '22:00:00', 17),
    ('Miércoles', '10:00:00', '22:00:00', 17),
    ('Jueves', '10:00:00', '22:00:00', 17),
    ('Viernes', '10:00:00', '22:00:00', 17),
    ('Sábado', '11:00:00', '21:00:00', 17),
    ('Domingo', '11:00:00', '21:00:00', 17),
    ('Lunes', '10:00:00', '22:00:00', 18),
    ('Martes', '10:00:00', '22:00:00', 18),
    ('Miércoles', '10:00:00', '22:00:00', 18),
    ('Jueves', '10:00:00', '22:00:00', 18),
    ('Viernes', '10:00:00', '22:00:00', 18),
    ('Sábado', '11:00:00', '21:00:00', 18),
    ('Domingo', '11:00:00', '21:00:00', 18),
    ('Lunes', '11:30:00', '23:30:00', 19),
    ('Martes', '11:30:00', '23:30:00', 19),
    ('Miércoles', '11:30:00', '23:30:00', 19),
    ('Jueves', '11:30:00', '23:30:00', 19),
    ('Viernes', '11:30:00', '23:30:00', 19),
    ('Sábado', '12:30:00', '22:30:00', 19),
    ('Domingo', '12:30:00', '22:30:00', 19),
    ('Lunes', '10:30:00', '22:30:00', 20),
    ('Martes', '10:30:00', '22:30:00', 20),
    ('Miércoles', '10:30:00', '22:30:00', 20),
    ('Jueves', '10:30:00', '22:30:00', 20),
    ('Viernes', '10:30:00', '22:30:00', 20),
    ('Sábado', '11:30:00', '21:30:00', 20),
    ('Domingo', '11:30:00', '21:30:00', 20),
    ('Lunes', '10:00:00', '22:00:00', 21),
    ('Martes', '10:00:00', '22:00:00', 21),
    ('Miércoles', '10:00:00', '22:00:00', 21),
    ('Jueves', '10:00:00', '22:00:00', 21),
    ('Viernes', '10:00:00', '22:00:00', 21),
    ('Sábado', '11:00:00', '20:00:00', 21),
    ('Domingo', '11:00:00', '20:00:00', 21);

-- Inserciones en la tabla Menu
INSERT INTO Menu (platosDestacados, idRestaurante)
VALUES 
    ('Sundae 2 sabores', 1),
    ('Copa Gelarti', 1),
    ('Charlie Brownie', 1),
    ('Milkshake 16 oz', 1),
    ('Sandwich de Helado', 1),
    ('Pizza Combinación', 2),
    ('Pizza Hawaiana', 2),
    ('Pizza Atheniense', 2),
    ('Pizza Athens', 2),
    ('Baklava', 2), 
    ('Pollo al sésamo', 3),
    ('Bistec picado', 3),
    ('Pollo Kung Pao', 3),
    ('Pescado agridulce', 3),
    ('Camarones al coco', 3),
    ('Orangeville roll', 4),
    ('California Tempura roll', 4),
    ('Snow roll', 4),
    ('Ichiban roll', 4),
    ('Izumidai', 4),
    ('Carpaccio de Salmón', 5),
    ('Sashimi mixto', 5),
    ('Sashimi Fresh', 5),
    ('Unagi lover roll', 5),
    ('Royal Toro roll', 5),
    ('Caldo Tlalpeño', 6),
    ('Sopa Azteca', 6),
    ('Burritos de Pastor', 6),
    ('Burriro de Pollo', 6),
    ('Burrito de Res', 6),
    ('Tokio Crunch', 7),
    ('OAXACA', 7),
    ('Retro Cheese Burger', 7),
    ('Bacon Lovers', 7),
    ('Madrileña', 7),
    ('Tonkoksu ramen', 8),
    ('Hakata black garlic ramen', 8),
    ('Miso ramen', 8),
    ('Toro-tori ramen', 8),
    ('Tan-tan ramen', 8),
    ('La Popu', 9),
    ('La Tarantella', 9),
    ('Mr. Jack N7', 9),
    ('La Barbie Q', 9),
    ('Passion Burger', 9),
    ('Stacker Hotcakes', 10),
    ('Bacon & Eggs', 10),
    ('Eggs N Toast', 10),
    ('RDS Big Poppa', 10),
    ('Bistec encebollado', 10),
    ('Xia long bao', 11),
    ('Chofun de costillas', 11),
    ('Hakao', 11),
    ('Yishikao', 11),
    ('Fen Guo', 11),
    ('Japanese Milk Bread', 12),
    ('Brown Sugar Fresh Milk', 12),
    ('Taro Slush', 12),
    ('Peipacoa Milk Tea', 12),
    ('Matcha Cheese Milk', 12),
    ('Kara Gyoza', 13),
    ('Gyoza Wings', 13),
    ('Chasyu Ramen', 13),
    ('Ajisen Ramen', 13),
    ('California roll', 14),
    ('Poseidon roll', 14),
    ('Dinamita roll', 14),
    ('Osaka roll', 14),
    ('Altamar roll', 14),
    ('Ceviche de camarones', 15),
    ('Cóctel de camarones', 15),
    ('Ceviche de pulpo', 15),
    ('Ceviche de combinación', 15),
    ('Ceviche de huevo de codorniz', 15),
    ('Kimchi con Camarones', 16),
    ('Bulgogi con Arroz', 16),
    ('Bulgogi Sandwich', 16),
    ('Ramyeon', 16),
    ('Japchae', 16),
    ('Milk Butter Bun', 17),
    ('Custard Bun', 17),
    ('Passion Bun With Strawberry', 17),
    ('Lemon Matcha Bun', 17),
    ('Pan de Red Beans', 17),
    ('Arroz Frito Oriental', 18),
    ('Arroz Frito Vegetariano', 18),
    ('Bistec Picado', 18),
    ('Chow Fun', 18),
    ('Chow Mein', 18),
    ('Patacones con Hogao', 19),
    ('Morcillas Leños', 19),
    ('Chorizos Leños', 19),
    ('Sopa de Guineo Verde', 19),
    ('Sopa de Lentejas con Chorizo', 19),
    ('Iced White Mocha', 20),
    ('Iced Dark Mocha', 20),
    ('Cappuccino', 20),
    ('Licuado verde', 20),
    ('Licuado de fresas', 20),
    ('Korean Dog Salchicha', 21),
    ('Korean Dog Queso Mozarella', 21),
    ('Street Fries', 21),
    ('Chickenton', 21),
    ('Hello Dollies', 21);

-- Inserciones en la tabla Plato
INSERT INTO Plato (nombre, costo, idMenu)
VALUES 
    ('Sundae 2 sabores', 4.75, 1),
    ('Copa Gelarti', 4.50, 1),
    ('Charlie Brownie', 4.75, 1),
    ('Milkshake 16 oz', 5.50, 1),
    ('Sandwich de Helado', 4.50, 1),
    ('Pizza Combinación', 9.75, 2),
    ('Pizza Hawaiana', 9.75, 2),
    ('Pizza Atheniense', 9.75, 2),
    ('Pizza Athens', 10.00, 2),
    ('Baklava', 2.50, 2),
    ('Pollo al sésamo', 5.25, 3),
    ('Bistec picado', 5.75, 3),
    ('Pollo Kung Pao', 6.25, 3),
    ('Pescado agridulce', 6.25, 3),
    ('Camarones al coco', 6.25, 3),
    ('Orangeville roll', 12.50, 4),
    ('California Tempura roll', 10.75, 4),
    ('Snow roll', 11.00, 4),
    ('Ichiban roll', 13.25, 4),
    ('Izumidai', 14.90, 4),
    ('Carpaccio de Salmón', 15.50, 5),
    ('Sashimi mixto', 18.75, 5),
    ('Sashimi Fresh', 17.25, 5),
    ('Unagi lover roll', 22.00, 5),
    ('Royal Toro roll', 23.50, 5),
    ('Caldo Tlalpeño', 9.99, 6),
    ('Sopa Azteca', 8.75, 6),
    ('Burritos de Pastor', 12.25, 6),
    ('Burriro de Pollo', 10.50, 6),
    ('Burrito de Res', 11.75, 6),
    ('Tokio Crunch', 14.99, 7),
    ('OAXACA', 13.50, 7),
    ('Retro Cheese Burger', 16.75, 7),
    ('Bacon Lovers', 15.25, 7),
    ('Madrileña', 17.50, 7),
    ('Tonkoksu ramen', 11.99, 8),
    ('Hakata black garlic ramen', 12.75, 8),
    ('Miso ramen', 10.50, 8),
    ('Toro-tori ramen', 14.25, 8),
    ('Tan-tan ramen', 13.99, 8),
    ('La Popu', 9.75, 9),
    ('La Tarantella', 12.50, 9),
    ('Mr. Jack N7', 10.99, 9),
    ('La Barbie Q', 11.75, 9),
    ('Passion Burger', 13.50, 9),
    ('Stacker Hotcakes', 4.99, 10),
    ('Bacon & Eggs', 8.99, 10),
    ('Eggs N Toast', 6.25, 10),
    ('RD''S Big Poppa', 16.99, 10),
    ('Bistec encebollado', 15.99, 10),
    ('Xia long bao', 6.50, 11),
    ('Chofun de costillas', 3.75, 11),
    ('Hakao', 3.60, 11),
    ('Yishikao', 3.60, 11),
    ('Fen Guo', 2.95, 11),
    ('Japanese Milk Bread', 5.99, 12),
    ('Brown Sugar Fresh Milk', 4.75, 12),
    ('Taro Slush', 6.50, 12),
    ('Peipacoa Milk Tea', 5.25, 12),
    ('Matcha Cheese Milk', 6.75, 12),
    ('Chicken Karaage', 6.50, 13),
    ('Kara Gyoza', 8.00, 13),
    ('Gyoza Wings', 7.00, 13),
    ('Chasyu Ramen', 12.00, 13),
    ('Ajisen Ramen', 9.00, 13),
    ('California roll', 7.50, 14),
    ('Poseidon roll', 14.75, 14),
    ('Dinamita roll', 7.50, 14),
    ('Osaka roll', 10.99, 14),
    ('Altamar roll', 12.00, 14),
    ('Ceviche de camarones', 12.50, 15),
    ('Cóctel de camarones', 10.99, 15),
    ('Ceviche de pulpo', 14.25, 15),
    ('Ceviche de combinación', 13.75, 15),
    ('Ceviche de huevo de codorniz', 11.50, 15),
    ('Kimchi con Camarones', 10.50, 16),
    ('Bulgogi con Arroz', 9.25, 16),
    ('Bulgogi Sandwich', 8.95, 16),
    ('Ramyeon', 9.95, 16),
    ('Japchae', 9.25, 16),
    ('Milk Butter Bun', 1.50, 17),
    ('Custard Bun', 1.50, 17),
    ('Passion Bun With Strawberry', 1.75, 17),
    ('Lemon Matcha Bun', 1.75, 17),
    ('Pan de Red Beans', 1.50, 17),
    ('Arroz Frito Oriental', 8.75, 18),
    ('Arroz Frito Vegetariano', 7.50, 18),
    ('Bistec Picado', 9.25, 18),
    ('Chow Fun', 10.50, 18),
    ('Chow Mein', 8.99, 18),
    ('Patacones con Hogao', 12.90, 19),
    ('Morcillas Leños', 12.90, 19),
    ('Chorizos Leños', 19.90, 19),
    ('Sopa de Guineo Verde', 10.90, 19),
    ('Sopa de Lentejas con Chorizo', 12.90, 19),
    ('Iced White Mocha', 5.25, 20),
    ('Iced Dark Mocha', 4.99, 20),
    ('Cappuccino', 6.75, 20),
    ('Licuado verde', 4.50, 20),
    ('Licuado de fresas', 5.00, 20),
    ('Korean Dog Salchicha', 9.50, 21),
    ('Korean Dog Queso Mozarella', 10.75, 21),
    ('Street Fries', 6.99, 21),
    ('Chickenton', 8.25, 21),
    ('Hello Dollies', 5.75, 21);

-- Inserciones para la tabla Telefono
INSERT INTO Telefono (tipoTelefono, numeroTelefono, idRestaurante) VALUES 
    ('Fijo', '+507 2000-0001', 1),
    ('Celular', '+507 6000-0001', 1),
    ('Fijo', '+507 2000-0002', 2),
    ('Celular', '+507 6000-0002', 2),
    ('Fijo', '+507 2000-0003', 3),
    ('Celular', '+507 6000-0003', 3),
    ('Fijo', '+507 2000-0004', 4),
    ('Celular', '+507 6000-0004', 4),
    ('Fijo', '+507 2000-0005', 5),
    ('Celular', '+507 6000-0005', 5),
    ('Fijo', '+507 2000-0006', 6),
    ('Celular', '+507 6000-0006', 6),
    ('Fijo', '+507 2000-0007', 7),
    ('Celular', '+507 6000-0007', 7),
    ('Fijo', '+507 2000-0008', 8),
    ('Celular', '+507 6000-0008', 8),
    ('Fijo', '+507 2000-0009', 9),
    ('Celular', '+507 6000-0009', 9),
    ('Fijo', '+507 2000-0010', 10),
    ('Celular', '+507 6000-0010', 10),    
    ('Fijo', '+507 2000-0011', 11),
    ('Celular', '+507 6000-0011', 11), 
    ('Fijo', '+507 2000-0012', 12),
    ('Celular', '+507 6000-0012', 12),
    ('Fijo', '+507 2000-0013', 13),
    ('Celular', '+507 6000-0013', 13),
    ('Fijo', '+507 2000-0014', 14),
    ('Celular', '+507 6000-0014', 14),
    ('Fijo', '+507 2000-0015', 15),
    ('Celular', '+507 6000-0015', 15),
    ('Fijo', '+507 2000-0016', 16),
    ('Celular', '+507 6000-0016', 16),
    ('Fijo', '+507 2000-0017', 17),
    ('Celular', '+507 6000-0017', 17),
    ('Fijo', '+507 2000-0018', 18),
    ('Celular', '+507 6000-0018', 18),
    ('Fijo', '+507 2000-0019', 19),
    ('Celular', '+507 6000-0019', 19),
    ('Fijo', '+507 2000-0020', 20),
    ('Celular', '+507 6000-0020', 20),
    ('Fijo', '+507 2000-0021', 21),
    ('Celular', '+507 6000-0021', 21);

DECLARE @id_restaurante_verificar INT = 1;
DECLARE @fecha_verificar DATE = '2023-11-25';
DECLARE @hora_verificar TIME = '19:00';

-- Contar el número de mesas reservadas para el restaurante en la fecha y hora específicas
DECLARE @mesas_reservadas INT;
SELECT @mesas_reservadas = COUNT(*)
FROM Reserva
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
