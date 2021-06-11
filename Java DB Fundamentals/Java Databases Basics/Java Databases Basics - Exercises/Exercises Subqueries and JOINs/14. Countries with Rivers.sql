-- 14.Countries with Rivers
-- Write a query that selects:
-- •	country_name
-- •	river_name
-- Find the first 5 countries with or without rivers in Africa. Sort them by country_name in ascending order.
-- Example
-- country_name	river_name
-- Algeria	Niger
-- Angola	Congo
-- Benin	Niger
-- Botswana	NULL
-- Burkina Faso	Niger

SELECT c.country_name,r.river_name
FROM countries AS c
LEFT JOIN countries_rivers AS cr ON c.country_code=cr.country_code
 LEFT JOIN rivers AS r ON cr.river_id=r.id
 WHERE c.continent_code ='AF'
 ORDER BY c.country_name
 LIMIT 5;

