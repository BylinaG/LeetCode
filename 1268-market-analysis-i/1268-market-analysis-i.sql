# Write your MySQL query statement below
with cte as(select buyer_id, count(*) as orders_in_2019 from Orders 
where left(order_date,4) = '2019' 
group by buyer_id)
select u.user_id as buyer_id, u.join_date, coalesce(t.orders_in_2019,0) as orders_in_2019 from cte t
right join Users u
on t.buyer_id = u.user_id