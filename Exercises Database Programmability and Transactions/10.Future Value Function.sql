-- 10.	Future Value Function
-- Your task is to create a function ufn_calculate_future_value that accepts as parameters – sum (with precision, 4 digits after the decimal point), yearly interest rate (double) and number of years(int). It should calculate and return the future value of the initial sum. The result from the function must be decimal, with percision 4.
--  Using the following formula:
--  

-- •	I – Initial sum
-- •	R – Yearly interest rate
-- •	T – Number of years
-- Submit your query statement as Run skeleton, run queries & check DB in Judge.
-- Example
-- Input	Output
-- Initial sum: 1000
-- Yearly Interest rate: 50%
-- years: 5
-- ufn_calculate_future_value(1000, 0.5, 5)	7593.7500

CREATE FUNCTION `ufn_calculate_future_value`(sum DECIMAL(20,4),interest DOUBLE,num_years INT) RETURNS decimal(10,4)
    DETERMINISTIC
BEGIN 

RETURN  sum*power(1+interest,num_years) ;
END