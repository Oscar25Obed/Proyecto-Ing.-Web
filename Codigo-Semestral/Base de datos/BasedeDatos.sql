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
    fecha DATE NOT NULL,
    hora TIME NOT NULL,
    cantidadPersonas INT NOT NULL,
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
