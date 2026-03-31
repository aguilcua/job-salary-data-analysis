SELECT company_size, ROUND(AVG(salary), 2) AS avg_salary
FROM job
GROUP BY company_size
ORDER BY avg_salary DESC;