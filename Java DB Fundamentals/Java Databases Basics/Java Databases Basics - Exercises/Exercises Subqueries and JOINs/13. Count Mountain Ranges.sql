-- 13.13.	Count Mountain Ranges
-- Write a query that selects:
-- •	country_code
-- •	mountain_range
-- Filter the count of the mountain ranges in the United States, Russia and Bulgaria. Sort result by mountain_range count in decreasing order.
-- Example
-- country_code	mountain_range
-- BG	6
-- RU	1
-- US	1


SELECT mc.country_code,COUNT(mc.country_code) AS mountain_range
FROM mountains_countries AS mc
JOIN mountains AS m ON m.id=mc.mountain_id
WHERE mc.country_code IN('US','RU','BG')
GROUP BY mc.country_code
ORDER BY mountain_range DESC;
