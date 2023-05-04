USE farmers_market;

SHOW databases;

SELECT database();

SHOW tables;

SELECT * FROM customer;

SELECT *
FROM product;

SELECT product_id, product_name
FROM product;

SELECT product_id AS id_of_product, product_name AS name_of_product
FROM product;
-- this alters how the name apperars

SELECT *
FROM PRODUCT;
-- SQL doesn;t care about spacing but semi colon is important for readability or execution of command 

-- To filter rows, we need to use the WHERE clause
-- FORMAT: SELECT * FROM [table] WHERE [conditions]
-- condition FORMAT: [column_name] operator [value]

SELECT *
FROM product
WHERE product_qty_type = 'lbs';

SELECT *
FROM product
WHERE product_size  = 'medium';

-- not equal: != or <>

SELECT *
FROM product
WHERE product_category_id != 1;

SELECT *
FROM product_category;

SELECT *
FROM customer_purchases
WHERE cost_to_customer_per_qty < 1;
-- SHOWS cost less than $1

SELECT *
FROM customer_purchases
WHERE cost_to_customer_per_qty  BETWEEN 3 AND 4;
-- Shows both includes costs 
-- exclusive on left side inclusive attribute on right side 

SELECT DISTINCT vendor_id
FROM customer_purchases;
-- select statement modifyer
-- tells you only the unique things within an id

SELECT DISTINCT product_id, vendor_id
FROM customer_purchases;
-- select allows you to chose the rows or column that you speciffically want to see


-- order is important for the statements you will get an error, WHERE ALWAYS AFTER FROM!!!
SELECT *
WHERE cost_to_customer_per_qty < 1
FROM customer_purchases; 

 

