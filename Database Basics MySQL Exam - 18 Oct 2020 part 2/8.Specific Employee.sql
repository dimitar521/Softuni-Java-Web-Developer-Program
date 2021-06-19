# 8.	Specific employee
#
# There are many employees in our shop system, but we need to find only the one that passes some specific criteria.
# Extract from the database, the full name of employee, name of store that he works, address of store, and salary. The employee's salary must be lower than 4000, the address of the store must contain '5' somewhere, the length of the store name needs to be more than 8 characters and the employee’s last name must end with an 'n'.
# Required Columns
# •	Full name (employee)
# •	Store name
# •	Address
# •	Salary
# Example
# Full_name	Store_name	address	salary
# Leigh Vedenyakin	Stronghold	32759 Dwight Plaza	2159.55
SELECT CONCAT(first_name, ' ', last_name) AS full_name, s.name, a.name, e.salary
FROM employees e
         JOIN stores s ON s.id = e.store_id
         JOIN addresses a ON a.id = s.address_id
WHERE salary < 4000
  AND a.name LIKE '%5%'
  AND CHAR_LENGTH(s.name) >= 8
  AND e.last_name LIKE '%n';