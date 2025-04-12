# Write your MySQL query statement below
with cte as(select  
    product_id, 
    year, 
    quantity, 
    price, 
    dense_rank() over(partition by product_id order by year) as first_year
from Sales)
select     
    product_id, 
    year as first_year, 
    quantity, 
    price
from cte
where first_year = 1