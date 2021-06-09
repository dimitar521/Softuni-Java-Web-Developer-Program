SELECT mountain_range,peak_name,elevation as `peak_elevation`
FROM mountains 
join peaks  on mountains.id=peaks.mountain_id
where mountain_range ='Rila'
Order by elevation desc;