-- Actividad 6.4
-- Jhonal Roca
-- BDD - 1º DAW

-- INSERT

INSERT INTO ventas
VALUES (null, 6, now(), 289.50, 60.80, 350.30);

INSERT INTO lineasventas
VALUES 
(null, 11, 1, 11, 0.21, 5, 30.00, 150),
(null, 11, 2, 12, 0.21, 10, 13.00, 130),
(null, 11, 3, 15, 0.21, 1, 9.50, 9.50);


-- UPDATE

UPDATE 
	clientes
SET 
	direccion = 'Polígono Ansu Fati, Calle Messi, Nave 20'
WHERE 
	nif = '23124234G';

UPDATE 
	autores
SET 
	premios = CONCAT(premios, ', Planeta')
WHERE 
	nombre = 'Oscar Wilde';

UPDATE 
	libros
SET 
	precio_venta = precio_venta * 0.9;

UPDATE 
	libros
SET 
	precio_coste = precio_coste * 1.10
WHERE 
	editorial_id IN 
(SELECT id FROM editoriales WHERE nombre IN ('Alfaguara','Anaya'));

UPDATE 
	libros
SET 
	precio_venta = precio_venta - 2
WHERE YEAR
	(fecha_edicion) < 2000;

-- DELETE

DELETE FROM 
	libros
WHERE 
	editorial_id = (SELECT id FROM editoriales WHERE nombre = 'Alfaguara');

DELETE FROM 
	editoriales
WHERE 
	nombre = 'Alfaguara';