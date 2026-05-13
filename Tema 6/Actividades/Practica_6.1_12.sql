-- Actividad 6.1
-- Jhonal Roca

-- Descropcion: mina de datos de la bbdd futbol
USE futbol;

-- Tabla equipos
INSERT INTO equipos VALUES
(NULL, 'Caracas FC', 'Estadio Olímpico de la UCV', 24000, 1967, 'Caracas'),
(NULL, 'Deportivo Táchira', 'Estadio Polideportivo de Pueblo Nuevo', 38500, 1974, 'San Cristóbal'),
(NULL, 'Metropolitanos FC', 'Estadio Olímpico de la UCV', 24000, 2012, 'Caracas'),
(NULL, 'Carabobo FC', 'Estadio Misael Delgado', 10400, 1997, 'Valencia'),
(NULL, 'Trujillanos FC', 'Estadio José Alberto Pérez', 25000, 1981, 'Valera');

-- Tabla jugadores
INSERT INTO jugadores VALUES
(NULL, 'Salomón Rondón', '1989-09-16', 1),
(NULL, 'Juan Arango', '1980-05-16', 2),
(NULL, 'José “El Brujo” Flores', '1992-04-21', 3),
(NULL, 'Edson Castillo', '1991-10-15', 4),
(NULL, 'José “Miku” Fedor', '1985-12-06', 5);

-- Tabla partidos
INSERT INTO partidos VALUES
(NULL, 1, 2, '2024-03-10 18:00:00', 1, 2, 'Clásico Nacional'),
(NULL, 3, 4, '2024-04-05 20:30:00', 0, 0, 'Duelo intenso'),
(NULL, 2, 5, '2024-05-12 19:45:00', 3, 1, 'Victoria local'),
(NULL, 4, 1, '2024-06-18 21:00:00', 1, 2, 'Remontada visitante'),
(NULL, 5, 3, '2024-07-20 20:00:00', 2, 2, 'Empate');

-- Tabla goles
INSERT INTO goles VALUES
(NULL, 1, 22, 'Gol de Rondón', 1),
(NULL, 1, 78, 'Gol de Arango', 2),
(NULL, 3, 55, 'Gol de Flores', 3),
(NULL, 4, 60, 'Gol de Castillo', 4),
(NULL, 5, 80, 'Gol de Miku', 5);
