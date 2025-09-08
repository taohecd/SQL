USE bakery;

SELECT order_id
, order_date
, date_format(order_date, '%M %D %Y') Date_1  -- Upper Case
, date_format(order_date, '%m-%d,%y') Date_2  -- Lower Case
FROM customer_orders
WHERE (year(order_date) + 2) = year(now()) -- Find orders in 2022
; 
SELECT now()
, curdate()
, curtime()
, year(now())
, month(now())
, day(now())
, dayname(now())
, monthname(now())
; 