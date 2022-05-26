INSERT INTO adreça_proveidors(carrer,número,pis,porta,ciutat,codi_postal,país) VALUES 
('Carrer Lepant',63,3,1,'Barcelona',08025,'Espanya'),
('Carrer Diagonal',523,6,2,'Barcelona',08021,'Espanya'),
('Rue de Paris',12,5,1,'Paris',34350,'França');

INSERT INTO clients(adreça_clients,recomanat_per_client,registre,codi_postal,email,telefon) VALUES 
(1,null,"2021-12-25",08035,'marc@perez.com',6777789),
(2,null,"2022-02-03",08042,'antonia1@hortet.com',66668 ),
(3,null,"2020-01-10",08038,'pere@lluc.com',61978 ),
(4,null,"2019-05-31",08052,'carlota@garcia.com',34423 );

INSERT INTO muntura(tipus) VALUES
('pasta'),
('metàliques'),
('flotants');

INSERT INTO empleats(nom) VALUES
('Enric'),
('Sonia'),
('Manel');

INSERT INTO marques(nom) VALUES
('Oakley'),
('Miu miu'),
('Prada'),
('Gucci'),
('Ray Ban');

INSERT INTO proveidors(nom,adreça) VALUES
('Exportaciones Manolo SA',1),
('Export Terrassa SA',2),
('PRETAGAFAS SLU',3);

INSERT INTO compres(marca,quantitat,proveidor) VALUES
(1,50,3),
(3,5,1),
(2,150,2),
(5,450,1),
(4,3,1);

