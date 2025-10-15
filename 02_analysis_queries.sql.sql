CREATE TABLE Date (
    Date DATE PRIMARY KEY,
    Day_of_week VARCHAR(20),
    Month VARCHAR(20),
    Year INT,
    Season VARCHAR(20)
);

CREATE TABLE Vehicle (
    Vehicle_ID INT AUTO_INCREMENT PRIMARY KEY,
    Model VARCHAR(100),
    Current_Location VARCHAR(100),
    Distance_travelled DECIMAL(10, 2),
    Battery_Level DECIMAL(5, 2)
);

CREATE TABLE Weather (
    Weather_ID INT AUTO_INCREMENT PRIMARY KEY,
    Conditions VARCHAR(100),
    Humidity DECIMAL(5, 2),
    Visibility DECIMAL(5, 2)
);

CREATE TABLE Injury (
    Injury_ID INT AUTO_INCREMENT PRIMARY KEY,
    Number_of_injuries INT,
    Number_of_victims INT,
    Severity VARCHAR(50),
    Type_of_injury VARCHAR(100)
);

CREATE TABLE Location (
    Location_ID INT AUTO_INCREMENT PRIMARY KEY,
    City VARCHAR(100)
);

CREATE TABLE Incident (
    Incident_ID INT AUTO_INCREMENT PRIMARY KEY,
    Date DATE,
    Vehicle_ID INT,
    Weather_ID INT,
    Injury_ID INT,
    Location_ID INT,
    Incident_type VARCHAR(100),
    Severity VARCHAR(50),
    Number_of_Incidents INT,
    FOREIGN KEY (Date) REFERENCES Date(Date),
    FOREIGN KEY (Vehicle_ID) REFERENCES Vehicle(Vehicle_ID),
    FOREIGN KEY (Weather_ID) REFERENCES Weather(Weather_ID),
    FOREIGN KEY (Injury_ID) REFERENCES Injury(Injury_ID),
    FOREIGN KEY (Location_ID) REFERENCES Location(Location_ID)
);

--INSERT VALUES ON TABLES
INSERT INTO Date (Date, Day_of_week, Month, Year, Season) VALUES
( '2024-01-01', 'Monday', 'January', 2024, 'Winter'),
( '2024-02-15', 'Thursday', 'February', 2024, 'Winter'),
( '2024-03-03', 'Sunday', 'March', 2024, 'Spring'),
( '2024-04-12', 'Friday', 'April', 2024, 'Spring'),
( '2024-05-20', 'Monday', 'May', 2024, 'Spring'),
( '2024-06-10', 'Monday', 'June', 2024, 'Summer'),
( '2024-07-05', 'Friday', 'July', 2024, 'Summer'),
( '2024-08-15', 'Thursday', 'August', 2024, 'Summer'),
( '2024-09-25', 'Wednesday', 'September', 2024, 'Fall'),
( '2024-10-30', 'Wednesday', 'October', 2024, 'Fall');

INSERT INTO Vehicle (Model, Current_Location, Distance_travelled, Battery_Level) VALUES
('Kick Scooter', 'Detroit', 150.0, 85.0),
('Bike', 'Ann Arbor', 300.0, 100.0),
('E-bike', 'Rochester', 500.0, 75.0),
('Kick Scooter', 'Detroit', 200.0, 90.0),
('Bike', 'Rochester', 400.0, 100.0),
('E-bike', 'Ann Arbor', 600.0, 80.0),
('Kick Scooter', 'Detroit', 100.0, 95.0),
('Bike', 'Ann Arbor', 250.0, 100.0),
('E-bike', 'Rochester', 450.0, 70.0),
('Kick Scooter', 'Detroit', 120.0, 85.0);

INSERT INTO Weather (Conditions, Humidity, Visibility) VALUES
('Clear', 50.0, 10.0),
('Rainy', 80.0, 7.0),
('Cloudy', 60.0, 8.0),
('Clear', 55.0, 10.0),
('Thunderstorm', 90.0, 5.0),
('Clear', 45.0, 9.0),
('Foggy', 85.0, 3.0),
('Clear', 70.0, 9.0),
('Snowy', 75.0, 4.0),
('Clear', 60.0, 10.0);

INSERT INTO Injury (Number_of_injuries, Number_of_victims, Severity, Type_of_injury) VALUES
(1, 1, 'Minor', 'Fracture'),
(2, 1, 'Moderate', 'Head injury'),
(1, 1, 'Severe', 'Fracture'),
(1, 1, 'Minor', 'Sprain'),
(3, 2, 'Severe', 'Head injury'),
(1, 1, 'Moderate', 'Bruise'),
(2, 2, 'Moderate', 'Abrasion'),
(1, 1, 'Minor', 'Fracture'),
(1, 1, 'Severe', 'Sprain'),
(2, 1, 'Minor', 'Head injury');

INSERT INTO Location (City) VALUES
('Detroit'),
('Ann Arbor'),
('Rochester'),
('Detroit'),
('Ann Arbor'),
('Rochester'),
('Detroit'),
('Ann Arbor'),
('Rochester'),
('Detroit');

INSERT INTO Incident (Date, Vehicle_ID, Weather_ID, Injury_ID, Location_ID, Incident_type, Severity, Number_of_Incidents) VALUES
('2024-01-01', 1, 1, 1, 1, 'Sidewalk riding', 'Minor', 1),
('2024-02-15', 2, 2, 2, 2, 'Reckless riding', 'Moderate', 1),
('2024-03-03', 3, 3, 3, 3, 'Collision', 'Severe', 2),
('2024-04-12', 4, 4, 4, 4, 'Sidewalk riding', 'Minor', 1),
('2024-05-20', 5, 5, 5, 5, 'Reckless riding', 'Severe', 3),
('2024-06-10', 6, 6, 6, 6, 'Collision', 'Moderate', 2),
('2024-07-05', 7, 7, 7, 7, 'Sidewalk riding', 'Minor', 1),
('2024-08-15', 8, 8, 8, 8, 'Reckless riding', 'Moderate', 1),
('2024-09-25', 9, 9, 9, 9, 'Collision', 'Severe', 2),
('2024-10-30', 10, 10, 10, 10, 'Sidewalk riding', 'Minor', 1);

