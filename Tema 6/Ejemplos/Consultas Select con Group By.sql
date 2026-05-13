use maratoon;
select avg(edad) from corredores;
-- Selecciona la Edad media de los corredores del club 1
SELECT 
    AVG(edad)
FROM
    corredores
WHERE
    club_id = 1;
-- 
    SELECT 
    AVG(edad)
FROM
    corredores
WHERE
    club_id = (SELECT 
            id
        FROM
            clubs
        WHERE
            nombrecorto = 'NUT');

-- Número de corredores inscritos de cada ciudad

SELECT 
    ciudad,
    count(*) 'Num_Inscritos'
FROM 
	corredores
GROUP BY
	ciudad;
    
-- Ciudades con más de 5 inscritos

SELECT 
    ciudad,
    count(*) 'Num_Inscritos'
FROM 
	corredores
GROUP BY
	ciudad
HAVING Num_Inscritos > 5;

-- Ciudades con más de 5 inscritos mayores de 18 años

SELECT 
    ciudad,
    count(*) 'Num_Inscritos'
FROM 
	corredores
WHERE edad > 18
GROUP BY
	ciudad
HAVING Num_Inscritos > 5;

-- Muestra el número de corredores inscritos de cada categoría
SELECT 
	categoria_id,
    count(*) 'Num_Corredores'
FROM 
	corredores 
GROUP BY
	categoria_id
ORDER BY
	categoria_id;
-- Muestra además el nombre corto y nombre de la categoría
-- para que el resultado sea más descriptivo
SELECT 
	co.categoria_id,
    ca.nombrecorto,
    ca.nombre,
    count(*) 'Num_Corredores'
FROM 
	corredores co
INNER JOIN
	categorias ca
ON co.categoria_id = ca.id
GROUP BY
	categoria_id
ORDER BY
	categoria_id;

-- Muestra la edad media, maxima, minima y los miembros 
SELECT 
    cl.id,
    cl.Nombre,
    AVG(co.edad) AS 'Edad Media',
    MAX(co.edad) AS 'Edad Máxima',
    MIN(co.Edad) AS 'Edad Mínima',
    COUNT(*) AS 'Miembros'
FROM
    Corredores co
        INNER JOIN
    Clubs cl ON co.club_id = cl.id
GROUP BY co.club_id;
-- Cuenta el numero de corredores de cada club
SELECT 
	cl.id,
    cl.nombre 'Club',
    count(*) 'Num_Corredores'
FROM 
	corredores co
    INNER JOIN
    clubs cl ON co.club_id = cl.id
GROUP BY
	co.club_id;