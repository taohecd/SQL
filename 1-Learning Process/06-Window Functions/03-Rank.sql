select *
, rank() over(partition by department order by salary) as rank_
, dense_rank() over(partition by department order by salary) as dense_
from employees
;

select *
from
(
select *
, rank() over(partition by department order by salary) as rank_
from employees
) as rank_table
where rank_ <3
;