SELECT job_title, COUNT(*) AS count
FROM job
GROUP BY job_title
ORDER BY count DESC;