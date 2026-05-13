-- Practica 8.2
-- Jhonal Roca
-- Tema 8 - Programación de bases de datos
USE bancos;
-- Actividad 1 - Saldo total
DELIMITER $$
DROP FUNCTION IF EXISTS bancos.saldo_total $$
CREATE FUNCTION bancos.saldo_total()
RETURNS DECIMAL(10,2)

BEGIN

    DECLARE total DECIMAL(10,2);

    SET total = (
        SELECT SUM(saldo)
        FROM cuentas
    );

    RETURN total;

END $$

DELIMITER ;
-- Prueba
SELECT bancos.saldo_total();


-- Actividad 2 - Mejor cliente
DELIMITER $$
DROP FUNCTION IF EXISTS bancos.mejor_cliente $$
CREATE FUNCTION bancos.mejor_cliente()
RETURNS INT UNSIGNED

BEGIN

    DECLARE mejor INT UNSIGNED;

    SET mejor = (
        SELECT cliente_id
        FROM cuentas
        ORDER BY saldo DESC
        LIMIT 1
    );

    RETURN mejor;

END $$
DELIMITER ;
-- Prueba
SELECT bancos.mejor_cliente();


-- Actividad 3 - Saldo Cuentas
DELIMITER $$
DROP FUNCTION IF EXISTS bancos.saldo_cuentas $$

CREATE FUNCTION bancos.saldo_cuentas(id_cuenta INT UNSIGNED)
RETURNS DECIMAL(10,2)

BEGIN

    DECLARE saldo_total DECIMAL(10,2);

    SET saldo_total = (
        SELECT SUM(cantidad)
        FROM movimientos
        WHERE cuenta_id = id_cuenta
    );

    RETURN saldo_total;

END $$
DELIMITER ;
-- Prueba
SELECT bancos.saldo_cuentas(1);


-- Actividad 4 - Verificar saldo
DELIMITER $$

DROP PROCEDURE IF EXISTS bancos.verificar_saldo $$

CREATE PROCEDURE bancos.verificar_saldo(IN id_cuenta INT UNSIGNED)

BEGIN

    DECLARE saldo_tabla DECIMAL(10,2);
    DECLARE saldo_real DECIMAL(10,2);

    -- Saldo almacenado
    SET saldo_tabla = (
        SELECT saldo
        FROM cuentas
        WHERE id = id_cuenta
    );

    -- Saldo calculado
    SET saldo_real = bancos.saldo_cuentas(id_cuenta);

    -- Comparación
    IF saldo_tabla <> saldo_real THEN

        SELECT *
        FROM cuentas
        WHERE id = id_cuenta;

    END IF;

END $$

DELIMITER ;

-- Prueba
CALL bancos.verificar_saldo(1);


-- Actividad 5 - Auditar salodo
DELIMITER $$
DROP PROCEDURE IF EXISTS bancos.auditar_saldo $$
CREATE PROCEDURE bancos.auditar_saldo(IN id_cuenta INT UNSIGNED)
BEGIN

    DECLARE saldo_tabla DECIMAL(10,2);
    DECLARE saldo_real DECIMAL(10,2);

    -- Saldo almacenado
    SET saldo_tabla = (
        SELECT saldo
        FROM cuentas
        WHERE id = id_cuenta
    );

    -- Saldo calculado
    SET saldo_real = bancos.saldo_cuentas(id_cuenta);

    -- Si no coinciden
    IF saldo_tabla <> saldo_real THEN

        UPDATE cuentas
        SET saldo = saldo_real
        WHERE id = id_cuenta;

    END IF;

END $$

DELIMITER ;