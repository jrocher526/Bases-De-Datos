-- Ejercicio 6.10
-- Jhonal Roca 
-- 1º DAW - DML

-- Ejercicio 1 - Mostrar detalles de empleados y departamentos
SELECT 
    e.id,
    e.nombre,
    e.apellidos,
    e.nss,
    TIMESTAMPDIFF(YEAR,
        fecha_nac,
        CURDATE()) edad,
    e.salario,
    d.nombre AS departamento
FROM
    empleados e
        LEFT JOIN
    departamentos d ON e.departamento_id = d.id
ORDER BY e.id;

-- Ejercicio 2 - Mostrar detalles a cerca de los departamentos
SELECT 
    d.id,
    d.nombre,
    d.jefe_departamento_id,
    e.nombre AS jefe,
    e.id,
    e.nombre,
    e.apellidos
FROM
    departamentos d
        LEFT JOIN
    empleados e ON d.jefe_departamento_id = e.id
ORDER BY d.id;

-- Ejercicio 3 - Mostrar detalles sobre los empleados que haya trabajado en algun proyecto
SELECT 
    e.id,
    e.nombre,
    e.apellidos,
    d.nombre AS departamento,
    p.descripcion AS proyecto,
    ep.horas
FROM
    empleados e
        LEFT JOIN
    departamentos d ON e.departamento_id = d.id
        LEFT JOIN
    empleados_proyectos ep ON e.id = ep.empleado_id
        LEFT JOIN
    proyectos p ON ep.proyecto_id = p.id
ORDER BY ep.horas DESC;

-- Ejercicio 4 - Mostrar los siguientes detalles sobree proyectos
SELECT 
    p.id,
    p.descripcion,
    p.num_proyecto,
    p.fecha_inicio,
    d.nombre AS departamento,
    e.nombre,
    e.apellidos,
    ep.horas
FROM
    proyectos p
        LEFT JOIN
    departamentos d ON p.departamento_id = d.id
        LEFT JOIN
    empleados_proyectos ep ON p.id = ep.proyecto_id
        LEFT JOIN
    empleados e ON ep.empleado_id = e.id
ORDER BY ep.horas DESC;