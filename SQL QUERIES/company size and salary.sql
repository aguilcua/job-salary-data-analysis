select company_size, round(avg(salary), 2) as avg_salary
from job
group by company_size
order by avg_salary desc;
-- start ups tend to have lower salaries and enterprise larger salary