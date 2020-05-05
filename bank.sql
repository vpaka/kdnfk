-- phpMyAdmin SQL Dump
-- version 4.8.5
-- https://www.phpmyadmin.net/
--
-- Host: localhost
-- Generation Time: May 27, 2019 at 07:37 AM
-- Server version: 10.1.39-MariaDB
-- PHP Version: 7.1.29

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `bank`
--

-- --------------------------------------------------------

--
-- Table structure for table `Account`
--

CREATE TABLE `Account` (
  `AccountNumber` int(11) NOT NULL,
  `AccountType` enum('savings','credit','cheque','') NOT NULL DEFAULT 'savings',
  `CustomerID` int(11) NOT NULL,
  `Balance` float NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `Account`
--

INSERT INTO `Account` (`AccountNumber`, `AccountType`, `CustomerID`, `Balance`) VALUES
(132005, 'savings', 120080, 0),
(132006, 'savings', 120081, 4000),
(132007, 'savings', 120083, 2000);

-- --------------------------------------------------------

--
-- Table structure for table `customer`
--

CREATE TABLE `customer` (
  `CustomerID` int(10) NOT NULL,
  `CustomerName` text NOT NULL,
  `UserID` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `customer`
--

INSERT INTO `customer` (`CustomerID`, `CustomerName`, `UserID`) VALUES
(120080, '', 12397),
(120081, 'srujal', 12398),
(120083, 'Siva', 12400);

-- --------------------------------------------------------

--
-- Table structure for table `Transactions`
--

CREATE TABLE `Transactions` (
  `TransactionNumber` int(11) NOT NULL,
  `TransactionType` enum('Deposit','Withdraw','Transfer','') NOT NULL,
  `TransactionAmount` float NOT NULL,
  `Description` text NOT NULL,
  `AccountNumber` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `Transactions`
--

INSERT INTO `Transactions` (`TransactionNumber`, `TransactionType`, `TransactionAmount`, `Description`, `AccountNumber`) VALUES
(1011, 'Deposit', 10000, 'Deposited to', 132006),
(1012, 'Withdraw', 2000, 'Withdraw from', 132006),
(1014, 'Transfer', 2000, 'Transfered from', 132006),
(1015, 'Transfer', 2000, 'Transfered from', 132006),
(1016, 'Deposit', 4000, 'Deposited to', 132007),
(1017, 'Withdraw', 1000, 'Withdraw from', 132007),
(1018, 'Transfer', 1000, 'Transfered from', 132007);

-- --------------------------------------------------------

--
-- Table structure for table `Users`
--

CREATE TABLE `Users` (
  `UserID` int(10) NOT NULL,
  `UserType` enum('admin','customer','teller','') NOT NULL DEFAULT 'customer',
  `UserName` varchar(10) NOT NULL,
  `Password` varchar(10) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `Users`
--

INSERT INTO `Users` (`UserID`, `UserType`, `UserName`, `Password`) VALUES
(12345, 'admin', 'vamshi', '123456'),
(12397, '', '', ''),
(12398, 'customer', 'srujal', '123'),
(12400, 'customer', 'Siva', '123');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `Account`
--
ALTER TABLE `Account`
  ADD PRIMARY KEY (`AccountNumber`,`CustomerID`),
  ADD UNIQUE KEY `CustomerID` (`CustomerID`);

--
-- Indexes for table `customer`
--
ALTER TABLE `customer`
  ADD PRIMARY KEY (`CustomerID`),
  ADD UNIQUE KEY `UserID_2` (`UserID`),
  ADD KEY `UserID` (`UserID`);

--
-- Indexes for table `Transactions`
--
ALTER TABLE `Transactions`
  ADD PRIMARY KEY (`TransactionNumber`),
  ADD KEY `AccountNumber` (`AccountNumber`),
  ADD KEY `TransactionNumber` (`TransactionNumber`),
  ADD KEY `TransactionNumber_2` (`TransactionNumber`);

--
-- Indexes for table `Users`
--
ALTER TABLE `Users`
  ADD PRIMARY KEY (`UserID`),
  ADD UNIQUE KEY `UserName` (`UserName`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `Account`
--
ALTER TABLE `Account`
  MODIFY `AccountNumber` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=132008;

--
-- AUTO_INCREMENT for table `customer`
--
ALTER TABLE `customer`
  MODIFY `CustomerID` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=120085;

--
-- AUTO_INCREMENT for table `Transactions`
--
ALTER TABLE `Transactions`
  MODIFY `TransactionNumber` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=1019;

--
-- AUTO_INCREMENT for table `Users`
--
ALTER TABLE `Users`
  MODIFY `UserID` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12402;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `Account`
--
ALTER TABLE `Account`
  ADD CONSTRAINT `account_ibfk_1` FOREIGN KEY (`CustomerID`) REFERENCES `customer` (`CustomerID`);

--
-- Constraints for table `customer`
--
ALTER TABLE `customer`
  ADD CONSTRAINT `customer_ibfk_1` FOREIGN KEY (`UserID`) REFERENCES `Users` (`UserID`);

--
-- Constraints for table `Transactions`
--
ALTER TABLE `Transactions`
  ADD CONSTRAINT `transactions_ibfk_1` FOREIGN KEY (`AccountNumber`) REFERENCES `Account` (`AccountNumber`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
