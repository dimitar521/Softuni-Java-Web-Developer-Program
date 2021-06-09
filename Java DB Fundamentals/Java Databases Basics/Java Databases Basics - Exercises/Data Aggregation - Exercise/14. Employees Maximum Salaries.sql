SELECT `department_id`,MAX(`salary`)AS max_salary
FROM employees
GROUP BY department_id
HAVING NOT `max_salary`BETWEEN 30000 and 70000
ORDER BY `department_id`;