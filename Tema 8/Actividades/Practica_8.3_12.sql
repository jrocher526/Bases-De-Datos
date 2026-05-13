-- Practica 8.3  
-- Jhonal Roca
-- Tema 8 - Programación de bases de datos
USE maratoon;
-- Actividad 1 - Id de categoria
DELIMITER $$
DROP FUNCTION IF EXISTS Categoria $$
CREATE FUNCTION Categoria(PEdad INT)
RETURNS INT
BEGIN

    DECLARE VCategoria INT;

    SET VCategoria =

    CASE
        WHEN PEdad < 12 THEN 1
        WHEN PEdad BETWEEN 12 AND 14 THEN 2
        WHEN PEdad BETWEEN 15 AND 17 THEN 3
        WHEN PEdad BETWEEN 18 AND 29 THEN 4
        WHEN PEdad BETWEEN 30 AND 39 THEN 5
        WHEN PEdad BETWEEN 40 AND 49 THEN 6
        WHEN PEdad BETWEEN 50 AND 60 THEN 7
        ELSE 8
        
    END;

    RETURN VCategoria;
END $$
DELIMITER ;
-- Prueba
SELECT Categoria(35);


-- Actividad 2 - Procedimiento actualizar categoria
DELIMITER $$
DROP PROCEDURE IF EXISTS ActualizarCategoria $$
CREATE PROCEDURE ActualizarCategoria()
BEGIN

    UPDATE Corredores
    SET categoria_id = Categoria(Edad);
END $$
DELIMITER ;
-- Uso
CALL ActualizarCategoria();


-- Actividad 3 - Procedimiento proximo cumpleaños
DELIMITER $$
DROP PROCEDURE IF EXISTS ProximosCumpleaños $$
CREATE PROCEDURE ProximosCumpleaños()
BEGIN

    SELECT *
    FROM Corredores
    WHERE WEEK(DATE_ADD(FechaNacimiento,
          INTERVAL YEAR(CURDATE()) - YEAR(FechaNacimiento) YEAR))
          =
          WEEK(CURDATE()) + 1;

END $$
DELIMITER ;
-- Uso
CALL ProximosCumpleaños();


-- Actividad 4 - Funcion numeros primos
DELIMITER $$

DROP FUNCTION IF EXISTS NumerosPrimos $$

CREATE FUNCTION NumerosPrimos(num INT)
RETURNS INT
BEGIN
    DECLARE i INT DEFAULT 1;
    DECLARE e INT;
    DECLARE esprimo BOOLEAN;
    DECLARE suma INT DEFAULT 0;

    WHILE i <= num DO

        SET esprimo = 1;
        SET e = 2;

        WHILE e < i DO

            IF MOD(i,e)=0 THEN
                SET esprimo = 0;
            END IF;

            SET e = e + 1;

        END WHILE;

        IF esprimo = 1 THEN
            SET suma = suma + i;
        END IF;

        SET i = i + 1;

    END WHILE;

    RETURN suma;
END $$
DELIMITER ;
-- Prueba
SELECT NumerosPrimos(7);


-- Actividad 5 - Factprial
DELIMITER $$
DROP FUNCTION IF EXISTS factorial $$
CREATE FUNCTION factorial(num INT)
RETURNS INT
BEGIN

    DECLARE i INT DEFAULT 1;
    DECLARE resultado INT DEFAULT 1;

    WHILE i <= num DO

        SET resultado = resultado * i;

        SET i = i + 1;

    END WHILE;

    RETURN resultado;

END $$

DELIMITER ;

-- Prueba
SELECT factorial(5);