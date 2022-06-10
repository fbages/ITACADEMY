
DROP SCHEMA IF EXISTS `pizzeria_francesc`;
CREATE SCHEMA `pizzeria_francesc` DEFAULT CHARACTER SET utf8 ;

USE `pizzeria_francesc` ;

-- -----------------------------------------------------
-- Table `pizzeria`.`provincies`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `provincies` (
  `idprovincies` INT NOT NULL AUTO_INCREMENT,
  `provincia` VARCHAR(45) NULL,
  PRIMARY KEY (`idprovincies`));


-- -----------------------------------------------------
-- Table `pizzeria`.`localitats`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `localitats` (
  `idlocalitats` INT NOT NULL AUTO_INCREMENT,
  `localitat` VARCHAR(45) NULL,
  `provincia` INT NULL,
  PRIMARY KEY (`idlocalitats`),
  INDEX `provincia_idx` (`provincia` ASC) VISIBLE,
  CONSTRAINT `idprovincia`
    FOREIGN KEY (`provincia`)
    REFERENCES `provincies` (`idprovincies`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION);

-- -----------------------------------------------------
-- Table `pizzeria`.`clients`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `clients` (
  `idclients` INT NOT NULL AUTO_INCREMENT,
  `nom` VARCHAR(45) NULL,
  `cognom` VARCHAR(45) NULL,
  `adreça` VARCHAR(45) NULL,
  `codi_postal` INT NULL,
  `localitat` INT NULL,
  `telefon` INT NULL,
  PRIMARY KEY (`idclients`),
  INDEX `localitat_idx` (`localitat` ASC) VISIBLE,
  CONSTRAINT `localitat`
    FOREIGN KEY (`localitat`)
    REFERENCES `localitats` (`idlocalitats`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION);
   
-- -----------------------------------------------------
-- Table `pizzeria`.`categories`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `categories` (
  `idcategories` INT NOT NULL AUTO_INCREMENT,
  `nom` VARCHAR(45) NULL,
  PRIMARY KEY (`idcategories`));


-- -----------------------------------------------------
-- Table `pizzeria`.`productes`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `productes` (
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
    REFERENCES `categories` (`idcategories`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION);


-- -----------------------------------------------------
-- Table `pizzeria`.`botigues`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `botigues` (
  `idbotigues` INT NOT NULL AUTO_INCREMENT,
  `nom` VARCHAR(45) NULL,
  `adreça` VARCHAR(45) NULL,
  `codi_postal` INT NULL,
  `localitat` INT NULL,
  `provincia` INT NULL,
  PRIMARY KEY (`idbotigues`));


-- -----------------------------------------------------
-- Table `pizzeria`.`empleats`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `empleats` (
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
    REFERENCES `botigues` (`idbotigues`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION);


-- -----------------------------------------------------
-- Table `pizzeria`.`comandes`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `comandes` (
  `idcomandes` INT NOT NULL AUTO_INCREMENT,
  `idclient` INT NULL,
  `dataihora` DATETIME NULL,
  `distribucio` ENUM('Recollida','Enviar'),
  `preu` DOUBLE NULL,
  `botiga` INT NULL,
  `cuiner` INT NULL,
  `repertidor` INT NULL,
  `entregadataihora` DATETIME NULL,
  PRIMARY KEY (`idcomandes`),
  INDEX `empleat_idx` (`repertidor` ASC) VISIBLE,
  INDEX `idclient_idx` (`idclient` ASC) VISIBLE,
  INDEX `idbotiga_idx` (`botiga` ASC) VISIBLE,
  CONSTRAINT `idbotiga_empleat`
    FOREIGN KEY (`botiga`)
    REFERENCES `botigues` (`idbotigues`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `idempleat`
    FOREIGN KEY (`repertidor`)
    REFERENCES `empleats` (`idempleats`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `idempleat2`
    FOREIGN KEY (`cuiner`)
    REFERENCES `empleats` (`idempleats`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `idclient`
    FOREIGN KEY (`idclient`)
    REFERENCES `clients` (`idclients`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION);



-- -----------------------------------------------------
-- Table `pizzeria`.`detall_compres`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `detall_compres` (
  `iddetall_compres` INT NOT NULL AUTO_INCREMENT,
  `producte` INT NULL,
  `preu_compra` DOUBLE NULL,
  `quantitat` INT NULL,
  `idcomanda` INT NULL,
  PRIMARY KEY (`iddetall_compres`),
  INDEX `producte_idx` (`producte` ASC) VISIBLE,
  CONSTRAINT `idproducte`
    FOREIGN KEY (`producte`)
    REFERENCES `productes` (`idproductes`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION);



