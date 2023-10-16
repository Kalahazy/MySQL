USE generation;
SHOW tables;
SELECT * FROM students;
SELECT * FROM countries;
SELECT * FROM idtypes;
SELECT * FROM courses_has_students;

-- JOIN. una clausula JOIN se usa para seleccionar datos de dos o más tablas, en función de la relación entre tablas
-- INNER JOIN /JOIN natural. Selecciona registros que tienen valroes que coinciden en ambas tablas.
-- A intersección begin

SELECT students.*, countries.* FROM students JOIN countries ON students.nationality = countries.idCountries;

-- Mostrando información estructurada
SELECT
	CONCAT(students.name, ' ', students.last_name) AS 'Nombre completo',
	CONCAT(students.address, ', ', countries.name) AS 'Direccion',
    students.birthdate AS 'Fecha de nacimiento'
FROM students
JOIN countries
ON students.nationality = countries.idCountries;

-- Conocer el total de estudiantes de USA
SELECT
	COUNT(countries.name)
FROM students
JOIN countries
ON students.nationality = countries.idCountries
WHERE countries.name = 'United States of America';


-- Ejercicios:
-- 1. Encontrar a todo estudiante que tenga como nacionalidad el país 33, mostrando su nombre, apellido y nacionalidad.
SELECT
	CONCAT(s.name, ' ', s.last_name) AS 'Nombre Completo',
    c.name AS 'Nacionalidad'
FROM students AS s
JOIN countries AS c ON s.nationality = c.idCountries
WHERE s.nationality = 33;
-- 2. Encontrar a todo estudiante en países que inician con Ca
SELECT
	s.name AS 'Nombre',
	c.name AS 'País'
FROM students AS s
JOIN countries AS c ON s.nationality = c.idCountries
WHERE c.name LIKE 'ca%';
-- 3. Obtener información de estudiantes y obtener el código del curso que estén cursando.
SELECT
	CONCAT(s.name, ' ', s.last_name) AS 'Nombre Completo',
    co.name AS 'Curso'
FROM students AS s
JOIN courses_has_students AS cS ON s.idStudent = cS.students_id_student
JOIN courses AS co ON cS.course_code = co.code;


-- Aplicando LEFT JOIN
SELECT
	CONCAT(s.name, ' ', s.last_name) AS 'Nombre Completo',
    CONCAT(s.address, ' ', c.name) AS 'Dirección',
    s.birthdate AS 'Fecha de Nacimiento',
    c.name AS 'País'
FROM countries AS c	-- Tabla princial (A) / Mayor jerarquía
LEFT JOIN students AS s	-- Tabla secundaria (B) / Menor jerarquía, tiene KF
ON s.nationality = c.idCountries;
-- Aplicando RIGHT JOIN
SELECT
	CONCAT(s.name, ' ', s.last_name) AS 'Nombre Completo',
    CONCAT(s.address, ' ', c.name) AS 'Dirección',
    s.birthdate AS 'Fecha de Nacimiento',
    c.name AS 'País'
FROM students AS s	-- Tabla princial (A)
RIGHT JOIN countries AS c	-- Tabla secundaria (B)
ON s.nationality = c.idCountries;