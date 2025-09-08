SELECT * FROM bakery.customer_sweepstakes;
alter table customer_sweepstakes rename column `ï»¿sweepstake_id` to `sweepstake_id`;

SELECT customer_id, count(customer_id)
FROM bakery.customer_sweepstakes
group by customer_id
having count(customer_id) > 1
;

select *
from (
SELECT customer_id, 
row_number() over(partition by customer_id order by customer_id) as row_num
FROM bakery.customer_sweepstakes
) as table_row
where row_num > 1
;

delete from customer_sweepstakes
where sweepstake_id in (
select sweepstake_id
from (
SELECT sweepstake_id, 
row_number() over(partition by customer_id order by customer_id) as row_num
FROM bakery.customer_sweepstakes
) as table_row
where row_num > 1
)
;