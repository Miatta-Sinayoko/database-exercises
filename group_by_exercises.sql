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
USE employees;

-- 2. In your script, use DISTINCT to find the unique titles in the titles table. 
-- How many unique titles have there ever been? Answer that in a comment in your SQL file.

SELECT DISTINCT titles
FROM employees;

-- 3.Write a query to find a list of all unique last names of all employees that start and end with 'E' using GROUP BY.

#If I want the names in order
SELECT DISTINCT last_name
FROM employees
WHERE last_name like 'e%e'
GROUP BY last_name;
#What if I want most frequent last name to least frequent?
SELECT DISTINCT last_name, COUNT(*)
FROM employees
WHERE last_name like 'e%e'
GROUP BY last_name
ORDER BY COUNT(*) DESC;
Answer:

Erbe 186
Erde 185
Erie 180
Eldridge 174
Etalle 174
4. Write a query to to find all unique combinations of first and last names of all employees whose last names start and end with 'E'.

#simply answering the question
SELECT first_name, 
    last_name
FROM employees
WHERE last_name LIKE 'e%e'
GROUP BY first_name , last_name;
#Getting more specific with a count
SELECT first_name, 
    last_name,
    COUNT(*) as 'first_last_name_combos'
FROM employees
WHERE last_name LIKE 'e%e'
GROUP BY first_name , last_name;
#Now, let's put them in order by most common name pair
SELECT first_name, 
    last_name,
    COUNT(*) as 'first_last_name_combos'
FROM employees
WHERE last_name LIKE 'e%e'
GROUP BY first_name , last_name
ORDER BY first_last_name_combos DESC;
5. Write a query to find the unique last names with a 'q' but not 'qu'. Include those names in a comment in your sql code.

#Simply answering the question
SELECT last_name
FROM employees
WHERE last_name LIKE '%q%'
    AND last_name NOT LIKE '%qu%'
GROUP BY last_name;
Answer:

Chleq
Lindqvist
Qiwen
6. Add a COUNT() to your results (the query above) to find the number of employees with the same last name.

SELECT last_name, 
    COUNT(last_name) AS 'number_of_employees'
FROM employees
WHERE last_name LIKE '%q%'
    AND last_name NOT LIKE '%qu%'
GROUP BY last_name;
#put them in order
SELECT last_name, 
    COUNT(last_name) AS 'number_of_employees'
FROM employees
WHERE last_name LIKE '%q%'
    AND last_name NOT LIKE '%qu%'
GROUP BY last_name
ORDER BY number_of_employees DESC;
7. Find all employees with first names 'Irena', 'Vidya', or 'Maya'. Use COUNT(*) and GROUP BY to find the number of employees for each gender with those names.

SELECT gender, 
    first_name, 
    COUNT(*) AS 'name_by_gender'
FROM employees
WHERE first_name IN ('Irene' , 'Vidya', 'Maya')
GROUP BY gender, first_name;
#put them in order by most common
SELECT gender, 
    first_name, 
    COUNT(*) AS 'name_by_gender'
FROM employees
WHERE first_name IN ('Irene' , 'Vidya', 'Maya')
GROUP BY gender, first_name
ORDER BY name_by_gender DESC;
8. Using your query that generates a username for all of the employees, generate a count employees for each unique username.

SELECT 
    LOWER(
        CONCAT(
            SUBSTR(first_name, 1, 1),
            SUBSTR(last_name, 1, 4),
            '_',
            SUBSTR(birth_date, 6, 2),
            SUBSTR(birth_date, 3, 2)
        )
    ) AS username,
    COUNT(*) AS count_of_usernames
FROM employees
GROUP BY username;
SELECT 
    LOWER(
        CONCAT(
            SUBSTR(first_name, 1, 1),
            SUBSTR(last_name, 1, 4),
            '_',
            SUBSTR(birth_date, 6, 2),
            SUBSTR(birth_date, 3, 2)
        )
    ) AS username,
    COUNT(*) AS count_of_usernames
FROM employees
GROUP BY username;
9. From your previous query, are there any duplicate usernames? What is the higest number of times a username shows up?

SELECT 
    LOWER(
            CONCAT(
                SUBSTR(first_name, 1, 1),
                SUBSTR(last_name, 1, 4),
                '_',
                SUBSTR(birth_date, 6, 2),
                SUBSTR(birth_date, 3, 2)
                )
            ) AS username,
            count(*) AS count_of_usernames
FROM employees
GROUP BY username
HAVING count_of_usernames > 1
ORDER BY count_of_usernames DESC;
Answer: Yes there are duplicates. The highest number of times a username shows up is 6.

9. Bonus: How many duplicate usernames are there from your previous query?

SELECT COUNT(*) AS num_duplicate_usernames
FROM (
  SELECT 
    LOWER(
      CONCAT(
        SUBSTR(first_name, 1, 1),
        SUBSTR(last_name, 1, 4),
        '_',
        SUBSTR(birth_date, 6, 2),
        SUBSTR(birth_date, 3, 2)
      )
    ) AS username,
    COUNT(*) AS count_of_usernames
  FROM employees
  GROUP BY username
  HAVING count_of_usernames > 1
) AS subquery;
Answer: 13,251





