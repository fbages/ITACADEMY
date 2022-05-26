-- MySQL Workbench Synchronization
-- Generated: 2022-05-26 12:40
-- Model: New Model
-- Version: 1.0
-- Project: Name of the project
-- Author: ANA

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION';

ALTER SCHEMA `optica`  DEFAULT CHARACTER SET utf8  DEFAULT COLLATE utf8_general_ci ;

ALTER TABLE `optica`.`proveidors` 
DROP FOREIGN KEY `adreça`;

ALTER TABLE `optica`.`ulleres` 
DROP FOREIGN KEY `marca`;

ALTER TABLE `optica`.`clients` 
DROP FOREIGN KEY `recomanat`;

ALTER TABLE `optica`.`marques` 
DROP FOREIGN KEY `proviedor`;

ALTER TABLE `optica`.`proveidors` 
CHARACTER SET = utf8 , COLLATE = utf8_general_ci ;

ALTER TABLE `optica`.`ulleres` 
CHARACTER SET = utf8 , COLLATE = utf8_general_ci ;

ALTER TABLE `optica`.`muntura` 
CHARACTER SET = utf8 , COLLATE = utf8_general_ci ;

ALTER TABLE `optica`.`adreça proveidors` 
CHARACTER SET = utf8 , COLLATE = utf8_general_ci ;

ALTER TABLE `optica`.`clients` 
CHARACTER SET = utf8 , COLLATE = utf8_general_ci ;

ALTER TABLE `optica`.`empleats` 
CHARACTER SET = utf8 , COLLATE = utf8_general_ci ;

CREATE TABLE IF NOT EXISTS `optica`.`ventes` (
  `idventes` INT(11) NOT NULL AUTO_INCREMENT,
  `ulleres` INT(11) NOT NULL,
  `client` INT(11) NOT NULL,
  `empleat` INT(11) NOT NULL,
  `data` DATETIME NOT NULL,
  PRIMARY KEY (`idventes`),
  INDEX `ulleres_idx` (`ulleres` ASC) VISIBLE,
  INDEX `client_idx` (`client` ASC) VISIBLE,
  INDEX `empleat_idx` (`empleat` ASC) VISIBLE,
  CONSTRAINT `ulleres`
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
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;

ALTER TABLE `optica`.`marques` 
CHARACTER SET = utf8 , COLLATE = utf8_general_ci ,
DROP COLUMN `proveidor`,
DROP INDEX `proviedor_idx` ;
;

CREATE TABLE IF NOT EXISTS `optica`.`compres` (
  `idcompres` INT(11) NOT NULL AUTO_INCREMENT,
  `quantitat` INT(11) NOT NULL,
  `proveidor` INT(11) NOT NULL,
  `marca` INT(11) NULL DEFAULT NULL,
  PRIMARY KEY (`idcompres`),
  INDEX `proveidor_idx` (`proveidor` ASC) VISIBLE,
  INDEX `marca_idx` (`marca` ASC) VISIBLE,
  CONSTRAINT `proveidor`
    FOREIGN KEY (`proveidor`)
    REFERENCES `optica`.`proveidors` (`idproveidors`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `marca`
    FOREIGN KEY (`marca`)
    REFERENCES `optica`.`marques` (`idmarques`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;

ALTER TABLE `optica`.`proveidors` 
ADD CONSTRAINT `adreça`
  FOREIGN KEY (`adreça`)
  REFERENCES `optica`.`adreça proveidors` (`idadreça`)
  ON DELETE NO ACTION
  ON UPDATE NO ACTION;

ALTER TABLE `optica`.`ulleres` 
DROP FOREIGN KEY `muntura`;

ALTER TABLE `optica`.`ulleres` ADD CONSTRAINT `muntura`
  FOREIGN KEY (`muntura`)
  REFERENCES `optica`.`muntura` (`idmuntura`)
  ON DELETE NO ACTION
  ON UPDATE NO ACTION,
ADD CONSTRAINT `marca`
  FOREIGN KEY (`marca`)
  REFERENCES `optica`.`marques` (`idmarques`)
  ON DELETE NO ACTION
  ON UPDATE NO ACTION;

ALTER TABLE `optica`.`clients` 
ADD CONSTRAINT `recomanat`
  FOREIGN KEY (`recomanat_per_client`)
  REFERENCES `optica`.`clients` (`idclients`)
  ON DELETE NO ACTION
  ON UPDATE NO ACTION;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
