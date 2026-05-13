-- Creamos la Base de Datos y la ponemos en uso
DROP DATABASE IF EXISTS lvbp;
CREATE DATABASE IF NOT EXISTS lvbp;

USE lvbp;

-- Cramos tablas principales

-- 1. TEMPORADAS
DROP TABLE IF EXISTS Temporadas;
CREATE TABLE IF NOT EXISTS Temporadas (
    id INT UNSIGNED AUTO_INCREMENT PRIMARY KEY,
    fecha_inicio DATE,
    fecha_fin DATE,
    descripcion VARCHAR(100)
);

-- 2. EQUIPOS
DROP TABLE IF EXISTS Equipos;
CREATE TABLE IF NOT EXISTS Equipos (
    id INT UNSIGNED AUTO_INCREMENT PRIMARY KEY,
    nombre VARCHAR(50),
    ciudad VARCHAR(50),
    fundacion YEAR
);

-- 3. ESTADIOS
DROP TABLE IF EXISTS Estadios;
CREATE TABLE IF NOT EXISTS Estadios (
    id INT UNSIGNED AUTO_INCREMENT PRIMARY KEY,
    nombre VARCHAR(100),
    capacidad INT, 
    ciudad VARCHAR(50)
);

-- 4. AMPAYERS 
DROP TABLE IF EXISTS Ampayers;
CREATE TABLE IF NOT EXISTS Ampayers (
    id INT UNSIGNED AUTO_INCREMENT PRIMARY KEY,
    nombre VARCHAR(50),
    apellido VARCHAR(50),
    especialidad VARCHAR(30),
    nacionalidad VARCHAR(30),
    experiencia SMALLINT,
    fecha_nac DATE,
    edad INT UNSIGNED
);

-- 5. JUGADORES
DROP TABLE IF EXISTS Jugadores;
CREATE TABLE IF NOT EXISTS Jugadores (
    id INT UNSIGNED AUTO_INCREMENT PRIMARY KEY,
    nombre VARCHAR(50),
    apellido VARCHAR(50),
    fecha_nac DATE,
    nacionalidad VARCHAR(30),
    altura DECIMAL(3,2),
    posicion VARCHAR(20),
    edad INT UNSIGNED
);

-- 6. PARTIDOS
DROP TABLE IF EXISTS Partidos;
CREATE TABLE IF NOT EXISTS Partidos (
    id INT UNSIGNED AUTO_INCREMENT PRIMARY KEY,
    fecha_hora DATETIME,
    espectadores INT 
);

-- Creamos las tablas de Relacion

-- PARTIDOS-TEMPORADAS
DROP TABLE IF EXISTS Estadisticas_Partidos_Temporadas;
CREATE TABLE IF NOT EXISTS Estadisticas_Partidos_Temporadas (
    partido_id INT UNSIGNED PRIMARY KEY,
    temporada_id INT UNSIGNED NOT NULL,
    carreras_anotadas INT,
    errores INT,
    hits INT,
    FOREIGN KEY (partido_id) REFERENCES Partidos(id)
        ON DELETE CASCADE
        ON UPDATE CASCADE,
    FOREIGN KEY (temporada_id) REFERENCES Temporadas(id)
        ON DELETE RESTRICT
        ON UPDATE CASCADE
);

-- PARTIDOS-JUGADORES
DROP TABLE IF EXISTS Estadisticas_Jugadores;
CREATE TABLE IF NOT EXISTS Estadisticas_Jugadores (
    partido_id INT UNSIGNED,
    jugador_id INT UNSIGNED,
    carreras_anotadas INT,
    carreras_impulsadas INT,
    home_run INT,
    errores INT,
    bases_robadas INT,
    PRIMARY KEY (partido_id, jugador_id),
    FOREIGN KEY (partido_id) REFERENCES Partidos(id)
        ON DELETE CASCADE
        ON UPDATE CASCADE,
    FOREIGN KEY (jugador_id) REFERENCES Jugadores(id)
        ON DELETE CASCADE
        ON UPDATE CASCADE
);

-- JUGADORES-EQUIPOS
DROP TABLE IF EXISTS Jugadores_Equipos;
CREATE TABLE IF NOT EXISTS Jugadores_Equipos (
    jugador_id INT UNSIGNED,
    equipo_id INT UNSIGNED,
    fecha_debut DATE,
    PRIMARY KEY (jugador_id, equipo_id),
    FOREIGN KEY (jugador_id) REFERENCES Jugadores(id)
        ON DELETE CASCADE
        ON UPDATE CASCADE,
    FOREIGN KEY (equipo_id) REFERENCES Equipos(id)
        ON DELETE CASCADE
        ON UPDATE CASCADE
);

