create table job_applied(
    job_id int,
    application_sent_date date,
    custom_resume varchar(255),
    cover_letter_sent Boolean,
    cover_letter_file_name varchar(255),
    status varchar(50)
);

insert INTO job_applied(
job_id, application_sent_date, custom_resume, cover_letter_sent, cover_letter_file_name, status 
)
values
(1, '2024-02-01', 'resume_john_doe.pdf', true, 'cover_letter_john_doe.pdf', 'Pending'),
(2, '2024-02-20', 'resume_jane_smith.pdf', false, null, 'Submitted'),
(3, '2024-03-05', 'resume_mike_brown.pdf', true, 'cover_letter_mike_brown.pdf', 'Interview Scheduled'),
(4, '2024-04-10', 'resume_emily_white.pdf', false, null, 'Rejected'),
(5, '2024-05-25', 'resume_chris_green.pdf', true, 'cover_letter_chris_green.pdf', 'Offer Received');

select * from job_applied;

alter TABLE job_applied
add contact varchar(100);

update job_applied
set contact = 'Erlich Bachman'
where job_id = 1;   
update job_applied
set contact = 'Richard Hendricks'
where job_id = 2;           
update job_applied
set contact = 'Dinesh Chugtai'
where job_id = 3;   
update job_applied
set contact = 'Jared Dunn'
where job_id = 4;   
update job_applied
set contact = 'Monica Hall'
where job_id = 5;   

alter TABLE job_applied
rename column contact to recruiter_contact;

alter TABLE job_applied
alter column recruiter_contact type text;

alter TABLE job_applied
drop column recruiter_contact;

drop table job_applied;
