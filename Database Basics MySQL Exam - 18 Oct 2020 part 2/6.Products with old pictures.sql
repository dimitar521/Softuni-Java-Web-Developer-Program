# 6.	Products with old pictures
# A photographer wants to take pictures of products that have old pictures. You must select all of the products that have a description more than 100 characters long description, and a picture that is made before 2019 (exclusive) and the product price being more than 20. Select a short description column that consists of first 10 characters of the picture's description plus '…'. Order the results by product price in descending order.
#
# Required Columns
# •	name (product)
# •	price
# •	best_before
# •	short_description
# o	only first 10 characters of product description + '...'
# •	url
# Example
# product_name	price	best_before	short_description	url
# Pasta - Bauletti, Chicken White	48.85	2020-02-08	Fusce cong...	http://dummyimage.com/241x194.jpg/5fa2dd/ffffff
# Oil - Sunflower	48.00	2019-10-25	Lorem ipsu...	http://dummyimage.com/243x233.jpg/cc0000/ffffff
# Sugar - White Packet	40.89	2019-11-14	Pellentesq...	http://dummyimage.com/197x104.jpg/cc0000/ffffff
# …
# Lemonade - Mandarin, 591 Ml	25.53	2020-04-03	Duis biben...	http://dummyimage.com/208x226.jpg/cc0000/ffffff


SELECT p.name, price, best_before, CONCAT(LEFT(description, 10), '...') AS short_description, p2.url
FROM products p
         JOIN pictures p2 ON p2.id = p.picture_id
WHERE CHAR_LENGTH(description) > 100
  AND price >= 20
  AND YEAR(added_on) < 2019
ORDER BY price DESC;