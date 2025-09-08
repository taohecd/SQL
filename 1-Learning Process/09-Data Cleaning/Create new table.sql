drop table if exists world_life_expectancy_2;
create table world_life_expectancy as select * from world_life_expectancy_1;
-- insert into world_life_expectancy_1 select * from world_life_expectancy;
