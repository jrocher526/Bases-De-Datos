-- practica_75_ubrique_01_12
-- conexion ubrique_01

USE geslibros;

-- Bloqueo lectura clientes
LOCK TABLES clientes READ;
LOCK TABLES editoriales read;
-- No podemos acceder
SELECT * FROM libros;

-- Desbloqueo
UNLOCK TABLES;

-- Debe fallar mientras arcos tiene WRITE
SELECT * FROM libros;

LOCK TABLES libros READ;

-- Transacción precios
