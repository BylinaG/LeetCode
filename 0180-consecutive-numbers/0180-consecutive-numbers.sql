# Write your MySQL query statement below
select distinct num as ConsecutiveNums
from (SELECT num, LEAD(num) OVER(ORDER BY id) AS lead_value, LAG(num) OVER (ORDER BY id) AS lag_value
FROM Logs) t
WHERE num=lead_value and num=lag_value