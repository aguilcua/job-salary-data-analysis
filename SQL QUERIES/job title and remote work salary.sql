SELECT job_title, remote_work, ROUND(AVG(salary), 2) AS avg_salary
FROM job
GROUP BY job_title, remote_work
ORDER BY job_title, avg_salary DESC;