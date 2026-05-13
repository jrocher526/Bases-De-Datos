-- practica_75_arcos_01_12
-- conexion arcos_01

USE geslibros;

-- Consulta permitida
SELECT *
FROM clientes
WHERE poblacion = 'Guadalajara';

-- Debe bloquearse
INSERT INTO clientes
(nombre, direccion, poblacion, c_postal, provincia_id, nif, telefono, movil, email)
VALUES
('Cliente Prueba', 'Calle Mayor 10', 'Ubrique', '11600', 11,
 '12345678Z', '956111111', '600111111', 'prueba@correo.es');

-- Comprobación
SELECT *
FROM clientes
WHERE nombre = 'Cliente Prueba';

-- Bloqueo escritura
LOCK TABLES libros WRITE;

INSERT INTO libros
(isbn, ean, titulo, autor_id, editorial_id, precio_coste, precio_venta,
 stock, stock_min, stock_max, fecha_edicion)
VALUES
('9780000000001', '9780000000001', 'SQL Avanzado DAW',
 1, 1, 20.00, 30.00, 10, 2, 20, '2026-04-13');

UNLOCK TABLES;

-- Transacción compartida
START TRANSACTION;

SELECT * FROM editoriales LOCK IN SHARE MODE;
SELECT * FROM autores LOCK IN SHARE MODE;

-- Faltan insert