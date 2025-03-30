# Write your MySQL query statement below
with cte as(select distinct *, case when product_key in (select * from Product) then 1 else 0 end as if_in_product
from Customer)
select customer_id
from cte
group by customer_id
having sum(if_in_product) = (select count(*) from Product)