-- Practica 8.1
-- Jhonal Roca
-- Tema 8 - Programación de bases de datos
USE bancos;

-- 1. Pocedimientos Clientes

DELIMITER $$
DROP PROCEDURE IF EXISTS clientes_ciudad $$
CREATE PROCEDURE clientes_ciudad(
    IN p_ciudad VARCHAR(20))

BEGIN
    SELECT *
    FROM clientes
    WHERE ciudad = p_ciudad;
END $$
CALL clientes_ciudad('Ubrique');


-- Actividad 2 - Procedimiento movimientos_cuentas

DROP PROCEDURE IF EXISTS movimientos_cuentas $$
CREATE PROCEDURE movimientos_cuentas(
    IN p_cuenta_id INT UNSIGNED)
BEGIN
    SELECT *
    FROM movimientos
    WHERE cuenta_id = p_cuenta_id;
END $$
CALL movimientos_cuentas(1);

-- Actividad 3 - Procedimiento clientes_cuentas
DROP PROCEDURE IF EXISTS clientes_cuentas $$
CREATE PROCEDURE clientes_cuentas(
    IN p_cliente_id INT UNSIGNED)
BEGIN
    SELECT *
    FROM cuentas
    WHERE cliente_id = p_cliente_id;
END $$

CALL clientes_cuentas(1);


-- Actividad 4 - Procedimiento SaldosBajos
DROP PROCEDURE IF EXISTS SaldosBajos $$
CREATE PROCEDURE SaldosBajos(
    IN p_saldo DECIMAL(10,2))
BEGIN
    SELECT 
        c.id AS id_cuenta,
        c.iban,
        cl.nombre,
        cl.apellidos,
        cl.dni,
        c.saldo
    FROM cuentas c
    INNER JOIN clientes cl
        ON c.cliente_id = cl.id
    WHERE c.saldo < p_saldo;
END $$
CALL SaldosBajos(100);

-- Actividad 5 - Saldo total por cliente
DROP PROCEDURE IF EXISTS saldo_total_cliente $$

CREATE PROCEDURE saldo_total_cliente()
BEGIN
    SELECT
        cl.id AS id_cliente,
        cl.nombre,
        cl.apellidos,
        cl.dni,
        cl.ciudad,
        SUM(c.saldo) AS saldo_total
    FROM clientes cl
    INNER JOIN cuentas c
        ON cl.id = c.cliente_id
    GROUP BY 
        cl.id,
        cl.nombre,
        cl.apellidos,
        cl.dni,
        cl.ciudad
    ORDER BY cl.apellidos, cl.nombre;
END $$

CALL saldo_total_cliente();

DELIMITER ;