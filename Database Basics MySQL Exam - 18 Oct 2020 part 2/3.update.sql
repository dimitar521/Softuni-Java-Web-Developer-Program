# 3.	Update
#           Update all employees that hire after 2003(exclusive) year and not work in store Cardguard and Veribet.
#           Set their manager to be Carolyn Q Dyett (with id 3) and decrease salary with 500.

UPDATE employees
    JOIN stores s ON s.id = employees.store_id
SET manager_id =3
WHERE YEAR(hire_date) > 2003
  AND s.name != 'Cardguard'
  AND s.name != 'Veribet';