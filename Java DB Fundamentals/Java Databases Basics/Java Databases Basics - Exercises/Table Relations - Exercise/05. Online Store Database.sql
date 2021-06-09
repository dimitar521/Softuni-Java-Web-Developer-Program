create table cities(
city_id int, 
name nvarchar(50),
constraint pk_cities primary key (city_id));


create table customers(
customer_id int,
name nvarchar(50),
birthday date,
city_id int, 
constraint pk_customers primary key(customer_id),
constraint fk_customers_cities foreign key (city_id)
references cities(city_id));

create table orders(
order_id int,
customer_id int,
constraint pk_orders primary key(order_id),
constraint fk_orders_customers foreign key(customer_id)
references customers(customer_id));


create table item_types(
item_type_id int,
name nvarchar(50),
constraint pk_item_types primary key(item_type_id));

create table items(
item_id int, 
name nvarchar(50),
item_type_id int,
constraint pk_items primary key(item_id),
constraint fk_items_item_types foreign key(item_type_id)
references item_types(item_type_id));

create table order_items(
order_id int, 
item_id int,
constraint pk_order_items primary key(order_id, item_id),
constraint fk_order_items_orders foreign key (order_id)
references orders(order_id),
constraint fk_order_items_items foreign key(item_id)
references items(item_id));