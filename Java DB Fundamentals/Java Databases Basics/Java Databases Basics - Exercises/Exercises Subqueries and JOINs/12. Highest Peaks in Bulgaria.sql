-- 12.Write a query that selects:
-- •	country_code	
-- •	mountain_range
-- •	peak_name
-- •	elevation
-- Filter all peaks in Bulgaria with elevation over 2835. Return all rows sorted by elevation in descending order.
-- Example
-- country_code	mountain_range	peak_name	elevation
-- BG	Rila	Musala	2925
-- BG	Pirin	Vihren	2914
-- …	…	…	…

SELECT mc.country_code,m.mountain_range,p.peak_name,p.elevation
FROM mountains AS m
JOIN peaks AS p ON m.id=p.mountain_id
JOIN mountains_countries as mc ON m.id=mc.mountain_id
WHERE mc.country_code LIKE 'BG' AND p.elevation >2835
ORDER BY p.elevation DESC;
