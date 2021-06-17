# 8.	The fastest player by towns
# Extract from the database, the fastest player (having max speed), in terms of towns where their team played.
# Order players by speed descending, then by town name.
# Skip players that played in team ‘Devify’
#
# Required Columns
# •	max_speed
# •	town_name
# Example
# max_speed	town_name
# 97	Smolensk
# 92	Bromma
# 92	Lühua
# …	…
# NULL	Zavolzh’ye
SELECT MAX(sd.speed) as max_speed,t2.name
FROM  players p
    JOIN skills_data sd ON sd.id = p.skills_data_id
right join teams t ON p.team_id = t.id
 join stadiums s ON t.stadium_id = s.id
 join towns t2 ON s.town_id = t2.id
WHERE t.name !='Devify'
GROUP BY t2.name
ORDER BY max_speed DESC ,t2.name;