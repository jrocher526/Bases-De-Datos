-- Practica_710_12
-- Observacion: Los comandos estan en modo comentario puesto que se ejecutan desde una consola

-- 1. Accede usuario root a modo consola
-- mysql -h localhost -u root 

/* 2. Realiza los siguientes comandos sql:
* Muestra todas las bases de datos existentes en mysql
	-- show databases; 
* Selecciona la base de datos geslibros, como base de datos activa
	-- use geslibros;
* Muestra todas las tablas de la base de datos activa (geslibros)
	-- show tables;
* Muestra la estructura de la tabla libros (usa el comando sql describe)
	-- describe libros;
* Muestra las columnas host, user y password de la tabla mysql.user.
-- select host, user, password from mysql.user;
* Muestra los privilegios de dos de los usuarios mostrados en el ejercicio anterior (usar el comando sql show grants for user@localhost)
	-- show grants for 'root'@'localhost';
* Muestra los privilegios del usuario actual (show grants for CURRENT_USER())
	-- show grants for CURRENT_USER();
* Muestra todos los privilegios que se pueden asignar a un usuario (show privileges) */
	-- show privileges;
    
/* 3. En modo consola crea el usuario lopez asignándole el password 123456 asignándole los siguientes privilegios:
Create, Alter, Update, Insert sobre la tabla corredores de la base de datos maratoon. */
		-- Para crear usuarios usamos
	-- create user 'lopez'@'localhost' identified by '123456';
		-- Para asignar permisos usamos
	/* grant create, alter, update, insert
			on maratoon.corredores
		to 'lopez'@'localhost'; */
		-- Mostramos sus datos
	-- show grants for 'lopez'@'localhost';
    
/* 4. En modo consola cambiar el password del usuario anterior a 654321 */
	-- alter user 'lopez'@'localhost' identified by '654321';
    
/* 5. En modo consola realiza la siguiente transacción sobre la base de datos geslibros: 
	-- use geslibros;
Inicia transacción
	-- start transaction;
Actualiza el precio de todos los libros incrementándolo en un 10%
	-- update libros
	-- set precio_venta = precio_venta * 1.10;
Comprobar actualización
	-- select * from libros\G; 		/G Funciona para poner el resultado en vertical
Terminar transacción de forma no satisfactoria */
	-- rollback;
    
/* 6. En modo consola realiza las siguientes operaciones de bloqueo de tablas sobre la base de datos geslibros:
Bloquee a modo lectura la tabla libros
	-- lock table libros read;
Muestra todos los autores (no se debe ejecutar este comando)
	-- select * from autores;
Desbloquea todas las tablas
	-- unlock tables;
Muestra ahora todos los autores */
	-- select * from autores  \G;
    
/* 7. En modo consola realiza las siguientes operaciones:
Inicia transacción */
	-- start transaction;
/*Bloque a modo compartido todos los clientes de la provincia de Cádiz. */
	select * from clientes where provincia = 'Cadiz' lock in share mode;	-- Da error
/* Muestre todos los clientes excepto los que pertenecen a la provincia de Cádiz */
	select * from clientes where provincia <> 'Cadiz'; 	-- Da error
/* Termine correctamente la transacción */
	-- commit;

/* 8. Igualmente en modo consola realiza las siguientes operaciones sobre la base de datos maratoon:
	 USE maratoon;
/* Actualiza la edad de todos los corredores */
	-- UPDATE corredores SET edad = edad + 1;
/* Muestra id, apellidos, nombre, edad, club, categoria, de todos los corredores */
	 SELECT id, apellidos, nombre, edad, club, categoria FROM corredores;

/* 9. Crea en un fichero con formato csv a partir de un comando SELECT, los corredores sólo de villamartín. 
	 SELECT 
    *
FROM
    corredores
WHERE
    localidad = 'Villamartin' 
INTO OUTFILE 
	'/tmp/corredores_villamartin.csv' 
FIELDS TERMINATED BY ',' ENCLOSED BY '"' LINES TERMINATED BY ''; */

/* 10. Salir de MySQL en modo consola */ 
	-- EXIT;
    
/* 11. Realizar una copia de seguridad de la base de datos maratoon (tanto estructura como tablas) maratoon.sql */ 
	-- mysqldump -u root -p maratoon > maratoon.sql
    
/* 12. Realizar una copia de seguridad de todas las bases de datos de mysql (alldatabases.sql) */
	-- mysqldump -u root -p --all-databases > alldatabases.sql
    
/* Exportar la base de datos empresa en formato xml (empresa.xml) */
	-- mysqldump -u root -p --xml empresa > empresa.xml