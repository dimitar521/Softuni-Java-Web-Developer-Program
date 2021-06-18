# 7.	Counts of products in stores and their average
# The managers needs to know in which stores sell different products and their average price.
# Extract from the database all of the stores (with or without products) and the count of the products that they have. Also you can show the average price of all products (rounded to the second digit after decimal point) that sells in store.
#     Order the results descending by count of products in store, then by average price in descending order and finally by store id.
#     Required Columns
#     •	Name (store)
#     •	product_count
#     •	avg
#
#     Example
#     name	product_count	avg
#     DuoStore	4	32.15
#     Home Ing	3	13.72
#     Alphazap	2	48.43
#     Duobam	2	44.45
#     …	…	…
#     Lotstring	0	NULL
SELECT s.name,count(p.id) as product_count,round(avg(p.price),2)as `avg`
FROM stores s
LEFT JOIN products_stores ps ON s.id = ps.store_id
LEFT JOIN products p ON ps.product_id = p.id
GROUP BY (s.id)
ORDER BY product_count DESC ,`avg`DESC ,s.id;