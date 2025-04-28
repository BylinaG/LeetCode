# Write your MySQL query statement below
select 
case when id%2=1 and (lead(id) over(order by id) is not null) then id+1
     when id%2=0 then id-1
     else id end as id, student 
from Seat
order by id