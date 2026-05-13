-- Actividad 5.12
-- Creamos la Base de Datos
DROP DATABASE IF EXISTS taller;
CREATE DATABASE IF NOT EXISTS taller;

-- Activamos
USE taller;

-- Creamos la tabla maquinas
DROP TABLE IF EXISTS Maquinas;
CREATE TABLE IF NOT EXISTS Maquinas (
    id INT UNSIGNED AUTO_INCREMENT PRIMARY KEY,
    nombre VARCHAR(100),
    fecha_compra DATE,
    valor DECIMAL(10,2)
);

-- Creamos la tabla partes de produccion 
DROP TABLE IF EXISTS Partes_produccion;
CREATE TABLE IF NOT EXISTS Partes_produccion (
    id INT UNSIGNED AUTO_INCREMENT PRIMARY KEY,
    num_parte VARCHAR(50),
    fecha_emision DATE,
    fecha_final DATE,
    coste_total DECIMAL(10,2)
);

-- Creamos la tabla articulos
DROP TABLE IF EXISTS Articulos;
CREATE TABLE IF NOT EXISTS Articulos (
    id INT UNSIGNED AUTO_INCREMENT PRIMARY KEY,
    nombre VARCHAR(100),
    precio DECIMAL(10,2),
    modelo VARCHAR(50),
    coste DECIMAL(10,2)
);

-- Creamos la tabla talleres
DROP TABLE IF EXISTS Talleres;
CREATE TABLE IF NOT EXISTS Talleres (
    id INT UNSIGNED AUTO_INCREMENT PRIMARY KEY,
    funcion VARCHAR(100),
    nombre VARCHAR(100),
    jefe_id INT
);

-- Creamos la tabla empleados
DROP TABLE IF EXISTS Empleados;
CREATE TABLE IF NOT EXISTS Empleados (
    id INT UNSIGNED AUTO_INCREMENT PRIMARY KEY,
    id INT UNSIGNED AUTO_INCREMENT PRIMARY KEY,
    nombre VARCHAR(100),
    apellidos VARCHAR(150),
    dni VARCHAR(15),
    taller_id INT NOT NULL,
	-- Añadimos restricciones 
    CONSTRAINT fk_empleados_taller
        FOREIGN KEY (taller_id)
        REFERENCES Talleres(id)
        ON DELETE RESTRICT
        ON UPDATE CASCADE
);

-- Modifcamos la tabla para añadir restriccions
ALTER TABLE Talleres
ADD CONSTRAINT fk_taller_jefe
FOREIGN KEY (jefe_id)
REFERENCES Empleados(id)
ON DELETE RESTRICT
ON UPDATE CASCADE;

-- creamos la tabla maquina que se usa en taller
DROP TABLE IF EXISTS Maquina_utiliza_taller;
CREATE TABLE IF NOT EXISTS Maquina_utiliza_taller (
    taller_id INT NOT NULL,
    maquina_id INT NOT NULL,
    inicio DATE,
    fin DATE,
    tiempo_d INT,
    
	-- Añadimos restricciones 
    PRIMARY KEY (taller_id, maquina_id),
    CONSTRAINT fk_mut_taller
        FOREIGN KEY (taller_id)
        REFERENCES Talleres(id)
        ON DELETE RESTRICT
        ON UPDATE CASCADE,
    CONSTRAINT fk_mut_maquina
        FOREIGN KEY (maquina_id)
        REFERENCES Maquinas(id)
        ON DELETE RESTRICT
        ON UPDATE CASCADE
);

-- Creamos la tabla partes de produccion de un taller
DROP TABLE IF EXISTS partes_produccion_talleres;
CREATE TABLE IF NOT EXISTS partes_produccion_talleres (
    taller_id INT NOT NULL,
    parte_produccion_id INT NOT NULL,
	-- Añadimos restricciones 
    PRIMARY KEY (taller_id, parte_produccion_id),
    CONSTRAINT fk_ppt_taller
        FOREIGN KEY (taller_id)
        REFERENCES Talleres(id)
        ON DELETE RESTRICT
        ON UPDATE CASCADE,
    CONSTRAINT fk_ppt_parte
        FOREIGN KEY (parte_produccion_id)
        REFERENCES Partes_produccion(id)
        ON DELETE RESTRICT
        ON UPDATE CASCADE
);

-- Creamos la tbala fabrica
DROP TABLE IF EXISTS fabrica;
CREATE TABLE IF NOT EXISTS fabrica (
    parte_produccion_id INT NOT NULL,
    articulo_id INT NOT NULL,
    tiempo INT,
    cantidad INT,
    -- Añadimos restricciones 
    PRIMARY KEY (parte_produccion_id, articulo_id),
    CONSTRAINT fk_fabrica_parte
        FOREIGN KEY (parte_produccion_id)
        REFERENCES Partes_produccion(id)
        ON DELETE RESTRICT
        ON UPDATE CASCADE,
    CONSTRAINT fk_fabrica_articulo
        FOREIGN KEY (articulo_id)
        REFERENCES Articulos(id)
        ON DELETE RESTRICT
        ON UPDATE CASCADE
);
