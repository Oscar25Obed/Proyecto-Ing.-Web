
-- -----------------------------------------------------
-- Table `mydb`.`Ruta`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`Ruta` (
  `RUTidRuta` BIGINT UNSIGNED NOT NULL AUTO_INCREMENT,
  `RUTNombreRuta` VARCHAR(255) NOT NULL,
  PRIMARY KEY (`RUTidRuta`));


-- -----------------------------------------------------
-- Table `mydb`.`Usuario`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`Usuario` (
  `USUidUsuario` BIGINT NOT NULL,
  `USUcedula` VARCHAR(255) NOT NULL,
  `nombre_Completo` VARCHAR(255) NOT NULL,
  `email` VARCHAR(255) NOT NULL,
  `contrasena` TEXT NOT NULL,
  PRIMARY KEY (`USUidUsuario`));


-- -----------------------------------------------------
-- Table `mydb`.`Habitacion`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`Habitacion` (
  `HABidHabitacion` BIGINT UNSIGNED NOT NULL AUTO_INCREMENT,
  `HABNHabitacion` BIGINT NOT NULL,
  `HABCapacidad` BIGINT NOT NULL,
  `HABtipo` BIGINT NOT NULL,
  PRIMARY KEY (`HABidHabitacion`));


-- -----------------------------------------------------
-- Table `mydb`.`Crucero`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`Crucero` (
  `id_Crucero` BIGINT UNSIGNED NOT NULL,
  `CRUHabitaciones` BIGINT NOT NULL,
  `CRUCapacidad` BIGINT NOT NULL,
  `CRUEstados` BIGINT NOT NULL,
  PRIMARY KEY (`id_Crucero`));


-- -----------------------------------------------------
-- Table `mydb`.`Boletos`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`Boletos` (
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
    REFERENCES `mydb`.`Ruta` (`RUTidRuta`),
  CONSTRAINT `boletos_id_habitacion_foreign`
    FOREIGN KEY (`id_habitacion`)
    REFERENCES `mydb`.`Habitacion` (`HABidHabitacion`),
  CONSTRAINT `boletos_id_usuario_foreign`
    FOREIGN KEY (`BOLidUsuario`)
    REFERENCES `mydb`.`Usuario` (`USUidUsuario`),
  CONSTRAINT `boletos_id_crucero_foreign`
    FOREIGN KEY (`id_Crucero`)
    REFERENCES `mydb`.`Crucero` (`id_Crucero`));


-- -----------------------------------------------------
-- Table `mydb`.`Roles`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`Roles` (
  `id_Rol` BIGINT NOT NULL,
  `Rol` VARCHAR(255) NOT NULL,
  PRIMARY KEY (`id_Rol`));


-- -----------------------------------------------------
-- Table `mydb`.`UsuarioRoles`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`UsuarioRoles` (
  `us_Rol` BIGINT UNSIGNED NOT NULL AUTO_INCREMENT,
  `id_Usuario` BIGINT NOT NULL,
  `id_Rol` BIGINT NOT NULL,
  PRIMARY KEY (`us_Rol`),
  INDEX `usuario_roles_id_rol_foreign` (`id_Rol` ASC) VISIBLE,
  INDEX `usuario_roles_id_usuario_foreign` (`id_Usuario` ASC) VISIBLE,
  CONSTRAINT `usuario_roles_id_rol_foreign`
    FOREIGN KEY (`id_Rol`)
    REFERENCES `mydb`.`Roles` (`id_Rol`),
  CONSTRAINT `usuario_roles_id_usuario_foreign`
    FOREIGN KEY (`id_Usuario`)
    REFERENCES `mydb`.`Usuario` (`USUidUsuario`));


-- -----------------------------------------------------
-- Table `mydb`.`Itinerario`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`Itinerario` (
  `ITIidIntinerario` BIGINT UNSIGNED NOT NULL AUTO_INCREMENT,
  `ITIidRuta` BIGINT NOT NULL,
  `ITINombreIntinerario` VARCHAR(255) NOT NULL,
  `ITIDiaIntinerario` INT NOT NULL,
  `ITIDescripcion` TEXT NOT NULL,
  PRIMARY KEY (`ITIidIntinerario`),
  INDEX `intinerario_id_ruta_foreign` (`ITIidRuta` ASC) VISIBLE,
  CONSTRAINT `intinerario_id_ruta_foreign`
    FOREIGN KEY (`ITIidRuta`)
    REFERENCES `mydb`.`Ruta` (`RUTidRuta`));


-- -----------------------------------------------------
-- Table `mydb`.`CruceroActual`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`CruceroActual` (
  `CUAidCruceroActual` BIGINT NOT NULL,
  `CUAid_Ruta` BIGINT NOT NULL,
  `CUAidCrucero` BIGINT NOT NULL,
  PRIMARY KEY (`CUAidCruceroActual`),
  INDEX `crucero_actual_id_crucero_foreign` (`CUAidCrucero` ASC) VISIBLE,
  INDEX `crucero_actual_id_ruta_foreign` (`CUAid_Ruta` ASC) VISIBLE,
  CONSTRAINT `crucero_actual_id_crucero_foreign`
    FOREIGN KEY (`CUAidCrucero`)
    REFERENCES `mydb`.`Crucero` (`id_Crucero`),
  CONSTRAINT `crucero_actual_id_ruta_foreign`
    FOREIGN KEY (`CUAid_Ruta`)
    REFERENCES `mydb`.`Ruta` (`RUTidRuta`));


-- -----------------------------------------------------
-- Table `mydb`.`Permisos`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`Permisos` (
  `id_Permisos` BIGINT UNSIGNED NOT NULL AUTO_INCREMENT,
  `permiso` VARCHAR(255) NOT NULL,
  PRIMARY KEY (`id_Permisos`));


-- -----------------------------------------------------
-- Table `mydb`.`RolesPermisos`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`RolesPermisos` (
  `id_roles_permisos` BIGINT NOT NULL,
  `id_Rol` BIGINT NOT NULL,
  `id_Permisos` BIGINT NOT NULL,
  PRIMARY KEY (`id_roles_permisos`),
  INDEX `roles_permisos_id _rol_foreign` (`id_Rol` ASC) VISIBLE,
  INDEX `roles_permisos_id_permisos_foreign` (`id_Permisos` ASC) VISIBLE,
  CONSTRAINT `roles_permisos_id _rol_foreign`
    FOREIGN KEY (`id_Rol`)
    REFERENCES `mydb`.`Roles` (`id_Rol`),
  CONSTRAINT `roles_permisos_id_permisos_foreign`
    FOREIGN KEY (`id_Permisos`)
    REFERENCES `mydb`.`Permisos` (`id_Permisos`));


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;

