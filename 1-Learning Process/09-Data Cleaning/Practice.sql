select * from customer_sweepstakes;

delete from customer_sweepstakes 
where sweepstake_id in ( 
select sweepstake_id 
from ( 
SELECT sweepstake_id,  
row_number() over(partition by customer_id order by customer_id) as row_ 
FROM  customer_sweepstakes 
) as table_1 
where row_ > 1 
) 
;

select phone
, concat(substring(regexp_replace(phone, '[-/()]', ''), 1,3),'-',substring(regexp_replace(phone, '[-/()]', ''), 4,3),'-',substring(regexp_replace(phone, '[-/()]', ''), 7,4))
from customer_sweepstakes
where phone <> ''
;

update customer_sweepstakes
set phone = concat(substring(regexp_replace(phone, '[-/()]', ''), 1,3),'-',substring(regexp_replace(phone, '[-/()]', ''), 4,3),'-',substring(regexp_replace(phone, '[-/()]', ''), 7,4))
where phone <> ''
;

alter table customer_sweepstakes
drop column favorite_color
;

update customer_sweepstakes
set phone = null
where phone = ''
;

update customer_sweepstakes, customer_sweepstakes_staging
set customer_sweepstakes.phone = customer_sweepstakes_staging.phone
where customer_sweepstakes.customer_id = customer_sweepstakes_staging.customer_id
;

select *, left(`Are you over 18?`,1)
from customer_sweepstakes
;

update customer_sweepstakes
set `Are you over 18?` = left(`Are you over 18?`,1)
;

select birth_date
, case
when substring(birth_date,8,1)='/' then str_to_date(birth_date, '%Y/%d/%m')
else str_to_date(birth_date, '%m/%d/%Y')
end
from customer_sweepstakes
;

update customer_sweepstakes
set birth_date =
case
when substring(birth_date,8,1)='/' then str_to_date(birth_date, '%Y/%d/%m')
else str_to_date(birth_date, '%m/%d/%Y')
end
;

alter table customer_sweepstakes
add column street varchar(50) after address
;

alter table customer_sweepstakes
add column city varchar(50) after street
;

alter table customer_sweepstakes
add column state varchar(50) after city
;

select address
, substring_index(address, ',',1)
, substring_index(substring_index(address, ',',2),',',-1)
, substring_index(address, ',',-1)
from customer_sweepstakes
;

update customer_sweepstakes
set street = substring_index(address, ',',1)
;

update customer_sweepstakes
set city = trim(substring_index(substring_index(address, ',',2),',',-1))
;

update customer_sweepstakes
set state = upper(trim(substring_index(address, ',',-1)))
;

alter table customer_sweepstakes
drop column address;

select birth_date , `Are you over 18?`
,case
when year(now())-1-year(birth_date) < 18 then 'N'
else 'Y'
end
from customer_sweepstakes
;

update customer_sweepstakes
set `Are you over 18?`=
case
when year(now())-1-year(birth_date) < 18 then 'N'
else 'Y'
end
;

