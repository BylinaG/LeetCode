select request_at as Day, round(sum(if(status LIKE 'cancelled%',1,0))/count(*),2) as 'Cancellation Rate'
from Trips t
left join Users u1
on t.driver_id = u1.users_id
left join Users u2
on t.client_id = u2.users_id
where u1.banned = 'No' and u2.banned = 'No' and request_at between "2013-10-01" and "2013-10-03"
group by request_at
order by request_at