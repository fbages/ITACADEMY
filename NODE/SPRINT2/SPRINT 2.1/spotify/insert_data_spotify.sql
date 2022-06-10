USE spotify_francesc;

INSERT INTO artistes(nom_artista,imatge_artista,tipus_musica) VALUES
('Blink182',"",'Punk'),
('Oasis',"",'Poprock'),
('ACDC',"",'Rock');

INSERT INTO albums(nom_album,id_artista,any_publicacio) VALUES
('Blink182',1,2000),
('Don’t Believe The Truth',2,2005),
('Dig Out Your Soul',2,2008),
('Heathen Chemistry',2,2001);

INSERT INTO cançons(id_album,nom_canço,durada,reproduccions_canço) VALUES
(1,'First date','03:30',500000),
(4,'The_Hindu_Times', '03:52',21551),
(4,'Force of Nature','04:50',315345134),
(4,'Hung in A Bad Place','03:30',154535),
(4,'Stop Crying Your Heart Out','06:43',4135345);

INSERT INTO targeta_credit(numero_targeta,mes_caducitat,any_caducitat,codi_seguretat) VALUES
('1234-1234-1234-1234',01,23,535),
('1234-1234-1234-1234',01,23,534),
('1234-1234-1234-1234',01,23,534),
('1234-1234-1234-1234',01,23,534);

INSERT INTO subscripcions(inici_subscripcio, renovacio_subscripcio, metode_pagament, idtargeta_credit, usuari_paypal) VALUES
('2022-10-11 23:59:59','2022-11-11 23:59:59','Targeta',1,null),
('2022-10-11 23:59:59','2022-11-11 23:59:59','Targeta',2,null),
('2022-10-11','2022-11-11 23:59:59','Targeta',3,null),
('2022-10-11','2022-11-11 23:59:59','Paypal',null,"usuariPaypal"),
('2022-10-11','2022-11-11 23:59:59','Targeta',4,null);

INSERT INTO usuaris(tipus,email, data_naixement, sexe, pais,codi_postal,subscripcio) VALUES
('F','antonio@gjdlas.com','2022-11-11 23:59:59','F','Espanya',09324,null),
('P','manolo@gjdlas.com','2022-11-11 23:59:59','M','Espanya',09324,1),
('P','pere@gjdlas.com','2022-11-11 23:59:59','M','Espanya',09324,2);

INSERT INTO playlists(estat,usuari_creador,nom_playlist) VALUES
('A',1,"Punk que m'agrada"),
('E',2,"Punk que molava");

INSERT INTO detall_playlist(id_playlist, id_usuari_agrega_canço, id_canço_agregada, data_agregada) VALUES
(1,2,1,'2022-11-11'),
(1,2,2,'2022-11-11'),
(1,2,3,'2022-11-11'),
(1,2,4,'2022-11-11'),
(2,3,1,'2022-12-1');

INSERT INTO favorits(usuari_favorit,canço_favorit,album_favorit) VALUES
(1,1,null),
(1,2,null),
(1,null,3),
(2,1,null),
(2,null,4);

INSERT INTO registre_pagaments(idsubscripcions_pagaments,data_pagament,total_pagat) VALUES
(1,'2021-12-12',130),
(1,'2022-01-12',140),
(1,'2022-02-12',150),
(1,'2022-03-12',160);

INSERT INTO seguiment_artistes(usuari_segueix, artista_seguit) VALUES
(2,1),
(3,2),
(2,3),
(1,1);