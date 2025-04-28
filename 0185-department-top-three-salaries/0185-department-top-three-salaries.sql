# Write your MySQL query statement below
select d.name as Department, e.name as Employee, e.salary as Salary 
from Employee e 
left join Department d
on e.departmentId = d.id
where e.id in(select id 
from (select *, dense_rank() over(partition by departmentId order by salary desc) as _rank
from Employee e) t
where _rank <= 3)