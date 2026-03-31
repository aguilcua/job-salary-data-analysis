select education_level, round(avg(salary), 2) as avg_salary
from job
group by education_level
order by avg_salary DESC;
-- found that the difference between bachelors and masters increases salary the most