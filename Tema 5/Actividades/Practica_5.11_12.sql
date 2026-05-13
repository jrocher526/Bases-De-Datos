-- Creamos base de datos 
DROP DATABASE IF EXISTS restricciones_check;
CREATE DATABASE IF NOT EXISTS restricciones_check;

-- Usamos la base de datos
USE restricciones_check;

DROP TABLE IF EXISTS operadorLike;
CREATE TABLE IF NOT EXISTS operadorLike (
    id INT PRIMARY KEY,
    descripcion VARCHAR(100) CHECK (descripcion LIKE 'a%'),
    nombre VARCHAR(100) CHECK (nombre LIKE 'ju%'),
    email VARCHAR(100) CHECK (email LIKE '%@%'),
    password VARCHAR(100) CHECK (password LIKE '__M____%'),
    cpostal CHAR(5) CHECK (cpostal LIKE '11___'),
    codigo CHAR(7) CHECK (codigo LIKE 'ES____9')
);
