SELECT c1.customer_id
, c1.first_name
, c1.last_name
, c2.customer_id
, c2.first_name
, c2.last_name
FROM customers c1
JOIN customers c2
  ON c1.customer_id = c2.customer_id -1
;