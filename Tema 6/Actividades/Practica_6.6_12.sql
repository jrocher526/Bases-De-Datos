-- Actividad 6.6
-- Jhonal Roca
-- 1º DAW - Lenguaje DML
-- Funciones de Agregado

USE empresa;

-- 1. Order by, Limit, All, Distinct
-- Obtener los 3 empleados con mayor salario
SELECT * FROM empleados ORDER BY salario DESC LIMIT 3;

-- Obtener los 5 empleados con menor salario
SELECT * FROM empleados ORDER BY salario ASC LIMIT 5;

-- Obtener los empleados ordenados alfabeticamente
SELECT * FROM empleados ORDER BY nombre ASC;

-- Obtener los primeros 3 departamentos
SELECT * FROM departamentos ORDER BY id ASC LIMIT 3;

-- Obtener los 3 empleados con mayores salarios del departamento 3
SELECT e.* FROM empleados e
        JOIN departamentos d ON e.id = e.id
WHERE d.id = 3
ORDER BY e.salario DESC LIMIT 3;

-- 2. Funcion COUNT()
-- 1. Obtener el número total de departamentos
SELECT COUNT(id) AS Total_Departamentos FROM departamentos; 

-- 2. Obtener el número total de beneficiarios de sexo ‘M’ mujer
SELECT COUNT(id) AS Beneficiarios FROM beneficiarios WHERE genero = 'M';

-- 3. Obtener el número total de empleados cuyo salario esté comprendido entre 20000 y 50000.
SELECT COUNT(salario) AS Comprometidos FROM empleados WHERE salario BETWEEN 20000 AND 50000;

-- 4. Obtener el número total de empleados nacidos después del 1970, no inclusive.
SELECT COUNT(id) AS Total FROM empleados WHERE fecha_nac > '1970-12-31';

-- 5. Obtener el número total de proyectos asignados al departamento 3.
SELECT COUNT(id) AS Total FROM proyectos WHERE departamento_id =3;

-- 6. Obtener le número de departamentos que están realizando un proyecto.
SELECT COUNT(DISTINCT departamento_id) AS departamentos_activos FROM Proyectos;

-- 7. Obtener el número de empleados que están trabajando en algún proyecto.
SELECT COUNT(DISTINCT empleado_id) AS Total FROM empleados_proyectos;

-- 3. Funcion SUM()
-- 1. Obtener el total de horas trabajadas en los distintos proyectos.
SELECT SUM(horas) AS horas FROM empleados_proyectos;

-- 2. Obtener el total de horas trabajadas en el proyecto 2.
SELECT SUM(horas) Total FROM empleados_proyectos WHERE proyecto_id = 2;

-- 3. Obtener la suma total de los salarios de los empleados.
SELECT SUM(salario) AS Total FROM empleados;

-- 4. Obtener la suma total de los salarios de los empleados del departamento 5
SELECT SUM(salario) AS Total FROM empleados WHERE departamento_id = 5;

-- 5. Obtener la suma total de los salarios de los empleados cuyo número de supervisor es 3
SELECT SUM(salario) AS Total FROM empleados WHERE supervisor_id = 3;

-- 6. Obtener el número de empleados y la suma total de sus salarios del departamento 1
SELECT SUM(salario) AS Total_salario, COUNT(id) AS N_empleados FROM empleados WHERE departamento_id = 1;

-- 4. Funcion AVG()
-- 1. Obtener la media total de horas trabajadas en los proyectos
SELECT AVG(horas) AS Horas FROM empleados_proyectos;

-- 2. Obtener número total de jornadas trabajadas, suma total y media de horas trabajadas en los proyectos.
SELECT SUM(horas) AS Total_horas, AVG(horas) AS Media_hroas, COUNT(fecha) AS Jornadas FROM empleados_proyectos;

-- 3. Obtener número de empleados, suma total de sus salarios, media de sus salarios de los empleados del departamento 3.
SELECT COUNT(id) AS Empleados, SUM(salario) AS Salarios, AVG(salario) AS Salario FROM empleados WHERE departamento_id = 3;

-- 4. Obtener el salario medio de todos los empleados.
SELECT AVG(salario) AS Media_salarial FROM Empleados;

-- 5. Obtener el número total de empleados, salario medio y suma total de salarios de los empleados.
SELECT COUNT(id) AS Empleados, AVG(salario) AS Media_salarial, SUM(salario) AS Total_salarial FROM empleados;

-- 6. Obtener el número de empleados y salario medio de los nacidos entre 1960 y 1980.
SELECT COUNT(id) AS Empleados, AVG(salario) AS Media_salarial FROM empleados WHERE fecha_nac BETWEEN '1960-01-01' AND '1980-12-31';

-- 7. Obtener aquellos empleados cuyo salario este por encima del salario medio.
SELECT nombre, apellidos, salario FROM empleados WHERE salario > (SELECT AVG(salario) FROM empleados);

-- 8. Obtener aquellos empleados cuyo salario esté por debajo del salario medio de los empleados del departamento 3.
SELECT nombre, apellidos, salario FROM empleados WHERE salario < (SELECT AVG(salario) FROM empleados);

-- 9. Obtener el NSS, Nombre, Apellido de los empleados que hayan trabajado en algún proyecto por encima de la media de horas trabajadas. 4
SELECT e.nss, e.nombre, e.apellidos FROM empleados e
	JOIN empleados_proyectos ep ON e.id = ep.empleado_id
WHERE ep.horas > (SELECT AVG(horas) FROM empleados_proyectos);

-- 5. Funcion MIN(), MAX()
-- 1. Obtener el salario maximo
SELECT MAX(salario) AS Salario_max FROM empleados;

-- 2. Obtener el salario mínimo
SELECT MIN(salario) AS Salario_min FROM empleados;

-- 3. Obtener máximo de horas trabajadas en un proyecto
SELECT MAX(horas) AS Max_horas FROM empleados_proyectos;

-- 4. Obtener los datos de los empleados con el salario máximo
SELECT nombre, apellidos, salario FROM empleados WHERE salario = (SELECT MAX(salario) FROM empleados);

-- 5. Obtener los datos del o de los empleados con el salario mínimo
SELECT nombre, apellidos, salario FROM empleados WHERE salario = (SELECT MIN(salario) FROM empleados);

-- 6. Obtener el NSSE del empleado con máximo de horas trabajadas en un proyecto.
SELECT e.nss FROM empleados e
	JOIN empleados_proyectos ep ON e.id = ep.empleado_id 
WHERE ep.horas = (SELECT MAX(horas) FROM empleados_proyectos);

-- 7. Obtener el NSS, Nombre, Apellidos de los empleados que hayan trabajado en las horas máximas en un proyecto.
SELECT e.nss, e.nombre, e.apellidos FROM empleados e
	JOIN empleados_proyectos ep ON e.id = ep.empleado_id
WHERE ep.horas = (SELECT MAX(horas) FROM empleados_proyectos);

-- 8. Obtener el NSS de los empleados con horas mínimas trabajadas.
SELECT e.nss FROM empleados e
	JOIN empleados_proyectos ep ON e.id = ep.empleado_id 
WHERE ep.horas = (SELECT MIN(horas) FROM empleados_proyectos);

-- 9. Obtener el NSS, Nombre, Apellidos de los empleados que han trabajado en los proyectos en tiempo de horas mínimos.
SELECT e.nss, e.nombre, e.apellidos FROM empleados e
	JOIN empleados_proyectos ep ON e.id = ep.empleado_id
WHERE ep.horas = (SELECT MIN(horas) FROM empleados_proyectos);