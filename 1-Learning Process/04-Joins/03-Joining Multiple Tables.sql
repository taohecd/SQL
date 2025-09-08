use bakery;

SELECT c.customer_id 
, c.first_name
, c.last_name
, p.product_id
, p.product_name
, c.total_money_spent
FROM customer_orders co
INNER JOIN  products p
on p.product_id = co.product_id
INNER JOIN customers c 
on co.customer_id = c.customer_id
;