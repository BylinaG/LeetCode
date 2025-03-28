# Write your MySQL query statement below
with cte as(select managerId, count(*) as cnt
from Employee 
where managerId is not null and managerId in(select distinct id from Employee)
group by managerId)
select Employee.name from cte 
left join Employee
on cte.managerId = Employee.id
where cnt >= 5