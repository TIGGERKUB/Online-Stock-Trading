-- phpMyAdmin SQL Dump
-- version 4.8.5
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: May 28, 2019 at 11:34 AM
-- Server version: 10.1.40-MariaDB
-- PHP Version: 7.3.5

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
-- Stand-in structure for view `agvcost`
-- (See below for the actual view)
--
CREATE TABLE `agvcost` (
`Account_ID` int(6)
,`Stock_Symbol` varchar(6)
,`volume` decimal(33,0)
,`average_cost` double
);

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
(435, 'www', '7777'),
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
  `Broker_Name` varchar(100) NOT NULL,
  `Broker_Address` varchar(200) NOT NULL,
  `Broker_Email` varchar(30) NOT NULL,
  `Broker_Phone` varchar(15) NOT NULL,
  `Broker_Commission` float NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `broker`
--

INSERT INTO `broker` (`Broker_Symbol`, `Broker_Name`, `Broker_Address`, `Broker_Email`, `Broker_Phone`, `Broker_Commission`) VALUES
('AEC', 'บริษัทหลักทรัพย์ เออีซี จำกัด ', 'เลขที่ 63 อาคารแอทธินี ทาวเวอร์ ชั้น 17 ถนนวิทยุ แขวงลุมพินี เขตปทุมวัน กทม.', 'E_biz@aecs.com', '0-2659-3456', 0.25),
('AIRA', 'บริษัทหลักทรัพย์ ไอร่า จำกัด ', '319 อาคารจัตุรัสจามจุรี ชั้นที่ 12 ถนนพญาไท ปทุมวัน กทม.', 'etrade@aira.co.th', '0-2080-2999', 23),
('ASL', 'บริษัทหลักทรัพย์ เอเอสแอล จำกัด', '343-343/1,343/4-5 ถนนคลองลำเจียก\r\nแขวงนวลจันทร์ เขตบึงกุ่ม กรุงเทพมหานคร 10230', 'Etrade@aslsecurities.com', '02-508-1567', 0.25),
('BLS', 'บริษัทหลักทรัพย์ บัวหลวง จำกัด (มหาชน)', 'ชั้น 29 อาคารสีลมคอมเพล็กซ์ 191 สีลม บางรัก กทม.10500', 'customerservice@bualuang.co.th', '0-2618-1111', 0.25),
('CNS', 'บริษัทหลักทรัพย์ โนมูระ พัฒนสิน จำกัด (มหาชน)', '25 อาคารกรุงเทพประกันภัย ชั้น 15-17 ถนนสาทรใต้ แขวงทุ่งมหาเมฆ เขตสาทร กทม. 10120', 'info.cns@th.nomura.com', '0-2638-5500', 0.25),
('IVG', 'บริษัทหลักทรัพย์ ไอ วี โกลบอล จำกัด (มหาชน)', '18th Floor, Mercury Tower\r\n540 Ploenchit Road, Lumpini, Pathumwan,Bangkok 10330, Thailand', ' info@ivglobal.co.th', '0-2658-5800', 0.25),
('KSS', 'บริษัทหลักทรัพย์ กรุงศรี จำกัด (มหาชน)', ' บริษัทหลักทรัพย์ กรุงศรี จำกัด (มหาชน) สำนักงานใหญ่\r\n898 อาคารเพลินจิตทาวเวอร์ ชั้น 3 ถนนเพลินจิต\r\n', 'itrade@krungsrisecurities.com', '0-2659-7777', 0.25),
('MBKET', 'บริษัทหลักทรัพย์ เมย์แบงก์ กิมเอ็ง (ประเทศไทย) จำกัด (มหาชน)', 'LINE id: @maybankfriends', 'clientservice@maybank-ke.co.th', '0-2658-5050', 0.25),
('SCBS', 'บริษัทหลักทรัพย์ ไทยพาณิชย์ จำกัด', 'เลขที่ 19 อาคาร 3 ชั้น 2,20-21\r\nไทยพาณิชย์ ปาร์ค พลาซ่า\r\nถนนรัชดาภิเษก แขวงจตุจักร เขตจตุจักร \r\nกรุงเทพฯ 10900', 'scbsonline@scb.co.th', ' 0-2949-1234', 0.25),
('TISCO', 'บริษัทหลักทรัพย์ ทิสโก้ จำกัด', '48/8 อาคารทิสโก้ทาวเวอร์ ชั้น4 ถนนสาทรเหนือ แขวงสีลม เขตบางรัก กรุงเทพฯ 10500', 'tiscoetrade@tisco.co.th', '0-2633-6555', 0.25);

-- --------------------------------------------------------

--
-- Table structure for table `company`
--

