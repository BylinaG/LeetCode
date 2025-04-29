# Write your MySQL query statement below
with cte as (select score from Scores order by score desc)
select *, dense_rank() over (order by score desc) as 'rank' from cte