-- 16.Countries Without Any Mountains
-- Find the count of all countries which don't have a mountain.
-- Example
-- country_count
-- 231
SELECT COUNT(c.country_code)AS country_count
FROM countries AS c
LEFT JOIN mountains_countries AS m  USING (`country_code`)
WHERE m.mountain_id IS NULL;



