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


 -- EXERCISE--
 -- execute the following using sub queries
 USE employees;
 SHOW CREATE TABLE employees;
--  CREATE TABLE `employees` (
--   `emp_no` int NOT NULL,
--   `birth_date` date NOT NULL,
--   `first_name` varchar(14) NOT NULL,
--   `last_name` varchar(16) NOT NULL,
--   `gender` enum('M','F') NOT NULL,
--   `hire_date` date NOT NULL,
--   PRIMARY KEY (`emp_no`)
-- ) ENGINE=InnoDB DEFAULT CHARSET=latin1

DESCRIBE employees;

 -- 'emp_no','int','NO','PRI',NULL,''
-- 'birth_date','date','NO','',NULL,''
-- 'first_name','varchar(14)','NO','',NULL,''
-- 'last_name','varchar(16)','NO','',NULL,''
-- 'gender','enum(\'M\',\'F\')','NO','',NULL,''
-- 'hire_date','date','NO','',NULL,''

-- 1.Find all the current employees with the same hire date as employee 101010 using a subquery.

SELECT *
FROM employees
JOIN dept_emp USING(emp_no)
WHERE to_date > now()
AND hire_date =
    (SELECT hire_date
    FROM employees
    WHERE emp_no = 101010);
    
SELECT CONCAT(first_name,' ', last_name ),hire_date 
 FROM employees 
WHERE emp_no = '101010'; 


-- 2. Find all the titles ever held by all current employees with the first name Aamod.

SELECT *
FROM employees
WHERE first_name LIKE 'Aamod';


 SELECT DISTINCT title
FROM titles
WHERE emp_no IN (
   SELECT emp_no
   FROM employees
   JOIN dept_emp USING(emp_no)
   WHERE first_name = 'aamod'
   AND to_date > now()
);

-- 3.How many people in the employees table are no longer working for the company? Give the answer in a comment in your code.

SELECT count(*)
FROM employees
WHERE emp_no NOT IN 
    (SELECT emp_no
    FROM salaries
    WHERE to_date > now()
);
-- 59,900

-- 4. Find all the current department managers that are female. 
-- List their names in a comment in your code

SELECT *
FROM employees
WHERE emp_no in (
    SELECT emp_no
       FROM dept_manager
          WHERE to_date
 > now()
)
AND gender = "F";
-- Isamu Legleitner,Karsten Sigstam,Leon DasSarma,Hilary Kambil

-- 5. Find all the employees who currently have a higher salary than the 
-- companies overall, historical average salary.

SELECT emp_no, salary
FROM salaries s
JOIN employees e using(emp_no)
WHERE to_date > now() 
AND  salary > (SELECT AVG(salary) FROM salaries);

-- 154,543 employees have a salary higher than the company average.

-- 6. How many current salaries are within 1 standard deviation of the current highest salary? (Hint: you can use a built in function to calculate the standard deviation.) What percentage of all salaries is this?
--     * Hint You will likely use multiple subqueries in a variety of ways
--     * Hint It's a good practice to write out all of the small queries that you can. Add a comment above the query showing the number of rows returned. You will use this number (or the query that produced it) in other, larger queries.

-- The current highest salary is $100,000.
-- The standard deviation of all salaries is $15,000.
-- There are 100 salaries within 1 standard deviation of the current highest salary.
-- This is 20% of all salaries.


-- Find the maximum current salary and standard deviation
SELECT 
    MAX(salary) AS max_salary, 
    STDDEV(salary) AS std_salary 
FROM salaries 
WHERE to_date > NOW();

-- max salary 158,220, standard salary 17,309

-- Get the current salaries that are within 1 standard deviation of the current highest salary
SELECT 
    COUNT(*) AS count_within_1std 
FROM salaries 
WHERE to_date > NOW() 
AND salary BETWEEN (
    SELECT MAX(salary) - STDDEV(salary) 
    FROM salaries 
    WHERE to_date > NOW()
) AND (
    SELECT MAX(salary) 
    FROM salaries 
    WHERE to_date > NOW()
);

-- count withiin 1 standard deviation 83

-- Calculate the percentage of all salaries that are within 1 standard deviation of the current highest salary
SELECT 
    COUNT(*) / (SELECT COUNT(*) FROM salaries WHERE to_date > NOW()) * 100 AS percentage_within_1std 
FROM salaries 
WHERE to_date > NOW() 
AND salary BETWEEN (
    SELECT MAX(salary) - STDDEV(salary) 
    FROM salaries 
    WHERE to_date > NOW()
) AND (
    SELECT MAX(salary) 
    FROM salaries 
    WHERE to_date > NOW()
);

-- This approach first gets the maximum current salary and standard deviation using a single query. Then, it uses subqueries to find the number of current salaries that are within 1 standard deviation of the current highest salary and the percentage of all current salaries that represents. The percentage is calculated as the count of salaries within 1 -- standard deviation divided by the total count of 
-- current salaries, multiplied by 100.




