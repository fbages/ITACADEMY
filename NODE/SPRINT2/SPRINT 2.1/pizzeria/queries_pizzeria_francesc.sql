USE pizzeria_francesc;

-- Llista quants productes del tipus 'begudes' s'han venut en una determinada localitat
-- SELECT * FROM detall_compres WHERE (producte = (	SELECT DISTINCT categoria FROM productes 	WHERE categoria = (		SELECT idcategories FROM categories 		WHERE nom = 'BEGUDES')));

-- Llista quantes comandes ha efectuat un determinat empleat
SELECT * FROM empleats INNER JOIN comandes ON (comandes.cuiner = empleats.idempleats OR comandes.repertidor = empleats.idempleats)