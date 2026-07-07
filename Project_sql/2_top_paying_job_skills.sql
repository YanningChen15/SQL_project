/*
Question: What are the top-paying data analyse jobs?
- Identify the top 10 hightest paying data analyst roles that are avaliable remotely.
- Focuses on job postings with specified salaries (remove nulls)
- Why? Highlight the top-paying opportunities for data analysts to help job seekers make informed career decisions.
        helping job seekers understand which skills are most valuable in the job market.
*/ 

WITH top_paying_jobs AS (

    SELECT 
        job_id,
        job_title, 
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
)

SELECT top_paying_jobs.*,
        skills_dim.skills
FROM top_paying_jobs
INNER JOIN skills_job_dim ON top_paying_jobs.job_id = skills_job_dim.job_id
INNER JOIN skills_dim ON skills_job_dim.skill_id = skills_dim.skill_id
ORDER BY top_paying_jobs.salary_year_avg DESC