-- phpMyAdmin SQL Dump
-- version 4.8.5
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: May 22, 2019 at 04:41 PM
-- Server version: 10.1.38-MariaDB
-- PHP Version: 7.3.2

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `online_trading`
--

-- --------------------------------------------------------

--
-- Table structure for table `bank_account`
--

CREATE TABLE `bank_account` (
  `Bank_Account_Number` int(10) NOT NULL,
  `Bank_Account_Name` varchar(30) NOT NULL,
  `Trader_Personal_ID` varchar(13) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `bank_account`
--

INSERT INTO `bank_account` (`Bank_Account_Number`, `Bank_Account_Name`, `Trader_Personal_ID`) VALUES
(0, 'sss', '555'),
(1, 'p', '123456'),
(222, '222', '123'),
(333, 'ku', '33232'),
(1234, 'KBank', '1104000012345'),
(21313, 'asd', '1445522'),
(77577, 'www', '12545'),
(645454, 'admin', '232323'),
(12345680, 'ww', '26262622'),
(12345681, 'www', '234'),
(21231231, 'zdca', '432324'),
(21313231, 'asddasdasdsa', '33333333333');

-- --------------------------------------------------------

--
-- Table structure for table `broker`
--

CREATE TABLE `broker` (
  `Broker_Symbol` varchar(5) NOT NULL,
  `Broker_Name` varchar(30) NOT NULL,
  `Broker_Address` varchar(50) NOT NULL,
  `Broker_Email` varchar(30) NOT NULL,
  `Broker_Phone` varchar(10) NOT NULL,
  `Broker_Commission` float NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `broker`
--

INSERT INTO `broker` (`Broker_Symbol`, `Broker_Name`, `Broker_Address`, `Broker_Email`, `Broker_Phone`, `Broker_Commission`) VALUES
('AEC', 'aaaaaaaaaaaaaa', 'aaaaaaaaaaaa', 'aaaaaaaaa', '11', 212.12),
('AIRA', 'บริษัทหลักทรัพย์ ไอร่า จำกัด (', 'asdcasd', 'asas', '3243', 23),
('ASL', 'บริษัทหลักทรัพย์ เอเอสแอล จำกั', 'asdad', '12', '12', 12),
('KSS', 'asd', '221', 'qweq', '213', 12),
('MBKET', 'nnn', '22', '21', '21', 12);

-- --------------------------------------------------------

--
-- Stand-in structure for view `close_price`
-- (See below for the actual view)
--
CREATE TABLE `close_price` (
`date` date
,`time` time(6)
,`Match_ID` int(6)
,`stock_symbol` varchar(6)
,`close_price` float
,`Match_Volume` int(10)
);

-- --------------------------------------------------------

--
-- Table structure for table `company`
--

CREATE TABLE `company` (
  `Company_Name (PK)` varchar(30) NOT NULL,
  `Company_Owner_Name` varchar(30) NOT NULL,
  `Company_Address` varchar(50) NOT NULL,
  `Company_Phone` int(10) NOT NULL,
  `Company_Industry_group` varchar(30) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `company`
--

INSERT INTO `company` (`Company_Name (PK)`, `Company_Owner_Name`, `Company_Address`, `Company_Phone`, `Company_Industry_group`) VALUES
('ROOM429', 'PONG', 'asdasd', 213123, 'adasdsd');

-- --------------------------------------------------------

--
-- Table structure for table `match_data`
--

CREATE TABLE `match_data` (
  `Match_ID` int(6) NOT NULL,
  `Match_Volume` int(10) NOT NULL,
  `Match_Time` timestamp(6) NOT NULL DEFAULT CURRENT_TIMESTAMP(6) ON UPDATE CURRENT_TIMESTAMP(6)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `match_data`
--

INSERT INTO `match_data` (`Match_ID`, `Match_Volume`, `Match_Time`) VALUES
(1, 100, '2019-05-22 06:14:33.250031'),
(2, 100, '2019-05-22 08:52:10.094423'),
(3, 100, '2019-05-22 10:26:22.000000'),
(4, 100, '2019-05-21 06:15:36.000000'),
(5, 100, '2019-05-21 08:26:27.000000');

-- --------------------------------------------------------

--
-- Table structure for table `match_order`
--

CREATE TABLE `match_order` (
  `Order_No` int(8) NOT NULL,
  `Match_ID` int(6) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `match_order`
--

INSERT INTO `match_order` (`Order_No`, `Match_ID`) VALUES
(116975, 2),
(209977, 1),
(305360, 4),
(406028, 5),
(415833, 3),
(464316, 4),
(715483, 2),
(764989, 3),
(848956, 1),
(887290, 5);

-- --------------------------------------------------------

--
-- Table structure for table `stock_market`
--

CREATE TABLE `stock_market` (
  `Market_Type` varchar(6) NOT NULL,
  `Timestamp` timestamp(6) NOT NULL DEFAULT CURRENT_TIMESTAMP(6) ON UPDATE CURRENT_TIMESTAMP(6)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `stock_market`
--

INSERT INTO `stock_market` (`Market_Type`, `Timestamp`) VALUES
('SET', '0000-00-00 00:00:00.000000');

-- --------------------------------------------------------

--
-- Table structure for table `stock_order`
--

CREATE TABLE `stock_order` (
  `Order_No` int(8) NOT NULL,
  `Order_Time` timestamp(6) NOT NULL DEFAULT CURRENT_TIMESTAMP(6) ON UPDATE CURRENT_TIMESTAMP(6),
  `Order_Status` varchar(5) NOT NULL,
  `Order_Price` float NOT NULL,
  `Order_Type` varchar(5) NOT NULL,
  `Order_Volume` int(10) NOT NULL,
  `Stock_Symbol` varchar(6) NOT NULL,
  `Account_ID` int(6) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `stock_order`
--

INSERT INTO `stock_order` (`Order_No`, `Order_Time`, `Order_Status`, `Order_Price`, `Order_Type`, `Order_Volume`, `Stock_Symbol`, `Account_ID`) VALUES
(111513, '2019-05-01 18:25:24.694292', 'Q', 23, 'Sell', 2, 'AIS', 417438),
(116975, '2019-05-22 09:30:08.864039', 'Q', 55, 'Sell', 100, 'AIS', 379793),
(209977, '2019-05-22 09:01:26.241468', 'Q', 50, 'Sell', 100, 'AIS', 379793),
(280311, '2019-05-01 19:05:38.078299', 'Q', 123, 'Buy', 123, 'FUCK', 417438),
(286134, '2019-05-12 15:23:47.028485', 'Q', 3434, 'Buy', 123, 'AIS', 417438),
(305360, '2019-05-22 11:34:09.039991', 'Q', 40, 'Buy', 100, 'AIS', 317828),
(341451, '2019-05-02 08:51:55.652202', 'Q', 100, 'Buy', 2000, 'AIS', 427540),
(406028, '2019-05-22 12:00:58.583381', 'Q', 43, 'Buy', 100, 'AIS', 317828),
(415833, '2019-05-22 09:30:28.590707', 'Q', 45, 'Sell', 100, 'AIS', 379793),
(464316, '2019-05-22 11:34:28.355931', 'Q', 40, 'Sell', 100, 'AIS', 379793),
(510144, '2019-05-01 18:35:03.532743', 'Q', 122, 'Sell', 31, 'AIS', 417438),
(520679, '2019-05-12 15:23:12.857586', 'Q', 122, 'Buy', 12, 'AIS', 317828),
(625162, '2019-05-11 10:45:50.869695', 'Q', 232, 'Buy', 2321, 'FUCK', 317828),
(680443, '2019-05-01 18:43:34.319504', 'Q', 123, 'Sell', 22, 'TRUE', 417438),
(715483, '2019-05-22 09:29:26.215495', 'Q', 55, 'Buy', 100, 'AIS', 317828),
(764989, '2019-05-22 09:29:36.376099', 'Q', 45, 'Buy', 100, 'AIS', 317828),
(848956, '2019-05-22 09:00:57.818472', 'Q', 50, 'Buy', 100, 'AIS', 317828),
(887290, '2019-05-22 12:01:10.419927', 'Q', 43, 'Sell', 100, 'AIS', 379793),
(982763, '2019-05-02 08:53:35.513118', 'Q', 555, 'Sell', 45, 'TRUE', 427540),
(1096785, '2019-05-06 17:30:40.951091', 'Q', 342, 'Sell', 123, 'FUCK', 417438);

-- --------------------------------------------------------

--
-- Table structure for table `stock_symbol`
--

CREATE TABLE `stock_symbol` (
  `Stock_Symbol` varchar(6) NOT NULL,
  `Timestamp` timestamp(6) NOT NULL DEFAULT CURRENT_TIMESTAMP(6) ON UPDATE CURRENT_TIMESTAMP(6),
  `Stock_last` float NOT NULL,
  `Market_Type` varchar(6) NOT NULL,
  `Company_Name` varchar(30) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `stock_symbol`
--

INSERT INTO `stock_symbol` (`Stock_Symbol`, `Timestamp`, `Stock_last`, `Market_Type`, `Company_Name`) VALUES
('AIS', '0000-00-00 00:00:00.000000', 21.12, 'SET', 'ROOM429'),
('FUCK', '2019-04-30 17:00:00.000000', 43, 'SET', 'ROOM429'),
('TRUE', '2019-04-27 17:00:00.000000', 56.21, 'SET', 'ROOM429');

-- --------------------------------------------------------

--
-- Table structure for table `trader_account`
--

CREATE TABLE `trader_account` (
  `Account_ID` int(6) NOT NULL,
  `PIN` int(6) NOT NULL,
  `Account_Balance` float NOT NULL,
  `Account_Type` varchar(30) NOT NULL,
  `Trader_Personal_ID` varchar(13) NOT NULL,
  `Broker_Symbol` varchar(5) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `trader_account`
--

INSERT INTO `trader_account` (`Account_ID`, `PIN`, `Account_Balance`, `Account_Type`, `Trader_Personal_ID`, `Broker_Symbol`) VALUES
(226935, 111, 500000, 'Cash_Balance', '26262622', 'ASL'),
(268406, 554, 51677, 'Cash_Balance', '12545', 'AIRA'),
(317828, 561, 46176, 'Cash_Balance', '123456', 'AIRA'),
(379793, 111, 0, 'Cash_Balance', '123456', 'KSS'),
(381824, 222, 283.5, 'Cash_Balance', '26262622', 'MBKET'),
(417438, 121, 5110, 'Credit_Balance', '123456', 'KSS'),
(427540, 1234, 52222, 'Cash_Balance', '1104000012345', 'AEC'),
(438042, 2345, 876, 'Cash_Balance', '26262622', 'ASL'),
(531050, 111, 5123, 'Cash_Balance', '33333333333', 'ASL'),
(562964, 111, 40000000000, 'Cash_Balance', '26262622', 'ASL'),
(580429, 556, 60000000, 'Cash_Account', '123456', 'AIRA'),
(583928, 234, 12121, 'Cash_Balance', '26262622', 'ASL'),
(611388, 123, 15452, 'Credit_Balance', '123456', 'ASL');

-- --------------------------------------------------------

--
-- Table structure for table `trader_data`
--

CREATE TABLE `trader_data` (
  `Trader_Personal_ID` varchar(13) NOT NULL,
  `Username` varchar(15) NOT NULL,
  `Password` varchar(15) NOT NULL,
  `Trader_Fname` varchar(30) NOT NULL,
  `Trader_Lname` varchar(30) NOT NULL,
  `Trader_Age` int(3) NOT NULL,
  `Trader_Address` varchar(50) NOT NULL,
  `Trader_Email` varchar(30) NOT NULL,
  `Trader_Phone` varchar(10) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `trader_data`
--

INSERT INTO `trader_data` (`Trader_Personal_ID`, `Username`, `Password`, `Trader_Fname`, `Trader_Lname`, `Trader_Age`, `Trader_Address`, `Trader_Email`, `Trader_Phone`) VALUES
('1104000012345', 'testuser', 'password', 'testuser', 'testuser', 20, 'test address', 'test@mail.com', '081-111-11'),
('123', 'sc', '222', '22', '222', 22, 'as', 'as_sippanon@hotmail.com', '213123'),
('123456', 'p', 'p', 'p', 'p', 26, 'p', 'p@p.com', 'p'),
('12545', 'n', 'n', 'n', 'nn', 77, 'as', 'nabnoteac131@hotmail.com', '213123'),
('1445522', 'pop', 'wwqe', 'Sippanon', 'Utakruda', 20, 'as', 'as_sippanon@hotmail.com', '213123'),
('21111', 'asd', '222', '22', 'Utakruda', 1222, 'as', 'as_sippanon@hotmail.com', '0957728989'),
('213', 'mmm', 'mmm', 'mmm', 'mmm', 44, 'mm', 'music_rr_girl@hotmail.com', 'mmm'),
('232323', 'admin', 'admin', 'admin', 'admin', 55, 'admin', 'admin@admin.com', '2222'),
('234', 'v', 'sss', 'Sippanon', 'Utakruda', 22, 'as', 'as_sippanon@hotmail.com', '0957728989'),
('26262622', 'acz1', 'aaa', 'aa', 'aa', 22, 'as', 'as_sippanon@hotmail.com', '0957728989'),
('33232', 'ddddd', 'ddd', 'dd', 'ddd', 21, 'as', 'as_sippanon@hotmail.com', '213123'),
('33333333333', 'kuyyyyyyyymusic', 'dasda', 'adasd', 'asdadsad', 22, 'as', 'as_sippanon@hotmail.com', '0957728989'),
('432324', 'kkkk', 'kkkk', 'kkk', 'kkk', 45, 'as', 'as_sippanon@hotmail.com', '0957728989'),
('45231', 'qqq', 'qweq', 'qweqwe', 'qweqwe', 23, 'as', 'as_sippanon@hotmail.com', '122'),
('555', 'ac', '555', '555', 'Utakruda', 55, 'as', 'as_sippanon@hotmail.com', '0957728989'),
('677', 'acv', '77', 'Sippanon', 'Utakruda', 77, 'as', 'as_sippanon@hotmail.com', '0957728989');

-- --------------------------------------------------------

--
-- Table structure for table `transaction`
--

CREATE TABLE `transaction` (
  `Transaction_ID` int(6) NOT NULL,
  `Transaction_Type` varchar(10) NOT NULL,
  `Transaction_Timestamp` timestamp(6) NOT NULL DEFAULT CURRENT_TIMESTAMP(6) ON UPDATE CURRENT_TIMESTAMP(6),
  `Transaction_Amount` float NOT NULL,
  `Account_ID` int(6) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `transaction`
--

INSERT INTO `transaction` (`Transaction_ID`, `Transaction_Type`, `Transaction_Timestamp`, `Transaction_Amount`, `Account_ID`) VALUES
(1081277, 'Deposit', '2019-05-12 14:55:06.763428', 1222, 317828),
(1081278, 'Withdraw', '2019-05-12 14:55:12.500806', 22, 417438),
(1081279, 'Withdraw', '2019-05-12 14:59:50.660840', 121, 317828),
(1081280, 'Deposit', '2019-05-12 14:55:20.302249', 1223, 317828),
(1081281, 'Deposit', '2019-05-12 14:55:23.428204', 1212, 317828),
(1081282, 'Withdraw', '2019-05-12 14:55:28.639028', 12, 317828),
(1081283, 'Withdraw', '2019-05-12 14:57:58.515119', 12, 317828);

-- --------------------------------------------------------

--
-- Structure for view `close_price`
--
DROP TABLE IF EXISTS `close_price`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `close_price`  AS  select cast(`md`.`Match_Time` as date) AS `date`,cast(`md`.`Match_Time` as time(6)) AS `time`,`md`.`Match_ID` AS `Match_ID`,`so`.`Stock_Symbol` AS `stock_symbol`,`so`.`Order_Price` AS `close_price`,`md`.`Match_Volume` AS `Match_Volume` from ((`stock_order` `so` join `match_order` `mo`) join `match_data` `md`) where ((`so`.`Order_No` = `mo`.`Order_No`) and (`mo`.`Match_ID` = `md`.`Match_ID`) and (cast(`md`.`Match_Time` as time(6)) <= '16:30:00')) group by cast(`md`.`Match_Time` as date),`md`.`Match_ID`,`so`.`Stock_Symbol` order by cast(`md`.`Match_Time` as date) desc,cast(`md`.`Match_Time` as time(6)) desc ;

--
-- Indexes for dumped tables
--

--
-- Indexes for table `bank_account`
--
ALTER TABLE `bank_account`
  ADD PRIMARY KEY (`Bank_Account_Number`),
  ADD KEY `bank_account_ibfk_1` (`Trader_Personal_ID`);

--
-- Indexes for table `broker`
--
ALTER TABLE `broker`
  ADD PRIMARY KEY (`Broker_Symbol`);

--
-- Indexes for table `company`
--
ALTER TABLE `company`
  ADD PRIMARY KEY (`Company_Name (PK)`);

--
-- Indexes for table `match_data`
--
ALTER TABLE `match_data`
  ADD PRIMARY KEY (`Match_ID`);

--
-- Indexes for table `match_order`
--
ALTER TABLE `match_order`
  ADD PRIMARY KEY (`Order_No`,`Match_ID`),
  ADD KEY `match_data_ibfk_1` (`Match_ID`);

--
-- Indexes for table `stock_market`
--
ALTER TABLE `stock_market`
  ADD PRIMARY KEY (`Market_Type`,`Timestamp`);

--
-- Indexes for table `stock_order`
--
ALTER TABLE `stock_order`
  ADD PRIMARY KEY (`Order_No`),
  ADD KEY `stock_order_ibfk_1` (`Stock_Symbol`),
  ADD KEY `stock_order_ibfk_2` (`Account_ID`);

--
-- Indexes for table `stock_symbol`
--
ALTER TABLE `stock_symbol`
  ADD PRIMARY KEY (`Stock_Symbol`,`Timestamp`),
  ADD KEY `stock_symbol_ibfk_1` (`Market_Type`),
  ADD KEY `stock_symbol_ibfk_2` (`Company_Name`);

--
-- Indexes for table `trader_account`
--
ALTER TABLE `trader_account`
  ADD PRIMARY KEY (`Account_ID`),
  ADD KEY `trader_account_ibfk_2` (`Broker_Symbol`),
  ADD KEY `trader_account_ibfk_1` (`Trader_Personal_ID`);

--
-- Indexes for table `trader_data`
--
ALTER TABLE `trader_data`
  ADD PRIMARY KEY (`Trader_Personal_ID`);

--
-- Indexes for table `transaction`
--
ALTER TABLE `transaction`
  ADD PRIMARY KEY (`Transaction_ID`),
  ADD KEY `transaction_ibfk_1` (`Account_ID`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `match_data`
--
ALTER TABLE `match_data`
  MODIFY `Match_ID` int(6) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `trader_account`
--
ALTER TABLE `trader_account`
  MODIFY `Account_ID` int(6) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=611389;

--
-- AUTO_INCREMENT for table `transaction`
--
ALTER TABLE `transaction`
  MODIFY `Transaction_ID` int(6) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=1081284;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `bank_account`
--
ALTER TABLE `bank_account`
  ADD CONSTRAINT `bank_account_ibfk_1` FOREIGN KEY (`Trader_Personal_ID`) REFERENCES `trader_data` (`Trader_Personal_ID`) ON UPDATE CASCADE;

--
-- Constraints for table `match_order`
--
ALTER TABLE `match_order`
  ADD CONSTRAINT `match_data_ibfk_1` FOREIGN KEY (`Match_ID`) REFERENCES `match_data` (`Match_ID`) ON UPDATE CASCADE,
  ADD CONSTRAINT `match_data_ibfk_2` FOREIGN KEY (`Order_No`) REFERENCES `stock_order` (`Order_No`) ON UPDATE CASCADE;

--
-- Constraints for table `stock_order`
--
ALTER TABLE `stock_order`
  ADD CONSTRAINT `stock_order_ibfk_1` FOREIGN KEY (`Stock_Symbol`) REFERENCES `stock_symbol` (`Stock_Symbol`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `stock_order_ibfk_2` FOREIGN KEY (`Account_ID`) REFERENCES `trader_account` (`Account_ID`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `stock_symbol`
--
ALTER TABLE `stock_symbol`
  ADD CONSTRAINT `stock_symbol_ibfk_1` FOREIGN KEY (`Market_Type`) REFERENCES `stock_market` (`Market_Type`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `stock_symbol_ibfk_2` FOREIGN KEY (`Company_Name`) REFERENCES `company` (`Company_Name (PK)`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `trader_account`
--
ALTER TABLE `trader_account`
  ADD CONSTRAINT `trader_account_ibfk_1` FOREIGN KEY (`Trader_Personal_ID`) REFERENCES `trader_data` (`Trader_Personal_ID`) ON UPDATE CASCADE,
  ADD CONSTRAINT `trader_account_ibfk_2` FOREIGN KEY (`Broker_Symbol`) REFERENCES `broker` (`Broker_Symbol`) ON UPDATE CASCADE;

--
-- Constraints for table `transaction`
--
ALTER TABLE `transaction`
  ADD CONSTRAINT `transaction_ibfk_1` FOREIGN KEY (`Account_ID`) REFERENCES `trader_account` (`Account_ID`) ON DELETE CASCADE ON UPDATE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
