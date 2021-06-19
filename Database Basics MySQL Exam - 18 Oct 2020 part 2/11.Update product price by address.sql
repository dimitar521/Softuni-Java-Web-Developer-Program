# 11.	Update product price by address
# CREATE user define procedure udp_update_product_price (address_name VARCHAR (50)), that receives as parameter an address name.
# Increase the product's price with 100 if the address starts with 0 (zero) otherwise increase the price with 200.
#
# Example 1
# Query
# CALL udp_update_product_price('07 Armistice Parkway');
# SELECT name, price FROM products WHERE id = 15;
#
# Result
# name	price
# Spic And Span All Purpose  	136.53
#
# Example 2
# Query
# CALL udp_update_product_price('1 Cody Pass');
# SELECT name, price FROM products WHERE id = 17;
#
# Result
# name	price
# Wine – Ruffino Chianti Classico	221.63

CREATE PROCEDURE  udp_update_product_price (address_name VARCHAR (50))
DETERMINISTIC
BEGIN
    DECLARE increase_level int;
    IF address_name like '0%' then SET increase_level=100;
        else set increase_level=200;
        end IF ;
    UPDATE products p SET price=price+increase_level
    WHERE  p.id IN (SELECT ps.product_id from addresses a
        JOIN stores s ON a.id = s.address_id
        join products_stores ps ON s.id = ps.store_id
        WHERE a.name=address_name);


END;