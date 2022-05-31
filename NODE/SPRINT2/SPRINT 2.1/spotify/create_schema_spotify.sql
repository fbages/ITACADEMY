-- -----------------------------------------------------
-- Schema spotify_francesc
-- -----------------------------------------------------
DROP SCHEMA IF EXISTS `spotify_francesc` ;

-- -----------------------------------------------------
-- Schema spotify_francesc
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `spotify_francesc`;
USE `spotify_francesc` ;

-- -----------------------------------------------------
-- Table `spotify_francesc`.`targeta_credit`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `spotify_francesc`.`targeta_credit` (
  `idtargeta_credit` INT NOT NULL AUTO_INCREMENT,
  `numero_targeta` INT(16) NULL,
  `mes_caducitat` INT(2) NULL,
  `any_caducitat` INT(2) NULL,
  `codi_seguretat` INT NULL,
  PRIMARY KEY (`idtargeta_credit`));


-- -----------------------------------------------------
-- Table `spotify_francesc`.`subscripcions`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `spotify_francesc`.`subscripcions` (
  `idsubscripcions` INT NOT NULL AUTO_INCREMENT,
  `inici_subscripcio` DATETIME NULL,
  `renovacio_subscripcio` DATETIME NULL,
  `metode_pagament` ENUM('Tarjeta', 'Paypal') NULL,
  `idtargeta_credit` INT NULL,
  `usuari_paypal` VARCHAR(45) NULL,
  PRIMARY KEY (`idsubscripcions`),
  INDEX `id_targeta_paga_idx` (`idtargeta_credit` ASC) VISIBLE,
  CONSTRAINT `id_targeta_paga`
    FOREIGN KEY (`idtargeta_credit`)
    REFERENCES `spotify_francesc`.`targeta_credit` (`idtargeta_credit`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION);


-- -----------------------------------------------------
-- Table `spotify_francesc`.`usuaris`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `spotify_francesc`.`usuaris` (
  `idusuaris` INT NOT NULL AUTO_INCREMENT,
  `tipus` ENUM('F', 'P') NULL COMMENT 'F : Free\nP : Premium',
  `email` VARCHAR(45) NULL,
  `data_naixement` DATETIME NULL,
  `sexe` VARCHAR(1) NULL COMMENT 'F : Femenino\nM : Masculino',
  `pais` ENUM('França', 'Espanya') NULL,
  `codi_postal` INT(5) NULL,
  `subscripcio` INT NULL,
  PRIMARY KEY (`idusuaris`),
  INDEX `id_subscripcio_idx` (`subscripcio` ASC) VISIBLE,
  CONSTRAINT `id_subscripcio`
    FOREIGN KEY (`subscripcio`)
    REFERENCES `spotify_francesc`.`subscripcions` (`idsubscripcions`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION);


-- -----------------------------------------------------
-- Table `spotify_francesc`.`registre_pagaments`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `spotify_francesc`.`registre_pagaments` (
  `idregistre_pagaments` INT NOT NULL AUTO_INCREMENT,
  `idsubscripcions_pagaments` INT NULL,
  `data_pagament` DATETIME NULL,
  `total_pagat` DOUBLE NULL,
  PRIMARY KEY (`idregistre_pagaments`),
  INDEX `id_subscripcions_idx` (`idsubscripcions_pagaments` ASC) VISIBLE,
  CONSTRAINT `id_subscripcions`
    FOREIGN KEY (`idsubscripcions_pagaments`)
    REFERENCES `spotify_francesc`.`subscripcions` (`idsubscripcions`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION);


-- -----------------------------------------------------
-- Table `spotify_francesc`.`playlists`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `spotify_francesc`.`playlists` (
  `idplaylists` INT NOT NULL AUTO_INCREMENT,
  `estat` ENUM('A', 'E') NULL COMMENT 'A : Activa\nE : Esborrada',
  `usuari_creador` INT NULL,
  `nom_playlist` VARCHAR(45) NULL,
  PRIMARY KEY (`idplaylists`),
  INDEX `id_usuari_creador_idx` (`usuari_creador` ASC) VISIBLE,
  CONSTRAINT `id_usuari_creador`
    FOREIGN KEY (`usuari_creador`)
    REFERENCES `spotify_francesc`.`usuaris` (`idusuaris`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION);


-- -----------------------------------------------------
-- Table `spotify_francesc`.`artistes`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `spotify_francesc`.`artistes` (
  `idartistes` INT NOT NULL AUTO_INCREMENT,
  `nom_artista` VARCHAR(45) NULL,
  `imatge_artista` BLOB NULL,
  `tipus_musica` ENUM('Country', 'Jazz', 'Tecno', 'Clasica') NULL,
  PRIMARY KEY (`idartistes`));


-- -----------------------------------------------------
-- Table `spotify_francesc`.`albums`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `spotify_francesc`.`albums` (
  `idalbum` INT NOT NULL AUTO_INCREMENT,
  `nom_album` VARCHAR(45) NULL,
  `id_artista` INT NULL,
  `any_publicacio` YEAR NULL,
  `imatge` BLOB NULL,
  PRIMARY KEY (`idalbum`),
  INDEX `id_artista_idx` (`id_artista` ASC) VISIBLE,
  CONSTRAINT `id_artista`
    FOREIGN KEY (`id_artista`)
    REFERENCES `spotify_francesc`.`artistes` (`idartistes`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION);


-- -----------------------------------------------------
-- Table `spotify_francesc`.`cançons`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `spotify_francesc`.`cançons` (
  `idcanço` INT NOT NULL AUTO_INCREMENT,
  `id_album` INT NULL,
  `nom_canço` VARCHAR(45) NULL,
  `durada` TIME NULL,
  `reproduccions_canço` INT NULL,
  PRIMARY KEY (`idcanço`),
  INDEX `id_album_idx` (`id_album` ASC) VISIBLE,
  CONSTRAINT `id_album`
    FOREIGN KEY (`id_album`)
    REFERENCES `spotify_francesc`.`albums` (`idalbum`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION);


-- -----------------------------------------------------
-- Table `spotify_francesc`.`detall_playlist`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `spotify_francesc`.`detall_playlist` (
  `iddetall_playlist` INT NOT NULL AUTO_INCREMENT,
  `id_playlist` INT NULL,
  `id_usuari_agrega_canço` INT NULL,
  `id_canço_agregada` INT NULL,
  `data_agregada` DATE NULL,
  PRIMARY KEY (`iddetall_playlist`),
  INDEX `id_playlist_idx` (`id_playlist` ASC) VISIBLE,
  INDEX `id_usuari_agrega_idx` (`id_usuari_agrega_canço` ASC) VISIBLE,
  INDEX `id_canço_agregada_idx` (`id_canço_agregada` ASC) VISIBLE,
  CONSTRAINT `id_playlist`
    FOREIGN KEY (`id_playlist`)
    REFERENCES `spotify_francesc`.`playlists` (`idplaylists`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `id_usuari_agrega`
    FOREIGN KEY (`id_usuari_agrega_canço`)
    REFERENCES `spotify_francesc`.`usuaris` (`idusuaris`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `id_canço_agregada`
    FOREIGN KEY (`id_canço_agregada`)
    REFERENCES `spotify_francesc`.`cançons` (`idcanço`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION);


-- -----------------------------------------------------
-- Table `spotify_francesc`.`seguiment_artistes`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `spotify_francesc`.`seguiment_artistes` (
  `idseguiment_artistes` INT NOT NULL AUTO_INCREMENT,
  `usuari_segueix` INT NULL,
  `artista_seguit` INT NULL,
  PRIMARY KEY (`idseguiment_artistes`),
  INDEX `idartista_seguiment_idx` (`artista_seguit` ASC) VISIBLE,
  INDEX `idusuari_seguiment_idx` (`usuari_segueix` ASC) VISIBLE,
  CONSTRAINT `idartista_seguiment`
    FOREIGN KEY (`artista_seguit`)
    REFERENCES `spotify_francesc`.`artistes` (`idartistes`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `idusuari_seguiment`
    FOREIGN KEY (`usuari_segueix`)
    REFERENCES `spotify_francesc`.`usuaris` (`idusuaris`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION);


-- -----------------------------------------------------
-- Table `spotify_francesc`.`favorits`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `spotify_francesc`.`favorits` (
  `idfavorits` INT NOT NULL AUTO_INCREMENT,
  `usuari_favorit` INT NULL,
  `canço_favorit` INT NULL,
  `album_favorit` INT NULL,
  PRIMARY KEY (`idfavorits`),
  INDEX `usuari_favorit_idx` (`usuari_favorit` ASC) VISIBLE,
  INDEX `album_favorit_idx` (`album_favorit` ASC) VISIBLE,
  INDEX `canço_favorti_idx` (`canço_favorit` ASC) VISIBLE,
  CONSTRAINT `usuari_favorit`
    FOREIGN KEY (`usuari_favorit`)
    REFERENCES `spotify_francesc`.`usuaris` (`idusuaris`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `album_favorit`
    FOREIGN KEY (`album_favorit`)
    REFERENCES `spotify_francesc`.`albums` (`idalbum`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `canço_favorti`
    FOREIGN KEY (`canço_favorit`)
    REFERENCES `spotify_francesc`.`cançons` (`idcanço`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION);
