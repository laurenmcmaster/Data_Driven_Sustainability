-------------------------------------------------------------------------
-------------------Renewable Energy Trends Analysis----------------------

-- Historical Trends in Renewable Energy Production
-- calculating the total renewable energy production for each source (solar, wind, hydro) for each year
SELECT
    Year,
    SUM(Solar_Production) AS Total_Solar_Production,
    SUM(Wind_Production) AS Total_Wind_Production,
    SUM(Hydro_Production) AS Total_Hydro_Production
FROM Renewable_Energy
GROUP BY Year
ORDER BY Year;

------------------------------------------------------------------------
--------------------Renewable Energy Growth Rates-----------------------

-- calculating the year-over-year growth rates for each renewable source

WITH Growth_Rates AS (
    SELECT
        Year,
        Solar_Production,
        LAG(Solar_Production) OVER (ORDER BY Year) AS Previous_Solar_Production,
        Wind_Production,
        LAG(Wind_Production) OVER (ORDER BY Year) AS Previous_Wind_Production,
        Hydro_Production,
        LAG(Hydro_Production) OVER (ORDER BY Year) AS Previous_Hydro_Production
    FROM Renewable_Energy
)

SELECT
    Year,
    AVG(CAST(
        COALESCE(
            CASE
                WHEN Previous_Solar_Production IS NOT NULL AND Previous_Solar_Production <> 0 THEN
                    ((Solar_Production - Previous_Solar_Production) / Previous_Solar_Production)
                ELSE 0
            END, 0
        ) AS DECIMAL(18, 3)
    )) AS Avg_Solar_Growth_Rate,
    AVG(CAST(
        COALESCE(
            CASE
                WHEN Previous_Wind_Production IS NOT NULL AND Previous_Wind_Production <> 0 THEN
                    ((Wind_Production - Previous_Wind_Production) / Previous_Wind_Production)
                ELSE NULL
            END, 0
        ) AS DECIMAL(18, 3)
    )) AS Avg_Wind_Growth_Rate,
    AVG(CAST(
        COALESCE(
            CASE
                WHEN Previous_Hydro_Production IS NOT NULL AND Previous_Hydro_Production <> 0 THEN
                    ((Hydro_Production - Previous_Hydro_Production) / Previous_Hydro_Production)
                ELSE NULL
            END, 0
        ) AS DECIMAL(18, 3)
    )) AS Avg_Hydro_Growth_Rate
FROM Growth_Rates
GROUP BY Year
ORDER BY Year;

-------------------------------------------------------------------------
--------------------Renewable Energy Mix Analysis -----------------------

-- calculating the average percentage of each source in the total renewable energy production
WITH Renewable_Energy_Percentage AS (
    SELECT
        Year,
        FORMAT(AVG(Solar_Percentage), '0.000') AS Solar_Percentage,
        FORMAT(AVG(Wind_Percentage), '0.000') AS Wind_Percentage,
        FORMAT(AVG(Hydro_Percentage), '0.000') AS Hydro_Percentage
    FROM Renewable_Energy
    GROUP BY Year
) 

SELECT
    Year,
    Solar_Percentage,
    Wind_Percentage,
    Hydro_Percentage
FROM Renewable_Energy_Percentage
ORDER BY Year;

-------------------------------------------------------------------------
-----------------Regional Renewable Energy Comparisons-------------------

SELECT
    Year,
    Country_Region,
    FORMAT(AVG(Solar_Production), '0.000') AS Avg_Solar,
    FORMAT(AVG(Wind_Production), '0.000') AS Avg_Wind,
    FORMAT(AVG(Hydro_Production), '0.000') AS Avg_Hydro
FROM Renewable_Energy
GROUP BY Year, Country_Region
ORDER BY Country_Region;

--------------------------------------------------------------------------
---------------------Environmental Impact Analysis------------------------

--Environmental Pollution Trends

SELECT
	Year,
	Country_Region,
	AVG(CO2_Levels_kt) AS Avg_CO2_Levels
FROM Environmental_Data
GROUP BY Year, Country_Region
ORDER BY Avg_CO2_Levels DESC;






