-- Actividad 6.2
-- Jhonal Roca
USE futbol;

-- 1️ Cambiar el nombre del equipo Girona FC a Girona Futbol Club
UPDATE equipos 
SET 
    nombre = 'Girona Futbol Club'
WHERE
    id = 10;

-- 2️ Actualizar la ciudad de Villarreal CF a "Vila-real"
UPDATE equipos 
SET 
    ciudad = 'Vila-real'
WHERE
    id = 7;

-- 3️ Incrementar en 1.000 el aforo de los equipos con aforo > 50.000
UPDATE equipos 
SET 
    aforo = aforo + 1000
WHERE
    aforo > 50000;

-- 4️ Cambiar el equipo de Hugo Duro al Villarreal CF (id = 7)
UPDATE jugadores 
SET 
    equipo_id = 7
WHERE
    id = 17;

-- 5️ Corregir la fecha de nacimiento de Takefusa Kubo
UPDATE jugadores 
SET 
    fecha_nac = '2001-06-05'
WHERE
    id = 23;

-- 6️ Ajustar goles del partido id = 7 a 2-1
UPDATE partidos 
SET 
    goles_casa = 2,
    goles_fuera = 1
WHERE
    id = 7;

-- 7️ Añadir "(actualizado)" a las observaciones de los 3 últimos partidos
UPDATE partidos 
SET 
    observaciones = CONCAT_WS(' ', observaciones, ' (actualizado)')
ORDER BY fecha DESC LIMIT 3;

-- 8️ Retrasar 1 minuto todos los goles que sean de penalti
UPDATE goles 
SET 
    minuto = minuto + 1
WHERE
    descripcion LIKE '%penalti%';

-- 9️ Asignar a Gerard Moreno (id = 18) los goles del partido 13 del equipo de casa
UPDATE goles 
SET 
    jugador_id = 18
WHERE
    partido_id = 13
        AND jugador_id IN (SELECT 
            id
        FROM
            jugadores
        WHERE
            equipo_id = (SELECT 
                    equipo_casa_id
                FROM
                    partidos
                WHERE
                    id = 13));

-- 10 Sumar 1 minuto a los 2 primeros goles de Iñaki Williams
UPDATE goles 
SET 
    minuto = minuto + 1
WHERE
    jugador_id = 20 ORDER BY minuto LIMIT 2;

-- 1️1 Cambiar el estadio de la Real Sociedad
UPDATE equipos 
SET 
    estadio = 'Reale Arena Nuevo'
WHERE
    id = 9;

-- 12 Mover todos los jugadores del Girona al Athletic Club (id = 8)
UPDATE jugadores 
SET 
    equipo_id = 8
WHERE
    equipo_id = 10;

-- 1️3 Sumar 1 gol al equipo local cuando Valencia CF juega en casa
UPDATE partidos 
SET 
    goles_casa = goles_casa + 1
WHERE
    equipo_casa_id = 6;

-- 1️4 Restar 2 minutos a los goles con minuto mayor a 80
UPDATE goles 
SET 
    minuto = minuto - 2
WHERE
    minuto > 80;

-- 15 Renombrar a José Luis Gayà como José Gayà
UPDATE jugadores 
SET 
    nombre = 'José Gayà'
WHERE
    id = 16;