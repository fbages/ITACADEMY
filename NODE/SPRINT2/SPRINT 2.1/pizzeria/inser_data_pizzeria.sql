USE pizzeria;

INSERT INTO botigues(nom) VALUES
('BOTIGA1'),
('BOTIGA2'),
('BOTIGA3'),
('BOTIGA4');

INSERT INTO categories(nom) VALUES
('BEGUDES'),
('HAMBURGUESES'),
('PIZZA_GRAN'),
('PIZZA_MITJANA'),
('PIZZA_PETITA');

INSERT INTO empleats(nom, cognom, nif, telefon, tipus_empleat,botiga) VALUES
('Nom_empleat1','Cognom_empleat1','12345678A',612345678,'cuiner',1),
('Nom_empleat2','Cognom_empleat2','12345678B',612345679,'cuiner',2),
('Nom_empleat3','Cognom_empleat3','12345678C',612345680,'cuiner',3),
('Nom_empleat4','Cognom_empleat4','12345678D',612345681,'cuiner',4),
('Nom_empleat5','Cognom_empleat5','12345678A',612345682,'cuiner',1),
('Nom_empleat6','Cognom_empleat6','12345678B',612345683,'cuiner',2),
('Nom_empleat7','Cognom_empleat7','12345678C',612345684,'cuiner',3),
('Nom_empleat8','Cognom_empleat8','12345678D',612345685,'cuiner',4),
('Nom_empleat9','Cognom_empleat9','12345678A',612345686,'cuiner',1),
('Nom_empleat10','Cognom_empleat10','12345678B',612345687,'cuiner',2),
('Nom_empleat11','Cognom_empleat11','12345678C',612345688,'cuiner',3),
('Nom_empleat12','Cognom_empleat12','12345678D',612345689,'cuiner',4);

INSERT INTO provincies(provincia) VALUES
('Lleida'),
('Barcelona'),
('Tarragona'),
('Girona');

INSERT INTO localitats(localitat,provincia) VALUES
('Abella de la Conca',1),
('Barcelona',2),
('Agramunt',1),
('Lleida',1),
('Girona',4),
('Tarragona',3);

INSERT INTO productes(nom, categoria, descripcio, imatge, preu) VALUES

('pepsi',1,'beguda freda','imatge1',2),
('cocacola',1,'beguda freda','imatge2',1.9),
('hamburguesa bbq',2,'hamburguesa amb salsa bbq','imatge3',5.5),
('hamburguesa vegetal',2,'hamburguesa vegetal sense carn','imatge4',6),
('pizza petita bbq',5,'pizza petita bbq','imatge5',6),
('pizza petita 4 formatges',5,'pizza petita 4 formatges','imatge6',5.5),
('pizza mitjana bbq',4,'pizza mitjana bbq','imatge7',7.15),
('pizza mitjana 4 formatges',4,'pizza mitjana 4 formatges','imatge8',6),
('pizza gran bbq',3,'pizza gran bbq','imatge9',10.8),
('pizza gran 4 formatges',3,'pizza gran 4 formatges','imatge10',11);