CREATE TABLE `company` (
  `Company_Name` varchar(30) NOT NULL,
  `Company_Owner_Name` varchar(100) NOT NULL,
  `volume` varchar(50) NOT NULL,
  `Company_Address` varchar(200) NOT NULL,
  `Company_Phone` varchar(20) NOT NULL,
  `Company_Industry_group` varchar(30) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `company`
--

INSERT INTO `company` (`Company_Name`, `Company_Owner_Name`, `volume`, `Company_Address`, `Company_Phone`, `Company_Industry_group`) VALUES
(' ฟู้ด แคปปิตอล', 'นาย อัครเดช ศรีชวาลา', '2,136,460,276', '18/8 อาคารฟิโก้ เพลส ชั้น 2 ถนนสุขุมวิท 21 (อโศก) แขวงคลองเตยเหนือ เขตวัฒนา กทม.', '0-2259-9522', 'AGRO'),
('2 เอส เมทัล', 'นาย สมบัติ ลีสวัสดิ์ตระกูล', '449,998,800', '8/5 หมู่ที่ 14 ตำบลท่าช้าง อำเภอบางกล่ำ สงขลา', '0-7480-0111', 'INDUS'),
('กรุงเทพดุสิตเวชการ', 'นาย ปราเสริฐ ปราสาททองโอสถ', '15,668,956,048', 'เลขที่ 2 ซอยศูนย์วิจัย 7 ถนนเพชรบุรีตัดใหม่ แขวงบางกะปิ เขตห้วยขวาง กทม.', '0-2310-3000', 'SERVICE'),
('ช ทวี', 'นาย สุรเดช ทวีแสงสกุลไทย', '1,308,886,517', 'เลขที่ 265 หมู่ 4 ถนนกลางเมือง ตำบลเมืองเก่า อำเภอเมืองขอนแก่น ขอนแก่น', '0-4304-3888', 'INDUS'),
('ซีพี ออลล์', 'บริษัท ซี.พี.เมอร์แชนไดซิ่ง จำกัด', '8,983,101,348', 'เลขที่ 313 อาคารซีพี ทาวเวอร์ ชั้น 24 ถนนสีลม แขวงสีลม เขตบางรัก กทม.', '0-2071-9000', 'SERVICE'),
('ดีโอดี ไบโอเทค', 'นาย ล้ำพันธุ์ พรรธนประเทศ', '410,000,000', 'เลขที่ 111 หมู่ 2 ตำบลท่าจีน อำเภอเมืองสมุทรสาคร สมุทรสาคร', '0-3444-6333', 'CONSUMP'),
('ทางด่วนและรถไฟฟ้ากรุงเทพ', 'บริษัท ช.การช่าง จำกัด (มหาชน)', '15,285,000,000', '587 ถนนสุทธิสารวินิจฉัย แขวงรัชดาภิเษก เขตดินแดง กทม.', '0-2641-4611', 'SERVICE'),
('ท่าอากาศยานไทย', 'กระทรวงการคลัง', '14,285,700,000', '333 หมู่ที่ 7 ถนนเชิดวุฒากาศ แขวงสีกัน เขตดอนเมือง กทม.', '0-2535-1111', 'SERVICE'),
('ธนาคารกรุงเทพ', 'บริษัท ไทยเอ็นวีดีอาร์ จำกัด', '1,908,842,894', '333 ถนนสีลม เขตบางรัก กทม.', '0-2231-4333', 'FINCIAL'),
('บรุ๊คเคอร์ กรุ๊ป', 'นาย วรุฒ บูลกุล', '5,637,604,866', 'อาคารเดอะเทรนดี้ ชั้น 26, 10/190-193 ซอยสุขุมวิท13 ถนนสุขุมวิท แขวงคลองเตยเหนือ เขตวัฒนา กทม.', '0-2168-7100', 'FINCIAL'),
('บางกอกชีทเม็ททัล', 'นาย ธเนศ สัจจะบริบูรณ์', '440,000,000', 'เลขที่ 149 หมู่ที่ 6 ถนนสุขสวัสดิ์ ตำบลบางจาก อำเภอพระประแดง สมุทรปราการ', '0-2817-5555', 'INDUS'),
('บิสซิเนสอะไลเม้นท์', 'นาย สมพงษ์ ชื่นกิติญานนท์', '400,000,000', '92/45 อาคารสาธรธานี 2 ชั้น\Z 16 ถนนสาทรเหนือ แขวงสีลม เขตบางรัก กทม.', '0-2636-6828', 'CONSUMP'),
('บี.กริม เพาเวอร์', 'B.GRIMM POWER (SINGAPORE) PTE.LTD.', '2,606,900,000', '5 ถนนกรุงเทพกรีฑา แขวงหัวหมาก เขตบางกะปิ กทม.', '0-2710-3400', 'RESOURC'),
('บีจีที คอร์ปอเรชั่น', 'น.ส. ดลนภา ธรรมวัฒนะ', '363,519,904', 'เลขที่ 188 ถนนสุวินทวงศ์ แขวงมีนบุรี เขตมีนบุรี กทม.', '0-2540-2888', 'CONSUMP'),
('บีทีเอส กรุ๊ป โฮลดิ้งส์', 'นาย คีรี กาญจนพาสน์', '11,894,252,866', 'อาคารทีเอสที ทาวเวอร์, 21 ซอยเฉยพ่วง ถนนวิภาวดี-รังสิต แขวงจอมพล เขตจตุจักร กทม.', '0-2273-8511', 'SERVICE'),
('บ้านปู', 'บริษัท ไทยเอ็นวีดีอาร์ จำกัด', '5,161,925,515', 'อาคารธนภูมิ ชั้น 26-28, 1550 ถนนเพชรบุรีตัดใหม่ แขวงมักกะสัน เขตราชเทวี กทม.', '0-2694-6600', 'RESOURC'),
('บ้านปู เพาเวอร์', 'บริษัท บ้านปู จำกัด (มหาชน)', '3,051,021,700', '1550 อาคารธนภูมิ ชั้น 26 ถนนเพชรบุรีตัดใหม่ แขวงมักกะสัน เขตราชเทวี กทม.', '0-2007-6000', 'RESOURC'),
('ผลิตไฟฟ้า', 'การไฟฟ้าฝ่ายผลิตแห่งประเทศไทย', '526,465,000', 'อาคารเอ็กโก, 222 หมู่ 5 ถนนวิภาวดีรังสิต แขวงทุ่งสองห้อง เขตหลักสี่ กทม.', '0-2998-5000', 'RESOURC'),
('พลังงานบริสุทธิ์ ', 'UBS AG SINGAPORE BRANCH', '3,730,000,000', 'ชั้น 16 อาคารเอไอเอ แคปปิตอล เซ็นเตอร์ เลขที่ 89 ถนนรัชดาภิเษก เขตดินแดง กทม.', '0-2248-2488', 'RESOURC'),
('สยามโกลบอลเฮ้าส์', 'บริษัท เอสซีจี ดิสทริบิวชั่น จำกัด', '4,201,540,599', '232 หมู่ที่ 19 ตำบลรอบเมือง อำเภอเมืองร้อยเอ็ด ร้อยเอ็ด', '0-4361-9850', 'SERVICE'),
('อาฟเตอร์ ยู', 'น.ส. กุลพัชร์ กนกวัฒนาวรรณ', '815,623,561', '1319/9 ถนนพัฒนาการ แขวงสวนหลวง เขตสวนหลวง กทม.', '0-2318-4488', 'AGRO'),
('อีสต์โคสท์เฟอร์นิเทค', 'นาย อารักษ์ สุขสวัสดิ์', '959,487,557', '37/9 หมู่ 10 ถนนบ้านบึง - แกลง ตำบลทางเกวียน อำเภอแกลง ระยอง', '0-3867-1361', 'CONSUMP'),
('เจซีเค ฮอสพิทอลลิตี้', 'นาย อภิชัย เตชะอุบล', '625,277,672', 'อาคาร TFD 18 ซอยสาทร 11 แยก 9 แขวงยานนาวา เขตสาทร กทม.', '0-2286-9959', 'AGRO'),
('เจริญโภคภัณฑ์อาหาร', 'บริษัท เครือเจริญโภคภัณฑ์ จำกัด', '8,611,242,385', 'อาคาร ซี.พี. ทาวเวอร์ ชั้น 15, 313 ถนนสีลม แขวงบางรัก เขตบางรัก กทม.', '0-2766-8000', 'AGRO'),
('เชาว์ สตีล อินดัสทรี้', 'นาย อนาวิล จิรธรรมศิริ', '800,000,000', '2525 อาคารเอฟวายไอ เซ็นเตอร์ 2 ชั้น 10 ยูนิต 2/1006-1008 ถนนพระราม 4 แขวงคลองเตย เขตคลองเตย กทม.', '0-2033-0901', 'INDUS'),
('เซ็นทรัลพัฒนา', 'บริษัท เซ็นทรัลโฮลดิ้ง จำกัด', '4,488,000,000', 'อาคารสำนักงานเซ็นทรัลเวิลด์ ชั้น 31-33, 999/9 ถนนพระราม 1 แขวงปทุมวัน เขตปทุมวัน กทม.', '0-2667-5555', 'PROPCON'),
('เดลต้า อีเลคโทรนิคส์', 'CITI (NOMINEES) LIMITED-CBHK-PBGSG-RESTRICTED SHARES', '1,247,381,614', '909 ซอย 9 หมู่ 4 นิคมอุตสาหกรรมบางปู ตำบลแพรกษา อำเภอเมืองสมุทรปราการ สมุทรปราการ', '0-2709-3200', 'TECH'),
('เบอร์ลี่ ยุคเกอร์ ', 'บริษัท ทีซีซี คอร์ปอเรชั่น จำกัด', '4,004,634,899', 'อาคารเบอร์ลี่ ยุคเกอร์ 99 ซอยรูเบีย ถนนสุขุมวิท 42 แขวงพระโขนง เขตคลองเตย กทม.', '0-2367-1111', 'SERVICE'),
('เอบิโก้ โฮลดิ้งส์', 'นาย ชัยฉัตร บุญรัตน์', '235,000,000', '401/1หมู่ที่ 8 อาคารเอบิโก้ ชั้น 5 ถนนพหลโยธิน ตำบลคูคต อำเภอลำลูกกา ปทุมธานี', '0-2080-7899', 'AGRO'),
('เอเชีย แคปปิตอล กรุ๊ป', 'น.ส. สุกัญญา สุขเจริญไกรศรี', '316,406,985', 'เลขที่ 349 อาคารเอสเจ อินฟินิท วัน บิสซิเนส คอมเพล็กซ์ ชั้น 24 ห้องเลขที่ 2401-2405 ถนน วิภาวดีรังสิต แขวงจอมพล เขตจตุจักร กทม.', '0-2793-3888', 'FINCIAL'),
('เอเอสเอ็น โบรกเกอร์', 'นาย ธวัชชัย เลิศรุ่งเรือง', '130,000,000', '388 อาคารไอบีเอ็ม ชั้น 16 บี ถนนพหลโยธิน แขวงสามเสนใน เขตพญาไท กทม.', '0-2494-8388', 'FINCIAL'),
('แอดวานซ์ อินโฟร์ เซอร์วิส', 'บริษัท อินทัช โฮลดิ้งส์ จำกัด (มหาชน)', '2,973,095,330', 'อาคารเอไอเอส ทาวเวอร์ 1, 414 ถนนพหลโยธิน แขวงสามเสนใน เขตพญาไท กทม.', '0-2029-5000', 'TECH'),
('แอ็พพลาย ดีบี', 'นาย หวัง วนาไพรสณฑ์', '600,000,000', '252 หมู่ 4 ถนนสุขุมวิท ตำบลแพรกษา อำเภอเมืองสมุทรปราการ สมุทรปราการ', '0-2709-4040', 'INDUS'),
('โกลว์ พลังงาน', 'บริษัท เอ็นจี โฮลดิ้ง (ประเทศไทย) จำกัด', '1,462,865,035', 'ชั้น 38 อาคารเอ็มไพร์ทาวเวอร์ - พาร์ควิง เลขที่ 1 ถนนสาทรใต้ แขวงยานนาวา เขตสาทร กทม.', '0-2670-1500', 'RESOURC'),
('โทเทิ่ลแอ็คเซ็สคอมมูนิเคชั่น', 'TELENOR ASIA PTE LTD', '2,367,811,000', 'เลขที่ 319 อาคารจัตุรัสจามจุรี ชั้น 41 ถนนพญาไท แขวงปทุมวัน เขตปทุมวัน กทม.', '0-2202-8000', 'TECH'),
('โรงพยาบาลบำรุงราษฎร์', 'บริษัท กรุงเทพดุสิตเวชการ จำกัด (มหาชน)', '728,841,357', '33 ถนนสุขุมวิท ซอย 3 (ซอยนานาเหนือ) แขวงคลองเตยเหนือ เขตวัฒนา กทม.', '0-2667-1000', 'SERVICE'),
('โรงแรมเซ็นทรัลพลาซา', 'บริษัท เตียง จิราธิวัฒน์ จำกัด', '1,350,000,000', '1695 ถนนพหลโยธิน แขวงจตุจักร เขตจตุจักร กทม.', '0-2769-1234', 'SERVICE'),
('โฮม พอตเทอรี่', 'นาง วรรณี เชาว์กิตติโสภณ', '520,000,000', 'เลขที่ 119 หมู่ที่ 15 ถนนลำปาง-ตาก ตำบลสบปราบ อำเภอสบปราบ ลำปาง', '0-5485-8996', 'CONSUMP'),
('ไทยฮา', 'บริษัท เชียร์ กรุ๊ป โฮลดิ้งส์ จำกัด', '278,000,000', 'เลขที่ 140 หมู่ 5 ตำบลบางกระทึก อำเภอสามพราน นครปฐม', '0-2482-1661', 'AGRO'),
('ไอร่า แคปปิตอล', 'บริษัท เจ อาร์ เค โฮลดิ้งส์ จำกัด', '6,314,878,393', '319 อาคารจัตุรัสจามจุรี ชั้นที่ 12 ถนนพญาไท ปทุมวัน กทม.', '0-2080-2999', 'FINCIAL'),
('ไอร่า แฟคตอริ่ง', 'บริษัท ไอร่า แคปปิตอล จำกัด (มหาชน)', '1,600,000,000', 'เลขที่ 319 อาคารจัตุรัสจามจุรี ชั้น 20 ถนนพญาไท แขวงปทุมวัน เขตปทุมวัน กทม.', '0-2657-6222', 'FINCIAL');

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
,`Order_Type` varchar(5)
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
-- Stand-in structure for view `last_price_market`
-- (See below for the actual view)
--
CREATE TABLE `last_price_market` (
`MaxDate` date
,`Market_Type` varchar(6)
,`last_price` double
,`price_chage` double
,`market_value` double
,`stock_volume` decimal(54,0)
);

-- --------------------------------------------------------

--
-- Stand-in structure for view `last_price_stock`
-- (See below for the actual view)
--
CREATE TABLE `last_price_stock` (
`MaxDate` date
,`Stock_Symbol` varchar(6)
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
(36, 189, 100, '2019-05-28 08:12:16.680498'),
(37, 66.75, 100, '2019-05-28 08:13:26.715125'),
(38, 14.6, 100, '2019-05-28 08:14:10.520584'),
(39, 198.5, 50, '2019-05-28 08:15:06.142473'),
(40, 26, 100, '2019-05-28 08:15:38.540950'),
(41, 11.3, 100, '2019-05-28 08:15:41.039452'),
(42, 32.75, 50, '2019-05-28 08:16:20.531138'),
(43, 166, 100, '2019-05-28 08:16:43.057631'),
(44, 49.25, 100, '2019-05-28 08:16:59.574299'),
(45, 19.8, 100, '2019-05-28 08:17:14.815134'),
(46, 11.4, 100, '2019-05-28 08:17:29.035389'),
(47, 34.25, 250, '2019-05-28 08:17:46.954490'),
(48, 80, 100, '2019-05-28 08:18:00.772029'),
(49, 27, 200, '2019-05-28 08:18:20.725557'),
(50, 73.25, 300, '2019-05-28 08:18:36.749660'),
(51, 55.5, 200, '2019-05-28 08:18:51.564286'),
(52, 51.75, 400, '2019-05-28 08:19:05.036699'),
(53, 284, 500, '2019-05-28 08:19:18.336006'),
(54, 16, 200, '2019-05-28 08:19:33.534965'),
(55, 3.84, 600, '2019-05-28 08:19:47.193371'),
(56, 9.5, 150, '2019-05-28 08:19:59.030296'),
(57, 0.31, 200, '2019-05-28 08:20:12.954486'),
(58, 0.77, 200, '2019-05-28 08:20:27.968820'),
(59, 1.82, 300, '2019-05-28 08:20:43.989875'),
(60, 1.01, 700, '2019-05-28 08:20:57.260833'),
(61, 2.52, 300, '2019-05-28 08:21:10.205549'),
(62, 7.8, 100, '2019-05-28 08:21:22.541870'),
(63, 0.81, 400, '2019-05-28 08:21:35.011086'),
(64, 2.38, 500, '2019-05-28 08:21:51.873002'),
(65, 3.56, 450, '2019-05-28 08:22:10.715754'),
(66, 48.25, 200, '2019-05-28 08:22:21.853041'),
(67, 0.68, 800, '2019-05-28 08:22:57.841028'),
(68, 1.3, 400, '2019-05-28 08:22:59.921242'),
(69, 3.98, 500, '2019-05-28 08:23:40.816589'),
(70, 0.43, 300, '2019-05-28 08:23:42.975046'),
(71, 66, 100, '2019-05-28 09:03:08.284487'),
(72, 14, 200, '2019-05-28 09:03:09.407817'),
(73, 63, 100, '2019-05-28 09:04:59.964710'),
(74, 15, 200, '2019-05-28 09:05:23.384822'),
(75, 50, 50, '2019-05-28 09:16:44.774406'),
(76, 30, 200, '2019-05-28 09:16:46.428348');

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
(1096885, 36),
(1096887, 37),
(1096889, 38),
(1096895, 39),
(1096896, 40),
(1096897, 41),
(1096898, 42),
(1096899, 43),
(1096900, 44),
(1096901, 45),
(1096902, 46),
(1096903, 47),
(1096904, 48),
(1096905, 49),
(1096906, 50),
(1096907, 51),
(1096908, 66),
(1096909, 52),
(1096910, 53),
(1096911, 54),
(1096912, 55),
(1096913, 56),
(1096914, 57),
(1096915, 58),
(1096916, 59),
(1096917, 60),
(1096918, 61),
(1096919, 62),
(1096921, 63),
(1096922, 64),
(1096923, 65),
(1096924, 67),
(1096925, 68),
(1096926, 69),
(1096927, 70),
(1096928, 36),
(1096929, 37),
(1096930, 38),
(1096931, 39),
(1096932, 40),
(1096933, 41),
(1096934, 42),
(1096935, 43),
(1096936, 44),
(1096937, 45),
(1096938, 46),
(1096939, 47),
(1096940, 48),
(1096941, 49),
(1096942, 50),
(1096943, 51),
(1096944, 52),
(1096945, 53),
(1096946, 54),
(1096947, 55),
(1096948, 56),
(1096949, 57),
(1096950, 58),
(1096951, 59),
(1096952, 60),
(1096953, 61),
(1096954, 62),
(1096955, 63),
(1096956, 64),
(1096957, 65),
(1096958, 66),
(1096959, 67),
(1096960, 68),
(1096961, 69),
(1096962, 70),
(1096975, 71),
(1096976, 72),
(1096977, 71),
(1096978, 72),
(1096979, 73),
(1096980, 74),
(1096981, 73),
(1096982, 74),
(1096986, 75),
(1096987, 76),
(1096988, 75),
(1096989, 76);

-- --------------------------------------------------------

--
-- Stand-in structure for view `maxdate_market`
-- (See below for the actual view)
--
CREATE TABLE `maxdate_market` (
`MaxDate` date
,`Market_Type` varchar(6)
);

-- --------------------------------------------------------

--
-- Stand-in structure for view `maxdate_stock`
-- (See below for the actual view)
--
CREATE TABLE `maxdate_stock` (
`MaxDate` date
,`Stock_Symbol` varchar(6)
);

-- --------------------------------------------------------

--
-- Stand-in structure for view `portfolio`
-- (See below for the actual view)
--
CREATE TABLE `portfolio` (
`Account_ID` int(6)
,`Stock_Symbol` varchar(6)
,`volume` decimal(33,0)
,`average_cost` double
,`last_price` float
,`Amount_Price` double
,`Market_Value` double
,`Unreal` double
,`Per_Unreal` double
);

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
  `Order_Time` timestamp(6) NOT NULL DEFAULT CURRENT_TIMESTAMP(6),
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
(1096883, '2019-05-28 07:52:39.333813', 'C', 189, 'Buy', 100, 'ADVANC', 317828),
(1096884, '2019-05-28 07:52:49.314607', 'C', 189, 'Buy', 100, 'ADVANC', 317828),
(1096885, '2019-05-28 07:54:27.642089', 'M', 189, 'Buy', 100, 'ADVANC', 317828),
(1096886, '2019-05-28 07:55:45.461045', 'C', 66.75, 'Buy', 100, 'AOT', 317828),
(1096887, '2019-05-28 07:55:49.720125', 'M', 66.75, 'Buy', 100, 'AOT', 317828),
(1096888, '2019-05-28 07:56:08.618110', 'C', 14.6, 'Buy', 100, 'BANPU', 317828),
(1096889, '2019-05-28 07:56:22.388426', 'M', 14.6, 'Buy', 100, 'BANPU', 317828),
(1096890, '2019-05-28 07:57:24.063466', 'C', 45, 'Buy', 34, 'ADB ', 317828),
(1096891, '2019-05-28 07:57:41.436816', 'C', 456, 'Sell', 2334, 'BDMS ', 317828),
(1096892, '2019-05-28 07:57:47.515726', 'C', 456, 'Sell', 2334, 'BDMS ', 317828),
(1096893, '2019-05-28 07:57:49.135307', 'C', 456, 'Sell', 2334, 'BDMS ', 317828),
(1096894, '2019-05-28 07:57:50.618018', 'C', 456, 'Sell', 2334, 'BDMS ', 317828),
(1096895, '2019-05-28 07:58:28.500658', 'M', 198.5, 'Buy', 100, 'BBL', 317828),
(1096896, '2019-05-28 07:58:50.313467', 'M', 26, 'Buy', 200, 'BDMS ', 317828),
(1096897, '2019-05-28 07:59:08.402689', 'M', 11.3, 'Buy', 200, 'BEM ', 317828),
(1096898, '2019-05-28 07:59:33.858028', 'M', 32.75, 'Buy', 100, 'BGRIM ', 317828),
(1096899, '2019-05-28 07:59:53.039507', 'M', 166, 'Buy', 200, 'BH ', 317828),
(1096900, '2019-05-28 08:00:11.955811', 'M', 49.25, 'Buy', 100, 'BJC ', 317828),
(1096901, '2019-05-28 08:00:36.289005', 'M', 19.8, 'Buy', 100, 'BPP', 317828),
(1096902, '2019-05-28 08:01:01.713103', 'M', 11.4, 'Buy', 200, 'BTS', 317828),
(1096903, '2019-05-28 08:01:23.297682', 'M', 34.25, 'Buy', 500, 'CENTEL', 317828),
(1096904, '2019-05-28 08:01:42.815506', 'M', 80, 'Buy', 300, 'CPALL', 317828),
(1096905, '2019-05-28 08:02:06.989299', 'M', 27, 'Buy', 400, 'CPF ', 317828),
(1096906, '2019-05-28 08:02:36.308886', 'M', 73.25, 'Buy', 500, 'CPN ', 317828),
(1096907, '2019-05-28 08:02:57.885497', 'M', 55.5, 'Buy', 300, 'DELTA ', 317828),
(1096908, '2019-05-28 08:03:18.115754', 'M', 48.25, 'Buy', 300, 'DTAC ', 317828),
(1096909, '2019-05-28 08:03:40.206718', 'M', 51.75, 'Buy', 700, 'EA', 317828),
(1096910, '2019-05-28 08:04:04.868122', 'M', 284, 'Buy', 1000, 'EGCO', 317828),
(1096911, '2019-05-28 08:04:24.337741', 'M', 16, 'Buy', 500, 'GLOBAL', 317828),
(1096912, '2019-05-28 08:05:09.134651', 'M', 3.84, 'Buy', 1000, 'ABICO', 317828),
(1096913, '2019-05-28 08:05:26.709900', 'M', 9.5, 'Buy', 300, 'AU ', 317828),
(1096914, '2019-05-28 08:05:41.169782', 'M', 0.31, 'Buy', 600, 'FC', 317828),
(1096915, '2019-05-28 08:05:55.699728', 'M', 0.77, 'Buy', 500, 'JCKH ', 317828),
(1096916, '2019-05-28 08:06:11.850864', 'M', 1.82, 'Buy', 300, 'KASET ', 317828),
(1096917, '2019-05-28 08:06:27.576664', 'M', 1.01, 'Buy', 1000, 'BGT ', 317828),
(1096918, '2019-05-28 08:06:56.634869', 'M', 2.52, 'Buy', 700, 'BIZ', 317828),
(1096919, '2019-05-28 08:08:22.969297', 'M', 7.8, 'Buy', 200, 'DOD 	', 317828),
(1096920, '2019-05-28 08:08:37.864328', 'C', 2.38, 'Sell', 500, 'ECF ', 317828),
(1096921, '2019-05-28 08:09:01.407523', 'M', 0.81, 'Buy', 900, 'HPT ', 317828),
(1096922, '2019-05-28 08:09:39.193444', 'M', 2.38, 'Buy', 600, 'ECF ', 317828),
(1096923, '2019-05-28 08:09:57.558300', 'M', 3.56, 'Buy', 900, 'ACAP ', 317828),
(1096924, '2019-05-28 08:10:12.277816', 'M', 0.68, 'Buy', 1000, 'AF ', 317828),
(1096925, '2019-05-28 08:10:26.292546', 'M', 1.3, 'Buy', 600, 'AIRA ', 317828),
(1096926, '2019-05-28 08:10:58.522407', 'M', 3.98, 'Buy', 700, 'ASN ', 317828),
(1096927, '2019-05-28 08:11:21.050818', 'M', 0.43, 'Buy', 800, 'BROOK ', 317828),
(1096928, '2019-05-28 08:12:14.453621', 'M', 189, 'Sell', 100, 'ADVANC', 317828),
(1096929, '2019-05-28 08:13:20.479562', 'M', 66.75, 'Sell', 100, 'AOT', 317828),
(1096930, '2019-05-28 08:14:07.409302', 'M', 14.6, 'Sell', 100, 'BANPU', 317828),
(1096931, '2019-05-28 08:14:39.787454', 'M', 198.5, 'Sell', 50, 'BBL', 317828),
(1096932, '2019-05-28 08:15:06.140479', 'M', 26, 'Sell', 100, 'BDMS ', 317828),
(1096933, '2019-05-28 08:15:38.538945', 'M', 11.3, 'Sell', 100, 'BEM ', 317828),
(1096934, '2019-05-28 08:16:07.698813', 'M', 32.75, 'Sell', 50, 'BGRIM ', 317828),
(1096935, '2019-05-28 08:16:20.529166', 'M', 166, 'Sell', 100, 'BH ', 317828),
(1096936, '2019-05-28 08:16:43.055616', 'M', 49.25, 'Sell', 100, 'BJC ', 317828),
(1096937, '2019-05-28 08:16:59.572305', 'M', 19.8, 'Sell', 100, 'bpp', 317828),
(1096938, '2019-05-28 08:17:14.813140', 'M', 11.4, 'Sell', 100, 'BTS', 317828),
(1096939, '2019-05-28 08:17:29.031400', 'M', 34.25, 'Sell', 250, 'CENTEL', 317828),
(1096940, '2019-05-28 08:17:46.952493', 'M', 80, 'Sell', 100, 'CPALL', 317828),
(1096941, '2019-05-28 08:18:00.769054', 'M', 27, 'Sell', 200, 'CPF ', 317828),
(1096942, '2019-05-28 08:18:20.723587', 'M', 73.25, 'Sell', 300, 'CPN ', 317828),
(1096943, '2019-05-28 08:18:36.748684', 'M', 55.5, 'Sell', 200, 'DELTA ', 317828),
(1096944, '2019-05-28 08:18:51.562292', 'M', 51.75, 'Sell', 400, 'EA', 317828),
(1096945, '2019-05-28 08:19:05.034705', 'M', 284, 'Sell', 500, 'EGCO', 317828),
(1096946, '2019-05-28 08:19:18.334011', 'M', 16, 'Sell', 200, 'GLOBAL', 317828),
(1096947, '2019-05-28 08:19:33.531973', 'M', 3.84, 'Sell', 600, 'ABICO ', 317828),
(1096948, '2019-05-28 08:19:47.190398', 'M', 9.5, 'Sell', 150, 'AU ', 317828),
(1096949, '2019-05-28 08:19:59.028301', 'M', 0.31, 'Sell', 200, 'FC', 317828),
(1096950, '2019-05-28 08:20:12.952491', 'M', 0.77, 'Sell', 200, 'JCKH ', 317828),
(1096951, '2019-05-28 08:20:27.966825', 'M', 1.82, 'Sell', 300, 'KASET ', 317828),
(1096952, '2019-05-28 08:20:43.987881', 'M', 1.01, 'Sell', 700, 'BGT ', 317828),
(1096953, '2019-05-28 08:20:57.258839', 'M', 2.52, 'Sell', 300, 'BIZ', 317828),
(1096954, '2019-05-28 08:21:10.203552', 'M', 7.8, 'Sell', 100, 'DOD 	', 317828),
(1096955, '2019-05-28 08:21:22.539862', 'M', 0.81, 'Sell', 400, 'HPT ', 317828),
(1096956, '2019-05-28 08:21:35.009115', 'M', 2.38, 'Sell', 500, 'ECF ', 317828),
(1096957, '2019-05-28 08:21:51.871007', 'M', 3.56, 'Sell', 450, 'ACAP ', 317828),
(1096958, '2019-05-28 08:22:10.713758', 'M', 48.25, 'Sell', 200, 'DTAC ', 317828),
(1096959, '2019-05-28 08:22:40.118033', 'M', 0.68, 'Sell', 800, 'AF ', 317828),
(1096960, '2019-05-28 08:22:57.839059', 'M', 1.3, 'Sell', 400, 'AIRA ', 317828),
(1096961, '2019-05-28 08:23:19.775607', 'M', 3.98, 'Sell', 500, 'ASN ', 317828),
(1096962, '2019-05-28 08:23:40.814609', 'M', 0.43, 'Sell', 300, 'BROOK', 317828),
(1096963, '2019-05-26 17:00:00.000000', 'M', 189.5, 'Buy', 100, 'ADVANC', 611406),
(1096964, '2019-05-25 17:00:00.000000', 'M', 190.5, 'Buy', 200, 'ADVANC', 611394),
(1096967, '2019-05-25 17:00:00.000000', 'M', 189, 'Buy', 300, 'ADVANC', 580429),
(1096968, '2019-05-24 17:00:00.000000', 'M', 190, 'Buy', 500, 'ADVANC', 427540),
(1096969, '2019-05-26 17:00:00.000000', 'M', 65.75, 'Buy', 10000, 'AOT', 226935),
(1096970, '2019-05-26 17:00:00.000000', 'M', 3.74, 'Buy', 5000, 'ABICO ', 427540),
(1096971, '2019-05-25 17:00:00.000000', 'M', 3.68, 'Buy', 10000, 'ABICO ', 268406),
(1096972, '2019-05-24 17:00:00.000000', 'M', 3.7, 'Buy', 200, 'ABICO ', 381824),
(1096973, '2019-05-25 17:00:00.000000', 'M', 100, 'Buy', 100, 'ABICO ', 580429),
(1096974, '2019-05-28 09:00:53.720090', 'C', 5, 'Sell', 100, 'ADB ', 417438),
(1096975, '2019-05-28 09:01:50.708734', 'M', 66, 'Buy', 100, 'AOT', 417438),
(1096976, '2019-05-28 09:02:21.021287', 'M', 14, 'Buy', 200, 'BANPU', 417438),
(1096977, '2019-05-28 09:02:55.995864', 'M', 66, 'Sell', 100, 'AOT', 580429),
(1096978, '2019-05-28 09:03:08.280496', 'M', 14, 'Sell', 200, 'BANPU', 580429),
(1096979, '2019-05-28 09:04:15.304313', 'M', 63, 'Buy', 100, 'AOT', 417438),
(1096980, '2019-05-28 09:04:38.748987', 'M', 15, 'Buy', 200, 'BANPU', 417438),
(1096981, '2019-05-28 09:04:58.618333', 'M', 63, 'Sell', 100, 'AOT', 580429),
(1096982, '2019-05-28 09:05:20.986842', 'M', 15, 'Sell', 200, 'BANPU', 580429),
(1096983, '2019-05-28 09:12:54.027281', 'C', 14.6, 'Sell', 212, 'KASET ', 317828),
(1096984, '2019-05-28 09:13:23.091380', 'C', 123, 'Sell', 123, 'BTS', 317828),
(1096985, '2019-05-28 09:13:34.327160', 'C', 123, 'Sell', 123, 'KASET ', 317828),
(1096986, '2019-05-28 09:15:26.400467', 'M', 50, 'Buy', 100, 'DOD 	', 417438),
(1096987, '2019-05-28 09:15:50.586114', 'M', 30, 'Buy', 200, 'FC', 417438),
(1096988, '2019-05-28 09:16:32.453455', 'M', 40, 'Sell', 50, 'DOD 	', 611388),
(1096989, '2019-05-28 09:16:44.772410', 'M', 30, 'Sell', 200, 'FC', 611388),
(1096991, '2019-05-28 09:20:05.810705', 'Q', 7.6, 'Buy', 200, 'DOD 	', 417438),
(1096993, '2019-05-28 09:20:46.982326', 'Q', 7.9, 'Sell', 300, 'DOD 	', 611388),
(1096994, '2019-05-28 09:21:19.779537', 'Q', 0.31, 'Buy', 500, 'FC', 417438),
(1096995, '2019-05-28 09:21:38.375088', 'Q', 0.33, 'Sell', 200, 'FC', 611388),
(1096996, '2019-05-24 17:00:00.000000', 'M', 6, 'Buy', 50, 'AU ', 438042);

-- --------------------------------------------------------

--
-- Table structure for table `stock_symbol`
--

CREATE TABLE `stock_symbol` (
  `Stock_Symbol` varchar(10) NOT NULL,
  `Stock_Volume` varchar(50) NOT NULL,
  `Market_Type` varchar(6) NOT NULL,
  `Company_Name` varchar(30) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `stock_symbol`
--

INSERT INTO `stock_symbol` (`Stock_Symbol`, `Stock_Volume`, `Market_Type`, `Company_Name`) VALUES
('2S ', '16,600', 'mai', '2 เอส เมทัล'),
('ABICO ', '8,600', 'mai', 'เอบิโก้ โฮลดิ้งส์'),
('ACAP ', '78,900', 'mai', 'เอเชีย แคปปิตอล กรุ๊ป'),
('ADB ', '3,200', 'mai', 'แอ็พพลาย ดีบี'),
('ADVANC', '1,946,467	', 'SET', 'แอดวานซ์ อินโฟร์ เซอร์วิส'),
('AF ', '67,500	', 'mai', 'ไอร่า แฟคตอริ่ง'),
('AIRA ', '12,500', 'mai', 'ไอร่า แคปปิตอล'),
('AOT', '6,441,697	', 'SET', 'ท่าอากาศยานไทย'),
('ASN ', '1,500', 'mai', 'เอเอสเอ็น โบรกเกอร์'),
('AU ', '1,439,234	', 'mai', 'อาฟเตอร์ ยู'),
('BANPU', '28,290,893', 'SET', 'บ้านปู'),
('BBL', '3,033,426	', 'SET', 'ธนาคารกรุงเทพ'),
('BDMS ', '65,266,251', 'SET', 'กรุงเทพดุสิตเวชการ'),
('BEM ', '42,557,870	', 'SET', 'ทางด่วนและรถไฟฟ้ากรุงเทพ'),
('BGRIM ', '3,222,385', 'SET', 'บี.กริม เพาเวอร์'),
('BGT ', '10,500	', 'mai', 'บีจีที คอร์ปอเรชั่น'),
('BH ', '423,483', 'SET', 'โรงพยาบาลบำรุงราษฎร์'),
('BIZ', '13,400	', 'mai', 'บิสซิเนสอะไลเม้นท์'),
('BJC ', '6,677,893', 'SET', 'เบอร์ลี่ ยุคเกอร์ '),
('BM ', '25,400', 'mai', 'บางกอกชีทเม็ททัล'),
('BPP', '2,642,632	', 'SET', 'บ้านปู เพาเวอร์'),
('BROOK ', '206,601	', 'mai', 'บรุ๊คเคอร์ กรุ๊ป'),
('BTS', '9,097,747', 'SET', 'บีทีเอส กรุ๊ป โฮลดิ้งส์'),
('CENTEL ', '5,203,939', 'SET', 'โรงแรมเซ็นทรัลพลาซา'),
('CHO', '733,300', 'mai', 'ช ทวี'),
('CHOW 	', '118,900	', 'mai', 'เชาว์ สตีล อินดัสทรี้'),
('CPALL', '13,925,442	', 'SET', 'ซีพี ออลล์'),
('CPF ', '24,596,382	', 'SET', 'เจริญโภคภัณฑ์อาหาร'),
('CPN ', '6,650,359	', 'SET', 'เซ็นทรัลพัฒนา'),
('DELTA ', '2,038,299', 'SET', 'เดลต้า อีเลคโทรนิคส์'),
('DOD 	', '1,084,900', 'mai', 'ดีโอดี ไบโอเทค'),
('DTAC ', '6,225,105	', 'SET', 'โทเทิ่ลแอ็คเซ็สคอมมูนิเคชั่น'),
('EA', '11,592,293', 'SET', 'พลังงานบริสุทธิ์ '),
('ECF ', '1,251,800', 'mai', 'อีสต์โคสท์เฟอร์นิเทค'),
('EGCO', '1,422,298', 'SET', 'ผลิตไฟฟ้า'),
('FC', '216,700', 'mai', ' ฟู้ด แคปปิตอล'),
('GLOBAL ', '4,679,033	', 'SET', 'สยามโกลบอลเฮ้าส์'),
('HPT ', '6,932', 'mai', 'โฮม พอตเทอรี่'),
('JCKH ', '47,800	', 'mai', 'เจซีเค ฮอสพิทอลลิตี้'),
('KASET ', '1,800', 'mai', 'ไทยฮา');

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
(317828, 561, 592199, 'Cash_Balance', '123456', 'AIRA'),
(381824, 222, 283.5, 'Cash_Balance', '26262622', 'MBKET'),
(417438, 121, 5110, 'Credit_Balance', '123456', 'KSS'),
(427540, 1234, 52222, 'Cash_Balance', '1104000012345', 'AEC'),
(438042, 2345, 876, 'Cash_Balance', '26262622', 'ASL'),
(531050, 111, 5123, 'Cash_Balance', '33333333333', 'ASL'),
(562964, 111, 40000000000, 'Cash_Balance', '26262622', 'ASL'),
(580429, 556, 0, 'Cash_Account', '123456', 'AIRA'),
(583928, 234, 12121, 'Cash_Balance', '26262622', 'ASL'),
(611388, 123, 15452, 'Credit_Balance', '123456', 'ASL'),
(611389, 333, 0, 'Credit_Balance', '123456', 'KSS'),
(611392, 123, 213, 'Credit_Balance', '123456', 'ASL'),
(611393, 123, 123, 'Cash_Balance', '45231', 'ASL'),
(611394, 122, 123, 'Cash_Account', '123', 'MBKET'),
(611395, 123, 123, 'Cash_Balance', '432324', 'KSS'),
(611396, 232, 123, 'Cash_Balance', '12545', 'ASL'),
(611397, 231, 0, 'Credit_Balance', '1445522', 'AIRA'),
(611398, 123, 50000, 'Cash_Balance', '33232', 'AIRA'),
(611406, 324, 234, 'Cash_Account', '555', 'AEC');

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
('1104000012345', 'testuser', 'password', 'testuser', 'testuser', 20, 'test address', 'test@mail.com', '1045324324'),
('123', 'zxczxc', '222', 'fsaefwefewfwef', '222', 22, 'as', 'as_sippanon@hotmail.com', '213123'),
('123456', 'p', 'p', 'p', 'p', 26, 'p', 'p@p.com', 'p'),
('12545', 'n', 'n', 'n213', 'nn', 77, 'as', 'nabnoteac131@hotmail.com', '213123'),
('1445522', 'k', 'k', 'Sippanon', 'Utakruda', 20, 'as', 'as_sippanon@hotmail.com', '213123'),
('21111', 'l', 'l', '22', 'Utakruda', 1222, 'as', 'as_sippanon@hotmail.com', '0957728989'),
('213', 'mmm', 'mmm', 'mmm', 'mmm', 44, 'mm', 'music_rr_girl@hotmail.com', 'mmm'),
('232323', 'admin', 'admin', 'admin', 'admin', 55, 'admin', 'admin@admin.com', '2222'),
('234', 'v', 'sss', 'Sippanon', 'Utakruda', 22, 'as', 'as_sippanon@hotmail.com', '0957728989'),
('26262622', 'acz1', 'aaa', 'aa', 'aa', 22, 'as', 'as_sippanon@hotmail.com', '0957728989'),
('33232', 'z', 'z', 'dd', 'ddd', 21, 'as', 'as_sippanon@hotmail.com', '213123'),
('33333333333', 'q', 'q', 'adasd', 'asdadsad', 22, 'as', 'as_sippanon@hotmail.com', '0957728989'),
('432324', 'kkkk', 'kkkk', 'kkk', 'kkk', 45, 'as', 'as_sippanon@hotmail.com', '0957728989'),
('45231', 'qqq', 'qweq', 'qweqwe', 'qweqwe', 23, 'as', 'as_sippanon@hotmail.com', '122'),
('555', 'ac', '555', '555', 'Utakruda', 55, 'as', 'as_sippanon@hotmail.com', '0957728989'),
('677', 'acv', '77', 'Sippanon', 'Utakruda', 77, 'as', 'as_sippanon@hotmail.com', '0957728989'),
('7777', 'o', 'o', 'o', 'o', 54, 'as', 'as_sippanon@hotmail.com', '0957728989');

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
(1081283, 'Withdraw', '2019-05-12 14:57:58.515119', 12, 317828),
(1081284, 'Withdraw', '2019-05-25 16:03:44.452741', 2656, 317828),
(1081285, 'Deposit', '2019-05-26 09:35:12.899067', 50000, 611398),
(1081287, 'Deposit', '2019-05-27 02:52:54.645753', 50000, 317828),
(1081288, 'Withdraw', '2019-05-27 03:34:31.186302', 1321, 317828),
(1081289, 'Deposit', '2019-05-27 16:00:36.199851', 500000, 317828),
(1081291, 'Withdraw', '2019-05-27 16:28:47.639936', 60000000, 580429);

-- --------------------------------------------------------

--
-- Structure for view `agvcost`
--
DROP TABLE IF EXISTS `agvcost`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `agvcost`  AS  select `o1`.`Account_ID` AS `Account_ID`,`o1`.`Stock_Symbol` AS `Stock_Symbol`,(coalesce((select sum(`o2`.`Order_Volume`) from `stock_order` `o2` where ((`o2`.`Order_Status` = 'M') and (`o2`.`Order_Type` = 'Buy') and (`o1`.`Account_ID` = `o2`.`Account_ID`) and (`o1`.`Stock_Symbol` = `o2`.`Stock_Symbol`))),0) - coalesce((select sum(`o3`.`Order_Volume`) from `stock_order` `o3` where ((`o3`.`Order_Status` = 'M') and (`o3`.`Order_Type` = 'Sell') and (`o1`.`Account_ID` = `o3`.`Account_ID`) and (`o1`.`Stock_Symbol` = `o3`.`Stock_Symbol`))),0)) AS `volume`,((coalesce((select sum(`c`.`Cost`) from `cost` `c` where ((`c`.`Account_ID` = `o1`.`Account_ID`) and (`o1`.`Stock_Symbol` = `c`.`Stock_Symbol`) and (`c`.`Order_Type` = 'Buy'))),-(1)) - coalesce((select sum(`c`.`Cost`) from `cost` `c` where ((`c`.`Account_ID` = `o1`.`Account_ID`) and (`o1`.`Stock_Symbol` = `c`.`Stock_Symbol`) and (`c`.`Order_Type` = 'Sell'))),-(0))) / (coalesce((select sum(`c`.`Order_Volume`) from `cost` `c` where ((`c`.`Account_ID` = `o1`.`Account_ID`) and (`o1`.`Stock_Symbol` = `c`.`Stock_Symbol`) and (`c`.`Order_Type` = 'Buy'))),1) - coalesce((select sum(`c`.`Order_Volume`) from `cost` `c` where ((`c`.`Account_ID` = `o1`.`Account_ID`) and (`o1`.`Stock_Symbol` = `c`.`Stock_Symbol`) and (`c`.`Order_Type` = 'Sell'))),0))) AS `average_cost` from `stock_order` `o1` where (`o1`.`Order_Status` = 'M') group by `o1`.`Account_ID`,`o1`.`Stock_Symbol` ;

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

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `current_price`  AS  select `m`.`stock_date` AS `stock_date`,`m`.`Stock_Symbol` AS `Stock_Symbol`,`o`.`Order_Type` AS `Order_Type`,`s`.`Market_Type` AS `Market_Type`,`o`.`Order_Price` AS `last_price` from ((`current_match_time` `m` join `stock_order` `o`) join `stock_symbol` `s`) where ((`m`.`stock_date` = cast(`o`.`Order_Time` as date)) and (`m`.`stock_Time` = cast(`o`.`Order_Time` as time(6))) and (`m`.`Stock_Symbol` = `o`.`Stock_Symbol`) and (`s`.`Stock_Symbol` = `m`.`Stock_Symbol`)) group by `m`.`stock_date`,`m`.`Stock_Symbol` ;

-- --------------------------------------------------------

--
-- Structure for view `cur_mar_price`
--
DROP TABLE IF EXISTS `cur_mar_price`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `cur_mar_price`  AS  select cast(`d`.`stock_date` as date) AS `stock_date`,`s`.`Market_Type` AS `Market_Type`,(sum(`d`.`last_price`) / count(`d`.`Stock_Symbol`)) AS `last_price` from (`stock_data` `d` join `stock_symbol` `s`) where (`s`.`Stock_Symbol` = `d`.`Stock_Symbol`) group by cast(`d`.`stock_date` as date),`s`.`Market_Type` ;

-- --------------------------------------------------------

--
-- Structure for view `last_price_market`
--
DROP TABLE IF EXISTS `last_price_market`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `last_price_market`  AS  select `m`.`MaxDate` AS `MaxDate`,`m`.`Market_Type` AS `Market_Type`,`d`.`last_price` AS `last_price`,`d`.`price_chage` AS `price_chage`,`d`.`market_value` AS `market_value`,`d`.`stock_volume` AS `stock_volume` from (`market_data` `d` join `maxdate_market` `m`) where ((`m`.`MaxDate` = `d`.`stock_date`) and (`m`.`Market_Type` = `d`.`Market_Type`)) ;

-- --------------------------------------------------------

--
-- Structure for view `last_price_stock`
--
DROP TABLE IF EXISTS `last_price_stock`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `last_price_stock`  AS  select `m`.`MaxDate` AS `MaxDate`,`m`.`Stock_Symbol` AS `Stock_Symbol`,`d`.`last_price` AS `last_price`,`d`.`price_change` AS `price_change`,`d`.`high_price` AS `high_price`,`d`.`low_price` AS `low_price`,`d`.`ceil_price` AS `ceil_price`,`d`.`floor_price` AS `floor_price`,`d`.`stock_value` AS `stock_value`,`d`.`stock_volume` AS `stock_volume` from (`stock_data` `d` join `maxdate_stock` `m`) where ((`m`.`MaxDate` = `d`.`stock_date`) and (`m`.`Stock_Symbol` = `d`.`Stock_Symbol`)) ;

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
-- Structure for view `maxdate_market`
--
DROP TABLE IF EXISTS `maxdate_market`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `maxdate_market`  AS  select max(`market_data`.`stock_date`) AS `MaxDate`,`market_data`.`Market_Type` AS `Market_Type` from `market_data` group by `market_data`.`Market_Type` ;

-- --------------------------------------------------------

--
-- Structure for view `maxdate_stock`
--
DROP TABLE IF EXISTS `maxdate_stock`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `maxdate_stock`  AS  select max(`stock_data`.`stock_date`) AS `MaxDate`,`stock_data`.`Stock_Symbol` AS `Stock_Symbol` from `stock_data` group by `stock_data`.`Stock_Symbol` ;

-- --------------------------------------------------------

--
-- Structure for view `portfolio`
--
DROP TABLE IF EXISTS `portfolio`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `portfolio`  AS  select `a`.`Account_ID` AS `Account_ID`,`a`.`Stock_Symbol` AS `Stock_Symbol`,`a`.`volume` AS `volume`,`a`.`average_cost` AS `average_cost`,`l`.`last_price` AS `last_price`,(`a`.`volume` * `a`.`average_cost`) AS `Amount_Price`,(`l`.`last_price` * `a`.`volume`) AS `Market_Value`,((`l`.`last_price` * `a`.`volume`) - (`a`.`volume` * `a`.`average_cost`)) AS `Unreal`,((((`l`.`last_price` * `a`.`volume`) - (`a`.`volume` * `a`.`average_cost`)) / (`a`.`volume` * `a`.`average_cost`)) * 100) AS `Per_Unreal` from (`last_price_stock` `l` join `agvcost` `a`) where ((`l`.`Stock_Symbol` = `a`.`Stock_Symbol`) and (`a`.`volume` > 0)) ;

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
  ADD PRIMARY KEY (`Company_Name`);

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
  ADD PRIMARY KEY (`Trader_Personal_ID`),
  ADD UNIQUE KEY `user` (`Username`);

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
  MODIFY `Match_ID` int(6) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=77;

--
-- AUTO_INCREMENT for table `stock_order`
--
ALTER TABLE `stock_order`
  MODIFY `Order_No` int(8) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=1096997;

--
-- AUTO_INCREMENT for table `trader_account`
--
ALTER TABLE `trader_account`
  MODIFY `Account_ID` int(6) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=611407;

--
-- AUTO_INCREMENT for table `transaction`
--
ALTER TABLE `transaction`
  MODIFY `Transaction_ID` int(6) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=1081292;

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
  ADD CONSTRAINT `stock_symbol_ibfk_2` FOREIGN KEY (`Company_Name`) REFERENCES `company` (`Company_Name`) ON DELETE CASCADE ON UPDATE CASCADE;

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
