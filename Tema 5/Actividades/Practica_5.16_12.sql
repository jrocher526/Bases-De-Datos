-- Actividad 5.16

-- Ponemos en uso la base de datos para realizar modificaciones
USE libros_almacen;

-- Tabla autores
DROP TABLE IF EXISTS autores;
CREATE TABLE IF NOT EXISTS autores (
	id INT UNSIGNED AUTO_INCREMENT PRIMARY KEY,
    nombre VARCHAR(50) NOT NULL,
    nacionalidad VARCHAR (30) NOT NULL,
    fechaNac DATE NOT NULL,
    Estilo VARCHAR (60)
);

-- Tabla libros
ALTER TABLE libros
    DROP COLUMN autor,
    ADD COLUMN autor_id INT UNSIGNED NOT NULL,
    ADD COLUMN isbn CHAR(13) UNIQUE NOT NULL,
    ADD COLUMN ean CHAR(13) UNIQUE,
    ADD COLUMN categorias SET('Drama','Novela','Comedia'),
    ADD COLUMN tipo_lector ENUM('Infantil','Juvenil','Adulto','Mayor') NOT NULL,
    ADD COLUMN fecha_edicion DATE;

ALTER TABLE libros
    ADD CONSTRAINT fk_libros_autor
    FOREIGN KEY (autor_id) REFERENCES autores(id);
    
    -- Tabla Socios
    ALTER TABLE socios
    ADD CONSTRAINT unique_telefono UNIQUE (telefono),
    ADD COLUMN direccion VARCHAR(255),
    ADD COLUMN poblacion VARCHAR(255),
    ADD COLUMN c_postal VARCHAR(10),
    ADD COLUMN provincia VARCHAR(255),
    ADD COLUMN nacionalidad VARCHAR(100),
    ADD COLUMN valoracion TINYINT UNSIGNED CHECK (valoracion BETWEEN 0 AND 10),
    CHANGE COLUMN nombre socio VARCHAR(255);

-- Tabla LibrosPedidos
ALTER TABLE librosPedidos
    ADD COLUMN descuento DECIMAL(4,3) CHECK (descuento BETWEEN 0 AND 1),
    ADD COLUMN importe DECIMAL(10,2);

-- Ficheros indices
-- Tutulo en la tabla libros
CREATE INDEX idx_libros_titulo
ON libros (titulo);

-- Fecha en la tabla pedidos
CREATE INDEX idx_pedidos_fecha
ON pedidos (fecha);

-- Nombre en la tabla almacenes
CREATE INDEX idx_almacenes_nombre
ON almacenes (nombre);

-- Nombre en la tabla socios
CREATE INDEX idx_socios_nombre
ON socios (nombre);