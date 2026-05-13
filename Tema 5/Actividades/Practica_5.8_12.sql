-- Actividad 5.8

-- Creamos la base de datos Horarios
DROP DATABASE IF EXISTS horarios;
CREATE DATABASE IF NOT EXISTS horarios;

-- Activamos la Base de datos
USE horarios;

-- Creamos la tabla departamentos
DROP TABLE IF EXISTS departamentos;
CREATE TABLE IF NOT EXISTS departamentos (
    id INT UNSIGNED AUTO_INCREMENT PRIMARY KEY,
    nombre VARCHAR(25) NOT NULL,                    
    codigo_dept CHAR(3) UNIQUE NOT NULL
);

-- Creamos la tabla profesor
DROP TABLE IF EXISTS profesores;
CREATE TABLE IF NOT EXISTS profesores (
    id INT UNSIGNED AUTO_INCREMENT PRIMARY KEY,
    nombre VARCHAR(25) NOT NULL,                      
    apellidos VARCHAR(40) NOT NULL,                 
    email VARCHAR(50) UNIQUE,                              
    fecha_ingreso DATE NOT NULL,
    especialidad VARCHAR(30) NOT NULL,               
    nrp CHAR(10) UNIQUE NOT NULL,
    departamento_id INT UNSIGNED,
    -- Establcecemos restricciones segun el criterio
    CONSTRAINT fk_departamentos_departmento_id 
    FOREIGN KEY (departamento_id) REFERENCES departamentos(id)
    ON DELETE RESTRICT ON UPDATE CASCADE
);

-- Creamos la tabla asignatura
DROP TABLE IF EXISTS asignaturas;
CREATE TABLE IF NOT EXISTS asignaturas (
    id INT UNSIGNED AUTO_INCREMENT PRIMARY KEY,
    nombre VARCHAR(20) NOT NULL,                          
    nivel CHAR(4) UNIQUE NOT NULL,                                
    codigo_asig CHAR(7) NOT NULL,                   
    horas SMALLINT UNSIGNED NOT NULL,                           
    departamento_id INT UNSIGNED NOT NULL,
	-- Establcecemos restricciones segun el criterio
    CONSTRAINT fk_departamentos_departamento_id
    FOREIGN KEY (departamento_id) REFERENCES departamentos(id)
	ON DELETE RESTRICT ON UPDATE RESTRICT

);

-- Creamos la tabla horario
DROP TABLE IF EXISTS horarios;
CREATE TABLE IF NOT EXISTS horarios (
    id INT UNSIGNED AUTO_INCREMENT PRIMARY KEY,
    dia CHAR(1),          
    tramo CHAR(1),     
    turno ENUM('mañana', 'tarde'),  
    horas TINYINT UNSIGNED NOT NULL,  
    asignatura_id INT UNSIGNED NOT NULL,
    profesor_id INT UNSIGNED NOT NULL,
   -- Establcecemos restricciones segun el criterio
    FOREIGN KEY (profesor_id) REFERENCES profesores(id)
	ON DELETE RESTRICT ON UPDATE RESTRICT,
    FOREIGN KEY (asignatura_id) REFERENCES asignaturas(id)
	ON DELETE RESTRICT ON UPDATE RESTRICT

);
