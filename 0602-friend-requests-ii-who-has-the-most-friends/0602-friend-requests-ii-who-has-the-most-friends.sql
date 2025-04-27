# Write your MySQL query statement below
with cte as(select distinct requester_id as id, count(*) as total from RequestAccepted group by requester_id),
cte2 as(select distinct accepter_id as id, count(*) as total from RequestAccepted group by accepter_id),
cte3 as (select id, total as num
from cte
union all select * from cte2)
select id, sum(num) as num
from cte3
group by id
order by num desc
limit 1