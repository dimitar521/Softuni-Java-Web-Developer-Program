# 11.	Find good playmaker by teams
# Create a stored procedure udp_find_playmaker which accepts the following parameters:
# •	min_dribble_points
# •	team_name (with max length 45)
#  And extracts data about the players with the given skill stats (more than min_dribble_points), played for given team (team_name) and have more than average speed for all players. Order players by speed descending. Select only the best one.
# Show all needed info for this player: full_name, age, salary, dribbling, speed, team name.
# CALL udp_find_playmaker (20, ‘Skyble’);
# Result
# full_name	age	salary	dribbling	speed	team_name
# Royal Deakes	19	49162.77	33	92	Skyble
CREATE PROCEDURE `udp_find_playmaker`(min_dribble_points INT,team_name VARCHAR(45))
    DETERMINISTIC
BEGIN

    SELECT concat(first_name,' ',last_name)as full_name,age,salary,dribbling,speed,t.name
    FROM players p
             right JOIN skills_data sd ON sd.id = p.skills_data_id
             right JOIN teams t ON t.id = p.team_id
    WHERE sd.dribbling>min_dribble_points and t.name = team_name and speed>( SELECT avg(speed)FROM skills_data)
    ORDER
        BY speed DESC
    LIMIT 1;
END