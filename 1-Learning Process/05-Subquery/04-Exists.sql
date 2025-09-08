use bakery;

select * 
from
customers
where customer_id in (
select customer_id 
from customer_orders
) 
;

select * 
from
customers as c
where exists (
select customer_id 
from customer_orders
where customer_id = c.customer_id
) 
;