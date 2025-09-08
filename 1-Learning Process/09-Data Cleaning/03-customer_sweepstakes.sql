SELECT * FROM bakery.customer_sweepstakes;

alter table customer_sweepstakes
add column Street varchar(50) after address;

alter table customer_sweepstakes
add column City varchar(50) after Street;

alter table customer_sweepstakes
add column State varchar(50) after City;

update customer_sweepstakes
set Street = substring_index(address,',',1);

update customer_sweepstakes
set City = trim(substring_index(substring_index(address,',',2),',',-1));

update customer_sweepstakes
set State = trim(upper(substring_index(address,',',-1)));
