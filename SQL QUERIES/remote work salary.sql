SELECT remote_work, ROUND(AVG(salary), 2) AS avg_salary, COUNT(*) AS count
FROM job
GROUP BY remote_work
ORDER BY avg_salary DESC;