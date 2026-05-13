-- Ejercicio 6.10
-- Jhonal Roca 
-- 1º DAW - DML

USE empresa;

/* 1. Empleados - Consulta multitabla que muestre todos los empleados ordenados por ID. Se quiere:
	De Empleados: id, Nombre, Apellidos, Salario, departamento_id
	De Departamento: Nombre del Departamento */
SELECT 
    e.id,
    e.nombre,
    e.apellidos,
    e.salario,
    e.departamento_id,
    d.nombre AS Departamento
FROM
    empleados e
        LEFT JOIN
    departamentos d ON d.id = e.departamento_id
ORDER BY e.id;

/* 2. Departamentos -  Muestre los detalles de cada departamento, incluido el nombre del jefe, Consulta ordenada afabeticamente por nombre del departamento. Se quiere: 
	De Departamento: id, nombre, localizacion, componentes, jefe_departamento_id
	De Empleados: apellidos, nombre */
SELECT 
    d.id,
    d.nombre,
    d.localizacion,
    d.componentes,
    d.jefe_departamento_id,
    e.nombre,
    e.apellidos
FROM
    departamentos d
        JOIN
    empleados e ON d.jefe_departamento_id = e.id
ORDER BY d.nombre;

/* 3. Empleados con Supervisor - Muestra los detalles de los empleados y el nombre del supervisor asignado, orden por id. Se quiere
	De Empleados: id, nombre, apellidos, nss, salario
	De Empleados_supervisor: nombre, apellidos (del supervisor) */
    SELECT 
    e.id,
    e.nombre,
    e.apellidos,
    e.nss,
    e.salario,
    s.nombre AS supervisor,
    s.apellidos
FROM
    empleados e
        JOIN
    empleados s ON e.supervisor_id = s.id
ORDER BY e.id;

/* 4. Beneficiarios con Empleados - Muestra los detalles de los beneficiarios junto con el nombre del empleado al que pertenecen. Se quiere:
	De Beneficiarios: id, nombre, genero, parentesco, fecha_nac, empleado_id
	De Empleados: nombre, apellidos (empleado) */
SELECT 
    b.id,
    b.nombre,
    b.genero,
    b.parentesco,
    b.fecha_nac,
    b.empleado_id,
    e.nombre,
    e.apellidos
FROM
    beneficiarios b
        JOIN
    empleados e ON b.empleado_id = e.id;
    
/* 5. Proyectos - Muestra los detalles de todos los proyectos junto con el nombre del departamento que lo esta realizando. Se quiere:
	De Proyectos: id, descripcion, num_proyecto, localizacion, fecha_inicio, fecha_fin, departamento_id
	De Departamento: nombre (departamento) */
SELECT 
    p.id,
    p.descripcion,
    p.num_proyecto,
    p.localizacion,
    p.fecha_inicio,
    p.fecha_fin,
    p.departamento_id,
    d.nombre AS departamento
FROM
    proyectos p
        LEFT JOIN
    departamentos d ON p.departamento_id = d.id;

/* 6. Proyectos con jefe de departamento - Muestra los detalles de todos los proyectos junto con el nombre del departamento que lo esta realizando y el nombre del jefe del departamento. Se quiere:
	De Proyectos: id, descripcion, num_proyecto, localizacion, fecha_inicio, fecha_fin, departamento_id
	De Departamento: nombre (departamento)
	De Empleados: nombre, apellidos (jefe del departamento) */
SELECT 
    p.id,
    p.descripcion,
    p.num_proyecto,
    p.localizacion,
    p.fecha_inicio,
    p.fecha_fin,
    p.departamento_id,
    d.nombre AS departemento,
    e.nombre AS jefe,
    e.apellidos
FROM
    proyectos p
        LEFT JOIN
    departamentos d ON p.departamento_id = d.id
        JOIN
    empleados e ON d.jefe_departamento_id = e.id;
    
/* 7. Informe empleados_proyectos - Muestra un informe de las horas trabajadas en cada proyecto, mostrar alfabeticamente por empleads. Se quiere: 
	De Empleados_proyectos: Empleado_id, proyecto_id, horas
	De Empleados: nombre, apellidos
	De Proyectos: descripcion */
SELECT ep.empleado_id, ep.proyecto_id, ep.horas, p.descripcion, e.nombre AS empleado, e.apellidos FROM empleados_proyectos ep JOIN proyectos p ON ep.proyecto_id = p.id JOIN empleados e ON ep.empleado_id = e.id ORDER BY e.nombre;

