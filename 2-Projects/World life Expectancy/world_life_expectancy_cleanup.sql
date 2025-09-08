SELECT Country, Year, COUNT(*) as count
FROM World_Life_Expectancy
GROUP BY Country, Year
HAVING COUNT(*) > 1;

SELECT *
FROM World_Life_Expectancy
WHERE (Country, Year) IN (
    SELECT Country, Year
    FROM World_Life_Expectancy
    GROUP BY Country, Year
    HAVING COUNT(*) > 1
)
ORDER BY Country, Year;