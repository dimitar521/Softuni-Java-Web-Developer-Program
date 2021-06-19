# 10.	Find full name of top paid employee by store name
# Create a user defined function with the name udf_top_paid_employee_by_store(store_name VARCHAR(50)) that receives a store name and returns the full name of top paid employee.
# Full info must be in format
#  	{first_name} {middle_name}. {last_name} works in store for {years of experience} years
# The years of experience is the difference when they were hired and 2020-10-18
#
# Example 1
# Query
# SELECT udf_top_paid_employee_by_store('Stronghold') as 'full_info';
# full_info
# Breena S. Hymans works in store for 3 years
#
# Example 2
# Query
# SELECT udf_top_paid_employee_by_store('Keylex') as 'full_info';
# full_info
# Xylina W. Apfelmann works in store for 7 years

CREATE FUNCTION udf_top_paid_employee_by_store(store_name VARCHAR(50)) RETURNS VARCHAR(100)
    DETERMINISTIC

BEGIN
    RETURN (SELECT CONCAT(first_name, ' ', middle_name, '.', ' ', last_name, ' ', 'works in store for', ' ',
                          (2020 - (YEAR(e.hire_date))), ' ', 'years')
            FROM employees e
                     JOIN stores s ON s.id = e.store_id
            WHERE s.name = store_name
            ORDER BY e.salary DESC

            LIMIT 1);

END;