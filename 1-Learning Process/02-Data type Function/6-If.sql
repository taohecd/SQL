use bakery;

SELECT order_total
, tip
, if(tip > 2, order_total * 0.9, order_total * 1.1) new_total
FROM customer_orders
LIMIT 10
;