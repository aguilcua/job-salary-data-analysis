select location, round(avg(salary), 2) as avg_salary, count(*) as job_count
from job
group by location
order by avg_salary desc
limit 10;
-- top 10 countries based on salary
