SELECT * FROM world_life_expectancy;


select Row_ID
from (
SELECT Row_ID, Country, Year
, concat(Country, Year)
, row_number() over(partition by concat(Country, Year)) as row_num
FROM world_life_expectancy
) as table_1
where row_num > 1
;

delete from world_life_expectancy
where Row_ID in (
select Row_ID
from (
SELECT Row_ID, Country, Year
, concat(Country, Year)
, row_number() over(partition by concat(Country, Year)) as row_num
FROM world_life_expectancy
) as table_1
where row_num > 1
);

select distinct Status
from world_life_expectancy;

select Country, Year, Status
from world_life_expectancy 
where Status = ''
;

select t1.Country, t1.Year, t1.Status, t2.Status
from world_life_expectancy as t1
join world_life_expectancy as t2
on t1.Country = t2.Country
where t1.Status = ''
and t2.Status <> ''
;

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
-- and t2.Status <> '' 
and t2.Status = 'Developed' 
;


select t1.Country, t1.Year, t1.`Life expectancy`, t2.`Life expectancy`, t3.`Life expectancy`, (t2.`Life expectancy`+t3.`Life expectancy`)/2
from world_life_expectancy as t1
join world_life_expectancy as t2
on t1.Country = t2.Country 
and t1.Year = t2.Year-1
join world_life_expectancy as t3
on t1.Country = t3.Country 
and t1.Year = t3.Year+1
where t1.`Life expectancy` = ''
;

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


