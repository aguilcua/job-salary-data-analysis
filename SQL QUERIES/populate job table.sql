LOAD DATA INFILE "C:/ProgramData/MySQL/MySQL Server 8.0/Uploads/jobscleaned_jobs_salary.csv"
INTO TABLE jobs
FIELDS TERMINATED BY ','
ENCLOSED BY '"'
LINES TERMINATED BY '\n'
IGNORE 1 ROWS
(job_title, experience_years, education_level, skills_count, 
 industry, company_size, location, remote_work, certifications, salary);
