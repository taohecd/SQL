use bakery;

SELECT units_in_stock
, case
	  WHEN units_in_stock < 25 THEN 'Order Now'
      WHEN units_in_stock BETWEEN 25 AND 55 THEN 'Check In 3 days'
      WHEN units_in_stock > 55 THEN 'In stock'
      -- ELSE 'In stock'
END AS 'order_status'
FROM products
;