-- Actividad 6.3 
-- Jhonal Roca
-- Comando DELETE

USE futbol;

-- 1. Eliminar a Aleix Garcia - Tabla jugadores
-- Comprobación
SELECT 
    *
FROM
    jugadores
WHERE
    nombre = 'Aleix García';

-- Eliminación
DELETE FROM jugadores 
WHERE
    id = 25 LIMIT 1;

-- 2.Elimana los goles correspondientes al partido cuyo id = 7
-- Comprobación
SELECT 
    *
FROM
    goles
WHERE
    partido_id = 7;

-- Eliminación
DELETE FROM goles 
WHERE
    partido_id = 7;
    
-- 3. Borrar todos los goles anotados despues del minuto 85 
-- Comprobación
SELECT 
    *
FROM
    goles
WHERE
    minuto > 85;

-- Eliminación
DELETE FROM goles 
WHERE
    minuto > 85;

-- 4. Elimina todos los partidos que hayan terminado con 0 goles por parte de ambos equipos
-- Comprobación
SELECT 
    *
FROM
    partidos
WHERE
    goles_casa = 0 AND goles_fuera = 0;

-- Eliminación
DELETE FROM partidos 
WHERE
    goles_casa = 0 AND goles_fuera = 0;
    
-- 5. Elimina jugadores que no tengan equipo asignado
-- Comprobación
SELECT 
    *
FROM
    jugadores
WHERE
    equipo_id IS NULL;

-- Eliminación
DELETE FROM jugadores 
WHERE
    equipo_id IS NULL;
    
-- 6. Elimina todos lo s goles marcados por Gerald Moreno
-- Comprobación
SELECT 
    *
FROM
    goles
WHERE
    jugador_id IN (SELECT 
            id
        FROM
            jugadores
        WHERE
            nombre = 'Gerard Moreno');

-- Eliminación
DELETE FROM goles 
WHERE
    jugador_id IN (SELECT 
        id
    FROM
        jugadores
    
    WHERE
        nombre = 'Gerard Moreno');

-- 7. Eliminal los dos ultimos goles insertados en la tabla gooles
-- Comprobación
SELECT 
    *
FROM
    goles
ORDER BY id DESC
LIMIT 2;

-- Eliminación
DELETE FROM goles ORDER BY id DESC LIMIT 2;

-- 8. Elimina todos los partidos disputados antes del 1 de abril de 2024
-- Comprobación
SELECT 
    *
FROM
    partidos
WHERE
    fecha < '2024-04-01';
    
-- Goles afectados
SELECT 
    *
FROM
    goles
WHERE
    partido_id IN (SELECT 
            id
        FROM
            partidos
        WHERE
            fecha < '2024-04-01');

-- Borramos goles
DELETE FROM goles 
WHERE
    partido_id IN (SELECT 
        id
    FROM
        partidos
    WHERE
        fecha < '2024-04-01');
 
 -- Borramos partidos 
DELETE FROM partidos 
WHERE
    fecha < '2024-04-01';

-- 9. Elimina los goles del partido id = 11 que hayan marcado antes del minuto 30	
-- Comprobación
SELECT 
    *
FROM
    goles
WHERE
    partido_id = 11 AND minuto < 30;
-- Eliminación
DELETE FROM goles 
WHERE
    partido_id = 11 AND minuto < 30;
    
-- 10. Elimina el equipo Girona FC, asegurandote que no tenga jugadores asociados 
-- Comprobación del equipo
SELECT 
    *
FROM
    equipos
WHERE
    id = 10;

-- Comprobación de jugadores asociados
SELECT 
    *
FROM
    jugadores
WHERE
    equipo_id = (SELECT 
            id
        FROM
            equipos
        WHERE
            id = 10);

-- Eliminación
DELETE FROM equipos 
WHERE
    id = 10 LIMIT 1;




