-- MySQL Script generated by MySQL Workbench
-- Wed 21 Sep 2022 05:44:09 PM -05
-- Model: New Model    Version: 1.0
-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION';

-- -----------------------------------------------------
-- Schema PapeleriaSoHo
-- -----------------------------------------------------
DROP SCHEMA IF EXISTS `PapeleriaSoHo` ;

-- -----------------------------------------------------
-- Schema PapeleriaSoHo
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `PapeleriaSoHo` ;
USE `PapeleriaSoHo` ;

-- -----------------------------------------------------
-- Table `PapeleriaSoHo`.`Usuarios`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `PapeleriaSoHo`.`Usuarios` ;

CREATE TABLE IF NOT EXISTS `PapeleriaSoHo`.`Usuarios` (
  `idUsuario` INT NOT NULL,
  `Login` VARCHAR(45) NULL,
  `Password` VARCHAR(45) NULL,
  `Nombres` VARCHAR(45) NULL,
  `Apellidos` VARCHAR(45) NULL,
  PRIMARY KEY (`idUsuario`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `PapeleriaSoHo`.`Publicaciones`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `PapeleriaSoHo`.`Publicaciones` ;

CREATE TABLE IF NOT EXISTS `PapeleriaSoHo`.`Publicaciones` (
  `Id` INT NOT NULL AUTO_INCREMENT,
  `Usuarios_Id` INT NOT NULL,
  `Titulo` VARCHAR(80) NOT NULL,
  `Publicacion` VARCHAR(255) NOT NULL,
  `CreatedAt` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`Id`),
  INDEX `fk_Publicaciones_Usuarios_idx` (`Usuarios_Id` ASC) VISIBLE,
  CONSTRAINT `fk_Publicaciones_Usuarios`
    FOREIGN KEY (`Usuarios_Id`)
    REFERENCES `PapeleriaSoHo`.`Usuarios` (`Id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `PapeleriaSoHo`.`Publicaciones_has_Usuarios`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `PapeleriaSoHo`.`Publicaciones_has_Usuarios` ;

CREATE TABLE IF NOT EXISTS `PapeleriaSoHo`.`Publicaciones_has_Usuarios` (
  `Usuarios_Id` INT NOT NULL,
  `Publicaciones_Id` INT NOT NULL,
  `MeGusta` TINYINT NULL,
  PRIMARY KEY (`Usuarios_Id`, `Publicaciones_Id`),
  INDEX `fk_Publicaciones_has_Usuarios_Usuarios1_idx` (`Usuarios_Id` ASC) VISIBLE,
  INDEX `fk_Publicaciones_has_Usuarios_Publicaciones1_idx` (`Publicaciones_Id` ASC) VISIBLE,
  CONSTRAINT `fk_Publicaciones_has_Usuarios_Publicaciones1`
    FOREIGN KEY (`Publicaciones_Id`)
    REFERENCES `PapeleriaSoHo`.`Publicaciones` (`Id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Publicaciones_has_Usuarios_Usuarios1`
    FOREIGN KEY (`Usuarios_Id`)
    REFERENCES `PapeleriaSoHo`.`Usuarios` (`Id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `PapeleriaSoHo`.`Usuarios`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `PapeleriaSoHo`.`Usuarios` ;

CREATE TABLE IF NOT EXISTS `PapeleriaSoHo`.`Usuarios` (
  `idUsuario` INT NOT NULL,
  `Login` VARCHAR(45) NULL,
  `Password` VARCHAR(45) NULL,
  `Nombres` VARCHAR(45) NULL,
  `Apellidos` VARCHAR(45) NULL,
  PRIMARY KEY (`idUsuario`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `PapeleriaSoHo`.`Roles`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `PapeleriaSoHo`.`Roles` ;

CREATE TABLE IF NOT EXISTS `PapeleriaSoHo`.`Roles` (
  `idRole` INT NOT NULL,
  `Rol` VARCHAR(45) NULL,
  PRIMARY KEY (`idRole`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `PapeleriaSoHo`.`Usuarios_has_Roles`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `PapeleriaSoHo`.`Usuarios_has_Roles` ;

CREATE TABLE IF NOT EXISTS `PapeleriaSoHo`.`Usuarios_has_Roles` (
  `Usuarios_idUsuario` INT NOT NULL,
  `Roles_idRole` INT NOT NULL,
  PRIMARY KEY (`Usuarios_idUsuario`, `Roles_idRole`),
  INDEX `fk_Usuarios_has_Roles_Roles1_idx` (`Roles_idRole` ASC) VISIBLE,
  INDEX `fk_Usuarios_has_Roles_Usuarios1_idx` (`Usuarios_idUsuario` ASC) VISIBLE,
  CONSTRAINT `fk_Usuarios_has_Roles_Usuarios1`
    FOREIGN KEY (`Usuarios_idUsuario`)
    REFERENCES `PapeleriaSoHo`.`Usuarios` (`idUsuario`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Usuarios_has_Roles_Roles1`
    FOREIGN KEY (`Roles_idRole`)
    REFERENCES `PapeleriaSoHo`.`Roles` (`idRole`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `PapeleriaSoHo`.`TiposTercero`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `PapeleriaSoHo`.`TiposTercero` ;

CREATE TABLE IF NOT EXISTS `PapeleriaSoHo`.`TiposTercero` (
  `idTipoTercero` INT NOT NULL,
  `Descripcion` VARCHAR(45) NULL,
  PRIMARY KEY (`idTipoTercero`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `PapeleriaSoHo`.`Terceros`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `PapeleriaSoHo`.`Terceros` ;

CREATE TABLE IF NOT EXISTS `PapeleriaSoHo`.`Terceros` (
  `idTercero` INT NOT NULL,
  `TipoTercero` INT NOT NULL,
  `Documento` VARCHAR(45) NULL,
  `RazonSocial` VARCHAR(45) NULL,
  `Direccion` VARCHAR(45) NULL,
  `Email` VARCHAR(45) NULL,
  PRIMARY KEY (`idTercero`),
  INDEX `fk_Terceros_TiposTercero1_idx` (`TipoTercero` ASC) VISIBLE,
  CONSTRAINT `fk_Terceros_TiposTercero1`
    FOREIGN KEY (`TipoTercero`)
    REFERENCES `PapeleriaSoHo`.`TiposTercero` (`idTipoTercero`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `PapeleriaSoHo`.`Productos`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `PapeleriaSoHo`.`Productos` ;

CREATE TABLE IF NOT EXISTS `PapeleriaSoHo`.`Productos` (
  `idProducto` INT NOT NULL,
  `Codigo` VARCHAR(45) NULL,
  `Nombre` VARCHAR(45) NULL,
  `Descripcion` VARCHAR(45) NULL,
  `PrecioVenta` DECIMAL NULL,
  `idProveedor` INT NULL,
  PRIMARY KEY (`idProducto`),
  INDEX `fk_Productos_Proveedores1_idx` (`idProveedor` ASC) VISIBLE,
  CONSTRAINT `fk_Productos_Proveedores1`
    FOREIGN KEY (`idProveedor`)
    REFERENCES `PapeleriaSoHo`.`Terceros` (`idTercero`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `PapeleriaSoHo`.`TiposMovimientos`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `PapeleriaSoHo`.`TiposMovimientos` ;

CREATE TABLE IF NOT EXISTS `PapeleriaSoHo`.`TiposMovimientos` (
  `idTipoMovimiento` INT NOT NULL,
  `Descripcion` VARCHAR(45) NULL,
  PRIMARY KEY (`idTipoMovimiento`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `PapeleriaSoHo`.`Movimientos`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `PapeleriaSoHo`.`Movimientos` ;

CREATE TABLE IF NOT EXISTS `PapeleriaSoHo`.`Movimientos` (
  `idMovimiento` INT NOT NULL,
  `TipoMovimiento` INT NOT NULL,
  `NumDocumento` INT NULL,
  `idTercero` INT NOT NULL,
  `RazonSocial` VARCHAR(45) NULL,
  PRIMARY KEY (`idMovimiento`, `idTercero`),
  INDEX `fk_Movimientos_TiposMovimientos1_idx` (`TipoMovimiento` ASC) VISIBLE,
  INDEX `fk_Movimientos_Terceros1_idx` (`idTercero` ASC) VISIBLE,
  CONSTRAINT `fk_Movimientos_TiposMovimientos1`
    FOREIGN KEY (`TipoMovimiento`)
    REFERENCES `PapeleriaSoHo`.`TiposMovimientos` (`idTipoMovimiento`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Movimientos_Terceros1`
    FOREIGN KEY (`idTercero`)
    REFERENCES `PapeleriaSoHo`.`Terceros` (`idTercero`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `PapeleriaSoHo`.`Items`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `PapeleriaSoHo`.`Items` ;

CREATE TABLE IF NOT EXISTS `PapeleriaSoHo`.`Items` (
  `idItem` INT NOT NULL,
  `idProducto` INT NOT NULL,
  `CantidadVendida` INT NULL,
  `CantidadComprada` INT NULL,
  `Descripcion` VARCHAR(45) NULL,
  `CantidadComprada` VARCHAR(45) NULL,
  `idMovimiento` INT NOT NULL,
  PRIMARY KEY (`idItem`),
  INDEX `fk_Items_Productos1_idx` (`idProducto` ASC) VISIBLE,
  INDEX `fk_Items_Movimientos1_idx` (`idMovimiento` ASC) VISIBLE,
  CONSTRAINT `fk_Items_Productos1`
    FOREIGN KEY (`idProducto`)
    REFERENCES `PapeleriaSoHo`.`Productos` (`idProducto`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Items_Movimientos1`
    FOREIGN KEY (`idMovimiento`)
    REFERENCES `PapeleriaSoHo`.`Movimientos` (`idMovimiento`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
