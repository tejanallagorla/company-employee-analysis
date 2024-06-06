CREATE DATABASE company_employee_analysis;

USE company_employee_analysis;

SELECT * FROM emp_data;

ALTER TABLE emp_data
CHANGE COLUMN ï»¿id emp_id VARCHAR(15) NULL;

SET sql_safe_updates = 0;

UPDATE emp_data
SET birthdate = CASE
	WHEN birthdate LIKE '%/%' THEN DATE_FORMAT(STR_TO_DATE(birthdate, '%m/%d/%Y'), '%Y-%m-%d')
    WHEN birthdate LIKE '%-%' THEN DATE_FORMAT(STR_TO_DATE(birthdate, '%m-%d-%Y'), '%Y-%m-%d')
    ELSE NULL
END;

ALTER TABLE emp_data
MODIFY COLUMN birthdate DATE;

UPDATE emp_data
SET hire_date = CASE
	WHEN hire_date LIKE '%/%' THEN DATE_FORMAT(STR_TO_DATE(hire_date, '%m/%d/%Y'), '%Y-%m-%d')
    WHEN hire_date LIKE '%-%' THEN DATE_FORMAT(STR_TO_DATE(hire_date, '%m-%d-%Y'), '%Y-%m-%d')
    ELSE NULL
END;

ALTER TABLE emp_data
MODIFY COLUMN hire_date DATE;

UPDATE emp_data
SET termdate = DATE(STR_TO_DATE(termdate, '%Y-%m-%d %H:%i:%s UTC'))
WHERE termdate != '';

UPDATE emp_data
SET termdate = NULL
WHERE termdate = '';

ALTER TABLE emp_data
MODIFY COLUMN termdate DATE;

ALTER TABLE emp_data
ADD COLUMN age INT;

UPDATE emp_data
SET age = TIMESTAMPDIFF(YEAR, birthdate, CURDATE());

SELECT
	MIN(age) AS youngest,
    MAX(age) AS oldest
FROM emp_data;

SELECT
	COUNT(*)
FROM emp_data
WHERE age < 18;

SELECT
	COUNT(*)
FROM emp_data
WHERE termdate IS NOT NULL AND termdate > CURDATE();
