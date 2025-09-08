USE bakery;
-- SELECT *FROM ordered_items;
-- SELECT * FROM products;

SELECT DISTINCT p.product_name
, oi.unit_price
, p.sale_price
, p.units_in_stock
, p.sale_price - oi.unit_price AS profit
, units_in_stock * (p.sale_price - oi.unit_price) AS potential_profit
FROM ordered_items AS oi
JOIN products AS p
USING(product_id)
ORDER BY potential_profit DESC
-- ON oi.product_id = p.product_id
;


