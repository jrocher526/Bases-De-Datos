-- 1. Crear la base de datos ajedrez
CREATE DATABASE IF NOT EXISTS ajedrez
CHARACTER SET utf8
COLLATE utf8_general_ci;

-- 2️. Modificar la base de datos ajedrez
ALTER DATABASE ajedrez
CHARACTER SET latin1
COLLATE latin1_swedish_ci;

-- 3️. Eliminar la base de datos ajedrez
DROP DATABASE IF EXISTS ajedrez;

-- 4️. Crear la base de datos futbol con UTF-16
CREATE DATABASE IF NOT EXISTS futbol
CHARACTER SET utf16
COLLATE utf16_general_ci;

-- 5️. Modificar la base de datos futbol a UTF8MB4
ALTER DATABASE futbol
CHARACTER SET utf8mb4
COLLATE utf8mb4_general_ci;

-- 6️. Eliminar definitivamente la base de datos futbol
DROP DATABASE IF EXISTS futbol;
