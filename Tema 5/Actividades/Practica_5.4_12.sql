-- Borrar la tabla tipos_datos_string si existe.
DROP DATABASE IF EXISTS datos_string;

-- Creamos la tabla tipos_datos_string
CREATE DATABASE IF NOT EXISTS datos_string;

-- Usamos la base de datos.
USE datos_string;

-- Creamos una tabla para los datos.
CREATE TABLE IF NOT EXISTS tipos_datos_string (
	id INT UNSIGNED AUTO_INCREMENT PRIMARY KEY,
    codigo_postal CHAR(5),
    telefono CHAR(13),
    apellidos VARCHAR(40),
    nombre VARCHAR(20),
    nombre_acronimo CHAR(5),
    historial TEXT,
    direccion VARCHAR(50),
    provincia VARCHAR(30),
	observaciones TEXT,
    contenido_libro LONGTEXT,
    categoria ENUM('primera', 'segunda','tercera', 'regional'),
    create_at VARCHAR(25),
    update_at VARCHAR(25)
	);
    
-- Añadir valores a la tabla creada.
INSERT INTO tipos_datos_string VALUES
(null, 11600, 34623331649, 'Roca', 'Jhonal', 'jjr5', 'Historial clinico aprobado', 'Ubrique calle 34', 'Cadiz', 'Buen estudiante', 'Libro de BBDD', 'primera', 'Viernes 10', 'Sabado 11'),
(null, 12457, 58426960458, 'Hernandez', 'Jesus', 'JJH6', 'Paciente con falta de atencion', 'sevilla calle 2', 'Sevilla', 'Estudiante regular', 'MySQL', 'regional', 'Sabado 11', 'domingo 12'),
(null, 55866, 57489652354, 'Martinez', 'Juan', '8GJJ', 'Paciente en perfecto estado', 'Malaga calle galera', 'Malaga', 'Estudiante en curso', 'Napoleon comiendo arepa', 'segunda', 'domingo 12', 'lunes 13');