-- 11.Write a query that returns the value of the lowest average salary of all departments.
-- Example:
-- min_average_salary
-- 10866.6666

SELECT avg(`salary`) AS min_average_salary
FROM employees
GROUP BY department_id
ORDER BY min_average_salary
LIMIT 1;




