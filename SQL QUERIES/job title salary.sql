SELECT job_title, ROUND(AVG(salary), 2) AS avg_salary, COUNT(*) AS job_count
FROM job
GROUP BY job_title
ORDER BY avg_salary DESC;