SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION';

-- -----------------------------------------------------
-- Table `MODULO02`.`Ruta`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `MODULO02`.`Ruta` (
  `RUTidRuta` BIGINT UNSIGNED NOT NULL AUTO_INCREMENT,
  `RUTNombreRuta` VARCHAR(255) NOT NULL,
  PRIMARY KEY (`RUTidRuta`));

-- -----------------------------------------------------
-- Table `MODULO02`.`Usuario`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `MODULO02`.`Usuario` (
  `USUidUsuario` BIGINT NOT NULL,
  `USUcedula` VARCHAR(255) NOT NULL,
  `USUnombreCompleto` VARCHAR(255) NOT NULL,
  `USUemail` VARCHAR(255) NOT NULL,
  `USUcontrasena` TEXT NOT NULL,
  PRIMARY KEY (`USUidUsuario`));

-- -----------------------------------------------------
-- Table `MODULO02`.`Habitacion`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `MODULO02`.`Habitacion` (
  `HABidHabitacion` BIGINT UNSIGNED NOT NULL AUTO_INCREMENT,
  `HABNHabitacion` BIGINT NOT NULL,
  `HABCapacidad` BIGINT NOT NULL,
  `HABtipo` BIGINT NOT NULL,
  PRIMARY KEY (`HABidHabitacion`));

-- -----------------------------------------------------
-- Table `MODULO02`.`Crucero`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `MODULO02`.`Crucero` (
  `id_Crucero` BIGINT UNSIGNED NOT NULL,
  `CRUHabitaciones` BIGINT NOT NULL,
  `CRUCapacidad` BIGINT NOT NULL,
  `CRUEstados` BIGINT NOT NULL,
  PRIMARY KEY (`id_Crucero`));

-- -----------------------------------------------------
-- Table `MODULO02`.`Boletos`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `MODULO02`.`Boletos` (
  `BOLidBoletos` BIGINT UNSIGNED NOT NULL AUTO_INCREMENT,
  `BOLidUsuario` BIGINT NOT NULL,
  `BOLidRuta` BIGINT NOT NULL,
  `BOLPrecio` DECIMAL(8,2) NOT NULL,
  `id_habitacion` BIGINT NOT NULL,
  `id_Crucero` BIGINT NOT NULL,
  PRIMARY KEY (`BOLidBoletos`),
  INDEX `boletos_id_ruta_foreign` (`BOLidRuta` ASC) VISIBLE,
  INDEX `boletos_id_habitacion_foreign` (`id_habitacion` ASC) VISIBLE,
  INDEX `boletos_id_usuario_foreign` (`BOLidUsuario` ASC) VISIBLE,
  INDEX `boletos_id_crucero_foreign` (`id_Crucero` ASC) VISIBLE,
  CONSTRAINT `boletos_id_ruta_foreign`
    FOREIGN KEY (`BOLidRuta`)
    REFERENCES `MODULO02`.`Ruta` (`RUTidRuta`),
  CONSTRAINT `boletos_id_habitacion_foreign`
    FOREIGN KEY (`id_habitacion`)
    REFERENCES `MODULO02`.`Habitacion` (`HABidHabitacion`),
  CONSTRAINT `boletos_id_usuario_foreign`
    FOREIGN KEY (`BOLidUsuario`)
    REFERENCES `MODULO02`.`Usuario` (`USUidUsuario`),
  CONSTRAINT `boletos_id_crucero_foreign`
    FOREIGN KEY (`id_Crucero`)
    REFERENCES `MODULO02`.`Crucero` (`id_Crucero`));

-- -----------------------------------------------------
-- Table `MODULO02`.`Roles`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `MODULO02`.`Roles` (
  `ROLidRol` BIGINT NOT NULL,
  `ROLRol` VARCHAR(255) NOT NULL,
  PRIMARY KEY (`ROLidRol`));

-- -----------------------------------------------------
-- Table `MODULO02`.`UsuarioRoles`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `MODULO02`.`UsuarioRoles` (
  `UROusRol` BIGINT UNSIGNED NOT NULL AUTO_INCREMENT,
  `UROidUsuario` BIGINT NOT NULL,
  `UROidRol` BIGINT NOT NULL,
  PRIMARY KEY (`UROusRol`),
  INDEX `usuario_roles_id_rol_foreign` (`UROidRol` ASC) VISIBLE,
  INDEX `usuario_roles_id_usuario_foreign` (`UROidUsuario` ASC) VISIBLE,
  CONSTRAINT `usuario_roles_id_rol_foreign`
    FOREIGN KEY (`UROidRol`)
    REFERENCES `MODULO02`.`Roles` (`ROLidRol`),
  CONSTRAINT `usuario_roles_id_usuario_foreign`
    FOREIGN KEY (`UROidUsuario`)
    REFERENCES `MODULO02`.`Usuario` (`USUidUsuario`));

