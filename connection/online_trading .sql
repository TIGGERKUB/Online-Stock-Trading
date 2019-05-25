-- phpMyAdmin SQL Dump
-- version 4.8.5
-- https://www.phpmyadmin.net/
--
-- Host: localhost
-- Generation Time: May 25, 2019 at 04:29 PM
-- Server version: 10.1.38-MariaDB
-- PHP Version: 7.1.28

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
-- Stand-in structure for view `cost`
-- (See below for the actual view)
--
CREATE TABLE `cost` (
`Account_ID` int(6)
,`Stock_Symbol` varchar(6)
,`Order_Price` float
,`Order_Type` varchar(5)
,`Order_Volume` int(10)
,`Cost` double
);

-- --------------------------------------------------------

--
-- Stand-in structure for view `current_match_time`
-- (See below for the actual view)
--
CREATE TABLE `current_match_time` (
`stock_date` date
,`stock_Time` time(6)
,`Stock_Symbol` varchar(6)
);

-- --------------------------------------------------------

--
-- Stand-in structure for view `current_price`
-- (See below for the actual view)
--
CREATE TABLE `current_price` (
`stock_date` date
,`Stock_Symbol` varchar(6)
,`Market_Type` varchar(6)
,`last_price` float
);

-- --------------------------------------------------------

--
-- Stand-in structure for view `cur_mar_price`
-- (See below for the actual view)
--
CREATE TABLE `cur_mar_price` (
`stock_date` date
,`Market_Type` varchar(6)
,`last_price` double
);

-- --------------------------------------------------------

--
-- Stand-in structure for view `market_data`
-- (See below for the actual view)
--
CREATE TABLE `market_data` (
`stock_date` date
,`Market_Type` varchar(6)
,`last_price` double
,`price_chage` double
,`market_value` double
,`stock_volume` decimal(54,0)
);

-- --------------------------------------------------------

--
-- Stand-in structure for view `market_val_vol`
-- (See below for the actual view)
--
CREATE TABLE `market_val_vol` (
`stock_date` date
,`Market_Type` varchar(6)
,`Stock_Symbol` varchar(6)
,`stock_value` double
,`stock_volume` decimal(32,0)
);

-- --------------------------------------------------------

--
-- Table structure for table `match_data`
--

