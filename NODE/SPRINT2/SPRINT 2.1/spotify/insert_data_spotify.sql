USE spotify_francesc;

INSERT INTO artistes(nom_artista,tipus_musica) VALUES
('Blink182','Punk'),
('Oasis','Poprock'),
('ACDC','Rock');

INSERT INTO albums(nom_album,id_artista,any_publicacio) VALUES
('Blink182',1,2000),
('',2,2003);

INSERT INTO cançons(id_album,nom_canço,durada,reproduccions_canço) VALUES
(1,'First date','03:30',500000);