-- -----------------------------------------------------
-- Table `MODULO02`.`Itinerario`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `MODULO02`.`Itinerario` (
  `ITIidIntinerario` BIGINT UNSIGNED NOT NULL AUTO_INCREMENT,
  `ITIidRuta` BIGINT NOT NULL,
  `ITINombreIntinerario` VARCHAR(255) NOT NULL,
  `ITIDiaIntinerario` INT NOT NULL,
  `ITIDescripcion` TEXT NOT NULL,
  PRIMARY KEY (`ITIidIntinerario`),
  INDEX `intinerario_id_ruta_foreign` (`ITIidRuta` ASC) VISIBLE,
  CONSTRAINT `intinerario_id_ruta_foreign`
    FOREIGN KEY (`ITIidRuta`)
    REFERENCES `MODULO02`.`Ruta` (`RUTidRuta`));

-- -----------------------------------------------------
-- Table `MODULO02`.`CruceroActual`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `MODULO02`.`CruceroActual` (
  `CUAidCruceroActual` BIGINT NOT NULL,
  `CUAid_Ruta` BIGINT NOT NULL,
  `CUAidCrucero` BIGINT NOT NULL,
  PRIMARY KEY (`CUAidCruceroActual`),
  INDEX `crucero_actual_id_crucero_foreign` (`CUAidCrucero` ASC) VISIBLE,
  INDEX `crucero_actual_id_ruta_foreign` (`CUAid_Ruta` ASC) VISIBLE,
  CONSTRAINT `crucero_actual_id_crucero_foreign`
    FOREIGN KEY (`CUAidCrucero`)
    REFERENCES `MODULO02`.`Crucero` (`id_Crucero`),
  CONSTRAINT `crucero_actual_id_ruta_foreign`
    FOREIGN KEY (`CUAid_Ruta`)
    REFERENCES `MODULO02`.`Ruta` (`RUTidRuta`));

-- -----------------------------------------------------
-- Table `MODULO02`.`Permisos`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `MODULO02`.`Permisos` (
  `PERid_Permisos` BIGINT UNSIGNED NOT NULL AUTO_INCREMENT,
  `PErpermiso` VARCHAR(255) NOT NULL,
  PRIMARY KEY (`PERid_Permisos`));

-- -----------------------------------------------------
-- Table `MODULO02`.`RolesPermisos`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `MODULO02`.`RolesPermisos` (
  `RPEidRolesRermisos` BIGINT NOT NULL,
  `RPEid_Rol` BIGINT NOT NULL,
  `RPEidPermisos` BIGINT NOT NULL,
  PRIMARY KEY (`RPEidRolesRermisos`),
  INDEX `roles_permisos_id _rol_foreign` (`RPEid_Rol` ASC) VISIBLE,
  INDEX `roles_permisos_id_permisos_foreign` (`RPEidPermisos` ASC) VISIBLE,
  CONSTRAINT `roles_permisos_id _rol_foreign`
    FOREIGN KEY (`RPEid_Rol`)
    REFERENCES `MODULO02`.`Roles` (`ROLidRol`),
  CONSTRAINT `roles_permisos_id_permisos_foreign`
    FOREIGN KEY (`RPEidPermisos`)
    REFERENCES `MODULO02`.`Permisos` (`PERid_Permisos`));

SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
















SQL Error [1005] [HY000]: (conn=4307) Can't create table `MODULO02`.`Boletos` (errno: 150 "Foreign key constraint is incorrectly formed")


DELIMITER //

CREATE PROCEDURE InsertarUsuarioYBoleto (
    IN p_cedula VARCHAR(255),
    IN p_nombreCompleto VARCHAR(255),
    IN p_email VARCHAR(255),
    IN p_contrasena TEXT,
    IN p_idRuta BIGINT,
    IN p_precio DECIMAL(8,2),
    IN p_idHabitacion BIGINT UNSIGNED,
    IN p_idCrucero BIGINT UNSIGNED
)
BEGIN
    DECLARE v_usuarioId BIGINT;
    
    -- Insertar un nuevo usuario
    INSERT INTO MODULO02.Usuario (USUcedula, USUnombreCompleto, USUemail, USUcontrasena)
    VALUES (p_cedula, p_nombreCompleto, p_email, p_contrasena);
    
    -- Obtener el ID del usuario recién creado
    SET v_usuarioId = LAST_INSERT_ID();
    
    -- Insertar un nuevo boleto para el usuario
    INSERT INTO MODULO02.Boletos (BOLidUsuario, BOLidRuta, BOLPrecio, id_habitacion, id_Crucero)
    VALUES (v_usuarioId, p_idRuta, p_precio, p_idHabitacion, p_idCrucero);
    
    -- Mensaje de éxito
    SELECT 'Usuario y Boleto insertados correctamente.' AS mensaje;
END //

DELIMITER ;
CALL InsertarUsuarioYBoleto(
    '1234567890', 
    'Juan Pérez', 
    'juan.perez@example.com', 
    'password123', 
    1, 
    100.00, 
    1, 
    1
);
