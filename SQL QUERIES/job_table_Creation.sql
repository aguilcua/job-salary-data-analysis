CREATE TABLE jobs (
    job_id         INT          AUTO_INCREMENT PRIMARY KEY,
    job_title      VARCHAR(50),
    experience_years INT,
    education_level VARCHAR(50),
    skills_count   INT,
    industry       VARCHAR(50),
    company_size   VARCHAR(50),
    location       VARCHAR(50),
    remote_work    VARCHAR(30),
    certifications INT,
    salary         INT
);