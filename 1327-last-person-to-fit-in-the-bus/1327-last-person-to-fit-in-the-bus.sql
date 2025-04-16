# Write your MySQL query statement below
with cte as(select *, sum(weight) over(order by turn) as total_sum from Queue
order by turn)
select person_name
from cte
where total_sum <= 1000
order by turn desc
limit 1