-- Consulta 1: Departamento com maior número de pessoas
SELECT d.name, COUNT(e.id) AS total_employees
FROM department d
JOIN employee e ON d.id = e.department_id
GROUP BY d.name
ORDER BY total_employees DESC
LIMIT 1;

-- Índice criado para acelerar o JOIN e agregação por departamento
CREATE INDEX idx_employee_department ON employee(department_id);

-- ------------------------------------------------------------------------

-- Consulta 2: Quais são os departamentos por cidade
SELECT city, GROUP_CONCAT(name SEPARATOR ', ') AS departments
FROM department
GROUP BY city;

-- Índice criado para otimizar o agrupamento por cidade
CREATE INDEX idx_department_city ON department(city);

-- ------------------------------------------------------------------------

-- Consulta 3: Relação de empregados por departamento
SELECT d.name AS department, e.name AS employee
FROM department d
JOIN employee e ON d.id = e.department_id
ORDER BY d.name;

-- Já coberto pelo índice `idx_employee_department` criado anteriormente
-- O ORDER BY d.name pode se beneficiar de um índice adicional:
CREATE INDEX idx_department_name ON department(name);
-- Comentário: Índice criado para melhorar a ordenação por nome de departamento
