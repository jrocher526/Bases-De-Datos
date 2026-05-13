-- Actividad: 5.14
-- MODIFICACIONES TABLA CLIENTES

USE proyectos;

-- Añadir nuevas columnas a la tabla clientes
ALTER TABLE clientes
ADD COLUMN apellidos VARCHAR(45),
ADD COLUMN poblacion VARCHAR(50),
ADD COLUMN nacionalidad VARCHAR(30),
ADD COLUMN email VARCHAR(60) UNIQUE,
ADD COLUMN direccion VARCHAR(100),
ADD COLUMN cod_cliente CHAR(7) UNIQUE,
ADD COLUMN tipo_cliente INT;

-- Modificar columnas existentes
ALTER TABLE clientes
MODIFY nombre VARCHAR(25) NOT NULL,
MODIFY apellidos VARCHAR(45) NOT NULL,
MODIFY nacionalidad VARCHAR(30) DEFAULT 'España',
MODIFY direccion VARCHAR(100),
CHANGE email correo_electronico VARCHAR(60);

-- Añadir restricciones a la tabla clientes
ALTER TABLE clientes
ADD CONSTRAINT chk_correo_email
CHECK (correo_electronico LIKE '%@%'),
ADD CONSTRAINT chk_tipo_cliente
CHECK (tipo_cliente BETWEEN 0 AND 10);

-- Crear índice sobre las columnas apellidos y nombre
CREATE INDEX idx_clientes_apellidos_nombre
ON clientes (apellidos, nombre);

SHOW INDEX FROM clientes;