-- EQUIPO-TEMPORADA
DROP TABLE IF EXISTS Estadisticas_Temporada;
CREATE TABLE IF NOT EXISTS Estadisticas_Temporada (
    equipo_id INT UNSIGNED,
    temporada_id INT UNSIGNED,
    carreras_anotadas INT,
    errores INT,
    home_run INT,
    hits INT,
    PRIMARY KEY (equipo_id, temporada_id),
    FOREIGN KEY (equipo_id) REFERENCES Equipos(id)
        ON DELETE CASCADE
        ON UPDATE CASCADE,
    FOREIGN KEY (temporada_id) REFERENCES Temporadas(id)
        ON DELETE CASCADE
        ON UPDATE CASCADE
);

-- PARTIDO-EQUIPO
DROP TABLE IF EXISTS Estadisticas_Equipo;
CREATE TABLE IF NOT EXISTS Estadisticas_Equipo (
    partido_id INT UNSIGNED,
    equipo_id INT UNSIGNED,
    carreras_anotadas INT,
    errores INT,
    hits INT,
    PRIMARY KEY (partido_id, equipo_id),
    FOREIGN KEY (partido_id) REFERENCES Partidos(id)
        ON DELETE CASCADE
        ON UPDATE CASCADE,
    FOREIGN KEY (equipo_id) REFERENCES Equipos(id)
        ON DELETE CASCADE
        ON UPDATE CASCADE
);

-- AMPAYERS-PARTIDOS
DROP TABLE IF EXISTS Registro_Ampayers;
CREATE TABLE IF NOT EXISTS Registro_Ampayers (
    ampayer_id INT UNSIGNED,
    partido_id INT UNSIGNED,
    fecha DATE,
    posicion VARCHAR(20),
    PRIMARY KEY (ampayer_id, partido_id),
    FOREIGN KEY (ampayer_id) REFERENCES Ampayers(id)
        ON DELETE CASCADE
        ON UPDATE CASCADE,
    FOREIGN KEY (partido_id) REFERENCES Partidos(id)
        ON DELETE CASCADE
        ON UPDATE CASCADE
);

-- ESTADIOS-PARTIDOS
DROP TABLE IF EXISTS Registro_Partidos;
CREATE TABLE IF NOT EXISTS Registro_Partidos (
    partido_id INT UNSIGNED,
    estadio_id INT UNSIGNED,
    fecha_hora DATETIME,
    PRIMARY KEY (partido_id, estadio_id),
    FOREIGN KEY (partido_id) REFERENCES Partidos(id)
        ON DELETE CASCADE
        ON UPDATE CASCADE,
    FOREIGN KEY (estadio_id) REFERENCES Estadios(id)
        ON DELETE RESTRICT
        ON UPDATE CASCADE
);

-- Tiggers para calcular la edad segun la fecha de nacimiento

DELIMITER //
-- Trigger para Jugadores
CREATE TRIGGER tr_calcular_edad_jugador
BEFORE INSERT ON Jugadores
FOR EACH ROW
BEGIN
    SET NEW.edad = YEAR(CURRENT_DATE) - YEAR(NEW.fecha_nac);
END; //

-- Trigger para Ampayers
CREATE TRIGGER tr_calcular_edad_ampayer
BEFORE INSERT ON Ampayers
FOR EACH ROW
BEGIN
    SET NEW.edad = YEAR(CURRENT_DATE) - YEAR(NEW.fecha_nac);
END; //
DELIMITER ;

-- Insertamos Valores a la Base de Datos

USE lvbp;

-- 1. TEMPORADAS
INSERT INTO Temporadas VALUES
(NULL,'2023-10-01','2024-01-31','Temporada 2023-2024'),
(NULL,'2024-10-01','2025-01-31','Temporada 2024-2025');

-- 2. EQUIPOS
INSERT INTO Equipos VALUES
(NULL,'Leones del Caracas','Caracas',1942),
(NULL,'Navegantes del Magallanes','Valencia',1917),
(NULL,'Tigres de Aragua','Maracay',1965),
(NULL,'Cardenales de Lara','Barquisimeto',1942),
(NULL,'Águilas del Zulia','Maracaibo',1969),
(NULL,'Caribes de Anzoátegui','Puerto La Cruz',1987);

-- 3. ESTADIOS
INSERT INTO Estadios VALUES
(NULL,'Estadio Universitario',25000,'Caracas'),
(NULL,'José Bernardo Pérez',16000,'Valencia'),
(NULL,'Estadio José Pérez Colmenares',12000,'Maracay'),
(NULL,'Antonio Herrera Gutiérrez',20000,'Barquisimeto'),
(NULL,'Luis Aparicio',23000,'Maracaibo');

