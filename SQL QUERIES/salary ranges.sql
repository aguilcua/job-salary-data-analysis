SELECT 
    CASE 
        WHEN salary < 50000 THEN 'Under 50k'
        WHEN salary BETWEEN 50000 AND 100000 THEN '50k - 100k'
        WHEN salary BETWEEN 100001 AND 150000 THEN '100k - 150k'
        ELSE 'Over 150k'
    END AS salary_range,
    COUNT(*) AS count
FROM job
GROUP BY salary_range
ORDER BY count DESC;