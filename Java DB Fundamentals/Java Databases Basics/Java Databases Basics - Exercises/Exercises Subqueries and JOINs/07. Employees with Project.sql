-- 07.Write a query that selects:
-- •	employee_id
-- •	first_name
-- •	project_name
-- Filter only employees with a project, which has started after 13.08.2002 and it is still ongoing (no end date). Return the first 5 rows sorted by first_name then by project_name both in ascending order.
-- Example
-- employee_id	first_name	project_name
-- 44	A. Scott	Hitch Rack - 4-Bike
-- 170	Alan	LL Touring Handlebars
-- …	…	…


SELECT e.employee_id,e.first_name,p.name AS project_name
FROM employees AS e 
JOIN employees_projects AS ep ON e.employee_id=ep.employee_id
JOIN projects AS p USING (`project_id`)
WHERE date(p.start_date) > '2002-08-13'AND p.end_date IS NUll
ORDER BY e.first_name,p.name
Limit 5;