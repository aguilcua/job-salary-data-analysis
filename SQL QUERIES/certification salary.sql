SELECT certifications, ROUND(AVG(salary), 2) AS avg_salary, COUNT(*) AS count
FROM job
GROUP BY certifications
ORDER BY certifications ASC;
-- certifications pays slightly more but is not a huge impact on salary as compared to other features