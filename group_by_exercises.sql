-- USE farmers_market;

SELECT DISTINCT customer_first_name
FROM customer;

SELECT DISTINCT customer_first_name
FROM customer
GROUP BY customer_first_name;

SELECT DISTINCT customer_first_name,customer_last_name
FROM customer
GROUP BY customer_first_name,customer_last_name;

-- Group by with aggregation functions
SELECT customer_id, COUNT(*)
FROM customer_purchases
GROUP BY customer_id;

SELECT *
FROM customer_purchases;

SELECT customer_id, COUNT(*) n_of_purchases
FROM customer_purchases
GROUP BY customer_id;

SELECT customer_id AS id_of_customer, COUNT(*) n_of_purchases
FROM customer_purchases
GROUP BY customer_id;

SELECT customer_id 
COUNT(*) n_of_purchases
FROM customer_purchases
WHERE customer_purchases_per_qty > 4
GROUP BY customer_id
HAVING n_of_purchases > 200;

SELECT customer_id,
	COUNT(*) n_of_high_end_purchases
FROM customer_purchases
WHERE customer_purchases_per_qty > 4
GROUP BY customer_id
HAVING n_of_high_end_purchases > 100;

USE employees;
SHOW databases;
SHOW tables;


-- 1. Create a new file named group_by_exercises.sql
-- touch group_by_exercises.sql
-- git hub add file


-- 2. In your script, use DISTINCT to find the unique titles in the titles table. 
-- How many unique titles have there ever been? Answer that in a comment in your SQL file.

SELECT DISTINCT titles
FROM employees
GROUP BY customer_id;
-- 

-- SELECT customer_id,
-- 	COUNT(*) n_of_high_end_purchases
-- FROM customer_purchases
-- WHERE customer_purchases_per_qty > 4
-- GROUP BY customer_id
-- HAVING n_of_high_end_purchases > 100;




SELECT customer_id, COUNT(*)
FROM customer_purchases
GROUP BY customer_id;



