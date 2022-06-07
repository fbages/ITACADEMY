USE universidad;
-- 1
-- SELECT apellido1, apellido2, nombre FROM persona WHERE tipo = 'alumno' ORDER BY apellido1, apellido2, nombre ASC;

-- 2
-- SELECT nombre, apellido1, apellido2 FROM persona WHERE tipo = 'alumno' AND telefono IS NULL;

-- 3
-- SELECT * FROM persona WHERE tipo = 'alumno' AND YEAR(fecha_nacimiento) = '1999';

-- 4
-- SELECT * FROM persona WHERE tipo = 'profesor' AND telefono IS NULL AND nif LIKE '%K' ;

-- 5
-- SELECT * FROM asignatura WHERE cuatrimestre = 1 AND curso = 3 AND id_grado = 7;

-- 6
 -- SELECT  persona.apellido1, persona.apellido2, persona.nombre, departamento.nombre FROM persona LEFT JOIN profesor ON persona.id = profesor.id_profesor INNER JOIN departamento ON departamento.id = profesor.id_departamento ORDER BY persona.apellido1, persona.apellido2, persona.nombre ASC;

-- 7
 -- SELECT asignatura.nombre, curso_escolar.anyo_inicio, curso_escolar.anyo_fin FROM asignatura INNER JOIN alumno_se_matricula_asignatura ON alumno_se_matricula_asignatura.id_asignatura = asignatura.id INNER JOIN persona ON alumno_se_matricula_asignatura.id_alumno = persona.id INNER JOIN curso_escolar ON curso_escolar.id=alumno_se_matricula_asignatura.id_curso_escolar WHERE nif = '26902806M';
 
 -- 8
 -- SELECT DISTINCT departamento.nombre AS 'Departamento' FROM persona INNER JOIN profesor ON profesor.id_profesor = persona.id INNER JOIN departamento ON departamento.id = profesor.id_departamento INNER JOIN asignatura ON asignatura.id_profesor = profesor.id_profesor INNER JOIN grado ON grado.id = asignatura.id_grado WHERE persona.tipo = 'profesor' AND grado.nombre = 'Grado en Ingeniería Informática (Plan 2015)';
 
 -- 9
 -- SELECT DISTINCT persona.nombre, persona.apellido1, persona.apellido2 FROM persona LEFT JOIN alumno_se_matricula_asignatura ON persona.id = alumno_se_matricula_asignatura.id_alumno LEFT JOIN curso_escolar ON curso_escolar.id = alumno_se_matricula_asignatura.id_curso_escolar WHERE curso_escolar.anyo_inicio = '2018';
 
 -- SECCIO LEFT JOIN I RIGHT JOIN
 -- 1
 -- SELECT departamento.nombre AS 'DEPARTAMENTO', persona.nombre, persona.apellido1, persona.apellido2 FROM persona LEFT JOIN profesor ON profesor.id_profesor = persona.id LEFT JOIN departamento ON departamento.id = profesor.id_departamento WHERE persona.tipo = 'profesor' ORDER BY departamento.nombre ASC, persona.apellido1 ASC, persona.apellido2 ASC, persona.nombre ASC;
 
 -- 2
-- SELECT persona.nombre, persona.apellido1, persona.apellido2 FROM persona LEFT JOIN profesor ON profesor.id_profesor = persona.id LEFT JOIN departamento ON departamento.id = profesor.id_departamento WHERE profesor.id_departamento IS NULL AND persona.tipo = 'profesor';
 
 -- 3
 -- SELECT departamento.nombre AS 'DEPARTAMENTO' FROM departamento LEFT JOIN profesor ON departamento.id = profesor.id_departamento WHERE profesor.id_departamento IS NULL;
 
 -- 4
 -- SELECT * FROM persona LEFT JOIN profesor ON profesor.id_profesor = persona.id LEFT JOIN asignatura ON asignatura.id_profesor = profesor.id_profesor WHERE asignatura.id_profesor IS NULL AND persona.tipo = 'profesor';
 
 -- 5
