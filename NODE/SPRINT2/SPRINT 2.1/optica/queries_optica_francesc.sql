USE optica_francesc;

-- Llista el total de compres d'un client
-- SELECT * FROM ventes WHERE client = 2;

-- Llista les diferents ulleres que ha venut un empleat durant un any
-- SELECT * FROM ventes WHERE empleat = 1 && data_registre >= '2021-05-27 12:25:10';

-- Llista els diferents proveïdors que han subministrat ulleres venudes amb èxit per l'òptica , ventes.ulleres AS 'Ullera venuda' 
SELECT DISTINCT nom AS 'Nom proveidors únics que han venut' 
FROM proveidors p  
INNER JOIN compres c ON p.idproveidors = c.proveidor
INNER JOIN ulleres u ON u.marca = c.marca_compres
INNER JOIN ventes v ON v.ulleres = u.idulleres

