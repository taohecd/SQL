SELECT * FROM us_household _income;
SELECT * FROM us_household_income_statistics;

SELECT id
, count(id) 
FROM us_household_income
group by id
having count(id) > 1
;

select row_id,id
from (
SELECT row_id,id
, row_number() over(partition by id) as row_num
FROM us_household_income
) as table_1
where row_num > 1
;

delete from us_household_income
where row_id in (
select row_id
from (
SELECT row_id
, row_number() over(partition by id) as row_num
FROM us_household_income
) as table_1
where row_num > 1
);

SELECT id, State_Name
FROM us_household_income
where binary State_Name regexp'^[a-z]'
;

SELECT CONCAT(UPPER(LEFT(State_Name, 1)), LOWER(SUBSTRING(State_Name, 2))) AS capitalized_string
FROM us_household_income
where binary State_Name regexp'^[a-z]'
;

update us_household_income
set State_Name = CONCAT(UPPER(LEFT(State_Name, 1)), LOWER(SUBSTRING(State_Name, 2)))
where binary State_Name regexp'^[a-z]'
;

SELECT distinct State_Name 
FROM us_household_income;

update us_household_income
set State_Name = 'Georgia'
where State_Name = 'Georia'
;

SELECT *
FROM us_household_income
where State_Name = 'Alabama'
and County = 'Lee County'
;




