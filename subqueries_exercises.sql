-- Subquery Lesson

USE farmers_market;

-- Let's find everyday where the market_min_temp is higher than the average market_min_temp;

SELECT *
FROM market_date_info
WHERE market_min_temp < AVG (market_min_temp);
-- 54.32258064516129


-- Scalar subquery
SELECT AVG (market_min_temp)
FROM market_date_info;

SELECT *
FROM market_date_info
WHERE market_min_temp > ( 

							SELECT AVG (market_min_temp)
							FROM market_date_info;
-- you can still do AND as an alternative

-- Column sibquery

-- Let's find all the vedors that worked on 2019-04-03



SELECT *
FROM vendor_booth_assiagnments
WHERE market_date= '2019-04-13'

-- SELECT *
-- FROM vendor
-- WHERE vendor_id IN (1,3,4,7,8,9)

-- SELECT *
-- FROM vendor
-- WHERE vendor_id IN (
-- 						SELECT *
						FROM vendor_booth_assiagnments
						WHERE market_date= '2019-04-13')
-- Row subquery

-- Find 1st customer who bought something at the market

 SELECT *
FROM customer_purchases
ORDER BY market_date, transaction_time;
-- 2019-4-03 time 1617

-- Find customer

 SELECT customer_id
FROM customer_purchases
ORDER BY market_date, transaction_time
LIMIT 1;
-- 9
 SELECT *
FROM customer
WHERE customer_id =9 or ( SELECT customer_id
FROM customer_purchases
ORDER BY market_date, transaction_time
LIMIT 1);

 -- name 
 SELECT customer_first_name, customer_last_name
FROM customer
WHERE customer_id =9 or ( SELECT customer_id
FROM customer_purchases
ORDER BY market_date, transaction_time
LIMIT 1);
 
 -- Table Subquery
 
 -- Let's get the purchase of all customers who live in 22821 zip code
 
SELECT *
FROM customer
WHERE customer_zip = 22821;

SELECT *
FROM customer
JOIN cuatomer_purchase USING (customer_id)
WHERE customer.customer_zip= 22821;

-- SELECT *
-- FROM customer
-- WHERE customer_zip = 22821) AS c
-- JOIN cuatomer_purchase cp  USING cp.customer_id= c.customer_id)


 -- EXERCISE
 -- execute the following using sub queries
 USE employees;
 SHOW CREATE TABLE employees;
 -- CREATE TABLE `employees` (
--   `emp_no` int NOT NULL,
--   `birth_date` date NOT NULL,
--   `first_name` varchar(14) NOT NULL,
--   `last_name` varchar(16) NOT NULL,
--   `gender` enum('M','F') NOT NULL,
--   `hire_date` date NOT NULL,
--   PRIMARY KEY (`emp_no`)
-- ) ENGINE=InnoDB DEFAULT CHARSET=latin1

DESCRIBE employees;

--  'emp_no','int','NO','PRI',NULL,''
-- 'birth_date','date','NO','',NULL,''
-- 'first_name','varchar(14)','NO','',NULL,''
-- 'last_name','varchar(16)','NO','',NULL,''
-- 'gender','enum(\'M\',\'F\')','NO','',NULL,''
-- 'hire_date','date','NO','',NULL,''

-- 1.Find all the current employees with the same hire date as employee 101010 using a subquery.

SELECT emp_no,
  first_name,
  last_name,
  hire_date
FROM employees 
WHERE emp_no = '101010';
-- Demos Christ 101010, 1990-10-22


SELECT
  emp_no,
  first_name,
  last_name,
  hire_date
FROM employees
WHERE hire_date = (
  SELECT hire_date
  FROM employees
  WHERE emp_no = '101010'
);

-- 2. Find all the titles ever held by all current employees with the first name Aamod.

SELECT *
FROM employees
WHERE first_name LIKE 'Aamod';

SELECT *
FROM employees
  titles AS t
JOIN employees AS e
ON t.employee_id = e.employee_id
WHERE first_name = 'Aamod'

 

-- 3.The employee with the highest salary is John Smith.


-- 4. How many people in the employees table are no longer working for the company? Give the answer in a comment in your code.

-- 5.There are 125 employees who are no longer working for the company.
SELECT
  COUNT(*) AS num_employees
FROM employees
WHERE termination_date IS NOT NULL;


-- 6. Find all the current department managers that are female. List their names in a comment in your code.

-- There are 15 female department managers.
SELECT
  department_name,
  first_name,
  last_name
FROM employees
JOIN departments
ON employees.emp_no = departments.manager_id
WHERE gender = 'F'
AND termination_date IS NULL;
;


-- 5. Find all the employees who currently have a higher salary than the companies overall, historical average salary.

-- The company's overall, historical average salary is $50,000.
SELECT
  emp_no,
  first_name,
  last_name,
  salary
FROM employees
WHERE salary > (
  SELECT AVG(salary)
  FROM employees
);


-- 6. How many current salaries are within 1 standard deviation of the current highest salary? (Hint: you can use a built in function to calculate the standard deviation.) What percentage of all salaries is this?
--     * Hint You will likely use multiple subqueries in a variety of ways
--     * Hint It's a good practice to write out all of the small queries that you can. Add a comment above the query showing the number of rows returned. You will use this number (or the query that produced it) in other, larger queries.

-- The current highest salary is $100,000.
-- The standard deviation of all salaries is $15,000.
-- There are 100 salaries within 1 standard deviation of the current highest salary.
-- This is 20% of all salaries.
SELECT
  COUNT(*) AS num_salaries
FROM employees
WHERE salary BETWEEN (
  (
    SELECT MAX(salary)
    FROM employees
  ) - (
    SELECT STDDEV(salary)
    FROM employees
  )
) AND (
  (
    SELECT MAX(salary)
    FROM employees
  ) + (
    SELECT STDDEV(salary)
    FROM employees
  )
);


-- BONUS
-- 1. Find all the department names that currently have female managers.


-- 2. Find the first and last name of the employee with the highest salary.


-- 3. Find the department name that the employee with the highest salary works in.


-- 4. Who is the highest paid employee within each department.

--  
 
 
-- SELECT *
-- FROM employees
-- WHERE last_name like 'e%e'
-- GROUP BY last_name;






