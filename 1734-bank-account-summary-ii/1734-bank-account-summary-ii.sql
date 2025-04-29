# Write your MySQL query statement below
select u.name as NAME, sum(amount) as  BALANCE
from Transactions t 
left join Users u
on t.account = u.account
group by u.name
having sum(amount) > 10000