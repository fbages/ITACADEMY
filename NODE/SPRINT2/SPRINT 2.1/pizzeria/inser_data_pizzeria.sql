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

INSERT INTO detall_compres(producte,preu_compra,quantitat,idcomanda) VALUES

(1,2,4,1),
(2,1.9,4,1),
(3,4,4,1),
(4,2,4,2),
(5,2,4,2),
(6,2,4,3),
(6,2,4,3),
(6,2,4,4),
(6,2,4,4),
(6,2,4,4),
(6,2,4,5),
(7,2,4,6),
(7,2,4,7),
(7,2,4,8);

INSERT INTO comandes(client,dataihora,distribucio,preu,botiga,repertidor,entregadataihora) VALUES

(1,'2022-05-30 17:45:00','Recollida',15,1,null,null),
(2,'2022-05-25 17:45:00','Enviar',10,1,3,'2022-05-25 18:45:00'),
(3,'2022-05-25 17:45:00','Enviar',10,1,4,'2022-05-25 18:45:00'),
(4,'2022-05-25 17:45:00','Enviar',10,1,5,'2022-05-25 18:45:00'),
(5,'2022-05-25 17:45:00','Enviar',10,1,4,'2022-05-25 18:45:00'),
(6,'2022-05-25 17:45:00','Enviar',10,1,3,'2022-05-25 18:45:00'),
(6,'2022-05-25 17:45:00','Enviar',10,1,3,'2022-05-25 18:45:00'),
(7,'2022-05-05 17:45:00','Recollida',7,1,null,null),
(1,'2022-05-05 17:45:00','Recollida',7,1,null,null);

INSERT INTO clients(nom,cognom,adreça,codi_postal,localitat,telefon) VALUES
('Marc','Garcia','Diagonal 533 6-2',08024,1,654654654),
('Ana','Marques','Diagonal 33 1-2',08025,1,654654651),
('Enric','Perez','Corsega 41 3-2',08024,1,654633354);



