/*
Answer: What are the most optimal skills for data analyst jobs?
- Identify the top 5 skills that are both in-demand and high-paying for data analyst roles.
- COncentrates on remote data analyst jobs with specified salaries (remove nulls)
- Why? It helps job seekers make informed career decisions by highlighting the most valuable skills in the job market.
*/  

WITH top_paying_jobs AS (
    SELECT
    skills_dim.skill_id,
    ROUND(AVG(job_postings_fact.salary_year_avg), 0) AS avg_salary
FROM job_postings_fact
INNER JOIN skills_job_dim ON job_postings_fact.job_id = skills_job_dim.job_id
INNER JOIN skills_dim ON skills_job_dim.skill_id = skills_dim.skill_id
WHERE job_postings_fact.salary_year_avg IS NOT NULL AND
      job_postings_fact.job_title_short = 'Data Analyst'
GROUP BY skills_dim.skill_id
),

top_demanded_skills AS (
    SELECT 
        skills_dim.skill_id,
        skills_dim.skills,
        COUNT(skills_job_dim.job_id) AS demand_count
    FROM job_postings_fact
    INNER JOIN skills_job_dim ON job_postings_fact.job_id = skills_job_dim.job_id
    INNER JOIN skills_dim ON skills_job_dim.skill_id = skills_dim.skill_id
    WHERE job_title_short = 'Data Analyst' AND
          job_work_from_home = True AND
          salary_year_avg IS NOT NULL
    GROUP BY
        skills_dim.skill_id

)

SELECT 
    top_demanded_skills.skill_id,
    top_demanded_skills.skills,
    top_demanded_skills.demand_count,
    top_paying_jobs.avg_salary
FROM top_demanded_skills
INNER JOIN top_paying_jobs ON top_demanded_skills.skill_id = top_paying_jobs.skill_id
ORDER BY 
    top_demanded_skills.demand_count DESC,
    top_paying_jobs.avg_salary DESC