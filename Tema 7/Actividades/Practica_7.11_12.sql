-- Practica 7.11 
-- BDD - DCL
-- Jhonal Roca


/* 1. Crear usuarios
Se pide crear un usuario mediante la sentencia SQL correspondiente a partir de los siguientes requisitos:
Nombre de usuario: tu propio nombre seguido del primer apellido, todo junto y en minúsculas. Por ejemplo en mi caso el nombre de usuario sería juancarlosmoreno
Password: el password será 1234567 pero ha de ejecutarse cifrado, por lo que deberá obtenerse la cadena cifrada.
Privilegios: este usuario no tendrá ningún privilegio, sólo podrá acceder a la base de datos de testeo
Nota: se ha de adjuntar la sentencia SQL usada para obtener la cadena encriptada del password. */

-- Obtener contraseña cifrada
SELECT PASSWORD('1234567');

-- Crear usuario (sustituye por tu nombre real)
CREATE USER 'jhonaljesusroca'@'localhost' IDENTIFIED BY PASSWORD '*6A7A490FB9DC8C33C2B025A91737077A7E9CC5E5';

/* 2. Asignación de privilegios
Los scripts no tienen porque guardar relación unos con otros, por lo tanto puede ocurrir que dos sentencias sean incompatibles y den problemas a la hora de ejecutarse, de todas formas si queremos comprobar que funciona un scripts deberá reinstalarse de nuevo la base de datos para que no conste la anterior.

Sobre el usuario creado en el apartado anterior se pide:
Asignar al usuario privilegios de superadministrador, es decir, todos los privilegios, sobre todas las bases de datos, incluyendo el privilegio GRANT
Asignar todos los privilegios sobre la base de datos geslibros.
Asignar todos los privilegios sobre las tablas libros, editoriales y clientes de la base de datos geslibros.
Asignar privilegios para que sólo pueda consultar en la tabla libros, editoriales y clientes de la base de datos geslibros
Asignar privilegios para que pueda acceder a consultar y actualizar las columnas nombre, direccion, poblacion, codpostal, telefono y email de la tabla clientes correspondiente a la base de datos geslibros.
Asignar privilegios de forma que sólo podrá consultar las columnas id, titulo, precio_venta, fechaedicion y actualizar la columna precio_venta y titulo de la tabla libros correspondiente a la base de datos geslibros.
Asignar todos los privilegios para que pueda acceder a modo consulta a todas las tablas de la base de datos geslibros excepto a ventas y lineasventas */ 

-- Superadmin
GRANT ALL PRIVILEGES ON *.* TO 'jhonaljesusroca'@'localhost' WITH GRANT OPTION;

-- Todos los privilegios en geslibros
GRANT ALL PRIVILEGES ON geslibros.* TO 'jhonaljesusroca'@'localhost';

-- Todas las tablas concretas
GRANT ALL PRIVILEGES ON geslibros.libros TO 'jhonaljesusroca'@'localhost';
GRANT ALL PRIVILEGES ON geslibros.editoriales TO 'jhonaljesusroca'@'localhost';
GRANT ALL PRIVILEGES ON geslibros.clientes TO 'jhonaljesusroca'@'localhost';

-- Solo SELECT en tablas
GRANT SELECT ON geslibros.libros TO 'jhonaljesusroca'@'localhost';
GRANT SELECT ON geslibros.editoriales TO 'jhonaljesusroca'@'localhost';
GRANT SELECT ON geslibros.clientes TO 'jhonaljesusroca'@'localhost';

-- SELECT y UPDATE columnas clientes
GRANT SELECT (nombre, direccion, poblacion, c_postal, telefono, email),
      UPDATE (nombre, direccion, poblacion, c_postal, telefono, email)
ON geslibros.clientes TO 'jhonaljesusroca'@'localhost';

-- SELECT + UPDATE parcial en libros
GRANT SELECT (id, titulo, precio_venta, fecha_edicion),
      UPDATE (precio_venta, titulo)
ON geslibros.libros TO 'jhonaljesusroca'@'localhost';

-- SELECT en todas excepto ventas y lineasventas
GRANT SELECT ON geslibros.* TO 'jhonaljesusroca'@'localhost';
REVOKE SELECT ON geslibros.ventas FROM 'jhonaljesusroca'@'localhost';  --
REVOKE SELECT ON geslibros.lineasventas FROM 'jhonaljesusroca'@'localhost'; --

