SELECT *
FROM customers
WHERE total_money_spent REGEXP '[0-3]'  -- return the money include number '0,1,2,3'
;

SELECT *
FROM customers
WHERE total_money_spent REGEXP '36'  -- return the money include number '36'
;

SELECT *
FROM customers
WHERE phone REGEXP '.'  -- return the items are not null, '.' means any value
;

SELECT *
FROM customers
WHERE first_name REGEXP 'k.n'  -- '.' like '-' 
;

SELECT *
FROM customers
WHERE phone REGEXP '6.'  -- '.' like '%'
;

SELECT *
FROM customers
WHERE first_name REGEXP '^k'  -- '^' means at the beginning
;

SELECT *
FROM customers
WHERE first_name REGEXP 'n$'  -- '%' means end
;

SELECT *
FROM customers
WHERE first_name REGEXP 'ar.*'  -- '.*', means zero or more
;

SELECT *
FROM customers
WHERE first_name REGEXP 'ar.+'  -- '.+', means one or more
;

SELECT *
FROM customers
WHERE first_name REGEXP 'k.?n'  -- '.?', means zero or one, would be anything for putting '.?' to the end
;

SELECT *
FROM customers
WHERE first_name REGEXP 'k.{3}n'  -- '*', means 3 characters between 'k' and 'n'
;

SELECT *
FROM customers
WHERE first_name REGEXP 'kev|fro|ob'  
;