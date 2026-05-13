-- Actividad 7.4
 -- BDD - DCL
-- Jhonal Roca

USE geslibros;

-- 1. Incluye en una transacción un proceso que realice las siguientes actualizaciones:

-- Todos los libros de tema Novela se ponen en oferta y se decrementa el precio en un 10%
-- Los libros de la editorial Anaya se incrementa el precio en un 6% mientras que
-- el resto de editoriales se reduce en un 4,5%.

START TRANSACTION;

UPDATE libros SET  precio_venta = precio_venta * 0.9 
WHERE id IN (SELECT libro_id FROM libros_temas WHERE tema_id = 3);

UPDATE libros SET  precio_venta = precio_venta * 1.06
WHERE editorial_id = (SELECT id FROM editoriales WHERE nombre LIKE '%Anaya%');

UPDATE libros SET precio_venta = precio_venta * 0.955
WHERE editorial_id != (SELECT id FROM editoriales WHERE nombre LIKE '%Anaya%');

-- 2. Finalizar la transacción deshaciendo las operaciones anteriores. Comprobar
ROLLBACK;

-- Comprobación
SELECT titulo, precio_venta FROM libros;


-- 3. Inicia una nueva transacción que contenga las siguientes operaciones:

-- Añadir dos nuevos libros
-- Añadir una venta y 3 líneas de detalle sobre esa venta

START TRANSACTION;

-- Insertar 2 libros
INSERT INTO libros (id, isbn, ean, titulo, autor_id, editorial_id, precio_coste, precio_venta, stock, stock_min, stock_max, fecha_edicion)
VALUES 
(null,'1236547892530','3265987410058','El chavo del 8',1,1,'20.00','34.00',16,1,20,default),
(null,'8856692115831','4859126378459','EL chapulin Colorado',2,3,'30.00','50.00',16,1,20,default);

-- Insertar una venta
INSERT INTO ventas (id, cliente_id, fecha, importe_bruto, importe_iva, importe_total)
VALUES (null, 2,'2012-02-18',122.32,4.89,127.21);


-- Insertar 3 líneas de venta
INSERT INTO lineasventas (id, venta_id, numero_linea, libro_id, iva, cantidad, precio, importe )
VALUES
(null,3,1,1,0.18,1, 38.32,38.32),
(null,5,4,2,0.18,2,34.00,68.00),
(null,1,3,3,0.18,2,25.00,50.00);

-- 4. Finalizar la transacción confirmando las operaciones anteriores.
COMMIT;


-- 5. Incluye en una transacción las siguientes operaciones sobre la base de datos geslibros:

-- Insertar 2 libros
INSERT INTO libros (id, isbn, ean, titulo, autor_id, editorial_id, precio_coste, precio_venta, stock, stock_min, stock_max, fecha_edicion)
VALUES 
(null,'4857785224','9788497132523','Los 7 enanitos',1,1,'20.00','34.00',16,1,20,default),
(null,'8157725524','9788436358423','batman',2,3,'30.00','50.00',16,1,20,default);

-- Insertar 2 clientes
INSERT INTO clientes (id, nombre, direccion, poblacion, c_postal, provincia_id, nif, telefono, movil, email, create_at)
VALUES
(null,'Carlos','C/ marroquineros','ubrique','19003',11600,'34343434L','949876655','949876655','carloscca@gmail.com','2011/03/24'),
(null,'fernando','C/Los callejones 23','vaalencia','122233',11209,'34212244L','949488655','949876655','ferfernan@gmail.com','2011/03/24');

-- SAVEPOINT A
SAVEPOINT a;

-- Incrementar precios 10%
UPDATE libros
SET precio_venta = precio_venta * 1.10;

-- SAVEPOINT B
SAVEPOINT b;

-- Eliminar libros no vendidos
DELETE FROM libros 
WHERE
    id NOT IN (SELECT 
        libro_id
    FROM
        (SELECT DISTINCT
            libro_id
        FROM
            lineasventas) AS tabla_aux);

-- Volver al SAVEPOINT A
ROLLBACK TO a;

-- Comprobación
SELECT titulo, precio_venta FROM libros;
SELECT * FROM clientes;