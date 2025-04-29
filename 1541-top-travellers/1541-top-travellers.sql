# Write your MySQL query statement below
select u.name as name, coalesce(sum(r.distance),0) as travelled_distance
from Rides r
right join Users u
on r.user_id = u.id
group by u.id
order by sum(r.distance) desc, u.name