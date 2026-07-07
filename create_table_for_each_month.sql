create table january_job as
select *
from job_postings_fact
where extract(month from job_posted_date) = 1;

create table february_job as
select *
from job_postings_fact
where extract(month from job_posted_date) = 2;

create table march_job as
select *
from job_postings_fact
where extract(month from job_posted_date) = 3;

create table april_job as
select *
from job_postings_fact
where extract(month from job_posted_date) = 4;

create table may_job as
select *
from job_postings_fact
where extract(month from job_posted_date) = 5;

create table june_job as
select *
from job_postings_fact
where extract(month from job_posted_date) = 6;

create table july_job as
select *
from job_postings_fact
where extract(month from job_posted_date) = 7;

create table august_job as
select *
from job_postings_fact
where extract(month from job_posted_date) = 8;

create table september_job as
select *
from job_postings_fact
where extract(month from job_posted_date) = 9;

create table october_job as
select *
from job_postings_fact
where extract(month from job_posted_date) = 10;

create table november_job as
select *
from job_postings_fact
where extract(month from job_posted_date) = 11;

create table december_job as
select *
from job_postings_fact
where extract(month from job_posted_date) = 12;