
-- Schema youtube_francesc
-- -----------------------------------------------------
DROP SCHEMA IF EXISTS `youtube_francesc` ;

-- -----------------------------------------------------
-- Schema youtube_francesc
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `youtube_francesc`;
USE `youtube_francesc` ;

-- -----------------------------------------------------
-- Table `youtube_francesc`.`usuaris`
-- -----------------------------------------------------


CREATE TABLE IF NOT EXISTS `usuaris` (
  `idusuari` INT NOT NULL AUTO_INCREMENT,
  `email` VARCHAR(45) NULL,
  `contrasenya` VARCHAR(45) NULL,
  `nom_usuari` VARCHAR(45) NULL,
  `data_naixement` DATE NULL,
  `sexe` ENUM('F', 'M') NULL,
  `pais` ENUM('Espanya', 'França', 'Anglaterra') NULL,
  `codi_postal` INT NULL,
  PRIMARY KEY (`idusuari`)
  );


-- -----------------------------------------------------
-- Table `youtube_francesc`.`videos`
-- -----------------------------------------------------


CREATE TABLE IF NOT EXISTS `videos` (
  `idvideos` INT NOT NULL AUTO_INCREMENT,
  `titol` VARCHAR(45) NULL,
  `descripcio` VARCHAR(45) NULL,
  `tamany` DOUBLE NULL,
  `nom_fitxer` VARCHAR(45) NULL,
  `duracio` TIME NULL,
  `thumbnail` BLOB NULL,
  `numero_reproduccions` INT NULL,
  `numero_likes` INT NULL,
  `numero_dislikes` INT NULL,
  `tipus_video` ENUM('Public', 'Privat', 'Ocult') NULL,
  PRIMARY KEY (`idvideos`)
  );


-- -----------------------------------------------------
-- Table `youtube_francesc`.`canal`
-- -----------------------------------------------------


