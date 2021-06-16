-- 4.	Employees from Town
-- Write a stored procedure usp_get_employees_from_town that accepts town_name as parameter and return the employees' first and last name that live in the given town. The result should be sorted by first_name then by last_name alphabetically and id ascending. Submit your query statement as Run skeleton, run queries & check DB in Judge.
-- Example
-- Here it is a list of employees living in Sofia.
-- first_name	last_name
-- George	Denchev
-- Martin	Kulov
-- Svetlin	Nakov

CREATE PROCEDURE `usp_get_employees_from_town`(town_name VARCHAR(20))
BEGIN
SELECT e.first_name,e.last_name
FROM employees AS e
JOIN addresses AS a USING(address_id)
join towns AS t USING (town_id)
WHERE t.name=town_name
ORDER BY first_name,last_name,town_id;

END
