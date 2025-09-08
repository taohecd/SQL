use bakery;

select * from ordered_items;

select order_id, product_id, shipper_id, (quantity * unit_price) as total_order_cost
from ordered_items
where (quantity * unit_price) > (
select  max(quantity * unit_price) as total_order_cost
from ordered_items
where shipper_id = 1) 
;

select order_id, product_id, shipper_id, (quantity * unit_price) as total_order_cost
from ordered_items
where (quantity * unit_price) > all (
select  (quantity * unit_price) as total_order_cost
from ordered_items
where shipper_id = 1) 
;

select order_id, product_id, shipper_id, (quantity * unit_price) as total_order_cost
from ordered_items
where (quantity * unit_price) > any (
select  (quantity * unit_price) as total_order_cost
from ordered_items
where shipper_id = 1) 
;