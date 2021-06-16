-- 11.	Calculating Interest
-- Your task is to create a stored procedure usp_calculate_future_value_for_account that accepts as parameters – id of account and interest rate. The procedure uses the function from the previous problem to give an interest to a person's account for 5 years, along with information about his/her account id, first name, last name and current balance as it is shown in the example below. It should take the account_id and the interest_rate as parameters. Interest rate should have precision up to 0.0001, same as the calculated balance after 5 years. Be extremely careful to achieve the desired precision!
-- Submit your query statement as Run skeleton, run queries & check DB in Judge.
-- Example
-- Here is the result for account_id = 1 and interest_rate = 0.1.
-- account_id	fist_name	last_name	current_balance	balance_in_5_years
-- 1	Susan	Cane	123.1200	198.2860
CREATE FUNCTION `ufn_calculate_future_value`(balance DECIMAL(20,4),interest DECIMAL(19,4),years INT) RETURNS decimal(19,4)
    DETERMINISTIC
BEGIN 

RETURN  balance*pow((1+interest),years) ;
END;
CREATE PROCEDURE `usp_calculate_future_value_for_account`(acc_id INT,interest DECIMAL(19,4))
BEGIN
SELECT a.id AS account_id,ah.first_name,ah.last_name,a.balance AS current_balance,
(SELECT `ufn_calculate_future_value`(a.balance,interest,5))AS balance_in_5_years
FROM account_holders ah
JOIN `accounts` a on ah.id=a.account_holder_id
WHERE a.id=acc_id;

END;
