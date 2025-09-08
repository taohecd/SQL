select *
, lag(salary) over(partition by department) as lag_
, lead(salary) over(partition by department) as lead_
from
employees
;