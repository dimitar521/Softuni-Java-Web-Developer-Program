-- 6.	Employees by Salary Level

-- Write a stored procedure usp_get_employees_by_salary_level that receive as parameter level of salary (low, average or high) and print the names of all employees that have given level of salary. The result should be sorted by first_name then by last_name both in descending order.
-- Submit your query statement as Run skeleton, run queries & check DB in Judge.
-- Example

-- Here is the list of all employees with high salary.
-- first_name	last_name
-- Terri	Duffy
-- Laura	Norman
-- Ken	Sanchez
-- …	…
DELIMITER $$
CREATE FUNCTION `ufn_get_salary_level`(e_salary decimal) RETURNS varchar(50)
    DETERMINISTIC
BEGIN
RETURN(CASE 
WHEn  e_salary <30000 THEN 'Low'
WHEN e_salary BETWEEN 30000 AND 50000 THEN 'Average'
ELSE 'High'
END
);
END;
CREATE PROCEDURE `usp_get_employees_by_salary_level`(s_level VARCHAR(10))
BEGIN
SELECT first_name,last_name
FROM employees 
WHERE ufn_get_salary_level (salary)= s_level
ORDER BY first_name DESC,last_name DESC;

END;
DELIMITER;