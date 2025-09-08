-- DROP TABLE IF EXISTS world_life_expectancy;
-- CREATE TABLE world_life_expectancy AS SELECT * FROM world_life_expectancy_backup;

SELECT * FROM world_life_expectancy;

SELECT Country, concat(Country, Year), Country_Year
from (
SELECT Country,  Year, concat(Country, Year), count(concat(Country, Year)) AS Country_Year
FROM world_life_expectancy
GROUP BY Country, Year
) as table_1
where Country_Year > 1
;

SELECT * 
FROM world_life_expectancy
WHERE Country = 'Ireland'
;