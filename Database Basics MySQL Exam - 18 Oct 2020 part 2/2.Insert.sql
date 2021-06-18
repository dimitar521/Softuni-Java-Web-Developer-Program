# 2.	Insert
#           You will have to insert records of data into the products_stores table, based on the products table.
#           Find all products that are not offered in any stores (don’t have a relation with stores) and insert data in the
#                                                                                                            products_stores. For every product saved -> product_id and 1(one) as a store_id. And now this product will be offered in store with name Wrapsafe and id 1.
#                                                                                                            •	product_id – id of product
#                                                                                                            •	store_id – set it to be 1 for all products.
#

INSERT INTO products_stores (product_id,store_id)
SELECT p.id,1
from products p
LEFT OUTER JOIN products_stores ps ON p.id = ps.product_id
LEFT JOIN products_stores s ON p.id = s.product_id
LEFT JOIN stores s2 ON p.name = s2.name
where s.store_id is NULL;