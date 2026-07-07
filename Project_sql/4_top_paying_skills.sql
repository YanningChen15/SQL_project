/*
Question: What are the top-paying data analyse jobs?
- Look at the average salary associated with each skill for data analyst roles.
- Focuses on job postings with specified salaries (remove nulls), regardless of location.
- Why? It reveals how differennt skills can impact earning potential for data analysts
        helping job seekers make informed career decisions and understand which skills are most valuable in the job market.
*/

SELECT
    skills_dim.skills,
    ROUND(AVG(job_postings_fact.salary_year_avg), 0) AS avg_salary
FROM skills_dim
INNER JOIN skills_job_dim ON skills_dim.skill_id = skills_job_dim.skill_id
INNER JOIN job_postings_fact ON skills_job_dim.job_id = job_postings_fact.job_id
WHERE job_postings_fact.salary_year_avg IS NOT NULL AND
      job_postings_fact.job_title_short = 'Data Analyst'
GROUP BY skills_dim.skills
ORDER BY avg_salary DESC
LIMIT 5;

