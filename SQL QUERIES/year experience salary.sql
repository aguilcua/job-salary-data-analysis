SELECT experience_years, ROUND(AVG(salary), 2) AS avg_salary
FROM job
GROUP BY experience_years
ORDER BY experience_years ASC;