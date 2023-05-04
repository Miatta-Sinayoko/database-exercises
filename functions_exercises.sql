
-- String Functions

-- CONCAT

-- SUBSTR
SELECT product_name, substring(product_name, 5,10)
FROM product;

-- UPPER & LOWER
SELECT customer first_name, UPPER(customer first_name), LOWER(customer first_name) 
FROM customer;

-- REPLACE 
SELECT product_size, REPLACE(product_size,'medium' ,'M')
FROM product;

-- Date Functions

-- Get the dateime for right now 
SELECT NOW();
-- Get the date for right now 
SELECT CURDAET();
-- Get the time for right now 
SELECT CURTIME();

-- SELECT unix_timestamp()
-- USE for calculatios for date and time 
-- SELECT unix_timestamp(1993-11-19);

-- EXERCISE

-- 1.Copy the order by exercise and save it as functions_exercises.sql.
 USE employees; 

   
-- 2.Write a query to to find all employees whose last name starts and ends with 'E'.
-- Use concat() to combine their first and last name together as a single column named full_name

SELECT CONCAT(first_name,'',last_name) AS full_name
FROM employees
WHERE lastname LIKE 'E%E';


-- 3.Convert the names produced in your last query to all uppercase.

SELECT UPPER(CONCAT(first_name,'',last_name)) AS full_name
FROM employees
WHERE last_name LIKE 'E%E';


-- 4.Use a function to determine how many results were returned from your previous query.


SELECT COUNT(*) 
FROM employees
WHERE last_name LIKE 'E%E';



-- 5.Find all employees hired in the 90s and born on Christmas. Use datediff() function to find how many days they have been working at the company 
-- (Hint: You will also need to use NOW() or CURDATE()),
SELECT *, DATEDIFF(NOW(), hire_date) AS 'days_with_company'
FROM employees
WHERE hire_date LIKE '199%' 
AND birth_date LIKE '%12-25';


-- 6.Find the smallest and largest current salary from the salaries table.

SELECT MIN(salary) AS smallest_salary, MAX(salary) 
FROM salaries;


-- 7.Use your knowledge of built in SQL functions to generate a username for all of the employees. 
-- A username should be all lowercase, and consist of the first character of the employees 
-- first name, the first 4 characters of the employees last name, an underscore,
--  the month the employee was born, and the last two digits of the year that they were born. 
-- Below is an example of what the first 10 rows will look like:

SELECT CONCAT(
    LOWER(SUBSTRING(first_name, 1, 1)),
    SUBSTRING(last_name, 1, 4),
    '_',
    DATE_FORMAT(birth_date, '%m%y')
) AS username, first_name, last_name, birth_date
FROM employees limit 10;
    





