-- 02.Addresses with Towns
-- Write a query that selects:
-- •	first_name
-- •	last_name
-- •	town
-- •	address_text
-- Sort the result by first_name in ascending order then by last_name. Select first 5 employees.
-- Example:
-- first_name	last_name	town	address_text
-- A.Scott	Wright	Newport Hills	1400 Gate Drive
-- Alan	Brewer	Kenmore	8192 Seagull Court
-- …	…	…	…

SELECT e.first_name,e.last_name,t.name,a.address_text
FROM employees as e
JOIN addresses as a on a.address_id=e.address_id
JOIN towns as t on t.town_id=a.town_id
order by `first_name`,last_name
LIMIT 5;
