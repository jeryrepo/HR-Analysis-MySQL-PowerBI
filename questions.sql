-- QUESTIONS
use pf;

select count(id) as total_employees
from hr;
-- 1. What is the gender breakdown of employees in the company?

select gender,count(*)
from hr
where age > 18 and term_date = 0000-00-00
group by gender;

-- 2. What is the race/ethnicity breakdown of employees in the company?

select race,count(*) as total
from hr
where age > 18 and term_date = 0000-00-00
group by race;

-- 3. What is the age distribution of employees in the company?

SELECT
    CASE
        WHEN age BETWEEN 21 AND 26 THEN 'Gen Z'
        WHEN age BETWEEN 27 AND 42 THEN 'Millennials'
        WHEN age BETWEEN 43 AND 58 THEN 'Gen X'
        ELSE 'Other'
    END AS age_group,
    count(*) as total_employees
FROM hr
WHERE age >= 18 AND term_date = 0000-00-00
GROUP BY age_group
ORDER BY age_group ASC;


-- 4. How many employees work at headquarters versus remote locations?

select location, count(*) as employees
from hr
WHERE age >= 18 AND term_date = 0000-00-00
group by location;

-- 5. What is the average length of employment for employees who have been terminated?

select round(avg(timestampdiff(year,hire_date,term_date))) as average_lenght
from hr
WHERE term_date <= current_date() and age >= 18 AND term_date != 0000-00-00;

-- 6. How does the gender distribution vary across departments?

select department, gender, count(*) as distribution
from hr
where age > 18 and term_date = 0000-00-00
group by 1,2
order by 1;

-- 7. What is the distribution of job titles across the company?

select job_title, gender,count(*) as total
from hr
where age > 18 and term_date = 0000-00-00
group by 1,2
order by 1;


-- 8. Which department has the highest turnover rate?

WITH total_employees AS (
  SELECT
    department,
    COUNT(*) AS total_employees
  FROM hr e1
  WHERE e1.age > 18
  GROUP BY e1.department
),

total_left AS (
  SELECT
    department,
    COUNT(*) AS total_left
  FROM hr e2
  WHERE e2.age > 18 AND e2.term_date != 0000-00-00
  GROUP BY e2.department
)

SELECT
  te.department,
  round((tl.total_left/te.total_employees)*100,0) as turnover_rate
FROM total_employees te
LEFT JOIN total_left tl ON te.department = tl.department;


-- 9. What is the distribution of employees across locations by city and state?

select location, location_city, location_state, count(*) as total_employees
from hr
where age > 18 and term_date = 0000-00-00
group by location, location_city, location_state
order by count(*) desc;

-- 10. How has the company's employee count changed over time based on hire and term dates?

WITH total_employees_hired AS (
  SELECT
    hire_date,
    COUNT(*) AS total_employees_hired
  FROM hr e1
  WHERE e1.age >= 18
  GROUP BY e1.hire_date
),
total_employees_after_term AS (
  SELECT
    hire_date,
    COUNT(*) AS total_employees_after_term
  FROM hr e2
  WHERE e2.age >= 18 AND e2.term_date != 0000-00-00
  GROUP BY e2.hire_date
)
SELECT
  year(te.hire_date) as yr,
  sum(te.total_employees_hired) as hired,
  sum(tl.total_employees_after_term) as term,
  (sum(te.total_employees_hired) - sum(tl.total_employees_after_term)) as `change`,
  round(((sum(te.total_employees_hired) - sum(tl.total_employees_after_term))/sum(te.total_employees_hired)*100),2) as change_percent
  
FROM total_employees_hired te
LEFT JOIN total_employees_after_term tl ON te.hire_date = tl.hire_date
group by yr
order by yr;

-- 11. What is the tenure distribution for each department?

select department, round(avg(timestampdiff(year,hire_date,term_date)),0) as tenure
from hr
WHERE age >= 18 AND term_date != 0000-00-00 AND term_date <= current_date()
group by department
order by tenure desc;