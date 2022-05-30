-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION';

-- -----------------------------------------------------
-- Schema pizzeria
-- -----------------------------------------------------

-- -----------------------------------------------------
-- Schema pizzeria
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `pizzeria` DEFAULT CHARACTER SET utf8 ;
USE `pizzeria` ;

-- -----------------------------------------------------
-- Table `pizzeria`.`clients`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `pizzeria`.`clients` (
  `idclients` INT NOT NULL AUTO_INCREMENT,
  `nom` VARCHAR(45) NULL,
  `cognom` VARCHAR(45) NULL,
  `adreça` VARCHAR(45) NULL,
  `codi_postal` INT NULL,
  `localitat` INT NULL,
  `provincia` INT NULL,
  `telefon` INT NULL,
  PRIMARY KEY (`idclients`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `pizzeria`.`provincies`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `pizzeria`.`provincies` (
  `idprovincies` INT NOT NULL AUTO_INCREMENT,
  `provincia` VARCHAR(45) NULL,
  PRIMARY KEY (`idprovincies`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `pizzeria`.`localitats`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `pizzeria`.`localitats` (
  `idlocalitats` INT NOT NULL AUTO_INCREMENT,
  `localitat` VARCHAR(45) NULL,
  `provincia` INT NULL,
  PRIMARY KEY (`idlocalitats`),
  INDEX `provincia_idx` (`provincia` ASC) VISIBLE,
  CONSTRAINT `idprovincia`
    FOREIGN KEY (`provincia`)
    REFERENCES `pizzeria`.`provincies` (`idprovincies`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `pizzeria`.`categories`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `pizzeria`.`categories` (
  `idcategories` INT NOT NULL AUTO_INCREMENT,
  `nom` VARCHAR(45) NULL,
  PRIMARY KEY (`idcategories`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `pizzeria`.`productes`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `pizzeria`.`productes` (
  `idproductes` INT NOT NULL AUTO_INCREMENT,
  `nom` VARCHAR(45) NULL,
  `categoria` INT NULL,
  `descripcio` VARCHAR(45) NULL,
  `imatge` BLOB NULL,
  `preu` DOUBLE NULL,
  PRIMARY KEY (`idproductes`),
  INDEX `categoria_idx` (`categoria` ASC) VISIBLE,
  CONSTRAINT `idcategoria`
    FOREIGN KEY (`categoria`)
    REFERENCES `pizzeria`.`categories` (`idcategories`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `pizzeria`.`detall_compres`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `pizzeria`.`detall_compres` (
  `iddetall_compres` INT NOT NULL AUTO_INCREMENT,
  `producte` INT NULL,
  `preu_compra` DOUBLE NULL,
  `quantitat` INT NULL,
  PRIMARY KEY (`iddetall_compres`),
  INDEX `producte_idx` (`producte` ASC) VISIBLE,
  CONSTRAINT `idproducte`
    FOREIGN KEY (`producte`)
    REFERENCES `pizzeria`.`productes` (`idproductes`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `pizzeria`.`botigues`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `pizzeria`.`botigues` (
  `idbotigues` INT NOT NULL AUTO_INCREMENT,
  `nom` VARCHAR(45) NULL,
  PRIMARY KEY (`idbotigues`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `pizzeria`.`empleats`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `pizzeria`.`empleats` (
  `idempleats` INT NOT NULL AUTO_INCREMENT,
  `nom` VARCHAR(45) NULL,
  `cognom` VARCHAR(45) NULL,
  `nif` VARCHAR(45) NULL,
  `telefon` VARCHAR(45) NULL,
  `tipus_empleat` ENUM('cuiner', 'repartidor') NULL,
  `botiga` INT NULL,
  PRIMARY KEY (`idempleats`),
  INDEX `botiga_idx` (`botiga` ASC) VISIBLE,
  CONSTRAINT `idbotiga`
    FOREIGN KEY (`botiga`)
    REFERENCES `pizzeria`.`botigues` (`idbotigues`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `pizzeria`.`comandes`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `pizzeria`.`comandes` (
  `idcomandes` INT NOT NULL AUTO_INCREMENT,
  `client` INT NULL,
  `dataihora` DATETIME NULL,
  `distribucio` INT NULL,
  `detall_compra` INT NULL,
  `preu` DOUBLE NULL,
  `botiga` INT NULL,
  `repertidor` INT NULL,
  `entregadataihora` DATETIME NULL,
  PRIMARY KEY (`idcomandes`),
  INDEX `detall_compra_idx` (`detall_compra` ASC) VISIBLE,
  INDEX `empleat_idx` (`repertidor` ASC) VISIBLE,
  INDEX `client_idx` (`client` ASC) VISIBLE,
  INDEX `idbotiga_idx` (`botiga` ASC) VISIBLE,
  CONSTRAINT `iddetall_compra`
    FOREIGN KEY (`detall_compra`)
    REFERENCES `pizzeria`.`detall_compres` (`iddetall_compres`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `idbotiga_empleat`
    FOREIGN KEY (`botiga`)
    REFERENCES `pizzeria`.`botigues` (`idbotigues`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `idempleat`
    FOREIGN KEY (`repertidor`)
    REFERENCES `pizzeria`.`empleats` (`idempleats`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `idclient`
    FOREIGN KEY (`client`)
    REFERENCES `pizzeria`.`clients` (`idclients`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
