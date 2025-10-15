-- Retrieve all incidents, including the date, vehicle model, weather conditions, injury severity, and location
-- This query shows a comprehensive view of incidents, joining multiple tables to display all relevant information about each incident.
-- It allows us to analyze incidents in relation to vehicles, weather conditions, injuries, and locations.

SELECT 
    Incident.Incident_ID,
    Incident.Incident_type,
    Date.Date AS Incident_Date,
    Vehicle.Model AS Vehicle_Model,
    Weather.Conditions AS Weather_Condition,
    Injury.Severity AS Injury_Severity,
    Location.City AS Location
FROM Incident
INNER JOIN Date ON Incident.Date = Date.Date
INNER JOIN Vehicle ON Incident.Vehicle_ID = Vehicle.Vehicle_ID
INNER JOIN Weather ON Incident.Weather_ID = Weather.Weather_ID
INNER JOIN Injury ON Incident.Injury_ID = Injury.Injury_ID
INNER JOIN Location ON Incident.Location_ID = Location.Location_ID;

-- Retrieve incidents that occurred during "Rainy" weather conditions
-- This query demonstrates how to filter incidents based on a specific weather condition (e.g., "Rainy").
-- This can help assess whether certain weather conditions are associated with more incidents, providing insights for safety recommendations.

SELECT 
    Incident.Incident_ID,
    Incident.Incident_type,
    Date.Date AS Incident_Date,
    Vehicle.Model AS Vehicle_Model,
    Injury.Severity AS Injury_Severity,
    Location.City AS Location
FROM Incident
INNER JOIN Date ON Incident.Date = Date.Date
INNER JOIN Vehicle ON Incident.Vehicle_ID = Vehicle.Vehicle_ID
INNER JOIN Weather ON Incident.Weather_ID = Weather.Weather_ID
INNER JOIN Injury ON Incident.Injury_ID = Injury.Injury_ID
INNER JOIN Location ON Incident.Location_ID = Location.Location_ID
WHERE Weather.Conditions = 'Rainy';

-- Retrieve the number of incidents in each location (city), and sort by the most incident prone locations
-- This query demonstrates how to aggregate incident data by location, allowing us to compare the frequency of incidents across different cities.
-- The result can help identify which locations might need more safety measures or attention.

SELECT 
    Location.City,
    COUNT(Incident.Incident_ID) AS Incident_Count
FROM Incident
INNER JOIN Location ON Incident.Location_ID = Location.Location_ID
GROUP BY Location.City
ORDER BY Incident_Count DESC;

-- Retrieve incidents where the injury severity is "Severe"
-- This query filters the incidents to show only those where the injury severity is classified as "Severe."
-- This can help identify the most serious incidents, which are typically of higher concern and could inform safety improvements.

SELECT 
    Incident.Incident_ID,
    Incident.Incident_type,
    Date.Date AS Incident_Date,
    Vehicle.Model AS Vehicle_Model,
    Weather.Conditions AS Weather_Condition,
    Location.City AS Location
FROM Incident
INNER JOIN Date ON Incident.Date = Date.Date
INNER JOIN Vehicle ON Incident.Vehicle_ID = Vehicle.Vehicle_ID
INNER JOIN Weather ON Incident.Weather_ID = Weather.Weather_ID
INNER JOIN Injury ON Incident.Injury_ID = Injury.Injury_ID
INNER JOIN Location ON Incident.Location_ID = Location.Location_ID
WHERE Injury.Severity = 'Severe';

-- Retrieve the average battery level of vehicles involved in incidents
-- This query demonstrates how to aggregate the battery level of vehicles involved in incidents to determine whether there is any correlation between battery levels and incidents.
-- Analyzing this could help determine if low battery levels play a role in incidents.

SELECT 
    AVG(Vehicle.Battery_Level) AS Average_Battery_Level
FROM Incident
INNER JOIN Vehicle ON Incident.Vehicle_ID = Vehicle.Vehicle_ID;

-- Retrieve the top 5 most frequent incident types
-- This query aggregates incidents by type and sorts them by frequency, allowing us to identify which types of incidents occur most often.
-- This analysis helps in pinpointing areas for intervention, such as specific safety measures for common incident types.

SELECT 
    Incident.Incident_type,
    COUNT(Incident.Incident_ID) AS Incident_Count
FROM Incident
GROUP BY Incident.Incident_type
ORDER BY Incident_Count DESC
LIMIT 5;

