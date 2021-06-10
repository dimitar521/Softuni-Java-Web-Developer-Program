SELECT 
    `first_name`, `last_name`
FROM
    `employees`
WHERE
    `first_name` REGEXP '^Sa'
ORDER BY `employee_id`;