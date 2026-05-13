-- Actividad 6.8 
-- Jhonal Roca
-- BDD - DML

-- Consultas multitablas 

-- Activamos la base de datos 
USE futbol;

-- 1. Realiza un producto cartesiano entre las tablas jugadores y equipos
SELECT * FROM jugadores, equipos;

-- 2. Realiza un producto cartesiano entre la tablas jugadores y goles
SELECT * FROM jugadores, goles;

-- 3. Realiza un producto cartesiano entre las tablas jugadores y equipos eliminando los registros espurios (where).
SELECT * FROM jugadores, equipos WHERE jugadores.equipo_id = equipos.id;

-- 4. Realiza un producto cartesiano entre las tablas jugadores y goles eliminando los registros espurios (where)
SELECT * FROM jugadores, goles WHERE jugadores.id = goles.jugador_id;

-- 5. Realiza INNER JOIN correcto entre las tablas jugadores y equipos, devolver todas las columnas de jugadores y de equipos.
SELECT * FROM jugadores JOIN equipos ON jugadores.equipo_id = equipos.id;

-- 6. Realiza INNER JOIN correcto entre las tablas jugadores y equipos, devolver las columnas id, nombre, edad y equipo
SELECT j.id, j.nombre, TIMESTAMPDIFF(YEAR, fecha_nac, CURDATE()) edad, e.nombre AS Equipo FROM jugadores j JOIN equipos e ON j.equipo_id = e.id;

-- 7. Realizar INNER JOIN correcto entre las tablas jugadores y goles.
SELECT * FROM jugadores JOIN goles ON jugadores.id = goles.jugador_id;

-- 8. Realiza INNER JOIN correcto entre las tablas jugadores y goles, devolver las columnas id, nombre, minuto, descripción
SELECT j.id, j.nombre, g.minuto, g.descripcion FROM jugadores j JOIN goles g ON j.id = g.jugador_id;

-- 9. Realizar INNER JOIN correcto entre las tablas jugadores, equipos y goles.
SELECT * FROM jugadores JOIN equipos ON jugadores.equipo_id = equipos.id JOIN goles ON jugadores.id = goles.jugador_id;

-- 10. Realiza INNER JOIN correcto entre las tablas jugadores y goles, devolver las columnas id, nombre, equipo, minuto, descripción
SELECT j.id, j.nombre, j.equipo_id AS Equipo, g.minuto, g.descripcion FROM jugadores j JOIN goles g ON j.id = g.jugador_id;

-- 11. Realizar INNER JOIN correcto entre las tablas jugadores, equipos, goles y partidos. Todas las columnas
SELECT * FROM jugadores JOIN equipos ON jugadores.equipo_id = equipos.id 
						JOIN goles ON jugadores.id = goles.jugador_id 
                        JOIN partidos ON goles.partido_id = partidos.id;

-- 12. Realiza INNER JOIN correcto entre las tablas jugadores y goles, devolver las columnas id, nombre, equipo, minuto, descripción, observaciones
SELECT j.id, j.nombre, j.equipo_id AS Equipo, g.minuto, g.descripcion FROM jugadores j JOIN goles g ON j.id = g.jugador_id;

