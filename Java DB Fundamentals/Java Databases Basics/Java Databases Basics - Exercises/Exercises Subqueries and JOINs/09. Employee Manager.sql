-- 09.Employee Manager
-- Write a query that selects:
-- •	employee_id
-- •	first_name
-- •	manager_id
-- •	manager_name
-- Filter all employees with a manager who has id equal to 3 or 7. Return all rows sorted by employee first_name in ascending order.
-- Example
-- employee_id	first_name	manager_id	manager_name
-- 122	Bryan	7	JoLynn
-- 158	Dylan	3	Roberto
-- …	…	…	…

SELECT e.employee_id,e.first_name,e.manager_id,m.first_name
FROM employees AS e
JOIN employees AS m
On e.manager_id=m.employee_id
WHERE e.manager_id IN (3,7)
ORDER BY e.first_name;

