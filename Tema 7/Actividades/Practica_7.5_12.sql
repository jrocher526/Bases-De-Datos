-- Practica 7.5
-- BDD - DCL
-- Jhonal Roca

USE geslibros;

-- Bloqueo de tablas
-- 1. Creacion de usuarios
CREATE USER ubrique_01@localhost IDENTIFIED BY 'ubrique_01';
CREATE USER arcos_01@localhost IDENTIFIED BY 'arcos_01';

-- Asignacion de privilegios
GRANT ALL PRIVILEGES ON *.* TO ubrique_01@localhost, arcos_01@localhost;
