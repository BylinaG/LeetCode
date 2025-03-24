with cte as (select *, lag(temperature) over(order by recordDate) as previous,
lag(recordDate) over(order by recordDate) as previous_date
from Weather)
select id from cte  where temperature > previous and datediff(recordDate, previous_date) = 1