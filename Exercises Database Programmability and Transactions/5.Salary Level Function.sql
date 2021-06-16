-- 5.	Salary Level Function
-- Write a function ufn_get_salary_level that receives salary of an employee and returns the level of the salary.
-- •	If salary is < 30000 return "Low"
-- •	If salary is between 30000 and 50000 (inclusive) return "Average"
-- •	If salary is > 50000 return "High"
-- Submit your query statement as Run skeleton, run queries & check DB in Judge.
-- Example
-- salary	salary_Level
-- 13500.00	Low
-- 43300.00	Average
-- 125500.00	High

CREATE FUNCTION `ufn_get_salary_level`(salary decimal(20,2)) RETURNS varchar(50) CHARSET utf8
    DETERMINISTIC
BEGIN

RETURN

(CASE 
WHEn  salary <30000 THEN 'Low'
WHEN salary BETWEEN 30000 AND 50000 THEN 'Average'
ELSE 'High'
END
);
END
