-- Query
SELECT d.name, COUNT(e.id) AS total_employees
FROM department d
JOIN employee e ON d.id = e.department_id
GROUP BY d.name
ORDER BY total_employees DESC
LIMIT 1;

-- Índice
CREATE INDEX idx_employee_department ON employee(department_id);
-- Comentário: Índice criado para acelerar JOIN e contagem por departamento.

-- Query
SELECT city, GROUP_CONCAT(name SEPARATOR ', ') AS departments
FROM department
GROUP BY city;

-- Índice
CREATE INDEX idx_department_city ON department(city);
-- Comentário: Índice criado para otimizar o agrupamento por cidade.

-- Query
SELECT d.name AS department, e.name AS employee
FROM department d
JOIN employee e ON d.id = e.department_id
ORDER BY d.name;

-- Já coberto pelo índice anterior `idx_employee_department`.
