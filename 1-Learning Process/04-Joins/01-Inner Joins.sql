USE bakery;

SELECT *
FROM customers C
INNER JOIN customer_orders CO
  ON C.customer_id = CO.customer_id
ORDER BY C.customer_id
;

SELECT product_name        -- As product_name and order_total only exist in one table, no need to add table name before them.
, sum(order_total) total
FROM products p
INNER JOIN customer_orders co
  ON p.product_id =co.product_id
GROUP BY product_name     -- As using aggregation, need to use Group by
ORDER BY 2
;

SELECT *
FROM suppliers s
INNER JOIN ordered_items oi
ON s.supplier_id = oi.shipper_id  -- Can use Join with two defferent item name
;