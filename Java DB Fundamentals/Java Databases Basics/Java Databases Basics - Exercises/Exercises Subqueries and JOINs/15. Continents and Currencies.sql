-- 15.Continents and Currencies
-- Write a query that selects:
-- •	continent_code
-- •	currency_code
-- •	currency_usage
-- Find all continents and their most used currency. Filter any currency that is used in only one country. Sort the result by continent_code and currency_code.
-- Example
-- continent_code	currency_code	currency_usage
-- AF	XOF	8
-- AS	AUD	2
-- AS	ILS	2
-- EU	EUR	26
-- NA	XCD	8
-- OC	USD	8

SELECT d1.continent_code, d1.currency_code, d1.currency_usage FROM 
	(SELECT `c`.`continent_code`, `c`.`currency_code`,
    COUNT(`c`.`currency_code`) AS `currency_usage` FROM countries as c
	GROUP BY c.currency_code, c.continent_code HAVING currency_usage > 1) as d1
LEFT JOIN 
	(SELECT `c`.`continent_code`,`c`.`currency_code`,
    COUNT(`c`.`currency_code`) AS `currency_usage` FROM countries as c
	 GROUP BY c.currency_code, c.continent_code HAVING currency_usage > 1) as d2
ON d1.continent_code = d2.continent_code AND d2.currency_usage > d1.currency_usage
 
WHERE d2.currency_usage IS NULL
ORDER BY d1.continent_code, d1.currency_code;


