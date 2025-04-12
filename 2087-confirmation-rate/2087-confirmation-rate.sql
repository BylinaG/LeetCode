# Write your MySQL query statement below
select s.user_id, coalesce(round(sum(action='confirmed')/(sum(action='confirmed')+ sum(action='timeout')),2),0)as confirmation_rate
from Confirmations c
right join Signups s
on c.user_id = s.user_id
group by s.user_id