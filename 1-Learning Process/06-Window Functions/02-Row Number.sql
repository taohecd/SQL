select c.customer_id
, c.first_name
, co. order_total
, row_number() over(partition by c.customer_id order by c.customer_id) as row_num
from customers as c
join customer_orders as co
on c.customer_id = co.customer_id
;

select *
from
(
select c.customer_id
, c.first_name
, co. order_total
, row_number() over(partition by c.customer_id order by c.customer_id) as row_num
from customers as c
join customer_orders as co
on c.customer_id = co.customer_id
) as row_table
where row_num < 3
;
