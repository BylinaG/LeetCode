# Write your MySQL query statement below
with cte as
(select 
    country, 
    state, 
    amount, 
    left(trans_date, 7) as data
from Transactions)
select 
    data as month, 
    country, 
    count(state) as trans_count, 
    sum(case when state = 'approved' then 1 else 0 end) as approved_count, 
    sum(amount) as trans_total_amount, 
    sum(case when state = 'approved' then amount else 0 end) as approved_total_amount
from cte 
group by data, country