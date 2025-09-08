USE bakery;

SELECT *
FROM 
z_regular_expression
;

SELECT *
FROM 
z_regular_expression
WHERE email REGEXP '@gmail' -- Return email with '@gmail'
;

SELECT email, REGEXP_SUBSTR(email, '@.+')  -- can also use '@.*'
FROM 
z_regular_expression
;

SELECT email, REGEXP_SUBSTR(email, '@[a-z]+')  -- can also use '@[a-z]+'
FROM 
z_regular_expression
;

SELECT phone
FROM 
z_regular_expression
WHERE phone REGEXP '[0-9]{3}.[0-9]{3}.[0-9]{3}'
;

SELECT phone
FROM 
z_regular_expression
WHERE phone REGEXP '[0-9]{3}.[0-9]{3}.[0-9]{4}'
;

SELECT phone
FROM 
z_regular_expression
WHERE phone REGEXP '[0-9]{3}.*[0-9]{3}.*[0-9]{4}'
;

SELECT *
FROM 
z_regular_expression
WHERE phrase REGEXP '.+sql.+' -- Case insensitive
;