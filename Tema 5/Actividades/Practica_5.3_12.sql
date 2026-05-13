-- Borramos la base de datos en caso de que exista.
DROP DATABASE IF EXISTS tipos_datos;
-- Creamos la base de datos.
CREATE DATABASE IF NOT EXISTS tipos_datos
-- Asginamos juego de caracteres
CHARACTER SET utf8mb4
COLLATE utf8mb4_general_ci;

USE tipos_datos;    

-- Borramos tabla en caso de que exsita.
DROP TABLE IF EXISTS tipos_datos_num;
-- Creamos la tabla y asignamos filas y columnas.
CREATE TABLE IF NOT EXISTS tipos_datos_num (
    id INT UNSIGNED AUTO_INCREMENT PRIMARY KEY,
    num_camiseta TINYINT UNSIGNED,
    diferencia_doles SMALLINT, 
    goles_afavor SMALLINT UNSIGNED,
    goles_encontra SMALLINT UNSIGNED,
    num_habitantes INT UNSIGNED,
    humedad FLOAT UNSIGNED,
    precipitaciones SMALLINT UNSIGNED, 
    temperatura_maxima FLOAT,
    temperatura_minima FLOAT, 
    velocidad_viento SMALLINT UNSIGNED, 
    altura SMALLINT UNSIGNED,
    precio DECIMAL(10, 2),
    sueldo DECIMAL(10, 2),
    seno DOUBLE,
    coseno DOUBLE, 
    tangente SMALLINT UNSIGNED
);

INSERT INTO tipos_datos_num VALUES
(NULL, 25, 2, 4, 1, 152500, 81.50, 15, 36.00, 28.00, 300, 7000, 14.50, 1500.00, 8.6, 7.3, 4),
(NULL, 12, 3, 5, 2, 163526, 12.52, 5, 15.00, 10.00, 280, 7850, 45.50, 1230.00, 1.6, 6.3, 3),
(NULL, 15, 8, 4, 3, 584266, 5.06, 125, 48.00, 36.00, 158, 7120, 23.50, 2330.00, 5.1, 4.8, 6);