-- 4. AMPAYERS
INSERT INTO Ampayers VALUES
(NULL,'Carlos','Torres','Home Plate','Venezuela',10,'1985-04-10',NULL),
(NULL,'Luis','Mendoza','Primera Base','Venezuela',8,'1988-06-15',NULL),
(NULL,'José','Ramírez','Tercera Base','Venezuela',12,'1982-09-20',NULL);

-- 5. JUGADORES (Son muchos ya que he puesto las ultimas dos temporadas jugadas y he puesto 10 jugadores por equipo)
INSERT INTO Jugadores VALUES
(NULL,'José','Pérez','1995-05-10','Venezuela',1.80,'Pitcher',NULL),
(NULL,'Luis','García','1998-03-21','Venezuela',1.75,'Catcher',NULL),
(NULL,'Carlos','Rodríguez','1994-07-14','Venezuela',1.82,'1B',NULL),
(NULL,'Miguel','Torres','1997-11-03','Venezuela',1.78,'2B',NULL),
(NULL,'Andrés','Rojas','1996-02-19','Venezuela',1.76,'SS',NULL),
(NULL,'Juan','Mendoza','1993-09-09','Venezuela',1.83,'3B',NULL),
(NULL,'Pedro','Castillo','1999-04-12','Venezuela',1.79,'OF',NULL),
(NULL,'Ángel','Suárez','1995-12-22','Venezuela',1.81,'OF',NULL),
(NULL,'Rafael','Morales','1997-06-17','Venezuela',1.77,'OF',NULL),
(NULL,'Daniel','Herrera','1994-01-30','Venezuela',1.85,'Pitcher',NULL),
(NULL,'Jesús','Martínez','1996-08-10','Venezuela',1.79,'Pitcher',NULL),
(NULL,'Alberto','Vega','1993-05-15','Venezuela',1.74,'Catcher',NULL),
(NULL,'Ricardo','Silva','1998-02-18','Venezuela',1.83,'1B',NULL),
(NULL,'Eduardo','Navarro','1995-10-27','Venezuela',1.80,'2B',NULL),
(NULL,'Jorge','Figueroa','1997-07-04','Venezuela',1.76,'SS',NULL),
(NULL,'Mario','Colmenares','1994-03-02','Venezuela',1.82,'3B',NULL),
(NULL,'Leonardo','Acosta','1996-12-11','Venezuela',1.78,'OF',NULL),
(NULL,'Luis','Quintero','1993-09-29','Venezuela',1.84,'OF',NULL),
(NULL,'Víctor','Salazar','1999-05-23','Venezuela',1.77,'OF',NULL),
(NULL,'Tomás','Pacheco','1995-01-05','Venezuela',1.86,'Pitcher',NULL),
(NULL,'Kevin','Díaz','1996-04-06','Venezuela',1.79,'Pitcher',NULL),
(NULL,'Henry','Soto','1994-02-12','Venezuela',1.75,'Catcher',NULL),
(NULL,'Manuel','Reyes','1997-09-14','Venezuela',1.82,'1B',NULL),
(NULL,'Adrián','Vargas','1995-07-01','Venezuela',1.78,'2B',NULL),
(NULL,'Samuel','Guerrero','1993-11-19','Venezuela',1.80,'SS',NULL),
(NULL,'Cristian','López','1998-03-22','Venezuela',1.83,'3B',NULL),
(NULL,'Héctor','Mejías','1996-06-18','Venezuela',1.77,'OF',NULL),
(NULL,'Darwin','Molina','1994-12-05','Venezuela',1.81,'OF',NULL),
(NULL,'Felipe','Escobar','1997-01-09','Venezuela',1.79,'OF',NULL),
(NULL,'Brayan','Ortiz','1995-10-10','Venezuela',1.85,'Pitcher',NULL),
(NULL,'Alex','Gómez','1993-08-13','Venezuela',1.78,'Pitcher',NULL),
(NULL,'Frank','León','1996-05-28','Venezuela',1.76,'Catcher',NULL),
(NULL,'Roberto','Chacón','1994-03-09','Venezuela',1.82,'1B',NULL),
(NULL,'Nicolás','Campos','1997-02-17','Venezuela',1.80,'2B',NULL),
(NULL,'Guillermo','Cruz','1995-07-23','Venezuela',1.79,'SS',NULL),
(NULL,'Emilio','Padilla','1993-11-30','Venezuela',1.83,'3B',NULL),
(NULL,'Luis','Bermúdez','1998-04-14','Venezuela',1.77,'OF',NULL),
(NULL,'José','Rincón','1996-06-01','Venezuela',1.82,'OF',NULL),
(NULL,'Raúl','Parra','1995-09-08','Venezuela',1.80,'OF',NULL),
(NULL,'Iván','Gil','1994-12-18','Venezuela',1.86,'Pitcher',NULL),
(NULL,'Cristóbal','Peña','1996-03-03','Venezuela',1.79,'Pitcher',NULL),
(NULL,'Mauricio','Delgado','1995-06-25','Venezuela',1.74,'Catcher',NULL),
(NULL,'Gabriel','Alvarado','1993-02-20','Venezuela',1.83,'1B',NULL),
(NULL,'Diego','Arias','1998-08-15','Venezuela',1.80,'2B',NULL),
(NULL,'Ernesto','Pérez','1997-09-09','Venezuela',1.78,'SS',NULL),
(NULL,'Sebastián','Moreno','1994-05-11','Venezuela',1.82,'3B',NULL),
(NULL,'Félix','Montoya','1996-10-30','Venezuela',1.77,'OF',NULL),
(NULL,'Juan','Sánchez','1995-01-27','Venezuela',1.81,'OF',NULL),
(NULL,'Luis','Aponte','1997-07-07','Venezuela',1.79,'OF',NULL),
(NULL,'Ricardo','Durán','1993-03-19','Venezuela',1.85,'Pitcher',NULL);

