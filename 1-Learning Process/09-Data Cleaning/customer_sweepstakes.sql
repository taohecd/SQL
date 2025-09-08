SELECT * FROM customer_sweepstakes;

select sweepstake_id
from (
SELECT sweepstake_id, customer_id
, row_number() over(partition by customer_id) as row_
FROM 
customer_sweepstakes
) as table_1
where row_ > 1
;

delete from customer_sweepstakes
where sweepstake_id in (
select sweepstake_id
from (
SELECT sweepstake_id, customer_id
, row_number() over(partition by customer_id) as row_
FROM 
customer_sweepstakes
) as table_1
where row_ > 1
)
;

select phone, regexp_replace(phone, '[()-/]','') 
from customer_sweepstakes;

select phone
, concat(substring(regexp_replace(phone, '[()-/]',''), 1,3),'-',substring(regexp_replace(phone, '[()-/]',''), 4,3),'-',substring(regexp_replace(phone, '[()-/]',''), 7,4))
from customer_sweepstakes
where phone <> ''
;

update customer_sweepstakes       -- Column phone
set phone = concat(substring(regexp_replace(phone, '[()-/]',''), 1,3),'-',substring(regexp_replace(phone, '[()-/]',''), 4,3),'-',substring(regexp_replace(phone, '[()-/]',''), 7,4))
where phone <> ''
;

select birth_date            
, case 
	when substring(birth_date,8,1)='/' then  str_to_date(birth_date,'%Y/%d/%m')
    else str_to_date(birth_date,'%m/%d/%Y')
end
from customer_sweepstakes
;

update customer_sweepstakes      -- Column birth_date
set birth_date = 
case 
	when substring(birth_date,8,1)='/' then  str_to_date(birth_date,'%Y/%d/%m')
    else str_to_date(birth_date,'%m/%d/%Y')
end
;

select `Are you over 18?`
, substring(`Are you over 18?`,1,1)
, left(`Are you over 18?`,1)
from customer_sweepstakes
;

update customer_sweepstakes
set `Are you over 18?` = 
substring(`Are you over 18?`,1,1)
;

update customer_sweepstakes
set phone = null
where phone = ''
;

update customer_sweepstakes
set income = null
where income = ''
;

alter table customer_sweepstakes
drop column favorite_color;

select birth_date, `Are you over 18?`
, case
	when year(now())-1-year(birth_date) < 18 then 'N'
    else 'Y'
    end
from customer_sweepstakes;

update customer_sweepstakes
set `Are you over 18?` =
case
	when year(now())-1-year(birth_date) < 18 then 'N'
    else 'Y'
    end
;
    
update customer_sweepstakes, customer_sweepstakes_3
set  customer_sweepstakes.birth_date = customer_sweepstakes_3.birth_date
where customer_sweepstakes.customer_id = customer_sweepstakes_3.customer_id
;   

select address
, substring_index(address,',',1) as  street
, trim(substring_index(substring_index(address,',',2),',',-1)) as city
, trim(upper(substring_index(address,',',-1))) as State
from customer_sweepstakes
;

alter table customer_sweepstakes
add column street varchar(50) after address;

alter table customer_sweepstakes
add column city varchar(50) after street;

alter table customer_sweepstakes
add column state varchar(50) after city;

update customer_sweepstakes
set street = substring_index(address,',',1)
, city = trim(substring_index(substring_index(address,',',2),',',-1))
, state = trim(upper(substring_index(address,',',-1)))
;   

alter table customer_sweepstakes
drop column address;







