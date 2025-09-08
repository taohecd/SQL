USE bakery;
SELECT * FROM ordered_items;
SELECT * FROM products;
SELECT * FROM suppliers;
SELECT * FROM supplier_delivery_status;

SELECT oi.order_id, oi.product_id, p.product_name
, oi.shipped_date, sds.name, s.name 
FROM ordered_items AS oi
JOIN products AS p
ON oi.product_id = p.product_id
JOIN supplier_delivery_status AS sds
ON oi.status = sds.order_status_id
JOIN suppliers AS s
ON oi.shipper_id = s.supplier_id
WHERE sds.name != 'Delivered'
AND YEAR(oi.shipped_date) < YEAR(NOW()) -2
;


