# Write your MySQL query statement below
with cte as(select num 
from MyNumbers
group by num
having count(*) = 1
order by num desc
limit 1)
select case when count(*) = 0 then null else num end as num from cte