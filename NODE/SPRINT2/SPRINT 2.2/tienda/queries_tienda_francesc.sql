USE tienda;

-- 1 
-- SELECT nombre FROM tienda.producto;

-- 2
-- SELECT nombre, precio FROM tienda.producto;
 
-- 3
-- SELECT * FROM tienda.producto;

-- 4
-- SELECT nombre, precio, precio/1.07 FROM tienda.producto;

-- 5
-- SELECT nombre as 'nombre de producto', precio as 'euros', precio/1.07 as 'dolars' FROM tienda.producto;

-- 6
-- SELECT UPPER(nombre), precio FROM tienda.producto;

-- 7
-- SELECT LOWER(nombre), precio FROM tienda.producto;

-- 8
-- SELECT nombre, LEFT(UPPER(nombre),2) FROM fabricante;

-- 9
-- SELECT nombre, ROUND(precio,0) FROM producto;

-- 10
-- SELECT nombre, FLOOR(precio) FROM producto;

-- 11
-- SELECT codigo_fabricante FROM producto;

-- 12
-- SELECT DISTINCT codigo_fabricante FROM producto;

-- 13
-- SELECT nombre FROM fabricante ORDER BY nombre ASC;

-- 14
-- SELECT nombre FROM fabricante ORDER BY nombre DESC;

-- 15
-- SELECT nombre, precio FROM producto ORDER BY nombre ASC, precio DESC;

-- 16
-- SELECT nombre FROM fabricante LIMIT 5;

-- 17
-- SELECT nombre FROM fabricante LIMIT 3,2;

-- 18
-- SELECT nombre, precio FROM producto ORDER BY precio ASC LIMIT 1;

-- 19
-- SELECT nombre, precio FROM producto ORDER BY precio DESC LIMIT 1;

-- 20
-- SELECT nombre FROM producto WHERE codigo_fabricante = 2;

-- 21
-- SELECT producto.nombre, producto.precio, fabricante.nombre FROM producto INNER JOIN fabricante ON producto.codigo_fabricante = fabricante.codigo;

-- 22
-- SELECT producto.nombre, producto.precio, fabricante.nombre FROM producto INNER JOIN fabricante ON producto.codigo_fabricante = fabricante.codigo ORDER BY fabricante.nombre ASC;

-- 23
-- SELECT producto.codigo, producto.nombre, producto.codigo_fabricante, fabricante.nombre FROM producto INNER JOIN fabricante ON fabricante.codigo = producto.codigo_fabricante;

-- 24
-- SELECT producto.nombre, producto.precio, fabricante.nombre FROM producto INNER JOIN fabricante ON fabricante.codigo = producto.codigo_fabricante ORDER BY precio ASC LIMIT 1;

-- 25
-- SELECT producto.nombre, producto.precio, fabricante.nombre FROM producto INNER JOIN fabricante ON fabricante.codigo = producto.codigo_fabricante ORDER BY precio DESC LIMIT 1;

-- 26
-- SELECT * FROM producto INNER JOIN fabricante ON fabricante.codigo = producto.codigo_fabricante WHERE fabricante.nombre = 'Lenovo' ;

-- 27
-- SELECT * FROM producto INNER JOIN fabricante ON fabricante.codigo = producto.codigo_fabricante WHERE fabricante.nombre = 'Crucial' AND producto.precio > 200 ;

-- 28
-- SELECT * FROM producto INNER JOIN fabricante ON fabricante.codigo = producto.codigo_fabricante WHERE fabricante.nombre = ('Asus') OR fabricante.nombre = ('Hewlett-Packard') OR fabricante.nombre = ('Seagate');

-- 29
-- SELECT * FROM producto INNER JOIN fabricante ON fabricante.codigo = producto.codigo_fabricante WHERE fabricante.nombre IN ('Asus','Hewlett-Packard','Seagate');

-- 30
-- SELECT nombre, precio FROM producto WHERE nombre LIKE '%e'; 

-- 31
-- SELECT producto.nombre, precio FROM producto INNER JOIN fabricante ON fabricante.codigo = producto.codigo_fabricante WHERE fabricante.nombre LIKE '%w%';

-- 32
-- SELECT producto.nombre, precio, fabricante.nombre FROM producto INNER JOIN fabricante ON fabricante.codigo = producto.codigo_fabricante WHERE precio >= 180 ORDER BY precio DESC, producto.nombre ASC;

-- 33
-- SELECT DISTINCT fabricante.codigo, fabricante.nombre FROM fabricante INNER JOIN producto ON producto.codigo_fabricante = fabricante.codigo;

-- 34
-- SELECT * FROM fabricante LEFT JOIN producto ON producto.codigo_fabricante = fabricante.codigo;

-- 35
-- SELECT * FROM fabricante LEFT JOIN producto ON producto.codigo_fabricante = fabricante.codigo WHERE producto.codigo_fabricante IS NULL;

-- 36
-- SELECT producto.nombre FROM producto LEFT JOIN fabricante ON fabricante.codigo = producto.codigo_fabricante WHERE fabricante.nombre = 'Lenovo';

-- 37
-- SELECT * FROM producto LEFT JOIN fabricante ON fabricante.codigo = producto.codigo_fabricante WHERE precio > (SELECT precio FROM producto LEFT JOIN fabricante ON fabricante.codigo = producto.codigo_fabricante WHERE fabricante.nombre = 'Lenovo' ORDER BY precio DESC LIMIT 1);

-- 38
-- SELECT producto.nombre FROM producto INNER JOIN fabricante ON fabricante.codigo = producto.codigo_fabricante WHERE fabricante.nombre = 'Lenovo' ORDER BY precio DESC LIMIT 1;

-- 39
-- SELECT producto.nombre FROM producto INNER JOIN fabricante ON fabricante.codigo = producto.codigo_fabricante WHERE fabricante.nombre = 'Hewlett-Packard' ORDER BY precio ASC LIMIT 1;

-- 40
-- SELECT producto.nombre FROM producto INNER JOIN fabricante ON fabricante.codigo = producto.codigo_fabricante WHERE precio >= (SELECT precio FROM producto LEFT JOIN fabricante ON fabricante.codigo = producto.codigo_fabricante WHERE fabricante.nombre = 'Lenovo' ORDER BY precio DESC LIMIT 1);

-- 41
-- SELECT *  FROM producto  LEFT JOIN fabricante  ON fabricante.codigo = producto.codigo_fabricante WHERE fabricante.nombre = 'Asus' AND precio > (SELECT SUM(precio)/COUNT(codigo) FROM producto);
