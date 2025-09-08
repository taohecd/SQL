

SELECT first_name, last_name, 'Old' as note
FROM customers
WHERE year(birth_date) < 1950
UNION ALL
SELECT first_name, last_name, 'Good Tipper'
FROM customers as c
JOIN customer_orders as co
on c.customer_id = co.customer_id
WHERE tip >= 5
UNION DISTINCT                       -- Default Union is Distinct
SELECT first_name, last_name, 'Big Spender'
FROM customers
WHERE total_money_spent >1000
ORDER BY first_name                  -- put 'order by' at the end
;