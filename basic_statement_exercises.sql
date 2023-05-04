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

SHOW DATABASES;

USE albums_db;

-- What is the primary key for the albums table?
DESCRIBE albums;
-- id

-- What does the column named 'name' represent?
SELECT *
FROM albums;
-- album tittle 


-- What do you think the sales column represents?
SELECT *
FROM albums;
-- album sales in millions

-- Find the name of all albums by Pink Floyd.
SELECT *
FROM albums
WHERE artist='Pink Floyd';
-- The Dark Side of the Moon
-- The Wall

-- What is the year Sgt. Pepper's Lonely Hearts Club Band was released?
SELECT *
FROM albums
WHERE name= 'Sgt. Pepper\'s Lonely Hearts Club Band'; 
-- 1967

-- What is the genre for the album Nevermind?
SELECT *
FROM albums
WHERE name= 'Nevermind';
-- Grunge, Alternative rock

-- Which albums were released in the 1990s?
SELECT name, release_date
FROM albums
WHERE release_date  BETWEEN 1990 AND 1999;
-- 'The Bodyguard','1992'
-- 'Jagged Little Pill','1995'
-- 'Come On Over','1997'
-- 'Falling into You','1996'
-- 'Let\'s Talk About Love','1997'
-- 'Dangerous','1991'
-- 'The Immaculate Collection','1990'
-- 'Titanic: Music from the Motion Picture','1997'
-- 'Metallica','1991'
-- 'Nevermind','1991'
-- 'Supernatural','1999'
-- if it was date time 89 but typically go 89-00 to exclude 89 from range left exclude right include not the same for integer

-- Which albums had less than 20 million certified sales? Rename this column as low_selling_albums.

SELECT *
FROM albums
WHERE sales < 20;

SELECT name, sales AS low_selling_albums
FROM albums
WHERE sales < 20;








 

