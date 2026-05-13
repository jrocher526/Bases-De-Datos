-- Borramos la base de datos test si existe
DROP DATABASE IF EXISTS test;

-- Creamos las base de datos de testeo 
CREATE DATABASE IF NOT EXISTS test;

-- Activamos la base de datos para la creacion de tablas
USE test;

-- Creamos las tablas solicitadas
-- Creamos la primera tabla
CREATE TABLE IF NOT EXISTS alumnos(
id INT UNSIGNED AUTO_INCREMENT PRIMARY KEY,
nombre VARCHAR(20),
apellidos VARCHAR(45),
dni CHAR(9),
fecha_nac DATE,
edad TINYINT UNSIGNED,
poblacion INT(20),
direccion VARCHAR(255),
cpostal CHAR(4),
provincia VARCHAR(20),
nacionalidad VARCHAR(20),
telefono CHAR(13),
email VARCHAR(60)
);

-- Creamos la segunda tabla
CREATE TABLE IF NOT EXISTS articulos(
id INT UNSIGNED AUTO_INCREMENT PRIMARY KEY,
descripcion VARCHAR(255),
referencia CHAR(13),
precio_coste DECIMAL(10.2),
precio_venta DECIMAL(12.2),
descuento DECIMAL(5.2),
imagen VARCHAR(255),
categoria VARCHAR(60),
stock INT,
stock_min TINYINT,
stock_max INT
);

-- Creamos la tercera tabla tabla
CREATE TABLE IF NOT EXISTS registros(
id INT UNSIGNED AUTO_INCREMENT PRIMARY KEY,
fecha_hora_salida DATETIME(3),
fecha_hora_llegaba DATETIME(3),
tiempo_realizado TIME,
id_corredor INT UNSIGNED
);

-- Insertamos valores a la tabla alumnos
INSERT INTO alumnos VALUES 
( null,
'Juan', 
 'Pérez García', 
 '12345678A', 
 '2000/05/14', 
 24, 
 28001, 
 'Calle Ficticia 123', 
 '28001', 
 'Madrid', 
 'Española', 
 '6123456789012', 
 'juan.perez@email.com'),
 
( null,
'María', 
 'Lopez Fernández', 
 '23456789B', 
 '1995/08/22', 
 29, 
 41010, 
 'Avenida Real 456', 
 '41010', 
 'Sevilla', 
 'Española', 
 '6234567890123', 
 'maria.lopez@email.com'),

( null,
'Carlos', 
 'García Ruiz', 
 '34567890C', 
 '1988/12/01', 
 36, 
 08001, 
 'Carrer del Sol 789', 
 '08001', 
 'Barcelona', 
 'Española', 
 '6345678901234', 
 'carlos.garcia@email.com');

 
 -- Insertamos valores a la tabla articulos
 INSERT INTO articulos VALUES 
( null,
'Camiseta de algodón', 
 'REF001', 
 5.50, 
 12.99, 
 10.00, 
 'camiseta1.jpg', 
 'Ropa', 
 50, 
 5, 
 100),

( null,
'Zapatos deportivos', 
 'REF002', 
 20.00, 
 45.99, 
 15.00, 
 'zapatos.jpg', 
 'Calzado', 
 30, 
 3, 
 60),

( null,
'Mochila de cuero', 
 'REF003', 
 25.00, 
 55.00, 
 5.00, 
 'mochila.jpg', 
 'Accesorios', 
 40, 
 4, 
 80);

 
 -- Insertamos valores a la tabla registros
 INSERT INTO registros VALUES 
( null,
'2025/01/18 08:00:00.000', 
 '2025/01/18 10:00:00.000', 
 '02:00:00', 
 1),

( null,
'2025/01/18 09:30:00.000', 
 '2025/01/18 11:30:00.000', 
 '02:00:00', 
 2),

( null,
'2025/01/18 07:45:00.000', 
 '2025/01/18 09:45:00.000', 
 '02:00:00', 
 3);


