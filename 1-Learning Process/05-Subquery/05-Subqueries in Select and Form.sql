
select product_id
, quantity
, (select avg(quantity) from ordered_items) as avg_quantity
from 
ordered_items
;

select product_id
, quantity
, (select sum(quantity) from ordered_items) as sum_quantity
, quantity/(select sum(quantity) from ordered_items) * 100 as percent_of_quantity
from 
ordered_items
;

select product_id, percent_of_quantity
from 
(select product_id                     -- The entire paragraph in brackets is considered a table
, quantity
, (select sum(quantity) from ordered_items) as sum_quantity
, quantity/(select sum(quantity) from ordered_items) * 100 as percent_of_quantity
from 
ordered_items) as quantity             -- The new table should have an alias
;

