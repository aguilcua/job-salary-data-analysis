SELECT industry, education_level, ROUND(AVG(salary), 2) AS avg_salary
FROM job
GROUP BY industry, education_level
ORDER BY avg_salary DESC
LIMIT 10;