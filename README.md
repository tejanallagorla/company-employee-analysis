# company-employee-analysis
![Page 1](https://github.com/tejanallagorla/company-employee-analysis/blob/main/Employee%20Distribution%20Report%20-%20Page%201.png)
![Page 2](https://github.com/tejanallagorla/company-employee-analysis/blob/main/Employee%20Distribution%20Report%20-%20Page%202.png)

## Data/Technologies Used
**Data** - Human resources data with over 22,000 records from 2000 to 2020.<br>
**Data Cleaning & Analysis** - MySQL Workbench<br>
**Data Visualization** - Microsoft Power BI<br>

## Questions
1) What is the gender breakdown of employees in the company?
2) What is the race breakdown of employees in the company?
3) What is the age distribution of employees in the company?
4) How many employees work at the headquarters versus remote locations?
5) What is the average length of employment for employees who have been terminated?
6) How does the gender breakdown vary across departments?
7) What is the breakdown of job titles across the company?
8) Which department has the highest turnover rate?
9) What is the distribution of employees across locations by city and state?
10) How has the company's employee count changed over time?
11) What is the average tenure for each department?

## Summary of Findings
* The gender breakdown of employees in the company is 51.0% male, 46.3% female, and 2.7% non-conforming.
* The most common race of employees is White (28.5%), while the least common races are American Indian/Alaska Native (6.0%) and Native Hawaiian/Other Pacific Islander (5.4%).
* The youngest employee is 21 years old, whereas the oldest employee is 58 years old. The average age of employees at the company is 39, and very few employees fall into the 58-65 range.
* Approximately 75% of employees work at the headquarters, and the rest work remotely.
* For employees who have been terminated, the average length of employment is about 8 years.
* The gender breakdown of employees across each department roughly follows the overall gender breakdown in the company. However, there are a few departments, like Services, Research and Development, Support, Marketing, and Auditing, where the difference in number between male and female employees is almost indistinguishable.
* The most common job titles are Research Assistant II, Business Analyst, and Human Resources Analyst II. The least common job titles are Marketing Manager, Associate Professor, and VP of Training and Development.
* The Auditing department has the highest turnover rate (0.18).
* A large portion of employees are located in Cleveland, OH, but there are also substantial amounts in Chicago, IL, and Philadelphia, PA.
* After the first year (2000), the company has been growing by approximately 900 employees annually. In 20 years, it has gone from 185 employees to 17.5 thousand.
* The average tenure for each department is approximately 8 years, with Sales and Marketing being the highest, and Product Management and Legal being the lowest.

## Limitations
* Some records had unreasonable ages that were negative or below 18, so they were excluded during querying (967 records). Only records with ages 18 and above were used in the analysis.
* Some records had termination dates in the future, so they were excluded from the analysis (1408 records). Only records with termination dates on or before 06/04/2024 were used in the analysis.
