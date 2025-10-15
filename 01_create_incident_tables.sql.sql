-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Feb 07, 2025 at 08:31 AM
-- Server version: 10.4.32-MariaDB
-- PHP Version: 8.2.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `incidents`
--

-- --------------------------------------------------------

--
-- Table structure for table `date`
--

CREATE TABLE `date` (
  `Date` date NOT NULL,
  `Day_of_week` varchar(20) DEFAULT NULL,
  `Month` varchar(20) DEFAULT NULL,
  `Year` int(11) DEFAULT NULL,
  `Season` varchar(20) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `date`
--

INSERT INTO `date` (`Date`, `Day_of_week`, `Month`, `Year`, `Season`) VALUES
('2024-01-01', 'Monday', 'January', 2024, 'Winter'),
('2024-02-15', 'Thursday', 'February', 2024, 'Winter'),
('2024-03-03', 'Sunday', 'March', 2024, 'Spring'),
('2024-04-12', 'Friday', 'April', 2024, 'Spring'),
('2024-05-20', 'Monday', 'May', 2024, 'Spring'),
('2024-06-10', 'Monday', 'June', 2024, 'Summer'),
('2024-07-05', 'Friday', 'July', 2024, 'Summer'),
('2024-08-15', 'Thursday', 'August', 2024, 'Summer'),
('2024-09-25', 'Wednesday', 'September', 2024, 'Fall'),
('2024-10-30', 'Wednesday', 'October', 2024, 'Fall');

-- --------------------------------------------------------

--
-- Table structure for table `incident`
--

CREATE TABLE `incident` (
  `Incident_ID` int(11) NOT NULL,
  `Date` date DEFAULT NULL,
  `Vehicle_ID` int(11) DEFAULT NULL,
  `Weather_ID` int(11) DEFAULT NULL,
  `Injury_ID` int(11) DEFAULT NULL,
  `Location_ID` int(11) DEFAULT NULL,
  `Incident_type` varchar(100) DEFAULT NULL,
  `Severity` varchar(50) DEFAULT NULL,
  `Number_of_Incidents` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `incident`
--

INSERT INTO `incident` (`Incident_ID`, `Date`, `Vehicle_ID`, `Weather_ID`, `Injury_ID`, `Location_ID`, `Incident_type`, `Severity`, `Number_of_Incidents`) VALUES
(1, '2024-01-01', 1, 1, 1, 1, 'Sidewalk riding', 'Minor', 1),
(2, '2024-02-15', 2, 2, 2, 2, 'Reckless riding', 'Moderate', 1),
(3, '2024-03-03', 3, 3, 3, 3, 'Collision', 'Severe', 2),
(4, '2024-04-12', 4, 4, 4, 4, 'Sidewalk riding', 'Minor', 1),
(5, '2024-05-20', 5, 5, 5, 5, 'Reckless riding', 'Severe', 3),
(6, '2024-06-10', 6, 6, 6, 6, 'Collision', 'Moderate', 2),
(7, '2024-07-05', 7, 7, 7, 7, 'Sidewalk riding', 'Minor', 1),
(8, '2024-08-15', 8, 8, 8, 8, 'Reckless riding', 'Moderate', 1),
(9, '2024-09-25', 9, 9, 9, 9, 'Collision', 'Severe', 2),
(10, '2024-10-30', 10, 10, 10, 10, 'Sidewalk riding', 'Minor', 1);

-- --------------------------------------------------------

--
-- Table structure for table `injury`
--

CREATE TABLE `injury` (
  `Injury_ID` int(11) NOT NULL,
  `Number_of_injuries` int(11) DEFAULT NULL,
  `Number_of_victims` int(11) DEFAULT NULL,
  `Severity` varchar(50) DEFAULT NULL,
  `Type_of_injury` varchar(100) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `injury`
--

INSERT INTO `injury` (`Injury_ID`, `Number_of_injuries`, `Number_of_victims`, `Severity`, `Type_of_injury`) VALUES
(1, 1, 1, 'Minor', 'Fracture'),
(2, 2, 1, 'Moderate', 'Head injury'),
(3, 1, 1, 'Severe', 'Fracture'),
(4, 1, 1, 'Minor', 'Sprain'),
(5, 3, 2, 'Severe', 'Head injury'),
(6, 1, 1, 'Moderate', 'Bruise'),
(7, 2, 2, 'Moderate', 'Abrasion'),
(8, 1, 1, 'Minor', 'Fracture'),
(9, 1, 1, 'Severe', 'Sprain'),
(10, 2, 1, 'Minor', 'Head injury');

-- --------------------------------------------------------

--
-- Table structure for table `location`
--

CREATE TABLE `location` (
  `Location_ID` int(11) NOT NULL,
  `City` varchar(100) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `location`
--

INSERT INTO `location` (`Location_ID`, `City`) VALUES
(1, 'Detroit'),
(2, 'Ann Arbor'),
(3, 'Rochester'),
(4, 'Detroit'),
(5, 'Ann Arbor'),
(6, 'Rochester'),
(7, 'Detroit'),
(8, 'Ann Arbor'),
(9, 'Rochester'),
(10, 'Detroit');

-- --------------------------------------------------------

--
-- Table structure for table `vehicle`
--

CREATE TABLE `vehicle` (
  `Vehicle_ID` int(11) NOT NULL,
  `Model` varchar(100) DEFAULT NULL,
  `Current_Location` varchar(100) DEFAULT NULL,
  `Distance_travelled` decimal(10,2) DEFAULT NULL,
  `Battery_Level` decimal(5,2) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `vehicle`
--

INSERT INTO `vehicle` (`Vehicle_ID`, `Model`, `Current_Location`, `Distance_travelled`, `Battery_Level`) VALUES
(1, 'Kick Scooter', 'Detroit', 150.00, 85.00),
(2, 'Bike', 'Ann Arbor', 300.00, 100.00),
(3, 'E-bike', 'Rochester', 500.00, 75.00),
(4, 'Kick Scooter', 'Detroit', 200.00, 90.00),
(5, 'Bike', 'Rochester', 400.00, 100.00),
(6, 'E-bike', 'Ann Arbor', 600.00, 80.00),
(7, 'Kick Scooter', 'Detroit', 100.00, 95.00),
(8, 'Bike', 'Ann Arbor', 250.00, 100.00),
(9, 'E-bike', 'Rochester', 450.00, 70.00),
(10, 'Kick Scooter', 'Detroit', 120.00, 85.00);

-- --------------------------------------------------------

--
-- Table structure for table `weather`
--

CREATE TABLE `weather` (
  `Weather_ID` int(11) NOT NULL,
  `Conditions` varchar(100) DEFAULT NULL,
  `Humidity` decimal(5,2) DEFAULT NULL,
  `Visibility` decimal(5,2) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `weather`
--

INSERT INTO `weather` (`Weather_ID`, `Conditions`, `Humidity`, `Visibility`) VALUES
(1, 'Clear', 50.00, 10.00),
(2, 'Rainy', 80.00, 7.00),
(3, 'Cloudy', 60.00, 8.00),
(4, 'Clear', 55.00, 10.00),
(5, 'Thunderstorm', 90.00, 5.00),
(6, 'Clear', 45.00, 9.00),
(7, 'Foggy', 85.00, 3.00),
(8, 'Clear', 70.00, 9.00),
(9, 'Snowy', 75.00, 4.00),
(10, 'Clear', 60.00, 10.00);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `date`
--
ALTER TABLE `date`
  ADD PRIMARY KEY (`Date`);

--
-- Indexes for table `incident`
--
ALTER TABLE `incident`
  ADD PRIMARY KEY (`Incident_ID`),
  ADD KEY `Date` (`Date`),
  ADD KEY `Vehicle_ID` (`Vehicle_ID`),
  ADD KEY `Weather_ID` (`Weather_ID`),
  ADD KEY `Injury_ID` (`Injury_ID`),
  ADD KEY `Location_ID` (`Location_ID`);

--
-- Indexes for table `injury`
--
ALTER TABLE `injury`
  ADD PRIMARY KEY (`Injury_ID`);

--
-- Indexes for table `location`
--
ALTER TABLE `location`
  ADD PRIMARY KEY (`Location_ID`);

--
-- Indexes for table `vehicle`
--
ALTER TABLE `vehicle`
  ADD PRIMARY KEY (`Vehicle_ID`);

--
-- Indexes for table `weather`
--
ALTER TABLE `weather`
  ADD PRIMARY KEY (`Weather_ID`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `incident`
--
ALTER TABLE `incident`
  MODIFY `Incident_ID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT for table `injury`
--
ALTER TABLE `injury`
  MODIFY `Injury_ID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT for table `location`
--
ALTER TABLE `location`
  MODIFY `Location_ID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT for table `vehicle`
--
ALTER TABLE `vehicle`
  MODIFY `Vehicle_ID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT for table `weather`
--
ALTER TABLE `weather`
  MODIFY `Weather_ID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `incident`
--
ALTER TABLE `incident`
  ADD CONSTRAINT `incident_ibfk_1` FOREIGN KEY (`Date`) REFERENCES `date` (`Date`),
  ADD CONSTRAINT `incident_ibfk_2` FOREIGN KEY (`Vehicle_ID`) REFERENCES `vehicle` (`Vehicle_ID`),
  ADD CONSTRAINT `incident_ibfk_3` FOREIGN KEY (`Weather_ID`) REFERENCES `weather` (`Weather_ID`),
  ADD CONSTRAINT `incident_ibfk_4` FOREIGN KEY (`Injury_ID`) REFERENCES `injury` (`Injury_ID`),
  ADD CONSTRAINT `incident_ibfk_5` FOREIGN KEY (`Location_ID`) REFERENCES `location` (`Location_ID`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
