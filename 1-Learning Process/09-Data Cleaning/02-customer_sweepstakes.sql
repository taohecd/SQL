select * from customer_sweepstakes;
-- alter table customer_sweepstakes rename column `ï»¿sweepstake_id` to `sweepstake_id`
/*
select phone, regexp_replace(phone, '[()-/]','') 
from customer_sweepstakes;

update customer_sweepstakes
set phone = regexp_replace(phone, '[()-/]','') ;

select phone, concat(substring(phone,1,3), '-', substring(phone,4,3), '-', substring(phone,7,4))
from customer_sweepstakes
where phone != ''
;

update customer_sweepstakes
set phone = concat(substring(phone,1,3), '-', substring(phone,4,3), '-', substring(phone,7,4))
where phone != ''
;
*/

select customer_id, birth_date
, if (str_to_date(birth_date, '%m/%d/%Y') is not null, str_to_date(birth_date, '%m/%d/%Y'), str_to_date(birth_date, '%Y/%d/%m'))
from 
customer_sweepstakes_inter
;
/*
update customer_sweepstakes 
set customer_sweepstakes.birth_date = if (str_to_date(customer_sweepstakes_inter.birth_date, '%m/%d/%Y') is not null, 
str_to_date(customer_sweepstakes_inter.birth_date, '%m/%d/%Y'), 
str_to_date(customer_sweepstakes_inter.birth_date, '%Y/%d/%m')) 
;
*/
update customer_sweepstakes 
set birth_date = str_to_date(birth_date, '%m/%d/%Y')
where sweepstake_id not in (9,11)
;

update customer_sweepstakes 
set birth_date = str_to_date(birth_date, '%Y/%d/%m')
where sweepstake_id in (9,11)
;


select left(`Are you over 18?`, 1) 
from 
customer_sweepstakes
;

update customer_sweepstakes
set `Are you over 18?` = left(`Are you over 18?`, 1)
;




