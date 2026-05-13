-- Creamos la base de datos tipo_datos_fechas.
CREATE DATABASE IF NOT EXISTS tipo_datos_fechas; 

-- Ponemos en uso nuestra base de datos para poder crear nuestra tabla.
USE tipo_datos_fechas;

-- Cramos nuestra tabla.
CREATE TABLE IF NOT EXISTS datos_fechas (
id INT UNSIGNED AUTO_INCREMENT PRIMARY KEY,
fecha_nac DATE,
fecha_hora_nac DATETIME,
hora_llegada TIME,
hora_salida TIME,
anyo_nac YEAR,
anyo_fundacion YEAR,
fecha_hora_salida DATETIME(3),
fecha_hora_llegada DATETIME(3),
fecha_hora_actual DATETIME(1) DEFAULT CURRENT_TIMESTAMP,
tiempo_llegada TIMESTAMP(6), 
edad TINYINT UNSIGNED,
create_at DATETIME DEFAULT CURRENT_TIMESTAMP,
update_at DATETIME DEFAULT CURRENT_TIMESTAMP
);

-- Añadimos valores a la tabla creada.
INSERT INTO datos_fechas VALUES
(
 null,							-- id
 '2006/04/05',					-- fecha de nacimiento		
 NOW(),							-- fecha hora de nacimiento
 '12:25:35',					-- hora de llegada
 '05:00:00',					-- hora de salida
 '2006',						-- año de nacimiento
 '2008',						-- año de fundacion
 '2025-01-15 12:34:56.123456',	-- fecha hora de salida
 '2024-12-31 23:59:59.987654',	-- fehca hora de llegada
  NOW(),						-- fecha hora actual
 '2026-10-10 10:10:10.111111',	-- tiempo de llegada
 '18',							-- edad
  NOW(),						-- create_at
  NOW() 						-- update_at
),
(
 null,						
 '2008/09/11',					
 NOW(),							
 '07:30:00',					
 '03:00:00',				
 '2008',						
 '2010',						
 '2023-09-18 16:20:05.444444',	
 '2024-12-31 23:59:59.987654',	
  NOW(),			
 '2028-06-07 05:30:00.555555',
 '16',					
  NOW(),						
  NOW() 					
),
(
 null,			
 '2014/12/09',					
 NOW(),							
 '08:50:00',			
 '03:50:05',				
 '2014',				
 '2015',	
 '2021-09-09 08:48:30.234234',	
 '2020-02-14 06:22:15.456456',
  NOW(),						
 '2022-11-30 22:11:11.888888',	
 '10',							
  NOW(),						
  NOW() 
);
