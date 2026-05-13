-- Actividad 7.8
-- BDD - DCL
-- Jhonal Roca

-- Añadir corredores
INSERT INTO Corredores (Id, Nombre, Apellidos, Ciudad, FechaNacimiento, Sexo, Edad, Categoria_id, Club_id) VALUES
(NULL, 'Luis','Gómez Ruiz','Monagas','1995-03-10','M',NULL,NULL,5),
(NULL, 'Ana','Martín López','Puerto la cruz','2002-07-21','F',NULL,NULL,5),
(NULL, 'Carlos','Sánchez Díaz','Lecheria','1988-11-05','M',NULL,NULL,5);

-- Actualizar edad
UPDATE Corredores 
SET 
    Edad = TIMESTAMPDIFF(YEAR,
        FechaNacimiento,
        NOW());
        
-- Actualizar Categoria
UPDATE Corredores SET categoria_id = 1 WHERE Edad < 12; -- infantil
UPDATE Corredores SET categoria_id = 2 WHERE Edad < 15 AND Edad >= 12; -- junior
UPDATE Corredores SET categoria_id = 3 WHERE Edad < 18 AND Edad >= 15; -- juvenil
UPDATE Corredores SET categoria_id = 4 WHERE Edad < 30 AND Edad >= 18; -- senior and
UPDATE Corredores SET categoria_id = 5 WHERE Edad < 40 AND Edad >= 30; -- senior b
UPDATE Corredores SET categoria_id = 6 WHERE Edad < 50 AND Edad >= 40; -- VT A
UPDATE Corredores SET categoria_id = 7 WHERE Edad < 60 AND Edad >= 50; -- VT B 
UPDATE Corredores SET categoria_id = 8 WHERE Edad >= 60; -- VT C

-- Mostrar corredores
-- Todos
SELECT 
    c.id,
    c.Nombre,
    c.Apellidos,
    c.FechaNacimiento,
    c.Edad,
    cat.Nombrecorto AS Categoria,
    cl.NombreCorto AS Club
FROM
    Corredores c
        JOIN
    Categorias cat ON c.categoria_id = cat.id
        JOIN
    Clubs cl ON c.club_id = cl.id;

-- Los que cumplen el mes que viene 
SELECT 
    c.id,
    c.Nombre,
    c.Apellidos,
    c.FechaNacimiento,
    c.Edad,
    cat.Nombrecorto,
    cl.NombreCorto
FROM
    Corredores c
        JOIN
    Categorias cat ON c.categoria_id = cat.id
        JOIN
    Clubs cl ON c.club_id = cl.id
WHERE
    MONTH(c.FechaNacimiento) = MONTH(DATE_ADD(NOW(), INTERVAL 1 MONTH));

-- Los que cumplen la semana que viene 
SELECT 
    c.id,
    c.Nombre,
    c.Apellidos,
    c.FechaNacimiento,
    c.Edad,
    cat.Nombrecorto,
    cl.NombreCorto
FROM
    Corredores c
        JOIN
    Categorias cat ON c.categoria_id = cat.id
        JOIN
    Clubs cl ON c.club_id = cl.id
WHERE
    WEEK(c.FechaNacimiento) = WEEK(DATE_ADD(NOW(), INTERVAL 1 WEEK));

-- Los que cumplen el segundo 4º Cuatrimestre
SELECT 
    c.id,
    c.Nombre,
    c.Apellidos,
    c.FechaNacimiento,
    c.Edad,
    cat.Nombrecorto,
    cl.NombreCorto
FROM
    Corredores c
        JOIN
    Categorias cat ON c.categoria_id = cat.id
        JOIN
    Clubs cl ON c.club_id = cl.id
WHERE
    MONTH(c.FechaNacimiento) BETWEEN 4 AND 8;	

-- Maratoon de Sevilla 
INSERT INTO Registros VALUES
(NULL, 2, 2, '2019-12-02 09:00:00', '2019-12-02 11:15:00', NULL),
(NULL, 2, 3, '2019-12-02 09:00:00', '2019-12-02 11:20:00', NULL),
(NULL, 2, 4, '2019-12-02 09:00:00', '2019-12-02 11:18:00', NULL),
(NULL, 2, 5, '2019-12-02 09:00:00', '2019-12-02 11:25:00', NULL),
(NULL, 2, 6, '2019-12-02 09:00:00', '2019-12-02 11:30:00', NULL);	

-- Actualizar tiempo de llegada
UPDATE Registros 
SET 
    TiempoInvertido = TIMEDIFF(Llegada, Salida)
WHERE
    carrera_id = 2;

-- Mostrar Clasificacion 
-- Basica
SELECT c.id, c.Nombre, c.Apellidos,
cl.Nombre AS Club,
cat.Nombre AS Categoria,
r.TiempoInvertido
FROM Registros r
JOIN Corredores c ON r.corredor_id = c.id
JOIN Clubs cl ON c.club_id = cl.id
JOIN Categorias cat ON c.categoria_id = cat.id
WHERE r.carrera_id = 2
ORDER BY r.TiempoInvertido ASC;

-- Segundos 
SELECT c.id, c.Nombre, c.Apellidos,
cl.Nombre, cat.Nombre,
r.TiempoInvertido,
TIME_TO_SEC(r.TiempoInvertido) AS Segundos
FROM Registros r
JOIN Corredores c ON r.corredor_id = c.id
JOIN Clubs cl ON c.club_id = cl.id
JOIN Categorias cat ON c.categoria_id = cat.id
WHERE r.carrera_id = 2
ORDER BY r.TiempoInvertido;

-- Diferencias con record
SELECT c.id, c.Nombre, c.Apellidos,
cl.Nombre, cat.Nombre,
r.TiempoInvertido,
SEC_TO_TIME(TIME_TO_SEC(r.TiempoInvertido) - TIME_TO_SEC('02:01:39')) AS DiferenciaRecord
FROM Registros r
JOIN Corredores c ON r.corredor_id = c.id
JOIN Clubs cl ON c.club_id = cl.id
JOIN Categorias cat ON c.categoria_id = cat.id
WHERE r.carrera_id = 2
ORDER BY r.TiempoInvertido;

-- SNA 
SELECT c.id, c.Nombre, c.Apellidos,
cl.Nombre, cat.Nombre,
r.TiempoInvertido
FROM Registros r
JOIN Corredores c ON r.corredor_id = c.id
JOIN Clubs cl ON c.club_id = cl.id
JOIN Categorias cat ON c.categoria_id = cat.id
WHERE r.carrera_id = 2
AND cat.Nombrecorto = 'SNA'
ORDER BY r.TiempoInvertido;