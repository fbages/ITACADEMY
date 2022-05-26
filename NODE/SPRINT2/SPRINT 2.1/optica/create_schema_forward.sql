-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION';

-- -----------------------------------------------------
-- Schema optica
-- -----------------------------------------------------

-- -----------------------------------------------------
-- Schema optica
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `optica` DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci ;
USE `optica` ;

-- -----------------------------------------------------
-- Table `optica`.`adreça_proveidors`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `optica`.`adreça_proveidors` (
  `idadreça` INT NOT NULL AUTO_INCREMENT,
  `carrer` VARCHAR(45) NULL DEFAULT NULL,
  `número` INT NULL DEFAULT NULL,
  `pis` INT NULL DEFAULT NULL,
  `porta` VARCHAR(2) NULL DEFAULT NULL,
  `ciutat` VARCHAR(45) NULL DEFAULT NULL,
  `codi_postal` INT NULL DEFAULT NULL,
  `país` VARCHAR(45) NULL DEFAULT NULL,
  PRIMARY KEY (`idadreça`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;


-- -----------------------------------------------------
-- Table `optica`.`clients`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `optica`.`clients` (
  `idclients` INT NOT NULL AUTO_INCREMENT,
  `adreça_clients` VARCHAR(45) CHARACTER SET 'utf8mb4' COLLATE 'utf8mb4_0900_ai_ci' NOT NULL,
  `recomanat_per_client` INT NULL,
  `registre` DATE NOT NULL,
  `codi_postal` INT(11) NOT NULL,
  `email` VARCHAR(45) CHARACTER SET 'utf8mb4' COLLATE 'utf8mb4_0900_ai_ci' NOT NULL,
  `telefon` INT NOT NULL,
  PRIMARY KEY (`idclients`),
  INDEX `recomanat_idx` (`recomanat_per_client` ASC) VISIBLE,
  CONSTRAINT `recomanat`
    FOREIGN KEY (`recomanat_per_client`)
    REFERENCES `optica`.`clients` (`idclients`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;


-- -----------------------------------------------------
-- Table `optica`.`proveidors`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `optica`.`proveidors` (
  `idproveidors` INT(11) NOT NULL AUTO_INCREMENT,
  `nom` VARCHAR(45) NOT NULL,
  `adreça` INT(11) NOT NULL,
  PRIMARY KEY (`idproveidors`),
  INDEX `adreça_idx` (`adreça` ASC) VISIBLE,
  CONSTRAINT `adreça`
    FOREIGN KEY (`adreça`)
    REFERENCES `optica`.`adreça_proveidors` (`idadreça`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;


-- -----------------------------------------------------
-- Table `optica`.`marques`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `optica`.`marques` (
  `idmarques` INT NOT NULL AUTO_INCREMENT,
  `nom` VARCHAR(45) CHARACTER SET 'utf8mb4' COLLATE 'utf8mb4_0900_ai_ci' NOT NULL,
  PRIMARY KEY (`idmarques`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;


-- -----------------------------------------------------
-- Table `optica`.`compres`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `optica`.`compres` (
  `idcompres` INT NOT NULL AUTO_INCREMENT,
  `marca` INT NOT NULL,
  `quantitat` INT NOT NULL,
  `proveidor` INT NOT NULL,
  PRIMARY KEY (`idcompres`),
  INDEX `proveidor_idx` (`proveidor` ASC) VISIBLE,
  INDEX `marca_idx` (`marca` ASC) VISIBLE,
  CONSTRAINT `proveidor`
    FOREIGN KEY (`proveidor`)
    REFERENCES `optica`.`proveidors` (`idproveidors`),
  CONSTRAINT `marca_comprada`
    FOREIGN KEY (`marca`)
    REFERENCES `optica`.`marques` (`idmarques`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;


-- -----------------------------------------------------
-- Table `optica`.`empleats`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `optica`.`empleats` (
  `idempleats` INT NOT NULL AUTO_INCREMENT,
  `nom` VARCHAR(45) CHARACTER SET 'utf8mb4' COLLATE 'utf8mb4_0900_ai_ci' NOT NULL,
  PRIMARY KEY (`idempleats`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;


-- -----------------------------------------------------
-- Table `optica`.`muntura`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `optica`.`muntura` (
  `idmuntura` INT NOT NULL AUTO_INCREMENT,
  `tipus` VARCHAR(45) CHARACTER SET 'utf8mb4' COLLATE 'utf8mb4_0900_ai_ci' NOT NULL,
  PRIMARY KEY (`idmuntura`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;


-- -----------------------------------------------------
-- Table `optica`.`ulleres`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `optica`.`ulleres` (
  `idulleres` INT NOT NULL AUTO_INCREMENT,
  `marca` INT NOT NULL,
  `graduacio_dreta` DOUBLE NOT NULL,
  `graduacio_esquerra` DOUBLE NOT NULL,
  `muntura` INT NOT NULL,
  `color_muntura` VARCHAR(45) CHARACTER SET 'utf8mb4' COLLATE 'utf8mb4_0900_ai_ci' NOT NULL,
  `color_vidres` VARCHAR(45) CHARACTER SET 'utf8mb4' COLLATE 'utf8mb4_0900_ai_ci' NOT NULL,
  `preu` DOUBLE NOT NULL,
  PRIMARY KEY (`idulleres`),
  INDEX `muntura_idx` (`muntura` ASC) VISIBLE,
  INDEX `marca_idx` (`marca` ASC) VISIBLE,
  CONSTRAINT `marca`
    FOREIGN KEY (`marca`)
    REFERENCES `optica`.`marques` (`idmarques`),
  CONSTRAINT `muntura`
    FOREIGN KEY (`muntura`)
    REFERENCES `optica`.`muntura` (`idmuntura`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;


-- -----------------------------------------------------
-- Table `optica`.`ventes`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `optica`.`ventes` (
  `idventes` INT NOT NULL AUTO_INCREMENT,
  `ulleres` INT NOT NULL,
  `client` INT NOT NULL,
  `empleat` INT NOT NULL,
  `data` DATETIME NOT NULL,
  PRIMARY KEY (`idventes`),
  INDEX `ulleres_idx` (`ulleres` ASC) VISIBLE,
  INDEX `client_idx` (`client` ASC) VISIBLE,
  INDEX `empleat_idx` (`empleat` ASC) VISIBLE,
  CONSTRAINT `client_compra`
    FOREIGN KEY (`client`)
    REFERENCES `optica`.`clients` (`idclients`),
  CONSTRAINT `empleat`
    FOREIGN KEY (`empleat`)
    REFERENCES `optica`.`empleats` (`idempleats`),
  CONSTRAINT `ulleres_venudes`
    FOREIGN KEY (`ulleres`)
    REFERENCES `optica`.`ulleres` (`idulleres`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
