-- Actividad 7.1
-- Tema 7 - DCL
-- Jhonal Roca

-- Crear usuarios 
CREATE USER juan@localhost IDENTIFIED BY 'juan_01';
CREATE USER pedro@localhost IDENTIFIED BY 'pedro_01';
CREATE USER maria@localhost IDENTIFIED BY 'maria_03';
CREATE USER miguel@localhost IDENTIFIED BY 'miguel_04';
CREATE USER rocio@localhost IDENTIFIED BY 'rocio_05';

-- Crear conexion 
GRANT ALL PRIVILEGES ON test TO juan@localhost;
GRANT ALL PRIVILEGES ON test TO pedro@localhost;
GRANT ALL PRIVILEGES ON test TO maria@localhost;
GRANT ALL PRIVILEGES ON test TO miguel@localhost;
GRANT ALL PRIVILEGES ON test TO rocio@localhost;

-- Ver usuarios existentes
SELECT * FROM mysql.user;
-- Crear usuario
CREATE USER 'roberto'@'localhost'
IDENTIFIED BY 'roberto_79';

-- Eliminar usuario 
DROP USER miguel@localhost;
DROP USER rocio@localhost;