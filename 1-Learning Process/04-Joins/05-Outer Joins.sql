SELECT *
FROM customer_orders co
RIGHT JOIN products p       -- The main table 'products' is on the right
ON co.product_id = p.product_id
ORDER BY co.product_id
;

SELECT *
FROM customers c
LEFT JOIN customer_orders co    -- The main table 'customers' is on the Left
ON c.customer_id = co.customer_id
ORDER BY co.customer_id
;

