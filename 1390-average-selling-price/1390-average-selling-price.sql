# Write your MySQL query statement below
with cte as (select p.product_id, units, price, units*price as total_sum  
from Prices as p
left join UnitsSold as u
on p.product_id = u.product_id
and u.purchase_date between p.start_date and end_date)
select product_id, coalesce(round((sum(total_sum)/sum(units)),2),0) as average_price
from cte
group by product_id