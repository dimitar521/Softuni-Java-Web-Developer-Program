# 3.	Update
#           Update all coaches, who train one or more players and their first_name starts with ‘A’. Increase their level with 1.

UPDATE coaches
SET coach_level=coach_level+1
WHERE first_name LIKE 'A%'
and id=(SELECT coach_id FROM players_coaches pc WHERE coach_id=id
    LIMIT 1)
;