-- SELECT asignatura.nombre FROM asignatura LEFT JOIN profesor ON profesor.id_profesor = asignatura.id_profesor WHERE profesor.id_profesor IS NULL;

-- 6
/* no va
SELECT ALL * 
FROM departamento 
LEFT JOIN profesor 
ON profesor.id_departamento = departamento.id 
LEFT JOIN asignatura ON asignatura.id_profesor = profesor.id_profesor 
LEFT JOIN alumno_se_matricula_asignatura 
ON alumno_se_matricula_asignatura.id_asignatura = asignatura.id 
LEFT JOIN curso_escolar 
ON curso_escolar.id = alumno_se_matricula_asignatura.id_curso_escolar 
WHERE departamento.id = ALL( SELECT curso_escolar.id FROM curso_escolar WHERE curso_escolar.id IS NULL);
;
*/
-- Consultes resum
-- 1
-- SELECT COUNT(persona.id) FROM persona WHERE persona.tipo = 'alumno';

-- 2
-- SELECT COUNT(persona.id) FROM persona WHERE persona.tipo = 'alumno' AND YEAR(persona.fecha_nacimiento)='1999';

-- 3
-- SELECT departamento.nombre, COUNT(profesor.id_profesor) FROM departamento INNER JOIN profesor ON profesor.id_departamento = departamento.id GROUP BY departamento.id	 ORDER BY COUNT(profesor.id_profesor) DESC;

-- 4
-- SELECT departamento.nombre, COUNT(profesor.id_profesor) FROM departamento LEFT JOIN profesor ON profesor.id_departamento = departamento.id GROUP BY departamento.id ORDER BY COUNT(profesor.id_profesor) ASC; 

-- 5
--  SELECT grado.nombre, COUNT(asignatura.id) FROM grado LEFT JOIN asignatura ON asignatura.id_grado = grado.id GROUP BY grado.id ORDER BY COUNT(asignatura.id) DESC;

-- 6
-- SELECT grado.nombre, COUNT(asignatura.id) FROM grado INNER JOIN asignatura ON asignatura.id_grado = grado.id  GROUP BY grado.id HAVING COUNT(asignatura.id)>40  ORDER BY COUNT(asignatura.id) DESC;

-- 7
-- SELECT grado.nombre, asignatura.tipo, COUNT(asignatura.creditos) FROM grado LEFT JOIN asignatura ON asignatura.id_grado = grado.id GROUP BY grado.id, asignatura.tipo;

-- 8
-- SELECT curso_escolar.anyo_inicio, COUNT(persona.id) FROM curso_escolar INNER JOIN alumno_se_matricula_asignatura ON alumno_se_matricula_asignatura.id_curso_escolar = curso_escolar.id INNER JOIN persona ON persona.id	= alumno_se_matricula_asignatura.id_alumno WHERE persona.tipo = 'alumno' GROUP BY curso_escolar.id;

-- 9
-- SELECT persona.id, persona.nombre, persona.apellido1, persona.apellido2, COUNT(asignatura.id) FROM persona INNER JOIN profesor ON profesor.id_profesor = persona.id INNER JOIN asignatura ON asignatura.id_profesor = profesor.id_profesor GROUP BY persona.id;

-- 10
-- SELECT * FROM persona WHERE persona.tipo = 'alumno' AND YEAR(fecha_nacimiento) = (SELECT MIN(YEAR(fecha_nacimiento)) FROM persona WHERE persona.tipo = 'alumno');

-- 11
-- SELECT * FROM persona LEFT JOIN profesor ON profesor.id_profesor = persona.id LEFT JOIN departamento ON departamento.id = profesor.id_departamento LEFT JOIN asignatura ON asignatura.id_profesor = profesor.id_profesor WHERE asignatura.id IS NULL AND departamento.id IS NOT NULL;

