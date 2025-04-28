# Write your MySQL query statement below
with _ids as(select distinct product_id from Products),
_top as(select *, rank() over (partition by product_id order by change_date desc) as _rank
from Products where change_date <= '2019-08-16'),
cte2 as(select product_id, new_price as price from _top where _rank = 1)
select _ids.product_id,  
case when cte2.price is null then 10
else cte2.price end as price
from _ids left join cte2 on _ids.product_id = cte2.product_id