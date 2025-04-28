with cte as(select name as results
from MovieRating
left join Users
on MovieRating.user_id = Users.user_id
group by name
order by count(*) desc, name
limit 1),
cte2 as (select title as results
from MovieRating
left join Movies
on MovieRating.movie_id = Movies.movie_id
where left(created_at,7) = '2020-02'
group by title
order by avg(rating) desc, title
limit 1)
select * from cte
union all select * from cte2