CREATE TABLE IF NOT EXISTS `canal` (
  `idcanal` INT NOT NULL AUTO_INCREMENT,
  `nom_canal` VARCHAR(45) NULL,
  `descripcio` VARCHAR(45) NULL,
  `data_creacio` DATETIME NULL,
  `usuari_canal` INT NULL,
  PRIMARY KEY (`idcanal`),
  CONSTRAINT `usuari_canal`
    FOREIGN KEY (`usuari_canal`)
    REFERENCES `youtube_francesc`.`usuaris` (`idusuari`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION
    );

CREATE INDEX `usuari_idx` ON `youtube_francesc`.`canal` (`usuari_canal` ASC) VISIBLE;


-- -----------------------------------------------------
-- Table `youtube_francesc`.`Publicacio`
-- -----------------------------------------------------


CREATE TABLE IF NOT EXISTS `Publicacio` (
  `idPublicacio` INT NOT NULL AUTO_INCREMENT,
  `id_video_publicat` INT NULL,
  `usuari_publicacio` INT NULL,
  `data_publicacio` DATETIME NULL,
  PRIMARY KEY (`idPublicacio`),
  CONSTRAINT `usuari_publi`
    FOREIGN KEY (`usuari_publicacio`)
    REFERENCES `youtube_francesc`.`usuaris` (`idusuari`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `video_publi`
    FOREIGN KEY (`id_video_publicat`)
    REFERENCES `youtube_francesc`.`videos` (`idvideos`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION
    );

CREATE INDEX `usuari_idx` ON `youtube_francesc`.`Publicacio` (`usuari_publicacio` ASC) VISIBLE;

CREATE INDEX `video_idx` ON `youtube_francesc`.`Publicacio` (`id_video_publicat` ASC) VISIBLE;


-- -----------------------------------------------------
-- Table `youtube_francesc`.`usuaris_registrats_canal`
-- -----------------------------------------------------


CREATE TABLE IF NOT EXISTS `usuaris_registrats_canal` (
  `idusuaris_registrats_canal` INT NOT NULL AUTO_INCREMENT,
  `id_canal` INT NULL,
  `usuari_subscrit` INT NULL,
  PRIMARY KEY (`idusuaris_registrats_canal`),
  CONSTRAINT `usuari_registrat_canal`
    FOREIGN KEY (`usuari_subscrit`)
    REFERENCES `youtube_francesc`.`usuaris` (`idusuari`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `canal_registrat`
    FOREIGN KEY (`id_canal`)
    REFERENCES `youtube_francesc`.`canal` (`idcanal`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION
    );

CREATE INDEX `usuari_idx` ON `youtube_francesc`.`usuaris_registrats_canal` (`usuari_subscrit` ASC) VISIBLE;

CREATE INDEX `canal_idx` ON `youtube_francesc`.`usuaris_registrats_canal` (`id_canal` ASC) VISIBLE;


-- -----------------------------------------------------
-- Table `youtube_francesc`.`like_dislikes`
-- -----------------------------------------------------


CREATE TABLE IF NOT EXISTS `like_dislikes` (
  `idlike_dislikes` INT NOT NULL AUTO_INCREMENT,
  `video` INT NULL,
  `usuari` INT NULL,
  `opinio` ENUM('L', 'D') NULL,
  `data_opinio` DATETIME NULL,
  PRIMARY KEY (`idlike_dislikes`),
  CONSTRAINT `video_opinio`
    FOREIGN KEY (`video`)
    REFERENCES `youtube_francesc`.`videos` (`idvideos`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `usuari_opinio`
    FOREIGN KEY (`usuari`)
    REFERENCES `youtube_francesc`.`usuaris` (`idusuari`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION
)
COMMENT = 'L: LIKE   D: DISLIKE';
CREATE INDEX `video_idx` ON `youtube_francesc`.`like_dislikes` (`video` ASC) VISIBLE;

CREATE INDEX `usuari_idx` ON `youtube_francesc`.`like_dislikes` (`usuari` ASC) VISIBLE;


-- -----------------------------------------------------
-- Table `youtube_francesc`.`playlists`
-- -----------------------------------------------------


CREATE TABLE IF NOT EXISTS `playlists` (
  `idplaylists` INT NOT NULL AUTO_INCREMENT,
  `nom` VARCHAR(45) NULL,
  `usuari` INT NULL,
  `data_creacio` DATETIME NULL,
  `estat` ENUM('Publica', 'Privada') NULL,
  PRIMARY KEY (`idplaylists`),
  CONSTRAINT `usuari_playlist`
    FOREIGN KEY (`usuari`)
    REFERENCES `youtube_francesc`.`usuaris` (`idusuari`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION);


CREATE INDEX `usuari_idx` ON `youtube_francesc`.`playlists` (`usuari` ASC) VISIBLE;


-- -----------------------------------------------------
-- Table `youtube_francesc`.`hashtag`
-- -----------------------------------------------------

CREATE TABLE IF NOT EXISTS `hashtag` (
  `idhashtag` INT NOT NULL AUTO_INCREMENT,
  `nom_hashtag` VARCHAR(45) NULL,
  `video_hashtag` INT NULL,
  PRIMARY KEY (`idhashtag`),
  CONSTRAINT `video_hashtag`
    FOREIGN KEY (`video_hashtag`)
    REFERENCES `youtube_francesc`.`videos` (`idvideos`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION);

CREATE INDEX `video_idx` ON `youtube_francesc`.`hashtag` (`video_hashtag` ASC) VISIBLE;

CREATE TABLE IF NOT EXISTS `comentaris` (
`idcomentaris` INT NOT NULL AUTO_INCREMENT,
`id_video_comentat` INT NULL,
`id_usuari_comenta` INT NULL,
`text_comentari` LONGTEXT NULL,
`data_comentari` DATETIME,
PRIMARY KEY (`idcomentaris`),
CONSTRAINT `id_video_comentat`
	FOREIGN KEY (`id_video_comentat`)
    REFERENCES `youtube_francesc`.`videos` (`idvideos`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
CONSTRAINT `id_usuari_comenta`
	FOREIGN KEY (`id_usuari_comenta`)
    REFERENCES `youtube_francesc`.`usuaris` (`idusuari`)
        ON DELETE NO ACTION
		ON UPDATE NO ACTION
    );
    
CREATE INDEX `video_comentat_idx` ON `youtube_francesc`.`comentaris` (`id_video_comentat` ASC) VISIBLE;
CREATE INDEX `usuari_comenta_idx` ON `youtube_francesc`.`comentaris` (`id_usuari_comenta` ASC) VISIBLE;

CREATE TABLE IF NOT EXISTS `comentari_seguiment` (
`idcomentari_seguiment` INT NOT NULL AUTO_INCREMENT,
`id_comentari_agrada` INT NULL,
`id_usuari_agrada` INT NULL,
`agrada_o_no` ENUM('SI','NO') NULL,
`data_comentari_agrada` DATETIME,
PRIMARY KEY (`idcomentari_seguiment`),
CONSTRAINT `id_comentari_agrada`
	FOREIGN KEY (`id_comentari_agrada`)
    REFERENCES `youtube_francesc`.`comentaris` (`idcomentaris`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
CONSTRAINT `id_usuari_agrada`
	FOREIGN KEY (`id_usuari_agrada`)
    REFERENCES `youtube_francesc`.`usuaris` (`idusuari`)
        ON DELETE NO ACTION
		ON UPDATE NO ACTION
);

CREATE INDEX `comentari_agrada_idx` ON `youtube_francesc`.`comentari_seguiment` (`id_comentari_agrada` ASC) VISIBLE;
CREATE INDEX `usuari_agrada_idx` ON `youtube_francesc`.`comentari_seguiment` (`id_usuari_agrada` ASC) VISIBLE;

    
delimiter //

CREATE TRIGGER contador_likes_dislikes
       AFTER INSERT ON like_dislikes
       FOR EACH ROW
       BEGIN
		DECLARE index1 INT unsigned DEFAULT 1;
		DECLARE quantitat INT unsigned DEFAULT 0;
        DECLARE opinio_var VARCHAR(1);
        SET opinio_var = (SELECT opinio FROM like_dislikes ORDER BY idlike_dislikes desc LIMIT 1);
        
		IF opinio_var = 'L' THEN 
        SET index1 := (SELECT video FROM like_dislikes ORDER BY idlike_dislikes desc LIMIT 1); 
        SET quantitat := (SELECT numero_likes FROM videos WHERE idvideos = index1);
		UPDATE videos SET 
			numero_likes = quantitat + 1 
			WHERE idvideos = index1;  -- TAMBÉ ES PODRIA FER AMB UNA QUERY QUE CONTI TOTS ELS LIKES D'UN VIDEO, PERÒ REQUEREIX MÉS RECURSOS DE LA DB PER CADA LIKE
        END IF;
        
		IF opinio_var = 'D' THEN
        SET index1 := (SELECT video FROM like_dislikes ORDER BY idlike_dislikes desc LIMIT 1); 
        SET quantitat := (SELECT numero_dislikes FROM videos WHERE idvideos = index1);
		UPDATE videos SET 
			numero_dislikes = quantitat + 1 
			WHERE idvideos = index1;  -- TAMBÉ ES PODRIA FER AMB UNA QUERY QUE CONTI TOTS ELS LIKES D'UN VIDEO, PERÒ REQUEREIX MÉS RECURSOS DE LA DB PER CADA LIKE
        END IF;
        
       END; // 
       
       -- Per fer el contador del número de reproduccions hauria de fer un trigger d'un procediment, en el qual, hi hagués la query de busqueda del video