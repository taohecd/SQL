SELECT * FROM bakery.customer_sweepstakes_10;

SELECT customer_id, birth_date 
, case 
when substring(birth_date, 8, 1) = '/' then str_to_date(birth_date, '%Y/%d/%m')
else str_to_date(birth_date, '%m/%d/%Y')
end
FROM 
bakery.customer_sweepstakes_10
;

update customer_sweepstakes_10
set birth_date = case 
when substring(birth_date, 8, 1) = '/' then str_to_date(birth_date, '%Y/%d/%m')
else str_to_date(birth_date, '%m/%d/%Y')
end
;