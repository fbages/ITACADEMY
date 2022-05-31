USE `youtube_francesc`;

INSERT INTO usuaris(email, contrasenya, nom_usuari,data_naixement,sexe,pais,codi_postal) VALUES
('Enric@lopez.com','adsfadfa','Enric Lopez','1984-03-12','M','Espanya',08021),
('Ana@lopez.com','gfdgsdfb','Ana Lopez','1986-03-14','F','França',01344),
('Pau@lopez.com','fgadffgad','Pau Lopez','1988-03-12','M','Espanya',08032),
('Laura@lopez.com','gafaggfg','Laura Lopez','1986-03-12','F','Espanya',08012),
('Joan@lopez.com','agfdfgbvcb','Joan Lopez','1985-03-12','M','Espanya',084234),
('Marta@lopez.com','fadf3q4r','Marta Lopez','1984-03-12','F','Espanya',08023);

INSERT INTO playlists(nom,usuari,data_creacio,estat) VALUES
('list1',1,'2022-03-21 12:34:34','Publica'),
('list2',2,'2022-10-11 15:34:34','Privada'),
('list3',3,'2022-09-01 14:34:34','Publica'),
('list4',4,'2022-08-11 14:34:34','Privada'),
('list5',6,'2022-06-01 16:32:34','Privada');

INSERT INTO videos(titol,descripcio,tamany,nom_fitxer,duracio,thumbnail,numero_reproduccions,numero_likes,numero_dislikes,tipus_video) VALUES
('video01','Tutorial JS', 300,'tutorialjs.mp4','00:30:00','tut01',504,23,12,'Public'),
('video02','Tutorial NODE', 200,'tutorialNODE.mp4','02:32:00','tut01',1504,2123,12,'Public'),
('video03','Tutorial ANGULAR', 1300,'tutoDAFAaljs.mp4','00:51:00','tut01',2504,213,12,'Public'),
('video04','Tutorial VUE', 5300,'tutfdasadfsjs.mp4','00:36:00','tut01',4504,222,12,'Public'),
('video05','Tutorial REACH', 2300,'tuasdfdsljs.mp4','00:45:00','tut01',0,0,0,'Ocult'),
('video06','Tutorial GIT', 1300,'tutdasdfjs.mp4','00:55:00','tut01',1504,23,112,'Public'),
('video07','Tutorial NPM', 100,'tuto342343js.mp4','00:10:00','tut01',0,0,0,'Privat'),
('video08','Tutorial MONGODB', 350,'tuto234234s.mp4','02:30:00','tut01',2504,223,12,'Public'),
('video09','Tutorial MYSQL', 380,'tuto2342343js.mp4','01:30:00','tut01',5104,233,12,'Public');

INSERT INTO hashtag(nom_hashtag,video_hashtag) VALUES
('greatvideo',1),
('academic',2),
('LOL',1),
('greatvideo',4),
('academic',3),
('LOL',7),
('greatvideo',5),
('academic',3),
('LOL',6);

INSERT INTO publicacio(id_video_publicat, usuari_publicacio, data_publicacio) VALUES
(1,3,'2022-10-03 10:45:32'),
(2,3,'2021-12-03 10:45:32'),
(3,2,'2020-11-03 10:45:32'),
(4,1,'2021-03-03 10:45:32'),
(5,4,'2022-05-03 10:45:32'),
(6,5,'2022-02-03 10:45:32'),
(7,5,'2021-01-03 10:45:32'),
(8,5,'2022-02-03 10:45:32'),
(9,5,'2020-07-03 10:45:32');

INSERT INTO like_dislikes(video,usuari,opinio,data_opinio) VALUES
(1,4,'L','2022-10-03 12:45:32'),
(2,4,'D','2022-11-03 12:45:32'),
(3,4,'L','2022-10-05 12:45:32'),
(4,4,'L','2022-11-03 12:45:32'),
(1,3,'L','2022-11-03 12:45:32'),
(7,5,'L','2022-12-03 12:45:32'),
(6,1,'D','2022-12-03 12:45:32'),
(4,3,'L','2022-10-03 12:45:32'),
(3,5,'L','2022-12-03 12:45:32'),
(2,3,'L','2022-12-03 12:45:32'),
(1,5,'D','2022-11-03 12:45:32'),
(1,5,'L','2022-11-03 12:45:32');

INSERT INTO canal(nom_canal,descripcio,data_creacio,usuari_canal) VALUES
('tutorials programacio','Per apendre més','2022-11-03 12:45:32',3),
('tutorials123','','2022-11-03 12:45:32',5),
('tuto','too learn','2022-11-03 12:45:32',4),
('tutorials','Interesent','2022-11-03 12:45:32',2);

INSERT INTO usuaris_registrats_canal(id_canal,usuari_subscrit) VALUES
(1,3),
(2,3),
(3,4),
(1,2),
(4,5),
(4,4);