SELECT * FROM bakery.customer_sweepstakes;

SELECT avg(coalesce(income,0))
FROM customer_sweepstakes;
 
update customer_sweepstakes
set phone = null
where phone = ''
;

update customer_sweepstakes
set income = null
where income = ''
;

update customer_sweepstakes
set `Are you over 18?` = 'N'
where (year(now())-1 - year(birth_date)) < 18
;

update customer_sweepstakes
set `Are you over 18?` = 'Y'
where (year(now())-1 - year(birth_date)) > 18
;