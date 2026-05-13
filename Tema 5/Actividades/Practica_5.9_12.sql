-- Creamos la base de datos RestriccionesDefault UTF8_GENERAL_CI
DROP TABLE IF EXISTS restricciones_default;
CREATE DATABASE IF NOT EXISTS restricciones_default
CHARACTER SET utf8 COLLATE utf8_general_ci;

-- Activamos la base de datos
USE restricciones_default;

-- Creamos la tabla 
DROP TABLE IF EXISTS resdefault;
CREATE TABLE IF NOT EXISTS resdefault(
    id INT UNSIGNED AUTO_INCREMENT PRIMARY KEY,
    poblacion VARCHAR(20) DEFAULT 'Ubrique',
    provincia VARCHAR(20) DEFAULT 'Cadiz',
    nacionalidad VARCHAR(30) DEFAULT 'España',
    precio DECIMAL(10,2) DEFAULT '10.20',
    sueldo DECIMAL(10,2) DEFAULT '1500.00',
    fecha_Hora_Llegada TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    fecha_Llegada DATE DEFAULT CURRENT_TIMESTAMP,			
    hora_Llegada TIME DEFAULT CURRENT_TIMESTAMP,  
    casado BOOLEAN DEFAULT TRUE,
    carnet_conducir BOOLEAN DEFAULT TRUE
);

INSERT INTO resdefault VALUES
(null, 'Lecheria', 'Anzoategui', 'Venezuela', 22.24, default, default, default, default, false, false),
(null, 'Madrid', 'España', 'Italia', default, 23400.34, '2025-12-02 13:25:46', '2006-12-24', '09:45:27', default, default),
(null, 'Grazalema', 'Cádiz', 'España', 12.30, 1600.00, '2025-01-23 10:15:00', '2025-01-23', '10:15:00', TRUE, TRUE);
