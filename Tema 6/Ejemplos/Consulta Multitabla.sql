-- Ejemplo 01: Producto cartesiano entre las tablas corredores y clubs
SELECT 
    *
FROM
    corredores,
    CLUBS;

-- Ejemplo 02:
-- Relaciona cada corredo con el club al que le pertenece
SELECT 
    *
FROM
    corredores,
    clubs
WHERE
    corredores.club_id = clubs.id;

-- Ejemplo 03:
-- Mismo que el anterior pero usand alias
SELECT 
    *
FROM
    corredores co,
    clubs cl
WHERE
    co.club_id = cl.id;

-- Ejemplo 04:
-- Mismo que el anterior pero estableciendo lista de columnas
SELECT 
    co.id,
    co.apellidos,
    co.nombre,
    co.edad,
    co.club_id,
    cl.nombre,
    cl.NombreCorto
FROM
    corredores co,
    clubs cl
WHERE
    co.club_id = cl.id;

-- Ejemplo 05: 
-- Con INNER JOIN 
SELECT 
    co.id,
    co.apellidos,
    co.nombre,
    co.ciudad,
    co.edad,
    cl.nombre AS club
FROM
    corredores AS co
        INNER JOIN
    clubs AS cl ON co.club_id = cl.id;

-- Ejemplo 06
-- Relaciona tres tablas con INNER JOIN
SELECT 
    co.id,
    co.apellidos,
    co.nombre,
    co.ciudad,
    co.edad,
    cl.nombre AS club,
    ca.nombrecorto AS categoria
FROM
    corredores AS co
        INNER JOIN
    clubs AS cl ON co.club_id = cl.id
        INNER JOIN
    categorias ca ON co.categoria_id = ca.id;
    
-- EJEMPLO 07
-- LEFT JOIN - Muestra todos los corredores aunque no estén relacionados
-- con ningún registro de la tabla clubs
SELECT 
    co.id,
    co.apellidos,
    co.nombre,
    co.ciudad,
    co.edad,
    cl.nombre AS club
FROM
    corredores AS co
        LEFT JOIN
    clubs AS cl ON co.club_id = cl.id;