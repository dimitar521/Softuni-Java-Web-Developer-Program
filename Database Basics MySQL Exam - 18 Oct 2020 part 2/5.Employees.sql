5.	Employees
Extract from the SoftUni Stores System database, info about all of the employees.
Order the results by employees hire date in descending order.
Required Columns
•	first_name
•	middle_name
•	last_name
•	salary
•	hire_date

Example
first_name	middle_name	last_name	salary	hire_date
Roz	U	Dewdney	9316.56	2018-10-20
Florian	E	Bamlet	6266.27	2018-02-19
Shae	O	Fasey	7463.52	2018-02-03
Elwin	G	Rennock	9538.20	2017-05-12
…	…	…	…	…

SELECT first_name, middle_name, last_name, salary, hire_date
FROM employees e
ORDER BY hire_date DESC;
