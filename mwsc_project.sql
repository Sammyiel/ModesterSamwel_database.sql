-- phpMyAdmin SQL Dump
-- version 5.0.2
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Dec 14, 2020 at 10:26 PM
-- Server version: 10.4.14-MariaDB
-- PHP Version: 7.2.33

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `mwsc_project`
--

-- --------------------------------------------------------

--
-- Table structure for table `bill`
--

CREATE TABLE `bill` (
  `Bill_ID` int(10) NOT NULL,
  `Premise_ID` int(10) NOT NULL,
  `Meter_Number` varchar(25) NOT NULL,
  `Amount_of_money` int(50) NOT NULL,
  `Previous_Reading` int(50) NOT NULL,
  `Current_Reading` int(50) NOT NULL,
  `Payment_due_date` date NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `bill`
--

INSERT INTO `bill` (`Bill_ID`, `Premise_ID`, `Meter_Number`, `Amount_of_money`, `Previous_Reading`, `Current_Reading`, `Payment_due_date`) VALUES
(10000001, 1000001, '100001', 5500, 68, 98, '2021-01-01'),
(20000002, 2000002, '200002', 460, 55, 85, '2021-01-01'),
(30000003, 3000003, '300003', 5500, 68, 107, '2021-01-01'),
(40000004, 4000004, '400004', 460, 55, 85, '2021-01-01'),
(50000005, 5000005, '500005', 5500, 68, 107, '2021-01-01'),
(60000006, 6000006, '600006', 460, 55, 85, '2021-01-01');

-- --------------------------------------------------------

--
-- Table structure for table `charge_structure`
--

CREATE TABLE `charge_structure` (
  `Tarrif_ID` int(10) NOT NULL,
  `Lower_limit` int(10) NOT NULL,
  `Upper_limit` int(10) NOT NULL,
  `Charge` int(10) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `charge_structure`
--

INSERT INTO `charge_structure` (`Tarrif_ID`, `Lower_limit`, `Upper_limit`, `Charge`) VALUES
(1, 200, 5000, 5500),
(1, 200, 5000, 900),
(2, 200, 5000, 5500),
(1, 200, 5000, 1200),
(2, 200, 5000, 4000),
(1, 200, 5000, 1500);

-- --------------------------------------------------------

--
-- Table structure for table `customer`
--

CREATE TABLE `customer` (
  `Customer_ID` int(10) NOT NULL,
  `Customer_Name` text NOT NULL,
  `Telephone_Number` varchar(25) NOT NULL,
  `Physical_Address` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `customer`
--

INSERT INTO `customer` (`Customer_ID`, `Customer_Name`, `Telephone_Number`, `Physical_Address`) VALUES
(111111, 'Modester Mwangi', '0789876272', 'KG1111111'),
(222222, 'Samwel Maisiba', '0761816722', 'KG111111'),
(333333, 'Clinton Hisa', '0789876234', 'KG222222'),
(444444, 'Marthely Kimani', '0765616722', 'KG333333'),
(555555, 'Njoroge DJafro', '0783476272', 'KG555555'),
(666666, 'Celine Adhiambo', '0761816752', 'KG444444');

-- --------------------------------------------------------

--
-- Table structure for table `payment`
--

CREATE TABLE `payment` (
  `Bill_ID` int(10) NOT NULL,
  `Transaction_ID` int(10) NOT NULL,
  `Amount_paid` int(10) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `payment`
--

INSERT INTO `payment` (`Bill_ID`, `Transaction_ID`, `Amount_paid`) VALUES
(10000001, 1111, 890),
(40000004, 2222, 1100),
(30000003, 3333, 2500),
(40000004, 4444, 690),
(50000005, 5555, 670),
(60000006, 6666, 2000);

-- --------------------------------------------------------

--
-- Table structure for table `plants`
--

CREATE TABLE `plants` (
  `Plant_ID` int(10) NOT NULL,
  `Sector_ID` int(10) NOT NULL,
  `Zone_ID` int(10) NOT NULL,
  `Route_ID` int(10) NOT NULL,
  `Plant_Capacity` int(50) NOT NULL,
  `supply_status` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `plants`
--

INSERT INTO `plants` (`Plant_ID`, `Sector_ID`, `Zone_ID`, `Route_ID`, `Plant_Capacity`, `supply_status`) VALUES
(11, 101, 1001, 1234561, 1000000, 'Turned on'),
(22, 202, 3003, 1234562, 50000000, 'Turned on'),
(33, 202, 3003, 1234564, 500000, 'Turned off'),
(44, 404, 4004, 1234563, 1500000, 'Turned on'),
(55, 505, 5005, 1234565, 1000000, 'Turned on'),
(66, 606, 6006, 1234566, 500000, 'Turned off'),
(77, 505, 7007, 1234565, 1000000, 'Turned off');

-- --------------------------------------------------------

--
-- Table structure for table `premise`
--

CREATE TABLE `premise` (
  `Premise_ID` int(10) NOT NULL,
  `Customer_ID` int(10) NOT NULL,
  `Meter_Number` varchar(25) NOT NULL,
  `Tarrif_ID` int(10) NOT NULL,
  `Status` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `premise`
--

INSERT INTO `premise` (`Premise_ID`, `Customer_ID`, `Meter_Number`, `Tarrif_ID`, `Status`) VALUES
(3000003, 111111, '200002', 1, 'Active'),
(2000002, 222222, '100001', 1, 'Active'),
(3000003, 333333, '400004', 1, 'Active'),
(4000004, 444444, '300003', 2, 'Suspended'),
(5000005, 555555, '500005', 2, 'Suspended'),
(6000006, 666666, '600006', 1, 'Active');

-- --------------------------------------------------------

--
-- Table structure for table `route`
--

CREATE TABLE `route` (
  `Route_ID` int(10) NOT NULL,
  `Route_Name` text NOT NULL,
  `Zone_ID` int(10) NOT NULL,
  `Sector_ID` int(10) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `route`
--

INSERT INTO `route` (`Route_ID`, `Route_Name`, `Zone_ID`, `Sector_ID`) VALUES
(1234561, 'Kiabus', 3003, 505),
(1234562, 'Sunek', 4004, 606),
(1234563, 'Jogoo', 1001, 606),
(1234564, 'Mwembe', 1001, 202),
(1234565, 'Kanairo', 7007, 303),
(1234566, 'Jesuu', 4004, 404);

-- --------------------------------------------------------

--
-- Table structure for table `sector`
--

CREATE TABLE `sector` (
  `Sector_ID` int(10) NOT NULL,
  `Sector_Name` varchar(25) NOT NULL,
  `Office_Address` varchar(25) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `sector`
--

INSERT INTO `sector` (`Sector_ID`, `Sector_Name`, `Office_Address`) VALUES
(505, 'Kanombe', 'Office1'),
(606, 'Zuri', 'Office2'),
(101, 'Kacyiru', 'Office3'),
(202, 'Kimironko', 'Office4'),
(303, 'Kisimenti', 'Office5'),
(404, 'Nyarutarama', 'Office6');

-- --------------------------------------------------------

--
-- Table structure for table `staff`
--

CREATE TABLE `staff` (
  `Staff_ID` int(10) NOT NULL,
  `Staff_Name` text NOT NULL,
  `Sector_ID` int(10) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `staff`
--

INSERT INTO `staff` (`Staff_ID`, `Staff_Name`, `Sector_ID`) VALUES
(500000001, 'Bana Mweusi', 505),
(500000002, 'Chamsiku Nuru', 202),
(500000003, 'Mpendwa Sana', 303),
(500000004, 'Hapendi Watu', 404),
(500000005, 'Mpenda Mbese', 202),
(500000006, 'Mbese Tamu', 404);

-- --------------------------------------------------------

--
-- Table structure for table `tarrif`
--

CREATE TABLE `tarrif` (
  `Tarrif_ID` int(10) NOT NULL,
  `Tarrif_Name` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `tarrif`
--

INSERT INTO `tarrif` (`Tarrif_ID`, `Tarrif_Name`) VALUES
(1, 'Domestic'),
(2, 'Commercial');

-- --------------------------------------------------------

--
-- Table structure for table `zones`
--

CREATE TABLE `zones` (
  `Zone_ID` int(10) NOT NULL,
  `Zone_Name` varchar(25) NOT NULL,
  `Sector_ID` int(10) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `zones`
--

INSERT INTO `zones` (`Zone_ID`, `Zone_Name`, `Sector_ID`) VALUES
(1001, 'Wabe1234567', 101),
(4004, 'Wabe1234561', 404),
(3003, 'Wabe1234563', 303),
(4004, 'Wabe1234564', 202),
(5005, 'Wabe1234565', 101),
(6006, 'Wabe1234566', 202);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
