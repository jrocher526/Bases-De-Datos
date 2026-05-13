-- Actividad 6.5
-- Jhonal Roca
-- BDD - 1º DAW

-- 1. Consultas Basicas

SELECT * FROM jugadores;
SELECT * FROM equipos;
SELECT * FROM partidos;

SELECT *
FROM partidos
ORDER BY fecha DESC
LIMIT 3;


-- 2. Consultas con Limit

SELECT *
FROM goles
ORDER BY minuto
LIMIT 5;

SELECT *
FROM goles
LIMIT 4,6;

SELECT *
FROM partidos
ORDER BY fecha DESC
LIMIT 3;

SELECT *
FROM partidos
WHERE equipo_fuera_id = 5
LIMIT 1;

SELECT *
FROM partidos
WHERE goles_fuera = 0
LIMIT 1;

SELECT *
FROM goles
LIMIT 3,5;


-- 3. Lista de Columnas

SELECT id, nombre, equipo_id
FROM jugadores;

SELECT id AS Numero,
       nombre AS "Nombre Jugador",
       equipo_id AS "Código Equipo"
FROM jugadores;

SELECT id Numero,
       nombre "Nombre Jugador",
       equipo_id "Código Equipo"
FROM jugadores;

SELECT jugadores.id,
       jugadores.nombre,
       jugadores.equipo_id
FROM jugadores;

SELECT futbol.jugadores.id,
       futbol.jugadores.nombre,
       futbol.jugadores.equipo_id
FROM futbol.jugadores;

SELECT (32 + (0.33 * 10)) / 4;


-- 4. Consultas con Where

SELECT *
FROM jugadores
WHERE equipo_id = 2;

SELECT *
FROM jugadores
WHERE id = 4;

SELECT *
FROM jugadores
WHERE equipo_id = 2
ORDER BY fecha_nac DESC
LIMIT 3;

SELECT *
FROM equipos
WHERE aforo > 10000;

SELECT *
FROM equipos
WHERE aforo > 12000
AND fundacion > 1970;

SELECT *
FROM goles
WHERE jugador_id = 1;

SELECT g.*
FROM goles g
JOIN partidos p ON g.partido_id = p.id
JOIN jugadores j ON g.jugador_id = j.id
WHERE g.jugador_id = 1
AND p.equipo_casa_id = j.equipo_id;

SELECT *
FROM jugadores
WHERE nombre LIKE 'Lamine%';

SELECT *
FROM jugadores
WHERE equipo_id = 1
AND nombre LIKE 'Jude%';

SELECT *
FROM partidos
WHERE equipo_casa_id = 3
AND goles_casa > goles_fuera;

SELECT *
FROM partidos
WHERE goles_casa > goles_fuera;

SELECT *
FROM partidos
WHERE goles_casa = goles_fuera;

SELECT *
FROM partidos
WHERE goles_fuera > goles_casa;

SELECT *
FROM partidos
WHERE ABS(goles_casa - goles_fuera) > 1;


-- 5. Consultas in, Between, like

SELECT *
FROM jugadores
WHERE equipo_id IN (1,2,5);

SELECT *
FROM equipos
WHERE aforo BETWEEN 40000 AND 80000;

SELECT *
FROM equipos
WHERE aforo >= 30000;

SELECT *
FROM jugadores
WHERE fecha_nac BETWEEN '1995-01-01' AND '2000-12-31';

SELECT *
FROM jugadores
WHERE nombre LIKE 'D%';

SELECT *
FROM jugadores
WHERE nombre LIKE '%Alarcón%';


-- 6. Order by

SELECT *
FROM jugadores
ORDER BY nombre DESC;

SELECT *
FROM equipos
ORDER BY aforo DESC;

SELECT *
FROM jugadores
ORDER BY equipo_id, nombre;

SELECT *
FROM jugadores
WHERE equipo_id = 1
ORDER BY fecha_nac ASC;

SELECT *
FROM jugadores
WHERE equipo_id = 2
ORDER BY fecha_nac DESC;