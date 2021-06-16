-- 14.	Money Transfer
-- Write stored procedure usp_transfer_money(from_account_id, to_account_id, amount) that transfers money from one account to another. Consider cases when one of the account_ids is not valid, the amount of money is negative number, outgoing balance is enough or transferring from/to one and the same account. Make sure that the whole procedure passes without errors and if error occurs make no change in the database. 
-- Make sure to guarantee exact results working with precision up to fourth sign after decimal point.
-- Submit your query statement as Run skeleton, run queries & check DB in Judge.
-- Example
-- Here is the result for from_account_id = 1, to_account_id = 2 and money_amount = 10.
-- account_id	account_holder_id	balance
-- 1	1	113.1200
-- 2	3	4364.2300
DELIMITER $$
CREATE PROCEDURE usp_transfer_money(from_account_id INT, to_account_id INT, amount DECIMAL(20, 4))
BEGIN
	START TRANSACTION;
		CASE WHEN 
			(SELECT a.id FROM accounts as a WHERE a.id = from_account_id) IS NULL
            OR (SELECT a.id FROM accounts as a WHERE a.id = to_account_id) IS NULL
            OR from_account_id = to_account_id
            OR amount < 0
            OR (SELECT a.balance FROM accounts as a WHERE a.id = from_account_id) < amount
		THEN ROLLBACK;
	ELSE 
		UPDATE accounts a
		SET a.balance = a.balance - amount
        WHERE a.id = from_account_id;
        
        UPDATE accounts a
		SET a.balance = a.balance + amount
        WHERE a.id = to_account_id;
	END CASE;
	COMMIT;
END $$
CALL usp_transfer_money(1, 2, 10);

SELECT a.id, h.id, a.balance
FROM account_holders AS h
JOIN accounts AS a ON a.account_holder_id = h.id
WHERE a.id IN (1, 2);

