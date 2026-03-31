select industry, ROUND(AVG(salary), 2) as avg_salary, COUNT(*) AS job_count
from job
group by industry
order by avg_salary DESC;