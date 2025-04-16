# Write your MySQL query statement below
with cte as(select Students.student_id, student_name, Subjects.subject_name, 0 as attended_exams
from Students 
cross join Subjects),
cte2 as(select *, count(*) as attended_exams from Examinations
group by student_id, subject_name)
select cte.student_id, cte.student_name, cte.subject_name, (cte.attended_exams + coalesce(cte2.attended_exams, 0)) as attended_exams from cte
left join cte2
on cte.student_id = cte2.student_id
and cte.subject_name = cte2.subject_name
order by cte.student_id, cte.subject_name
