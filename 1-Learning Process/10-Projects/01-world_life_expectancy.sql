SELECT * FROM  world_life_expectancy;

SELECT Country, Year
, concat(Country,Year) 
, count(concat(Country,Year))
FROM  world_life_expectancy
group by Country, Year
having count(concat(Country,Year)) > 1
;

select Row_ID
from 
(
SELECT Row_ID
, concat(Country,Year)
, row_number() over(partition by concat(Country,Year)) as row_num
FROM  world_life_expectancy
) as table_1
where row_num > 1
;

-- Remove Duplicate
delete from world_life_expectancy
where Row_ID in (
select Row_ID
from 
(
SELECT Row_ID
, concat(Country,Year)
, row_number() over(partition by concat(Country,Year)) as row_num
FROM  world_life_expectancy
) as table_1
where row_num > 1
);


SELECT Country, Year, Status
FROM  world_life_expectancy 
where Status = ''
;


update world_life_expectancy
set Status =  'Developing'
where Country in (
select distinct (Country)
from world_life_expectancy
where Status = 'Developing'
)
;

update world_life_expectancy
set Status = ''
where Country = 'Albania' and Year = 2021 
;

-- Complete the blank
update world_life_expectancy as t1
join world_life_expectancy as t2
on t1.Country = t2.Country
set t1.Status = 'Developing'
where t1.Status = ''
and t2.Status <> ''
and t2.Status = 'Developing'
;

update world_life_expectancy as t1
join world_life_expectancy as t2
on t1.Country = t2.Country
set t1.Status = 'Developed'
where t1.Status = ''
and t2.Status <> ''
and t2.Status = 'Developed'
;

Select t1.Country, t1.Year, t1.`Life expectancy`
, t2.Country, t2.Year, t2.`Life expectancy`
, t3.Country, t3.Year, t3.`Life expectancy`
, round((t2.`Life expectancy`+t3.`Life expectancy`)/2,1)
from world_life_expectancy as t1
join world_life_expectancy as t2
on t1.Country = t2.Country
and t1.Year = t2.Year-1
join world_life_expectancy as t3
on t1.Country = t3.Country
and t1.Year = t3.Year+1
where t1.`Life expectancy` = ''
;

-- populate according to the related
update world_life_expectancy as t1
join world_life_expectancy as t2
on t1.Country = t2.Country
and t1.Year = t2.Year-1
join world_life_expectancy as t3
on t1.Country = t3.Country
and t1.Year = t3.Year+1
set t1.`Life expectancy` = round((t2.`Life expectancy`+t3.`Life expectancy`)/2,1)
where t1.`Life expectancy` = ''
;




