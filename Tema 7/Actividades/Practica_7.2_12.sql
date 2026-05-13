-- Actividad  7.2
-- BDD - DCL
-- Jhonal Roca

-- 1. Asignar al usuario Juan todos los privilegios a nivel global
GRANT ALL PRIVILEGES ON *.* TO 'juan'@'localhost';

-- 2. Asignar al usuario pedro el privilegio de poder acceder a tdodas las bases de datos pero solo para consultar
GRANT SELECT ON *.* TO 'pedro'@'localhost';

-- 3. Asignar al usuario maria privilegios de acceso a las bases de datos geslibros y maratoon solo para ejecutar comandos SACU
GRANT ALTER, CREATE, UPDATE, SELECT 
ON gestlibros.* TO 'maria'@'localhost';

GRANT ALTER, CREATE, UPDATE, SELECT 
ON maratoon.* TO 'maria'@'localhost';

-- 4. Asignar al nuevo usuario roberto/roberto_67 privigeligos de super admin
CREATE USER 'roberto'@'localhost' IDENTIFIED BY 'roberto_67';
GRANT ALL PRIVILEGES ON *.* TO 'roberto'@'localhost' WITH GRANT OPTION;

-- 5. Asignar al nuevo usuario rocio/rocio_69 todos los privilegios sobre la base de datos geslibros
CREATE USER 'rocio'@'localhost' IDENTIFIED BY 'rocio_69';
GRANT ALL PRIVILEGES 
ON geslibros.* 
TO 'rocio'@'localhost';

-- 6. Asignar al nuevo usuario carlos/carlos_90 privilegios sobre la tabla libros, editoriales, y clientes de la base de datos geslibros.
-- Solo podra realizar consultas y actualizaciones
CREATE USER 'carlos'@'localhost' IDENTIFIED BY 'carlos_90'; 
GRANT SELECT, UPDATE 
ON geslibros.libros 
TO 'carlos'@'localhost';

GRANT SELECT, UPDATE 
ON geslibros.editoriales 
TO 'carlos'@'localhost';

GRANT SELECT, UPDATE 
ON geslibros.clientes 
TO 'carlos'@'localhost';

-- 7. Asignar al nuevo usuario anamari/anamari_2000 privilegios para acceder a las columnas
-- titulo, ean, isbn y precio_venta de la tabla libros de la base de datos geslibros sólo para consultar.
CREATE USER 'anamari'@'localhost' IDENTIFIED BY 'anamari_2000';
GRANT SELECT (titulo, ean, isbn, precio_venta)
ON geslibros.libros
TO 'anamari'@'localhost';

-- 8. Asignar al usuario anamari privilegios para acceder a las columnas 
-- nombre, telefono, email de la tabla clientes de la base de datos geslibros sólo para consultar y actualizar.
GRANT SELECT (nombre, telefono, email),
      UPDATE (nombre, telefono, email)
ON geslibros.clientes
TO 'anamari'@'localhost';
