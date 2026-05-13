-- ejemplos restricciones

-- Creación base de datos
DROP DATABASE IF exists ventas;
CREATE database IF NOT EXISTS ventas;

-- Activar la base de datos ventas
USE ventas;

-- Crear la tabla articulos
DROP TABLE IF EXISTS productos;
CREATE TABLE IF NOT EXISTS productos(
	id INT UNSIGNED AUTO_INCREMENT PRIMARY KEY,
    descripcion VARCHAR(20) NOT NULL,
    precio DECIMAL(10, 2) NOT NULL,
    imagen VARCHAR(255),
    EAN CHAR(13) UNIQUE NOT NULL
);


-- Creación tabla clientes
DROP TABLE IF EXISTS clientes;
CREATE TABLE IF NOT EXISTS clientes(
	id INT UNSIGNED AUTO_INCREMENT PRIMARY KEY,
    nombre VARCHAR(50) NOT NULL,
    cif CHAR(9) UNIQUE NOT NULL,
    poblacion VARCHAR(20)
);

-- Creación tabla pedidos
DROP TABLE IF EXISTS pedidos;
CREATE TABLE IF NOT EXISTS pedidos(
	id INT UNSIGNED AUTO_INCREMENT PRIMARY KEY,
    descripcion VARCHAR(255),
    cliente_id INT UNSIGNED,
    FOREIGN KEY (cliente_id) REFERENCES clientes (id)
    ON DELETE RESTRICT ON UPDATE CASCADE
);

-- Creación tabla linea_pedidos
DROP TABLE IF EXISTS linea_pedidos;
CREATE TABLE IF NOT EXISTS linea_pedidos(
	pedido_id INT UNSIGNED,
    producto_id INT UNSIGNED,
    cantidad float,
    precio DECIMAL(10,2),
    PRIMARY KEY(pedido_id, producto_id),
    -- restricciones foreign key
    FOREIGN KEY(pedido_id) REFERENCES pedidos (id) 
    ON DELETE RESTRICT ON UPDATE CASCADE,
    FOREIGN KEY(producto_id) REFERENCES productos (id)
    ON DELETE RESTRICT ON UPDATE CASCADE
);