/* 3. Eliminar privilegios

Eliminar los siguientes privilegios al usuario creado en el primer apartado
Quitar privilegio GRANT
Quitar todos los privilegios sobre todas las bases de datos
Quitar todos los privilegios sobre la base de datos geslibros
Quitar el privilegio de actualización (UPDATE) sobre la tabla libros de la base de datos geslibros.
Quitar el privilegio de consulta sobre las columnas id, titulo, precio_venta de la tabla libros correspondiente a la base de datos geslibros.
Quitar el privilegio de acceso a todas las tablas de la base de datos geslibros excepto a las tablas libros y clientes.
Quitar el privilegio de consulta, actualización y eliminación sobre las tablas libros, clientes, editoriales y autores de la base de datos geslibros. */ 

-- Quitar GRANT OPTION
REVOKE GRANT OPTION ON *.* FROM 'jhonaljesusroca'@'localhost';

-- Quitar todos los privilegios globales
REVOKE ALL PRIVILEGES ON *.* FROM 'jhonaljesusroca'@'localhost';

-- Quitar privilegios en geslibros
REVOKE ALL PRIVILEGES ON geslibros.* FROM 'jhonaljesusroca'@'localhost';

-- Quitar UPDATE en libros
REVOKE UPDATE ON geslibros.libros FROM 'jhonaljesusroca'@'localhost';

-- Quitar SELECT columnas concretas
REVOKE SELECT (id, titulo, precio_venta) 
ON geslibros.libros FROM 'jhonaljesusroca'@'localhost';

-- Quitar acceso excepto libros y clientes
REVOKE ALL PRIVILEGES ON geslibros.* FROM 'jhonaljesusroca'@'localhost'; --
GRANT ALL PRIVILEGES ON geslibros.libros TO 'jhonaljesusroca'@'localhost';
GRANT ALL PRIVILEGES ON geslibros.clientes TO 'jhonaljesusroca'@'localhost';

-- Quitar SELECT, UPDATE, DELETE en varias tablas
REVOKE SELECT, UPDATE, DELETE 
ON geslibros.libros FROM 'jhonaljesusroca'@'localhost';

REVOKE SELECT, UPDATE, DELETE 
ON geslibros.clientes FROM 'jhonaljesusroca'@'localhost';

REVOKE SELECT, UPDATE, DELETE 
ON geslibros.editoriales FROM 'jhonaljesusroca'@'localhost';

REVOKE SELECT, UPDATE, DELETE 
ON geslibros.autores FROM 'jhonaljesusroca'@'localhost'; --

/* 4. Cambiar password
Se desea cambiar el password al usuario creado en el apartado 1. El nuevo password será '21436587'. Se ha de mostrar la obtención del password cifrado. */ 
-- Obtener cifrado
SELECT PASSWORD('21436587');

-- Cambiar password
ALTER USER 'jhonaljesusroca'@'localhost' IDENTIFIED BY PASSWORD '*1DEB27DD74919473A2C69FDFA8E46B08E9F16547';

/* 5. Sorteo lotería primitiva

Descargar el fichero loteriaprimitiva.sql e instalar la base de datos loteriaprimitiva.

Se pide incluir en una transacción una simulación de dos sorteos, es decir, añadir dos nuevos registros en la tabla sorteos de la base de datos loteriaprimitiva. Se tendrán en cuenta los siguientes requisitos:

Se ha de iniciar una transacción
La fecha se ha de corresponder con la fecha y hora actual
Los números de la lotería primitiva (num1, num2, ...) se han de corresponder con números aleatorios entre 1 y 49. No se tendrá en cuenta si el número se ha repetido.
El número complementario es un número aleatorio entre 1 y 49 también
El reintegro es un número aleatorio entre 0 y 9
Confirmar una vez finalizada la transacción	*/

START TRANSACTION;
INSERT INTO sorteos 
(fecha, num1, num2, num3, num4, num5, num6, complementario, reintegro)
VALUES
(NOW(),
 FLOOR(1 + RAND()*49),
 FLOOR(1 + RAND()*49),
 FLOOR(1 + RAND()*49),
 FLOOR(1 + RAND()*49),
 FLOOR(1 + RAND()*49),
 FLOOR(1 + RAND()*49),
 FLOOR(1 + RAND()*49),
 FLOOR(RAND()*10)
);

