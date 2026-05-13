-- Base de datos
DROP DATABASE IF EXISTS restricciones_check;
CREATE DATABASE restricciones_check
CHARACTER SET utf8 COLLATE utf8_general_ci;
USE restricciones_check;

-- Tabla comparacion
DROP TABLE IF EXISTS comparacion;
CREATE TABLE comparacion (
    id INT UNSIGNED AUTO_INCREMENT PRIMARY KEY,
    importe DECIMAL(10,2) CHECK (importe > 400),
    saldo DECIMAL(10,2) CHECK (saldo < 0),
    nombre VARCHAR(25) CHECK (nombre IS NULL),
    apellidos VARCHAR(30) CHECK (apellidos IS NULL),
    n_beneficiarios TINYINT UNSIGNED CHECK (n_beneficiarios >= 5),
    n_asignaturas TINYINT UNSIGNED CHECK (n_asignaturas <= 5),
    beca VARCHAR(10) CHECK (beca = 'concedida'),
    importe_beca DECIMAL(10,2) CHECK (importe_beca < 2500),
    n_goles TINYINT UNSIGNED CHECK (n_goles > 20),
    anno_nacimiento YEAR CHECK (anno_nacimiento >= 1970),
    fec_nacimiento DATE CHECK (fec_nacimiento < '2000-02-21'),
    hora_llegada TIME CHECK (hora_llegada >= '12:00')
);

-- Tabla comparacionBetween
DROP TABLE IF EXISTS comparacion_between;
CREATE TABLE comparacion_between (
    id INT UNSIGNED AUTO_INCREMENT PRIMARY KEY,
    ngoles INT CHECK (ngoles BETWEEN 20 AND 30),
    sueldo DECIMAL(10,2) CHECK (sueldo BETWEEN 2000 AND 3000),
    importe DECIMAL(10,2) CHECK (importe BETWEEN 400 AND 600),
    cantidad INT CHECK (cantidad BETWEEN 5 AND 20),
    valor DECIMAL(5,2) CHECK (valor NOT BETWEEN 4 AND 7),
    tipodescuento DECIMAL(5,2) CHECK (tipodescuento BETWEEN 5.25 AND 20.50),
    precio DECIMAL(5,2) CHECK (precio BETWEEN 20 AND 30)
);

-- tabla chekin
DROP TABLE IF EXISTS chekin;
CREATE TABLE chekin (
    id INT PRIMARY KEY,
    provincia VARCHAR(20) CHECK (provincia IN ('Cádiz','Málaga','Sevilla')),
    poblacion VARCHAR(30) CHECK (poblacion IN ('Ubrique','Villamartín','Prado del Rey','Olvera')),
    cicloEstudio VARCHAR(15) CHECK (cicloEstudio IN ('ESO','BACH','MEDIO','SUPERIOR','ADULTOS')),
    valores TINYINT CHECK (valores IN (1,2,5,8,9)),
    nacionalidad VARCHAR(20) CHECK (nacionalidad IN ('España','Brasil','Portugal','Argentina','Italia')),
    codEmpleado VARCHAR(10) CHECK (codEmpleado LIKE '_AB%'),
    nrp VARCHAR(10) CHECK (nrp LIKE '%Z'),
    dni VARCHAR(9) CHECK (LEFT(dni,2) = '25')
);