CREATE TABLE `match_data` (
  `Match_ID` int(6) NOT NULL,
  `Match_Price` float NOT NULL,
  `Match_Volume` int(10) NOT NULL,
  `Match_Time` timestamp(6) NOT NULL DEFAULT CURRENT_TIMESTAMP(6) ON UPDATE CURRENT_TIMESTAMP(6)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `match_data`
--

INSERT INTO `match_data` (`Match_ID`, `Match_Price`, `Match_Volume`, `Match_Time`) VALUES
(16, 34, 200, '2019-05-23 12:48:09.665469'),
(17, 500, 500, '2019-05-23 17:20:42.059658'),
(18, 20, 20, '2019-05-23 17:21:14.834299'),
(19, 42, 200, '2019-05-24 18:52:02.297181'),
(20, 41, 100, '2019-05-24 18:55:06.988347'),
(21, 12, 12, '2019-05-24 20:59:44.610849'),
(22, 123, 123, '2019-05-24 21:01:52.741221');

-- --------------------------------------------------------

--
-- Table structure for table `match_order`
--

CREATE TABLE `match_order` (
  `Order_No` int(8) NOT NULL,
  `Match_No` int(6) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `match_order`
--

INSERT INTO `match_order` (`Order_No`, `Match_No`) VALUES
(1096815, 16),
(1096818, 17),
(1096819, 17),
(1096820, 18),
(1096821, 18),
(1096824, 19),
(1096825, 19),
(1096826, 20),
(1096828, 20),
(1096829, 21),
(1096830, 21),
(1096831, 22),
(1096832, 22);

-- --------------------------------------------------------

--
-- Stand-in structure for view `stock_data`
-- (See below for the actual view)
--
CREATE TABLE `stock_data` (
`Stock_Symbol` varchar(6)
,`stock_date` date
,`last_price` float
,`price_change` double
,`high_price` float
,`low_price` float
,`ceil_price` double
,`floor_price` double
,`stock_value` double
,`stock_volume` decimal(32,0)
);

-- --------------------------------------------------------

--
-- Table structure for table `stock_market`
--

CREATE TABLE `stock_market` (
  `Market_Type` varchar(6) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `stock_market`
--

INSERT INTO `stock_market` (`Market_Type`) VALUES
('mai'),
('SET');

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
(116975, '2019-05-22 09:30:08.864039', 'Q', 55, 'Sell', 100, 'AIS', 379793),
(280311, '2019-05-01 19:05:38.078299', 'Q', 123, 'Buy', 123, 'FUCK', 417438),
(286134, '2019-05-12 15:23:47.028485', 'Q', 3434, 'Buy', 123, 'AIS', 417438),
(305360, '2019-05-22 11:34:09.039991', 'Q', 40, 'Buy', 100, 'AIS', 317828),
(341451, '2019-05-02 08:51:55.652202', 'Q', 100, 'Buy', 2000, 'AIS', 427540),
(406028, '2019-05-23 21:36:19.810983', 'Q', 467, 'Buy', 100, 'AIS', 317828),
(415833, '2019-05-22 09:30:28.590707', 'Q', 45, 'Sell', 100, 'AIS', 379793),
(464316, '2019-05-22 11:34:28.355931', 'Q', 40, 'Sell', 100, 'AIS', 379793),
(510144, '2019-05-01 18:35:03.532743', 'Q', 122, 'Sell', 31, 'AIS', 417438),
(520679, '2019-05-12 15:23:12.857586', 'Q', 122, 'Buy', 12, 'AIS', 317828),
(625162, '2019-05-11 10:45:50.869695', 'Q', 232, 'Buy', 2321, 'FUCK', 317828),
(680443, '2019-05-01 18:43:34.319504', 'Q', 123, 'Sell', 22, 'TRUE', 417438),
(1096815, '2019-05-23 21:36:35.965870', 'M', 501, 'Buy', 200, 'AIS', 317828),
(1096816, '2019-05-23 12:48:09.660483', 'Q', 40, 'Sell', 45, 'TRUE', 611397),
(1096817, '2019-05-23 12:48:33.936151', 'Q', 12, 'Sell', 12, 'AIS', 611397),
(1096818, '2019-05-23 17:20:42.064803', 'M', 500, 'Buy', 500, 'AIS', 317828),
(1096819, '2019-05-23 17:20:42.064803', 'M', 500, 'Sell', 500, 'AIS', 580429),
(1096820, '2019-05-23 17:21:14.842381', 'M', 20, 'Sell', 20, 'FUCK', 580429),
(1096821, '2019-05-23 17:21:14.842381', 'M', 20, 'Buy', 20, 'FUCK', 611392),
(1096822, '2019-05-24 18:42:48.533423', 'M', 501, 'Sell', 300, 'AIS', 317828),
(1096823, '2019-05-24 10:09:26.000000', 'M', 22, 'Sell', 123, 'FUCK', 438042),
(1096824, '2019-05-24 18:52:02.304949', 'M', 42, 'Sell', 200, 'FUCK', 317828),
(1096825, '2019-05-24 18:52:02.304949', 'M', 42, 'Buy', 200, 'FUCK', 611397),
(1096826, '2019-05-24 18:55:06.994126', 'M', 41, 'Sell', 100, 'FUCK', 317828),
(1096828, '2019-05-24 18:55:06.994126', 'M', 41, 'Buy', 100, 'FUCK', 611388),
(1096829, '2019-05-24 20:59:44.618468', 'M', 12, 'Sell', 12, 'FUCK', 379793),
(1096830, '2019-05-24 20:59:44.618468', 'M', 12, 'Buy', 12, 'FUCK', 417438),
(1096831, '2019-05-24 21:01:52.749124', 'M', 123, 'Buy', 123, 'AIS', 317828),
(1096832, '2019-05-24 21:01:52.749124', 'M', 123, 'Sell', 123, 'AIS', 580429);

-- --------------------------------------------------------

--
-- Table structure for table `stock_symbol`
--

CREATE TABLE `stock_symbol` (
  `Stock_Symbol` varchar(6) NOT NULL,
  `Stock_Volume` int(8) NOT NULL,
  `Market_Type` varchar(6) NOT NULL,
  `Company_Name` varchar(30) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `stock_symbol`
--

INSERT INTO `stock_symbol` (`Stock_Symbol`, `Stock_Volume`, `Market_Type`, `Company_Name`) VALUES
('ABICO', 4000, 'mai', 'ROOM429'),
('AIS', 21, 'SET', 'ROOM429'),
('CHEWA', 300, 'mai', 'ROOM429'),
('FUCK', 43, 'SET', 'ROOM429'),
('TRUE', 56, 'SET', 'ROOM429');

-- --------------------------------------------------------

--
-- Stand-in structure for view `stock_val_vol`
-- (See below for the actual view)
--
CREATE TABLE `stock_val_vol` (
`stock_date` date
,`Stock_Symbol` varchar(6)
,`stock_value` double
,`stock_volume` int(10)
);

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
(611388, 123, 15452, 'Credit_Balance', '123456', 'ASL'),
(611389, 333, 0, 'Credit_Balance', '123456', 'KSS'),
(611392, 123, 213, 'Credit_Balance', '123456', 'ASL'),
(611393, 123, 123, 'Cash_Balance', '45231', 'ASL'),
(611394, 122, 123, 'Cash_Account', '123', 'MBKET'),
(611395, 123, 123, 'Cash_Balance', '432324', 'KSS'),
(611396, 232, 123, 'Cash_Balance', '12545', 'ASL'),
(611397, 231, 0, 'Credit_Balance', '1445522', 'AIRA');

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
('1445522', 'k', 'k', 'Sippanon', 'Utakruda', 20, 'as', 'as_sippanon@hotmail.com', '213123'),
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
-- Structure for view `cost`
--
DROP TABLE IF EXISTS `cost`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `cost`  AS  select `stock_order`.`Account_ID` AS `Account_ID`,`stock_order`.`Stock_Symbol` AS `Stock_Symbol`,`stock_order`.`Order_Price` AS `Order_Price`,`stock_order`.`Order_Type` AS `Order_Type`,`stock_order`.`Order_Volume` AS `Order_Volume`,(`stock_order`.`Order_Price` * `stock_order`.`Order_Volume`) AS `Cost` from `stock_order` where (`stock_order`.`Order_Status` = 'M') ;

-- --------------------------------------------------------

--
-- Structure for view `current_match_time`
--
DROP TABLE IF EXISTS `current_match_time`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `current_match_time`  AS  select cast(`stock_order`.`Order_Time` as date) AS `stock_date`,max(cast(`stock_order`.`Order_Time` as time(6))) AS `stock_Time`,`stock_order`.`Stock_Symbol` AS `Stock_Symbol` from `stock_order` where (`stock_order`.`Order_Status` = 'M') group by cast(`stock_order`.`Order_Time` as date),`stock_order`.`Stock_Symbol` ;

-- --------------------------------------------------------

--
-- Structure for view `current_price`
--
DROP TABLE IF EXISTS `current_price`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `current_price`  AS  select `m`.`stock_date` AS `stock_date`,`m`.`Stock_Symbol` AS `Stock_Symbol`,`s`.`Market_Type` AS `Market_Type`,`o`.`Order_Price` AS `last_price` from ((`current_match_time` `m` join `stock_order` `o`) join `stock_symbol` `s`) where ((`m`.`stock_date` = cast(`o`.`Order_Time` as date)) and (`m`.`stock_Time` = cast(`o`.`Order_Time` as time(6))) and (`m`.`Stock_Symbol` = `o`.`Stock_Symbol`) and (`s`.`Stock_Symbol` = `m`.`Stock_Symbol`)) group by `m`.`stock_date`,`m`.`Stock_Symbol` ;

-- --------------------------------------------------------

--
-- Structure for view `cur_mar_price`
--
DROP TABLE IF EXISTS `cur_mar_price`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `cur_mar_price`  AS  select cast(`d`.`stock_date` as date) AS `stock_date`,`s`.`Market_Type` AS `Market_Type`,(sum(`d`.`last_price`) / count(`d`.`Stock_Symbol`)) AS `last_price` from (`stock_data` `d` join `stock_symbol` `s`) where (`s`.`Stock_Symbol` = `d`.`Stock_Symbol`) group by cast(`d`.`stock_date` as date),`s`.`Market_Type` ;

-- --------------------------------------------------------

--
-- Structure for view `market_data`
--
DROP TABLE IF EXISTS `market_data`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `market_data`  AS  select `c1`.`stock_date` AS `stock_date`,`c1`.`Market_Type` AS `Market_Type`,`c1`.`last_price` AS `last_price`,((select `c2`.`last_price` from `cur_mar_price` `c2` where ((`c1`.`stock_date` = `c2`.`stock_date`) and (`c1`.`Market_Type` = `c2`.`Market_Type`))) - coalesce((select `c2`.`last_price` from `cur_mar_price` `c2` where ((`c2`.`stock_date` = (`c1`.`stock_date` - 1)) and (`c1`.`Market_Type` = `c2`.`Market_Type`))),(select `c2`.`last_price` from `cur_mar_price` `c2` where ((`c1`.`stock_date` = `c2`.`stock_date`) and (`c1`.`Market_Type` = `c2`.`Market_Type`))))) AS `price_chage`,(select sum(`v`.`stock_value`) from `market_val_vol` `v` where ((`c1`.`stock_date` = `v`.`stock_date`) and (`v`.`Market_Type` = `c1`.`Market_Type`))) AS `market_value`,(select sum(`v`.`stock_volume`) from `market_val_vol` `v` where ((`c1`.`stock_date` = `v`.`stock_date`) and (`v`.`Market_Type` = `c1`.`Market_Type`))) AS `stock_volume` from `cur_mar_price` `c1` ;

-- --------------------------------------------------------

--
-- Structure for view `market_val_vol`
--
DROP TABLE IF EXISTS `market_val_vol`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `market_val_vol`  AS  select `d`.`stock_date` AS `stock_date`,`s`.`Market_Type` AS `Market_Type`,`d`.`Stock_Symbol` AS `Stock_Symbol`,(`d`.`stock_value` * `d`.`stock_volume`) AS `stock_value`,`d`.`stock_volume` AS `stock_volume` from (`stock_data` `d` join `stock_symbol` `s`) where (`d`.`Stock_Symbol` = `s`.`Stock_Symbol`) ;

-- --------------------------------------------------------

--
-- Structure for view `stock_data`
--
DROP TABLE IF EXISTS `stock_data`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `stock_data`  AS  select `c1`.`Stock_Symbol` AS `Stock_Symbol`,`c1`.`stock_date` AS `stock_date`,`c1`.`last_price` AS `last_price`,((select `c2`.`last_price` from `current_price` `c2` where ((`c2`.`stock_date` = `c1`.`stock_date`) and (`c2`.`Stock_Symbol` = `c1`.`Stock_Symbol`))) - coalesce((select `c2`.`last_price` from `current_price` `c2` where ((`c2`.`stock_date` = (`c1`.`stock_date` - 1)) and (`c2`.`Stock_Symbol` = `c1`.`Stock_Symbol`))),(select `c2`.`last_price` from `current_price` `c2` where ((`c2`.`stock_date` = `c1`.`stock_date`) and (`c2`.`Stock_Symbol` = `c1`.`Stock_Symbol`))))) AS `price_change`,max(`o`.`Order_Price`) AS `high_price`,min(`o`.`Order_Price`) AS `low_price`,(`c1`.`last_price` + (`c1`.`last_price` * 0.3)) AS `ceil_price`,(`c1`.`last_price` - (`c1`.`last_price` * 0.3)) AS `floor_price`,(select sum(`v`.`stock_value`) from `stock_val_vol` `v` where ((`c1`.`Stock_Symbol` = `v`.`Stock_Symbol`) and (`c1`.`stock_date` = `v`.`stock_date`))) AS `stock_value`,(select sum(`v`.`stock_volume`) from `stock_val_vol` `v` where ((`c1`.`Stock_Symbol` = `v`.`Stock_Symbol`) and (`c1`.`stock_date` = `v`.`stock_date`))) AS `stock_volume` from (`current_price` `c1` join `stock_order` `o`) where ((`o`.`Order_Status` = 'M') and (`o`.`Stock_Symbol` = `c1`.`Stock_Symbol`) and (cast(`o`.`Order_Time` as date) = `c1`.`stock_date`)) group by `c1`.`Stock_Symbol`,`c1`.`stock_date` ;

-- --------------------------------------------------------

--
-- Structure for view `stock_val_vol`
--
DROP TABLE IF EXISTS `stock_val_vol`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `stock_val_vol`  AS  select cast(`stock_order`.`Order_Time` as date) AS `stock_date`,`stock_order`.`Stock_Symbol` AS `Stock_Symbol`,(`stock_order`.`Order_Price` * `stock_order`.`Order_Volume`) AS `stock_value`,`stock_order`.`Order_Volume` AS `stock_volume` from `stock_order` where ((`stock_order`.`Order_Status` = 'M') and (`stock_order`.`Order_Type` = 'Buy')) ;

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
  ADD PRIMARY KEY (`Order_No`,`Match_No`),
  ADD KEY `match_order_ibfk_2` (`Match_No`);

--
-- Indexes for table `stock_market`
--
ALTER TABLE `stock_market`
  ADD PRIMARY KEY (`Market_Type`);

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
  ADD PRIMARY KEY (`Stock_Symbol`),
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
  MODIFY `Match_ID` int(6) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=23;

--
-- AUTO_INCREMENT for table `stock_order`
--
ALTER TABLE `stock_order`
  MODIFY `Order_No` int(8) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=1096833;

--
-- AUTO_INCREMENT for table `trader_account`
--
ALTER TABLE `trader_account`
  MODIFY `Account_ID` int(6) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=611398;

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
  ADD CONSTRAINT `match_order_ibfk_1` FOREIGN KEY (`Order_No`) REFERENCES `stock_order` (`Order_No`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `match_order_ibfk_2` FOREIGN KEY (`Match_No`) REFERENCES `match_data` (`Match_ID`) ON DELETE CASCADE ON UPDATE CASCADE;

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