INSERT INTO sorteos 
(fecha, num1, num2, num3, num4, num5, num6, complementario, reintegro)
VALUES
(NOW(),
 FLOOR(1 + RAND()*49),
 FLOOR(1 + RAND()*49),
 FLOOR(1 + RAND()*49),
 FLOOR(1 + RAND()*49),
 FLOOR(1 + RAND()*49),
 FLOOR(1 + RAND()*49),
 FLOOR(1 + RAND()*49),
 FLOOR(RAND()*10)
);
COMMIT;

/* 6. Base de datos maratoon. */ 

-- Añadir columnas
ALTER TABLE corredores 
ADD apellido1 VARCHAR(40),
ADD apellido2 VARCHAR(40),
ADD codigo CHAR(11);

-- Separar apellidos 
UPDATE corredores
SET apellido1 = SUBSTRING_INDEX(apellidos, ' ', 1),
    apellido2 = SUBSTRING_INDEX(apellidos, ' ', -1);

-- Generar codigo
UPDATE corredores
SET codigo = UPPER(CONCAT(
    YEAR(fechaNacimiento), '/',
    LEFT(nombre,2),
    LEFT(apellido1,2),
    LEFT(apellido2,2)
));

-- Actualizar edad
UPDATE corredores
SET edad = TIMESTAMPDIFF(YEAR, fechaNacimiento, CURDATE());

-- Actualizar categoría
UPDATE Corredores c
JOIN Categorias ca
ON (
    (c.Edad < 12 AND ca.id = 1) OR
    (c.Edad BETWEEN 12 AND 14 AND ca.id = 2) OR
    (c.Edad BETWEEN 15 AND 17 AND ca.id = 3) OR
    (c.Edad BETWEEN 18 AND 29 AND ca.id = 4) OR
    (c.Edad BETWEEN 30 AND 39 AND ca.id = 5) OR
    (c.Edad BETWEEN 40 AND 49 AND ca.id = 6) OR
    (c.Edad BETWEEN 50 AND 60 AND ca.id = 7) OR
    (c.Edad >= 60 AND ca.id = 8)
)
SET c.Categoria_id = ca.id;

-- Transacción con bloqueo
START TRANSACTION;

-- Bloqueo de categorías
SELECT * FROM Categorias FOR UPDATE;

-- Actualizar edad
UPDATE Corredores
SET Edad = TIMESTAMPDIFF(YEAR, FechaNacimiento, CURDATE());

-- Actualizar categoría
UPDATE Corredores c
JOIN Categorias ca
ON (
    (c.Edad < 12 AND ca.id = 1) OR
    (c.Edad BETWEEN 12 AND 14 AND ca.id = 2) OR
    (c.Edad BETWEEN 15 AND 17 AND ca.id = 3) OR
    (c.Edad BETWEEN 18 AND 29 AND ca.id = 4) OR
    (c.Edad BETWEEN 30 AND 39 AND ca.id = 5) OR
    (c.Edad BETWEEN 40 AND 49 AND ca.id = 6) OR
    (c.Edad BETWEEN 50 AND 60 AND ca.id = 7) OR
    (c.Edad >= 60 AND ca.id = 8)
)
SET c.Categoria_id = ca.id;

COMMIT;

/* 7. Exportar/Importar datos */
-- Exportar clientes Ubrique
SELECT * 
INTO OUTFILE 'C:/Users/14_1DAW_Alum/Documents/Jhonal Roca/BADAT/Tema 7/csv/clientesUbrique.csv'
FIELDS TERMINATED BY ';'
ENCLOSED BY '"'
LINES TERMINATED BY '\n'
FROM clientes
WHERE poblacion = 'Ubrique';

-- Exportar autores XML
SELECT 
CONCAT(
'<autor>',
'<id>', id, '</id>',
'<nombre>', nombre, '</nombre>',
'</autor>'
)
INTO OUTFILE 'C:/Users/14_1DAW_Alum/Documents/Jhonal Roca/BADAT/Tema 7/csv/autores.xml'
LINES TERMINATED BY '\n'
FROM autores;

-- Backup (fuera de SQL)
-- mysqldump -u root -p geslibros > backup.sql



