/*
Question: What are the top-paying data analyse jobs?
- Identify the top 10 hightest paying data analyst roles that are avaliable remotely.
- Focuses on job postings with specified salaries (remove nulls)
- Why? Highlight the top-paying opportunities for data analysts to help job seekers make informed career decisions.
*/  

SELECT 
    job_id,
    job_title, 
    job_location,
    job_schedule_type,
    job_posted_date, 
    salary_year_avg,
    name AS company_name
FROM job_postings_fact
LEFT JOIN company_dim ON job_postings_fact.company_id = company_dim.company_id  
WHERE
    job_title_short = 'Data Analyst' AND
    job_location = 'Anywhere' AND
    salary_year_avg IS NOT NULL
ORDER BY salary_year_avg DESC
LIMIT 10
