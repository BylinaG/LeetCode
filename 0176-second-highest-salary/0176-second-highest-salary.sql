# Write your MySQL query statement below
select if((select count(distinct salary) from Employee)=1, null, min(salary)) as  SecondHighestSalary
from (select distinct salary from Employee order by salary desc limit 2) as cte
