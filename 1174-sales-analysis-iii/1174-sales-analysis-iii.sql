# Write your MySQL query statement below
select product_id, product_name
from Sales
left join Product using (product_id)
where sale_date between '2019-01-01' and '2019-03-31'
except
select product_id, product_name
from Sales
left join Product using (product_id)
where sale_date not between '2019-01-01' and '2019-03-31'