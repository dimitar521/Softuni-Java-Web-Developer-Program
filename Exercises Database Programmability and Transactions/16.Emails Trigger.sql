-- 16.	Emails Trigger
-- Create another table – notification_emails(id, recipient, subject, body). Add a trigger to logs table to create new email whenever new record is inserted in logs table. The following data is required to be filled for each email:
-- •	recipient – account_id
-- •	subject – "Balance change for account: {account_id}"
-- •	body - "On {date (current date)} your balance was changed from {old} to {new}."
-- Submit your query statement as Run skeleton, run queries & check DB in Judge.
-- Example	
-- id	recipient	subject	body
-- 1	1	Balance change for account: 1	On Sep 15 2016 at 11:44:06 AM your balance was changed from 133 to 143.
-- …	…	…	…
CREATE TABLE `logs`(
log_id INT PRIMARY KEY AUTO_INCREMENT,
account_id INT,
old_sum DECIMAL(19,4),
new_sum DECIMAL(19,4)
);
CREATE  TRIGGER `accounts_AFTER_UPDATE` AFTER UPDATE ON `accounts` FOR EACH ROW BEGIN
INSERT INTO `logs`(account_id,old_sum,new_sum)
VALUES(OLD.id,OLD.balance,NEW.balance);

END;
CREATE TABLE `notification_emails` (
    `id` INT   PRIMARY KEY AUTO_INCREMENT,
    `recipient` INT(11) ,
    `subject` VARCHAR(50),
    `body` VARCHAR(255) 
);
CREATE TRIGGER `tr_notification_emails`
AFTER INSERT ON `logs`
FOR EACH ROW
BEGIN
    INSERT INTO `notification_emails` 
        (`recipient`, `subject`, `body`)
    VALUES (
        NEW.account_id, 
        CONCAT('Balance change for account: ', NEW.account_id), 
        CONCAT('On ', DATE_FORMAT(NOW(), '%b %d %Y at %r'), ' your balance was changed from ', ROUND(NEW.old_sum, 2), ' to ', ROUND(NEW.new_sum, 2), '.'));
END;
