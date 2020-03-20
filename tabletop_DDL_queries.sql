-- phpMyAdmin SQL Dump
-- version 4.9.2
-- https://www.phpmyadmin.net/
--
-- Host: classmysql.engr.oregonstate.edu:3306
-- Generation Time: Feb 24, 2020 at 08:34 PM
-- Server version: 10.4.11-MariaDB-log
-- PHP Version: 7.0.33

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `cs340_kellehec`
--

-- --------------------------------------------------------

--
-- Table structure for table `Boardgames`
--

DROP TABLE IF EXISTS `Boardgames`;
CREATE TABLE `Boardgames` (
  `boardgameID` int(11) NOT NULL,
  `boardgameName` varchar(255) NOT NULL,
  `designerFirstName` varchar(31) NOT NULL,
  `designerLastName` varchar(31) NOT NULL,
  `publisherName` varchar(21) NOT NULL,
  `rating` int(11) DEFAULT NULL,
  `releaseDate` date DEFAULT NULL,
  `genre` varchar(255) DEFAULT NULL,
  `description` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `Boardgames`
--

INSERT INTO `Boardgames` (`boardgameID`, `boardgameName`, `designerFirstName`, `designerLastName`, `publisherName`, `rating`, `releaseDate`, `genre`, `description`) VALUES
(1, 'Azul', 'Emmnaul', 'Price', 'CoolGames', 8, '2020-03-25', 'Family', 'A silly game for the whole family'),
(2, 'Pandemic', 'Matt', 'Leacock', 'Zman Games', 7, '2019-07-15', 'Medical', 'In Pandemic, several virulent diseases have broken out simultaneously all over the world! The players are disease-fighting specialists whose mission is to treat disease hotspots while researching cures for each of four plagues before they get out of hand.'),
(3, 'Gloomhaven', 'Isaac', 'Childres', 'Cephalofair Games', 9, '2020-03-06', 'Strategy', 'Gloomhaven is a game of Euro-inspired tactical combat in a persistent world of shifting motives. Players will take on the role of a wandering adventurer with their own special set of skills and their own reasons for traveling to this dark corner of the wo');


-- --------------------------------------------------------

--
-- Table structure for table `PrimaryDesigners`
--

DROP TABLE IF EXISTS `PrimaryDesigners`;
CREATE TABLE `PrimaryDesigners` (
  `designerID` int(11) NOT NULL,
  `designerFirstName` varchar(255) NOT NULL,
  `designerLastName` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `PrimaryDesigners`
--

INSERT INTO `PrimaryDesigners` (`designerID`, `designerFirstName`, `designerLastName`) VALUES
(1, 'Philippe', 'Guérin'),
(2, 'Chris', 'Quilliams');

-- --------------------------------------------------------

--
-- Table structure for table `PrimaryPublishers`
--

DROP TABLE IF EXISTS `PrimaryPublishers`;
CREATE TABLE `PrimaryPublishers` (
  `publisherID` int(11) NOT NULL,
  `publisherName` varchar(255) NOT NULL,
  `gamesPublished` int(11) DEFAULT NULL,
  `yearEstablished` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `PrimaryPublishers`
--

INSERT INTO `PrimaryPublishers` (`publisherID`, `publisherName`, `gamesPublished`, `yearEstablished`) VALUES
(1, 'Plan B Games', 15, 2016);

-- --------------------------------------------------------

--
-- Table structure for table `Users`
--

#DROP TABLE IF EXISTS `Users`;
#CREATE TABLE `Users` (
#  `userID` int(11) NOT NULL,
#  `userFirstName` varchar(255) NOT NULL,
#  `userLastName` varchar(255) NOT NULL,
#  `email` varchar(255) NOT NULL
#) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `Users`
--

#INSERT INTO `Users` (`userID`, `userFirstName`, `userLastName`, `email`) VALUES
#(1, 'Craig', 'Kelleher', 'kellehec@oregonstate.edu'),
#(3, 'Patrick', 'Oh', 'ohp@oregonstate.edu'),
#(4, 'Novia', 'Dela Rosa', 'delarosanovia@gmail.com');

-- --------------------------------------------------------

--
-- Table structure for table `UsersBoardgames`
--

#DROP TABLE IF EXISTS `UsersBoardgames`;
#CREATE TABLE `UsersBoardgames` (
#  `userID` int(11) NOT NULL,
#  `boardgameID` int(11) NOT NULL
#) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `UsersBoardgames`
--

#INSERT INTO `UsersBoardgames` (`userID`, `boardgameID`) VALUES
#(1, 1);

-- Table structure for table `UsersBoardgames`
--

DROP TABLE IF EXISTS `PrimaryPublishersPrimaryDesigners`;
CREATE TABLE `PrimaryPublishersPrimaryDesigners` (
  `publisherID` int(11) NOT NULL DEFAULT '0',
  `designerID` int(11) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- Dumping data for table `UsersBoardgames`
--

INSERT INTO `PrimaryPublishersPrimaryDesigners` (`publisherID`, `designerID`) VALUES
(1, 1);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `Boardgames`
--
ALTER TABLE `Boardgames`
  ADD PRIMARY KEY (`boardgameID`);

--
-- Indexes for table `PrimaryDesigners`
--
ALTER TABLE `PrimaryDesigners`
  ADD PRIMARY KEY (`designerID`);

--
-- Indexes for table `PrimaryPublishers`
--
ALTER TABLE `PrimaryPublishers`
  ADD PRIMARY KEY (`publisherID`);

#ALTER TABLE `PrimaryPublishersPrimaryDesigners`
#  ADD PRIMARY KEY (`publisherID`,`designerID`);

--
-- Indexes for table `Users`
--
#ALTER TABLE `Users`
#  ADD PRIMARY KEY (`userID`);

--
-- Indexes for table `UsersBoardgames`
--
#ALTER TABLE `UsersBoardgames`
#  ADD PRIMARY KEY (`userID`,`boardgameID`),
#  ADD KEY `boardgameID` (`boardgameID`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `Boardgames`
--
ALTER TABLE `Boardgames`
  MODIFY `boardgameID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `PrimaryDesigners`
--
ALTER TABLE `PrimaryDesigners`
  MODIFY `designerID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `PrimaryPublishers`
--
ALTER TABLE `PrimaryPublishers`
  MODIFY `publisherID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `Users`
--
#ALTER TABLE `Users`
#  MODIFY `userID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `Boardgames`
--
#ALTER TABLE `Boardgames`
#  ADD CONSTRAINT `Boardgames_ibfk_1` FOREIGN KEY (`designerID`) REFERENCES `PrimaryDesigners` (`designerID`),
#  ADD CONSTRAINT `Boardgames_ibfk_2` FOREIGN KEY (`publisherID`) REFERENCES `PrimaryPublishers` (`publisherID`);


#ALTER TABLE 'PrimaryPublishersPrimaryDesigners'
#  ADD CONSTRAINT `PrimaryPublishersPrimaryDesigners_ibfk_1` FOREIGN KEY (`designerID`) REFERENCES `PrimaryDesigners` (`designerID`),
#  ADD CONSTRAINT `PrimaryPublishersPrimaryDesigners_ibfk_2` FOREIGN KEY (`publisherID`) REFERENCES `PrimaryPublishers` (`publisherID`),
#COMMIT;
-- Constraints for table `UsersBoardgames`
--
#ALTER TABLE `UsersBoardgames`
#  ADD CONSTRAINT `UsersBoardgames_ibfk_1` FOREIGN KEY (`userID`) REFERENCES `Users` (`userID`),
#  ADD CONSTRAINT `UsersBoardgames_ibfk_3` FOREIGN KEY (`boardgameID`) REFERENCES `Boardgames` (`boardgameID`) ON DELETE CASCADE;
#COMMIT;





/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
