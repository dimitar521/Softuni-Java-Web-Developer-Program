-- 9.  Find Names of All Employees  
-- Write a SQL query to find the full name of all employees whose salary is 25000, 14000, 12500 or 23600. Full Name is combination of first, middle and last name (separated with single space) and they should be in one column called "Full Name". Submit your query statements as Prepare DB & run queries. 
-- Example 
-- Full Name 
-- Guy R Gilbert 
-- Thierry B D'Hers 
-- JoLynn M Dobney 

SELECT concat(first_name,' ', middle_name,' ',last_name) AS `Full Name` FROM employees
WHERE salary IN (25000, 14000, 12500, 23600);

