-- ORDER BY CLAUSE

USE farmers_market;

SELECT *
FROM market_date_info
ORDER BY market_min_temp;

-- Default is Ascending

SELECT *
FROM market_date_info
ORDER BY market_min_temp DESC;

-- We can sort by multiple colums
SELECT *
FROM market_date_info
ORDER BY market_min_temp DESC, market_max_temp ASC;

-- SQL, the order of operations for a query is as follows:

-- FROM clause: Specifies the table(s) that the query will retrieve data from.
-- JOIN clause: Joins the specified tables together based on a common column or set of columns.
-- WHERE clause: Filters the results based on a specified condition or set of conditions.
-- GROUP BY clause: Groups the results by one or more columns, typically used with aggregate functions.
-- HAVING clause: Filters the groups based on a specified condition or set of conditions.
-- SELECT clause: Specifies the columns to be returned in the result set.
-- ORDER BY clause: Sorts the results by one or more columns, either in ascending or descending order.
-- LIMIT clause: Limits the number of rows returned in the result set.

-- 1. Create a new file named order_by_exercises.sql and copy in the contents of your exercise from the previous lesson.

USE employees;
-- 2. Find all employees with first names 'Irena', 'Vidya', or 'Maya', and order your results returned by first name 
-- What was the first and last name in the first row of the results?
-- What was the first and last name of the last person in the table?

SELECT *
FROM employees
WHERE first_name 
IN ('Irena', 'Vidya', 'Maya') ORDER BY first_name;
-- Irena Reutenauer
SELECT *
FROM employees
WHERE first_name IN ('Irena', 'Vidya', 'Maya') 
ORDER BY first_name DESC, last_name DESC;
-- Vidya Awden

-- 3. Find all employees with first names 'Irena', 'Vidya', or 'Maya', and order your results returned by first name and then last name.
--  What was the first and last name of the last person in the table?

SELECT *
FROM employees
WHERE first_name IN ('Irena', 'Vidya', 'Maya')
ORDER BY first_name, last_name;
-- Irena Acton

SELECT *
FROM employees
WHERE first_name IN ('Irena', 'Vidya', 'Maya') 
ORDER BY first_name DESC, last_name DESC;
-- Vidya Awden

-- 4. Find all employees with first names 'Irena', 'Vidya', or 'Maya', 
-- and order your results returned by last name and then first name.
--  What was the first and last name in the first row of the results? 
-- What was the first and last name of the last person in the table?

SELECT *
FROM employees
WHERE first_name IN ('Irena', 'Vidya', 'Maya')
ORDER BY last_name, first_name;
-- Irena Acton

SELECT *
FROM employees
WHERE first_name IN ('Irena', 'Vidya', 'Maya')
ORDER BY last_name DESC, first_name DESC;
-- Maya Zyda

-- 5.Write a query to to find all employees whose last name starts and ends with 'E'. 
-- Sort the results by their employee number.
-- Enter a comment with the number of employees returned, 
-- the first employee number and their first and last name, and the last
-- employee number with their first and last name.

SELECT *
FROM employees
WHERE last_name LIKE 'e%e'
ORDER BY emp_no;

-- 899, Ramzi Erde #10021,Tadhiro Erde #499648

-- 6.Write a query to to find all employees whose last name starts and ends with 'E'. 
--  Sort the results by their hire date, so that the newest employees are listed first
-- the name of the newest employee, and the name of the oldest employee.

SELECT *
FROM employees
WHERE last_name LIKE 'e%e'
ORDER BY hire_date DESC;
-- 899 

SELECT *
FROM employees
WHERE last_name LIKE 'e%e'
ORDER BY hire_date DESC;
-- Teiji Eldridge

SELECT *
FROM employees
WHERE last_name LIKE 'e%e'
ORDER BY hire_date ASC;
-- Sergi Erde

-- 7.Find all employees hired in the 90s and born on Christmas. 
-- Sort the results so that the oldest employee who was hired last is the first result.
--  Enter a comment with the number of employees returned, the name of the oldest employee who was hired last, and 
-- the name of the youngest employee who was hired first.

SELECT *
from employees
WHERE hire_date like '199%' and birth_date like '%-12-25'
ORDER BY birth_date, hire_date DESC;
-- employees returned ,362 
SELECT *
from employees
WHERE hire_date like '199%' and birth_date like '%-12-25'
ORDER BY birth_date, hire_date DESC;
-- Khun Bernini

SELECT *
from employees
WHERE hire_date like '199%' and birth_date like '%-12-25'
ORDER BY birth_date DESC, hire_date;
-- Douadi Pettis

