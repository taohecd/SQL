use bakery;

select * from customers;
select * from customer_orders;

select *
from customers 
where  customer_id in 
(
select customer_id      -- Can only select one column in subquery
from customer_orders
where tip >=5           -- Can filter on the one which was not selected
)
;

select * 
from customers
where total_money_spent > 
( 
select avg(total_money_spent)
from customers
)
;