-- 10.Employee Summary
-- Write a query that selects:
-- •	employee_id
-- •	employee_name
-- •	manager_name		
-- •	department_name
-- Show the first 5 employees (only for employees who have a manager) with their managers and the departments they are in (show the departments of the employees). Order by employee_id.
-- Example
-- employee_id	employee_name	manager_name	department_name
-- 1	Guy Gilbert	Jo Brown	Production
-- 2	Kevin Brown	David Bradley	Marketing
-- …	…	…	…

SELECT e.employee_id,concat(e.first_name,' ',e.last_name)AS employee_name,concat(m.first_name,' ',m.last_name)AS manager_name,d.name AS department_name
FROM employees AS e
JOIN employees AS m ON e.manager_id=m.employee_id
 JOIN departments AS d ON d.department_id=e.department_id
ORDER BY e.employee_id
LIMIT 5;



