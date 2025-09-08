select c.customer_id
, c.first_name
, co. order_total
, max(order_total) over(partition by c.customer_id ) as max_partition
, max(order_total) over() as max
from customers as c
join customer_orders as co
on c.customer_id = co.customer_id
;