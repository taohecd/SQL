SELECT 
    *
FROM
    customers
WHERE
    first_name REGEXP 'k'   -- similar to the 'like', case insensitive
;

SELECT first_name, REGEXP_REPLACE (first_name, 'a' , 'b')  -- replace 'a' to 'b'
FROM customers
;

SELECT first_name, REGEXP_LIKE (first_name, 'o')   -- Cases insensitive, return 1 or 0
FROM customers
;

SELECT first_name, REGEXP_INSTR (first_name, 'o')  -- similar to 'locate', return the first location, cases insensitive
FROM customers
;

SELECT first_name, REGEXP_SUBSTR (first_name, 'o')  --  return the string firstly find in items, cases insensitive
FROM customers
;