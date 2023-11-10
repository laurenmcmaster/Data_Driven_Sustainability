-------------------------------------------------------------------------
-----------------------Renewable Energy Table--------------------------

-- creating Renewable_Energy table
CREATE TABLE Renewable_Energy (
    Year INT,
    Country_Region VARCHAR(255),
    Solar_Production DECIMAL(18, 3),
    Wind_Production DECIMAL(18, 3),
    Hydro_Production DECIMAL(18, 3),
    Solar_Percentage DECIMAL(10, 3),
    Wind_Percentage DECIMAL(10, 3),
    Hydro_Percentage DECIMAL(10, 3),
    Total_Percentage DECIMAL(10, 3)
);

-- inserting data into Renewable_Energy
INSERT INTO Renewable_Energy (
    Year,
    Country_Region,
    Solar_Production,
    Wind_Production,
    Hydro_Production,
    Solar_Percentage,
    Wind_Percentage,
    Hydro_Percentage,
    Total_Percentage)
SELECT
    rep.Year,
    rep.Entity AS Country_Region,
    ROUND(rep.Electricity_from_solar_TWh, 3) AS Solar_Production,
    ROUND(rep.Electricity_from_wind_TWh, 3) AS Wind_Production,
    ROUND(rep.Electricity_from_hydro_TWh, 3) AS Hydro_Production,
    ROUND(sse.Solar_percentage, 3) AS Solar_Percentage,
    ROUND(wse.Wind_percentage, 3) AS Wind_Percentage,
    ROUND(hse.Hydro_percentage, 3) AS Hydro_Percentage,
    ROUND(rse.Renewables_percentage, 3) AS Total_Percentage
FROM Renewable_Energy_Project..renewable_energy_production$ AS rep
INNER JOIN Renewable_Energy_Project..renewable_share_electricity$ AS rse ON rep.Year = rse.Year AND rep.Entity = rse.Entity
INNER JOIN Renewable_Energy_Project..solar_share_electricity$ AS sse ON rep.Year = sse.Year AND rep.Entity = sse.Entity
INNER JOIN Renewable_Energy_Project..wind_share_electricity$ AS wse ON rep.Year = wse.Year AND rep.Entity = wse.Entity
INNER JOIN Renewable_Energy_Project..hydro_share_electricity$ AS hse ON rep.Year = hse.Year AND rep.Entity = hse.Entity;


-------------------------------------------------------------------------
-----------------------Environmental Data Table--------------------------

-- creating Environmental_Data table
CREATE TABLE Environmental_Data (
	Year INT,
	Country_Region VARCHAR (255),
	CO2_Levels DECIMAL (18,2),
	NO2_Levels DECIMAL (18,2),
	PM25_Levels DECIMAL (18,2),
	PM10_Levels DECIMAL (18,2)
)

-- inserting data into Environmental_Data
INSERT INTO Environmental_Data (Year, Country_Region, NO2_Levels, PM25_Levels, PM10_Levels, CO2_Levels)
SELECT
    ap.Year,
    ap.Country AS Country_Region,
    AVG(ap.NO2_micro) AS NO2_Levels,
    AVG(ap.PM25_micro) AS PM25_Levels,
    AVG(ap.PM10_micro) AS PM10_Levels,
    em.co2 AS CO2_Levels
FROM Renewable_Energy_Project..Air_Pollution$ AS ap
INNER JOIN Renewable_Energy_Project..Emissions$ AS em ON ap.Year = em.year AND ap.Country = em.country
GROUP BY ap.Year, ap.Country, em.co2;


