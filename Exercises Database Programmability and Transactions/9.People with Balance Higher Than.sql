-- 9.	People with Balance Higher Than
-- Your task is to create a stored procedure usp_get_holders_with_balance_higher_than that accepts a number as a parameter and returns all people who have more money in total of all their accounts than the supplied number. The result should be sorted by account_holders.id ascending. 
-- Submit your query statement as Run skeleton, run queries & check DB in Judge.
-- Example
-- Supplied number for that example is 7000.
-- first_name	last_name
-- Susan	Cane
-- Petar	Kirilov
-- Zlatina	Pateva
-- …	…
CREATE PROCEDURE `usp_get_holders_with_balance_higher_than`(num DECIMAL(20,2))
BEGIN
SELECT first_name,last_name
  FROM account_holders AS ah
  JOIN accounts AS a ON ah.id=a.account_holder_id
 GROUP BY first_name,last_name
 HAVING SUM(a.balance) > num;


END