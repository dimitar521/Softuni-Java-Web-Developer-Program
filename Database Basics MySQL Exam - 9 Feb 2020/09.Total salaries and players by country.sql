# 9.	Total salaries and players by country
#
#  And like everything else in this world, everything is ultimately about finances. Now you need to extract detailed information on the amount of all salaries given to football players by the criteria of the country in which they played.
# If there are no players in a country, display NULL.  Order the results by total count of players in descending order, then by country name alphabetically.
#
#
# Required Columns
# •	name (country)
# •	total_sum_of_salaries
# •	total_count_of_players
# Example
# name	total_count_of_players	total_sum_of_salaries
# Sweden	28	14968947.79
#
# Brazil	18	8352732.65
#
# China	13	7042890.51
#
# Russia
# 	7	2230759.71
# …	…	…
# Thailand
# 	0	NULL
# United States
# 	0	NULL
SELECT c.name, COUNT(p.id) AS total_count_of_players, SUM(p.salary)
FROM countries c
         LEFT JOIN towns t ON c.id = t.country_id
         LEFT JOIN stadiums s ON t.id = s.town_id
         LEFT JOIN teams t2 ON s.id = t2.stadium_id
         LEFT JOIN players p ON t2.id = p.team_id
GROUP BY c.name
ORDER BY total_count_of_players DESC, c.name
;