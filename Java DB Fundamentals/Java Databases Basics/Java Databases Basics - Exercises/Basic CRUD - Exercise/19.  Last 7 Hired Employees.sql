-- 19.  Last 7 Hired Employees 
-- Write a SQL query to find last 7 hired employees. Select their first, last name and their hire date. Submit your query statements as Prepare DB & run queries. 
-- Example 
-- first_name 	last_name 	hire_date 
-- Rachel 	Valdez 	2005-07-01 00:00:00 
-- Lynn 	Tsoflias 	2005-07-01 00:00:00 
-- Syed 	Abbas 	2005-04-15 00:00:00 
-- … 	… 	… 

SELECT first_name,last_name,hire_date from employees
ORDER BY hire_date DESC
LIMIT 7;