-- RELACION JUGADORES-EQUIPOS (10 jugadores por equipo)
INSERT INTO Jugadores_Equipos VALUES
(1,1,'2023-10-01'),(2,1,'2023-10-01'),(3,1,'2023-10-01'),(4,1,'2023-10-01'),(5,1,'2023-10-01'),
(6,2,'2023-10-01'),(7,2,'2023-10-01'),(8,2,'2023-10-01'),(9,2,'2023-10-01'),(10,2,'2023-10-01'),
(11,3,'2023-10-01'),(12,3,'2023-10-01'),(13,3,'2023-10-01'),(14,3,'2023-10-01'),(15,3,'2023-10-01'),
(16,4,'2023-10-01'),(17,4,'2023-10-01'),(18,4,'2023-10-01'),(19,4,'2023-10-01'),(20,4,'2023-10-01'),
(21,5,'2023-10-01'),(22,5,'2023-10-01'),(23,5,'2023-10-01'),(24,5,'2023-10-01'),(25,5,'2023-10-01'),
(26,6,'2023-10-01'),(27,6,'2023-10-01'),(28,6,'2023-10-01'),(29,6,'2023-10-01'),(30,6,'2023-10-01');

-- PARTIDOS
INSERT INTO Partidos VALUES
(NULL,'2023-11-01 18:00:00',15000),
(NULL,'2023-11-02 19:00:00',12000),
(NULL,'2023-11-03 18:30:00',18000),
(NULL,'2024-11-01 18:00:00',16000),
(NULL,'2024-11-02 19:00:00',13000),
(NULL,'2024-11-03 18:30:00',17000);

-- ESTADISTICAS_PARTIDOS_TEMPORADAS
INSERT INTO Estadisticas_Partidos_Temporadas VALUES
(1,1,5,1,10),(2,1,3,0,7),(3,1,4,2,8),
(4,2,6,1,12),(5,2,2,0,5),(6,2,3,1,7);

-- ESTADISTICAS_JUGADORES
INSERT INTO Estadisticas_Jugadores VALUES
(1,1,2,3,1,0,0),(1,2,1,1,0,0,1),(2,3,2,2,1,0,0),
(3,4,1,2,0,1,0),(3,5,2,1,0,0,2),(4,6,1,1,0,0,1),
(5,7,2,3,1,0,1),(6,8,1,2,0,0,0);

-- ESTADISTICAS_TEMPORADA
INSERT INTO Estadisticas_Temporada VALUES
(1,1,400,20,50,800),(2,1,380,25,45,760),(3,1,350,30,40,700),
(4,1,420,18,55,820),(5,1,390,22,48,780),(6,1,360,28,42,730),
(1,2,410,19,52,810),(2,2,385,23,46,770),(3,2,355,31,41,710),
(4,2,425,20,56,830),(5,2,395,21,50,790),(6,2,365,27,43,740);

-- ESTADISTICAS_EQUIPO
INSERT INTO Estadisticas_Equipo VALUES
(1,1,5,1,10),(1,2,3,2,7),(2,3,4,1,8),
(2,4,2,0,5),(3,5,6,1,12),(3,6,3,2,7);

-- REGISTRO_AMPAYERS
INSERT INTO Registro_Ampayers VALUES
(1,1,'2023-11-01','Home'),
(2,1,'2023-11-01','Primera'),
(3,2,'2023-11-02','Home');

-- REGISTRO_PARTIDOS
INSERT INTO Registro_Partidos VALUES
(1,1,'2023-11-01 18:00:00'),
(2,2,'2023-11-02 19:00:00'),
(3,3,'2023-11-03 18:30:00'),
(4,4,'2024-11-01 18:00:00'),
(5,5,'2024-11-02 19:00:00'),
(6,1,'2024-11-03 18:30:00');
