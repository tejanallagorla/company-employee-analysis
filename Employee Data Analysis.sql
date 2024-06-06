-- QUESTIONS

-- 1) What is the gender breakdown of employees in the company?
SELECT
	gender,
    COUNT(*) AS count
FROM emp_data
WHERE age >= 18 AND termdate IS NULL
GROUP BY gender
ORDER BY count DESC;

-- 2) What is the race breakdown of employees in the company?
SELECT
	race,
    COUNT(*) AS count
FROM emp_data
WHERE age >= 18 AND termdate IS NULL
GROUP BY race
ORDER BY count DESC;

-- 3) What is the age distribution of employees in the company?
SELECT
    MIN(age) AS youngest,
    MAX(age) AS oldest
FROM emp_data
WHERE age >= 18 AND termdate IS NULL;

SELECT
	CASE
		WHEN age >= 18 AND age <= 25 THEN '18-25'
        WHEN age >= 26 AND age <= 33 THEN '26-33'
        WHEN age >= 34 AND age <= 41 THEN '34-41'
        WHEN age >= 42 AND age <= 49 THEN '42-49'
        WHEN age >= 50 AND age <= 57 THEN '50-57'
        WHEN age >= 58 AND age <= 65 THEN '58-65'
        ELSE '66+'
	END AS age_group,
    COUNT(*) AS count
FROM emp_data
WHERE age >= 18 AND termdate IS NULL
GROUP BY age_group
ORDER BY age_group;

-- 4) How many employees work at the headquarters versus remote locations?
SELECT
	location,
    COUNT(*) AS count
FROM emp_data
WHERE age >= 18 AND termdate IS NULL
GROUP BY location
ORDER BY count DESC;

-- 5) What is the average length of employment for employees who have been terminated?
SELECT
	ROUND(AVG(DATEDIFF(termdate, hire_date))/365, 2) AS avg_employment_length
FROM emp_data
WHERE age >= 18 AND termdate IS NOT NULL AND termdate <= CURDATE();

-- 6) How does the gender breakdown vary across departments?
SELECT
	department,
    gender,
    COUNT(*) AS count
FROM emp_data
WHERE age >= 18 AND termdate IS NULL
GROUP BY department, gender
ORDER BY department, gender;

-- 7) What is the breakdown of job titles across the company?
SELECT
	jobtitle,
    COUNT(*) AS count
FROM emp_data
WHERE age >= 18 AND termdate IS NULL
GROUP BY jobtitle
ORDER BY jobtitle;

-- 8) Which department has the highest turnover rate?
SELECT
	department,
    terminated_count,
    total_count,
    terminated_count/total_count AS turnover_rate
FROM (
	SELECT
		department,
        COUNT(*) AS total_count,
        SUM(IF(termdate IS NOT NULL AND termdate <= CURDATE(), 1, 0)) AS terminated_count
	FROM emp_data
    WHERE age >= 18
    GROUP BY department
) AS term_ct_by_dept
ORDER BY turnover_rate DESC;

-- 9) What is the distribution of employees across locations by city and state?
SELECT
	location_state,
    location_city,
    COUNT(*) AS count
FROM emp_data
WHERE age >= 18 AND termdate IS NULL
GROUP BY location_state, location_city
ORDER BY count DESC;

-- 10) How has the company's employee count changed over time?
SELECT
	year,
	net_growth,
	total_employees,
	ROUND(net_growth/(total_employees - net_growth) * 100, 2) AS growth_percentage
FROM (
	SELECT
		year,
		hires - terminations AS net_growth,
		SUM(hires - terminations) OVER (
			ORDER BY year
			ROWS BETWEEN UNBOUNDED PRECEDING AND CURRENT ROW
		) AS total_employees
	FROM (
		SELECT
			YEAR(hire_date) AS year,
			COUNT(*) AS hires,
			SUM(IF(termdate IS NOT NULL AND termdate <= CURDATE(), 1, 0)) AS terminations
		FROM emp_data
		WHERE age >= 18 AND (termdate IS NULL OR termdate <= CURDATE())
		GROUP BY year
	) AS total_hires_terms_by_year
) AS net_change_by_year;

-- 11) What is the average tenure for each department?
SELECT
	department,
    ROUND(AVG(DATEDIFF(termdate, hire_date))/365, 2) AS avg_tenure
FROM emp_data
WHERE age >= 18 AND termdate IS NOT NULL AND termdate <= CURDATE()
GROUP BY department
ORDER BY avg_tenure DESC;
