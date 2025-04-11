# Write your MySQL query statement below
with cte as(select  machine_id, process_id, activity_type, timestamp, lag(timestamp) over(partition by machine_id, process_id order by machine_id, process_id, activity_type) as leader
from Activity)
select machine_id, round(avg(timestamp-leader),3) as processing_time
from cte
group by machine_id