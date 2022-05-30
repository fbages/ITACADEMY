CREATE SCHEMA IF NOT EXISTS optica;

CREATE TABLE IF NOT EXISTS `optica`.`adreça_proveidors` (
  `idadreça` INT NOT NULL AUTO_INCREMENT,
  `carrer` VARCHAR(45) NULL,
  `número` INT NULL,
  `pis` INT NULL,
  `porta` INT NULL,
  `ciutat` VARCHAR(45) NULL,
  `codi_postal` INT NULL,
  `país` VARCHAR(45) NULL,
  PRIMARY KEY (`idadreça`))
ENGINE = InnoDB;

CREATE TABLE IF NOT EXISTS `optica`.`proveidors` (
  `idproveidors` INT NOT NULL AUTO_INCREMENT,
  `nom` VARCHAR(45) NOT NULL,
  `adreça` INT NOT NULL,
  PRIMARY KEY (`idproveidors`),
  INDEX `adreça_idx` (`adreça` ASC) VISIBLE,
  CONSTRAINT `adreça`
    FOREIGN KEY (`adreça`)
    REFERENCES `optica`.`adreça_proveidors` (`idadreça`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;

CREATE TABLE IF NOT EXISTS `optica`.`clients` (
  `idclients` INT NOT NULL AUTO_INCREMENT,
  `adreça_clients` VARCHAR(45) NOT NULL,
  `recomanat_per_client` INT NULL,
  `registre` DATETIME NOT NULL,
  `codi_postal` INT NOT NULL,
  `email` VARCHAR(45) NOT NULL,
  `telefon` INT NOT NULL,
  PRIMARY KEY (`idclients`),
  INDEX `recomanat_idx` (`recomanat_per_client` ASC) VISIBLE,
  CONSTRAINT `recomanat`
    FOREIGN KEY (`recomanat_per_client`)
    REFERENCES `optica`.`clients` (`idclients`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;

CREATE TABLE IF NOT EXISTS `optica`.`marques` (
  `idmarques` INT NOT NULL AUTO_INCREMENT,
  `nom` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`idmarques`))
ENGINE = InnoDB;

CREATE TABLE IF NOT EXISTS `optica`.`empleats` (
  `idempleats` INT NOT NULL AUTO_INCREMENT,
  `nom` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`idempleats`))
ENGINE = InnoDB;

CREATE TABLE IF NOT EXISTS `optica`.`muntura` (
  `idmuntura` INT NOT NULL AUTO_INCREMENT,
  `tipus` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`idmuntura`))
ENGINE = InnoDB;

CREATE TABLE IF NOT EXISTS `optica`.`ulleres` (
  `idulleres` INT NOT NULL AUTO_INCREMENT,
  `marca` INT NOT NULL,
  `graduacio_dreta` DOUBLE NOT NULL,
  `graduacio_esquerra` DOUBLE NOT NULL,
  `muntura` INT NOT NULL,
  `color_muntura` VARCHAR(45) NOT NULL,
  `color_vidres` VARCHAR(45) NOT NULL,
  `preu` DOUBLE NOT NULL,
  PRIMARY KEY (`idulleres`),
  INDEX `muntura_idx` (`muntura` ASC) VISIBLE,
  INDEX `marca_idx` (`marca` ASC) VISIBLE,
  CONSTRAINT `muntura`
    FOREIGN KEY (`muntura`)
    REFERENCES `optica`.`muntura` (`idmuntura`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `marca`
    FOREIGN KEY (`marca`)
    REFERENCES `optica`.`marques` (`idmarques`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;

CREATE TABLE IF NOT EXISTS `optica`.`compres` (
  `idcompres` INT NOT NULL AUTO_INCREMENT,
  `marca_compres` INT NOT NULL,
  `quantitat` INT NOT NULL,
  `proveidor` INT NOT NULL,
  PRIMARY KEY (`idcompres`),
  INDEX `proveidor_idx` (`proveidor` ASC) VISIBLE,
  INDEX `marca_compres_idx` (`marca_compres` ASC) VISIBLE,
  CONSTRAINT `proveidor`
    FOREIGN KEY (`proveidor`)
    REFERENCES `optica`.`proveidors` (`idproveidors`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `marca_compres`
    FOREIGN KEY (`marca_compres`)
    REFERENCES `optica`.`marques` (`idmarques`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;

CREATE TABLE IF NOT EXISTS `optica`.`ventes` (
  `idventes` INT NOT NULL AUTO_INCREMENT,
  `ulleres` INT NOT NULL,
  `client` INT NOT NULL,
  `empleat` INT NOT NULL,
  `data_registre` DATETIME NOT NULL,
  PRIMARY KEY (`idventes`),
  INDEX `ulleres_idx` (`ulleres` ASC) VISIBLE,
  INDEX `client_compra_idx` (`client` ASC) VISIBLE,
  INDEX `empleat_idx` (`empleat` ASC) VISIBLE,
  CONSTRAINT `ulleres_venudes`
    FOREIGN KEY (`ulleres`)
    REFERENCES `optica`.`ulleres` (`idulleres`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `client`
    FOREIGN KEY (`client`)
    REFERENCES `optica`.`clients` (`idclients`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `empleat`
    FOREIGN KEY (`empleat`)
    REFERENCES `optica`.`empleats` (`idempleats`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;
