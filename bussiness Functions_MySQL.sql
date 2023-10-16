USE business;
SHOW tables;
SELECT * FROM bonus;
SELECT * FROM employee;
Select * FROM title;

-- FUNCTIONS

-- MIN(). Nos permite obtener el valor mínimo de una columna
SELECT MIN(salary) AS 'Salario Menor'	-- AS = Alias
FROM employee;
-- Para caracteres con respecto a la tabla ASCII
SELECT MIN(last_name) AS 'Apellido Menor (ASCII)'
FROM employee;

-- MAX(). Nos permite obtener el valor máximo de una columna
SELECT MAX(salary) AS 'Salario Mayor'
FROM employee;
-- Para caracteres con respecto a la tabla ASCII
SELECT MAX(last_name) AS 'Apellido Mayor (ASCII)'
FROM employee;

-- GROUP BY. Agrupar infromación de diferentes columnas o de una misma columna. No podemos agrupar datos únicos como PKs y IDs
SELECT department FROM employee
GROUP BY department;
SELECT salary FROM employee
GROUP BY salary;
SELECT salary, department FROM employee
GROUP BY salary, department;

-- WHERE > IN. Regresa datos donde existe coinciddencia con los que le proporcionamos, entre paréntesis
-- ASC. Ordena los valores del menor al mayor 
-- DESC. Ordena los valores del mayor al menor
SELECT * FROM employee
WHERE employee_id IN (6, 1, 7, 3)
ORDER BY salary DESC;
SELECT * FROM employee
WHERE salary >= 300000
ORDER BY first_name DESC;
-- Implementando GROUP BY + ORDER BY
SELECT salary FROM employee
WHERE salary >= 300000
GROUP BY salary
ORDER BY salary DESC;

-- LIKE intenta hacer coincidir un String.
SELECT * FROM employee
WHERE first_name LIKE '%a';	-- Registros que FINALIZAN con la letra a
SELECT * FROM employee
WHERE first_name LIKE 'v%';	-- Registros que INICIAN con la letra v
SELECT * FROM employee
WHERE first_name LIKE '%k%';	-- Registros que CONTENGAN la letra k en cualquier posición

SELECT
	CONCAT(employee.first_name, ' ', employee.last_name) AS 'Nombre completo',	-- Se coloca nombreTabla.nombreColumna por buena práctica
    salary AS 'Salario'
FROM employee
ORDER BY salary ASC;

-- AVERAGE AVG() //Si se quiere promediar una columna que no es numérica, detecta que hay valores, pero al no ser numéricos regresa un 0
SELECT AVG(salary) AS 'Salario'
FROM employee;

-- COUNT. Nos permite contar los registros que se encuentran en una columna
SELECT COUNT(salary) AS 'Número registro salarios'
FROM employee;
    
-- Utilizando varias funciones
SELECT
	department AS 'Departamento',
    sum(salary) AS 'Total salario',
    avg(salary) AS 'Promedio de salario',
    min(salary) AS 'Salario menor',
    max(salary) AS 'Salario mayor',
    count(salary) AS 'Número registro salarios'
FROM employee
GROUP BY department;

-- Calcular el total de bonos de Monika
SELECT SUM(b.bonus_amount) AS 'Total de bonos'
FROM bonus AS b	-- Alias de una tabla no lleva comillas simples
WHERE b.employee_id_fk = 1;

-- Calcular el total de bonos de Santiago buscando en ambas tablas
SELECT SUM(b.bonus_amount)
FROM bonus AS b
INNER JOIN employee AS e ON b.employee_id_fk = e.employee_id
WHERE e.first_name = 'Santiago';