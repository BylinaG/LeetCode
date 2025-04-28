# Write your MySQL query statement below

with cte as(select *, 
    lag(amount, 1) over(order by visited_on) as 1lag,
    lag(amount, 2) over(order by visited_on) as 2lag,
    lag(amount, 3) over(order by visited_on) as 3lag,
    lag(amount, 4) over(order by visited_on) as 4lag,
    lag(amount, 5) over(order by visited_on) as 5lag,
    lag(amount, 6) over(order by visited_on) as 6lag,
    dense_rank() over(order by visited_on) as _rank
from (select visited_on, sum(amount) as amount from Customer group by visited_on) t)
select visited_on,
        (amount+1lag+2lag+3lag+4lag+5lag+6lag) as amount,
        round((amount+1lag+2lag+3lag+4lag+5lag+6lag)/7,2) as average_amount
from cte where _rank >6