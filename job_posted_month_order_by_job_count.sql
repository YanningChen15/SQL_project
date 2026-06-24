select 
count(job_id) as job_count,
extract(MONTH from job_posted_date) as month
from job_postings_fact
where job_title_short = 'Data Analyst'
group BY extract(MONTH from job_posted_date)
order by job_count desc;



