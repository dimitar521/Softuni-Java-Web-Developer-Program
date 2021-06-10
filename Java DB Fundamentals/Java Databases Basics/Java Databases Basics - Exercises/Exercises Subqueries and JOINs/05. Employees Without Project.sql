-- 05.Employees Without Project
-- Write a query that selects:
-- •	employee_id
-- •	first_name
-- Filter only employees without a project. Return the first 3 rows sorted by employee_id in descending order.
-- Example:
-- employee_id	first_name
-- 293	George
-- 292	Martin
-- 291	Svetlin

SELECT e.employee_id,e.first_name
FROM employees AS e 
 LEFT JOIN employees_projects as e_p ON e_p.employee_id=e.employee_id
WHERE e_p.project_id IS NULL
ORDER BY e.employee_id DESC
LImit 3;
