# 9.	Find all information of stores
# The managers always want to know how the business goes. Now, they want from us to show all store names, but for security, the name and must be in the reversed order.
#     Select the name of stores (in reverse order).
#     After that, the full_address in format: {town name in upper case}-{address name}.
#     The next info is the count of employees, that work in the store.
#     Filter only the stores that have a more than one employee.
#     Order the results by the full_address in ascending order.
#
#     Required Columns
#     •	reversed_name (store name)
#     •	full_address (full_address)
#     •	employees_count
#     Example
#     reversed_name	full_address	employees_count
#     dlohgnortS	BLAGOEVGRAD-32759 Dwight Plaza	3
#     mabouD	BLAGOEVGRAD-35952 Stoughton Circle	1
#     focsnarT	BURGAS-07 Armistice Parkway	2
#     …	…	…
#     draugdraC	VIDIN-61346 Melody Lane	3
SELECT reverse(s.name)as reversed_name,concat(upper(t.name),'-',a.name)as full_address,count(e.id)as employees_count
FROM stores s
JOIN addresses a ON a.id = s.address_id
JOIN towns t ON a.town_id = t.id
JOIN employees e ON s.id = e.store_id
GROUP BY s.name
HAVING employees_count>=1
ORDER BY full_address ;