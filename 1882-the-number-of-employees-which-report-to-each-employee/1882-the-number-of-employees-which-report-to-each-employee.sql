# Write your MySQL query statement below
with cte as(select reports_to as employee_id, count(*) as reports_count, round(avg(age)) as average_age
from Employees 
where reports_to is not null
group by reports_to)
select cte.employee_id, e.name, reports_count, average_age
from cte
left join Employees e
on cte.employee_id = e.employee_id
order by cte.employee_id