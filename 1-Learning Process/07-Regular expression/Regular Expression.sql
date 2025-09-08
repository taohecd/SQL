select * 
from customers
where first_name regexp 'k'  -- return items with given letter or string, similar to the 'like', case insensitive
;
select * 
from customers
where first_name like '%k%'  
;
select *
from z_regular_expression
where email regexp '@gmail'
;
select *
from z_regular_expression
where phone regexp '[0-9]{3}.*[0-9]{3}.*[0-9]{3}'  -- vs '[0-9]{3}.[0-9]{3}.[0-9]{3}' vs '[0-9]{3}.[0-9]{3}.[0-9]{4}'
;                                                  -- think about '.' vs '.+' vs '.*'
select *
from customers
where phone regexp '.6.5.'  -- '.'at the beginning means '%', '.' in the middle means '-', at then end means '%'
;


select first_name, regexp_replace(first_name, 'a' , '%')
from customers
;
select first_name, replace(first_name, 'a' , '$')     -- 'replace' can change to '$', but 'regexp_replace' cannot
from customers
;


select first_name, regexp_like(first_name, 'a' )       -- case insensitive, return '1' or '0'
from customers
;


select first_name, regexp_instr(first_name, 'a' )       -- similar to 'locate', return the first location, case insensitive
from customers
;
select first_name, locate('a',first_name)       -- similar to 'locate', return the first location, case insensitive
from customers
;

select first_name, regexp_substr(first_name, 'a' )       -- return the letter or string firstly find in items, case insensitive
from customers
;
select *, regexp_substr(email, '@.+')
from z_regular_expression
;








