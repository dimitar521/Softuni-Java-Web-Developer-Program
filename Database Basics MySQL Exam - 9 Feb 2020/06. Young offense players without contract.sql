# 6.	Young offense players without contract
# One of the coaches wants to know more about all the young players (under age of 23) who can strengthen his team in the offensive (played on position ‘A’). As he is not paying a transfer amount, he is looking only for those who have not signed a contract so far (haven’t hire_date) and have strength of more than 50. Order the results ascending by salary, then by age.
#
# Required Columns
# •	id (player)
# •	full_name
# •	age
# •	position
# •	hire_date
# Example
# id	full_name	age	position	hire_date
# 40	Carlen Hadny	18	A	NULL
# 23	Kalvin Bewley	19	A	NULL
# ..	..	..	..	..
SELECT p.id,concat_ws(' ',p.first_name,p.last_name) as full_name,age,position,hire_date
from players p
JOIN skills_data sd ON sd.id = p.skills_data_id
WHERE age<23 and position LIKE 'A' and hire_date is NULL AND sd.strength>50
ORDER BY salary,age;