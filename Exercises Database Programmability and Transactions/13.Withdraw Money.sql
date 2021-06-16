-- 13.	Withdraw Money
-- Add stored procedures usp_withdraw_money(account_id, money_amount) that operate in transactions. 
-- Make sure to guarantee withdraw is done only when balance is enough and money_amount is valid positive number. Work with precision up to fourth sign after decimal point. The procedure should produce exact results working with the specified precision.
-- Submit your query statement as Run skeleton, run queries & check DB in Judge.
-- Example
-- Here is the result for account_id = 1 and money_amount = 10.
-- account_id	account_holder_id	balance
-- 1	1	123.1200

CREATE PROCEDURE `usp_withdraw_money`(account_id INT,money_amount DECIMAL(20,4))
BEGIN
START TRANSACTION;
IF (SELECT COUNT(*)FROM accounts WHERE id= account_id)=0 OR (money_amount <=0)
OR ((SELECT balance FROM accounts WHERE id=account_id)<=money_amount)
THEN ROLLBACK;
ELSE 
update accounts
SET balance =balance-money_amount
WHERE id=account_id;
END IF;

END