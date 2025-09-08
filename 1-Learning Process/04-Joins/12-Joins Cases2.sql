USE bakery;

SELECT *
FROM supplier_delivery_status;
SELECT *
FROM ordered_items;
SELECT *
FROM suppliers;
select *
from products;

SELECT oi.order_id
, oi.product_id
, p.product_name
, oi.shipped_date
, sds.name
, s.name
FROM ordered_items AS oi
JOIN supplier_delivery_status AS sds
ON oi.status = sds.order_status_id
JOIN suppliers AS s
ON s.supplier_id = oi.shipper_id
join products as p
on p.product_id = oi.product_id
where sds.name != 'Delivered' and year(shipped_date) < year(now()) -2
order by  s.name, oi.shipped_date
;