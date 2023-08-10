-- --------------------------------------------------------
-- Host:                         localhost
-- Server version:               10.4.21-MariaDB-log - mariadb.org binary distribution
-- Server OS:                    Win64
-- HeidiSQL Version:             12.3.0.6589
-- --------------------------------------------------------

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET NAMES utf8 */;
/*!50503 SET NAMES utf8mb4 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;


-- Dumping database structure for complaint_db
CREATE DATABASE IF NOT EXISTS `complaint_db` /*!40100 DEFAULT CHARACTER SET utf8 */;
USE `complaint_db`;

-- Dumping structure for table complaint_db.complaint_tbl
CREATE TABLE IF NOT EXISTS `complaint_tbl` (
  `complaint_no` int(11) NOT NULL AUTO_INCREMENT,
  `section_code` int(11) NOT NULL DEFAULT 0,
  `complaint_date` date DEFAULT NULL,
  `floor_no` int(11) DEFAULT NULL,
  `floor_coordinator_empno` varchar(8) DEFAULT NULL,
  `location_in_floor` varchar(50) DEFAULT NULL,
  `nature_of_complaint` varchar(50) DEFAULT NULL,
  `flag` enum('0','1','2','3') DEFAULT NULL COMMENT '''coordinator'',''section incharge'',''problem solved'',''rejected''',
  `description` varchar(150) DEFAULT NULL,
  PRIMARY KEY (`complaint_no`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8;

-- Dumping data for table complaint_db.complaint_tbl: ~6 rows (approximately)
INSERT INTO `complaint_tbl` (`complaint_no`, `section_code`, `complaint_date`, `floor_no`, `floor_coordinator_empno`, `location_in_floor`, `nature_of_complaint`, `flag`, `description`) VALUES
	(3, 1, '2023-06-26', 4, '5545', 'lobby', 'ABC', '2', 'Tube is not working properly'),
	(4, 2, '2023-06-26', 0, '47543247', '4th floor', 'ABC', '3', 'fan not working.'),
	(5, 1, '2023-06-27', 0, '47543247', '4th floor', 'ABC', '2', 'fan not working.'),
	(6, 1, '2023-06-26', 4, '568989', '2nd', 'ABC', '2', 'light not working'),
	(7, 1, '2023-06-26', 4, '568989', '3rd floor', 'ABC', '0', 'passage not cleaned'),
	(8, 1, '2023-06-26', 4, '568989', '3rd floor', 'ABC', '1', 'passage not cleaned'),
	(9, 2, '2023-08-07', 0, '47543247', 'test', 'ABC', '1', 'dfgdfdfdfdfdfdfdfdfdfdfdfdfdfdfdfdfdfdfdfdfdfdfdfdfdfdfdfdfdfdfdfdfdfdfdfdfdfdfdfdfdfdfdfdfdfdfdfdfdfdfdfdfdfdfdfdfdfdfdfdfdfdfdfdfdfdfdfdfdfdfdfdfdfd');

-- Dumping structure for table complaint_db.complaint_transaction
CREATE TABLE IF NOT EXISTS `complaint_transaction` (
  `sno` int(11) NOT NULL AUTO_INCREMENT,
  `complaint_no` int(11) NOT NULL,
  `action_taken` varchar(8) DEFAULT NULL,
  `action_taken_by` varchar(50) DEFAULT NULL,
  `action_date` date DEFAULT NULL,
  `remark` varchar(150) DEFAULT NULL,
  PRIMARY KEY (`sno`),
  KEY `complaint_no` (`complaint_no`),
  CONSTRAINT `complaint_transaction_ibfk_1` FOREIGN KEY (`complaint_no`) REFERENCES `complaint_tbl` (`complaint_no`)
) ENGINE=InnoDB AUTO_INCREMENT=24 DEFAULT CHARSET=utf8;

-- Dumping data for table complaint_db.complaint_transaction: ~16 rows (approximately)
INSERT INTO `complaint_transaction` (`sno`, `complaint_no`, `action_taken`, `action_taken_by`, `action_date`, `remark`) VALUES
	(1, 3, 'F', 'sandeep_', '2023-06-26', 'Please see'),
	(2, 4, 'F', 'sandeep_incharge', '2023-06-26', 'problem solved'),
	(4, 4, 'C', 'sandeep_incharge', '2023-07-26', 'completed complaint.'),
	(7, 4, 'R', 'sandeep_incharge', '2023-06-26', 'Rejected'),
	(8, 6, 'F', 'sandeep_floor', '2023-06-26', 'please check'),
	(9, 7, 'F', 'sandeep_floor', '2023-06-26', 'test'),
	(10, 6, 'C', 'sandeep_incharge', '2023-06-26', 'issue resolved'),
	(11, 6, 'C', 'sandeep_incharge', '2023-06-26', 'r'),
	(12, 6, 'C', 'sandeep_incharge', '2023-06-26', 'test'),
	(13, 7, 'C', 'sandeep_incharge', '2023-06-27', 'C'),
	(14, 8, 'P', 'sandeep_incharge', '2023-07-03', 'In progress'),
	(16, 8, 'P', 'sandeep_incharge', '2023-07-03', 'test'),
	(17, 8, 'F', 'sandeep_floor', '2023-07-19', 'test'),
	(18, 8, 'P', 'sandeep_incharge', '2023-07-20', 'test'),
	(19, 8, 'P', 'sandeep_incharge', '2023-07-20', 'C'),
	(20, 8, 'C', 'sandeep_incharge', '2023-07-20', 'test'),
	(21, 8, 'C', 'sandeep_incharge', '2023-07-20', 'c'),
	(22, 8, 'P', 'sandeep_incharge', '2023-07-20', 'c'),
	(23, 9, 'F', 'sandeep_floor', '2023-08-07', 'forword');

-- Dumping structure for table complaint_db.floor_tbl
CREATE TABLE IF NOT EXISTS `floor_tbl` (
  `sno` int(11) NOT NULL AUTO_INCREMENT,
  `floor_no` int(11) NOT NULL DEFAULT 0,
  `floor_coordinator_empno` varchar(8) NOT NULL DEFAULT '0',
  `floor_coordinator_name` varchar(50) NOT NULL DEFAULT '0',
  `floor_coordinator_designation` varchar(50) NOT NULL DEFAULT '0',
  `location_in_floor` varchar(50) NOT NULL DEFAULT '0',
  `creation_date` date DEFAULT NULL,
  `active_status` enum('Y','N') DEFAULT 'Y',
  PRIMARY KEY (`sno`),
  UNIQUE KEY `floor_coordinator_empno` (`floor_coordinator_empno`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8;

-- Dumping data for table complaint_db.floor_tbl: ~4 rows (approximately)
INSERT INTO `floor_tbl` (`sno`, `floor_no`, `floor_coordinator_empno`, `floor_coordinator_name`, `floor_coordinator_designation`, `location_in_floor`, `creation_date`, `active_status`) VALUES
	(1, 4, '47543247', 'sandeep', 'MTS', 'Room No 10', '2023-06-26', 'Y'),
	(2, 1, '21207751', 'sasiram beeke', 'engineeer', '4th floor', '2023-06-26', 'Y'),
	(3, 2, '457896', 'vikas behenwal', 'administration', '3rd floor', '2023-06-26', 'Y'),
	(4, 4, '568989', 'vishal kale', 'office assistant', '2nd fllor', '2023-06-26', 'Y'),
	(5, 3, '5545', 'test', 'tets', 'gf', '2023-06-27', 'Y');

-- Dumping structure for table complaint_db.login
CREATE TABLE IF NOT EXISTS `login` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `username` varchar(50) DEFAULT NULL,
  `password` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;

-- Dumping data for table complaint_db.login: ~3 rows (approximately)
INSERT INTO `login` (`id`, `username`, `password`) VALUES
	(1, 'sasiram124@gmail.com', '123456'),
	(2, NULL, NULL),
	(3, NULL, NULL);

-- Dumping structure for table complaint_db.section_incharge_tbl
CREATE TABLE IF NOT EXISTS `section_incharge_tbl` (
  `sno` int(11) NOT NULL AUTO_INCREMENT,
  `section_code` int(11) NOT NULL DEFAULT 0,
  `section_name` varchar(20) NOT NULL DEFAULT '0',
  `sect_emp_mobile` varchar(15) NOT NULL DEFAULT '0',
  `sect_emp_name` varchar(50) NOT NULL DEFAULT '0',
  `sect_emp_desig` varchar(50) NOT NULL DEFAULT '0',
  `creation_date` date DEFAULT NULL,
  PRIMARY KEY (`sno`)
) ENGINE=InnoDB AUTO_INCREMENT=16 DEFAULT CHARSET=utf8;

-- Dumping data for table complaint_db.section_incharge_tbl: ~14 rows (approximately)
INSERT INTO `section_incharge_tbl` (`sno`, `section_code`, `section_name`, `sect_emp_mobile`, `sect_emp_name`, `sect_emp_desig`, `creation_date`) VALUES
	(1, 1, '0', '47543247', 'sandeep Dond', 'MTS', '2023-06-26'),
	(2, 2, '0', '689797', 'sasiram beeke', 's/r engineer', '2023-06-26'),
	(3, 3, '0', '99797', 'vishal kale', 'office assitant', '2023-06-26'),
	(4, 4, '0', '745537', 'vikas bhehenwal', 'tester', '2023-06-26'),
	(5, 2, '0', '5545', 'test', 'fdg', '2023-06-27'),
	(6, 3, '0', '2147483647', 'sasiram beeke', 'tester', '2023-07-17'),
	(7, 4, 'Cleaning', '8600412962', 'vishal ', 'admin section', '2023-07-17'),
	(8, 2, 'Civil', '9767525852', 'vikas behenwal', 'admin executive', '2023-07-17'),
	(9, 4, 'Cleaning', '8766130452', 'sachin thete', 'tester', '2023-07-17'),
	(10, 2, 'Civil', '9784515256', 'sagar bhus', 'software developer', '2023-07-17'),
	(11, 3, 'Housekeeping', '9795781425', 'rahul chopkar', 'software application assistant', '2023-07-17'),
	(12, 3, 'Housekeeping', '8767525852', 'test', 'dfgdf', '2023-07-17'),
	(13, 4, 'Cleaning', '87545', 'test', 'dfgfgdf', '2023-07-17'),
	(14, 1, 'Electrical', '8954678425', 'shubham unde', 'test', '2023-07-17'),
	(15, 2, 'Civil', '8600412962', 'test', 'test', '2023-07-17');

-- Dumping structure for table complaint_db.section_tbl
CREATE TABLE IF NOT EXISTS `section_tbl` (
  `section_code` int(11) NOT NULL AUTO_INCREMENT,
  `section_name` varchar(50) NOT NULL DEFAULT '0',
  `creation_date` date DEFAULT NULL,
  PRIMARY KEY (`section_code`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;

-- Dumping data for table complaint_db.section_tbl: ~4 rows (approximately)
INSERT INTO `section_tbl` (`section_code`, `section_name`, `creation_date`) VALUES
	(1, 'Electrical', '2023-06-21'),
	(2, 'Civil', '2023-06-22'),
	(3, 'Housekeeping', '2023-06-22'),
	(4, 'Cleaning', '2023-06-22');

-- Dumping structure for table complaint_db.user
CREATE TABLE IF NOT EXISTS `user` (
  `sno` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(50) NOT NULL DEFAULT '',
  `mobile` varchar(15) NOT NULL DEFAULT '',
  `email` varchar(50) NOT NULL DEFAULT '',
  `password` varchar(50) NOT NULL DEFAULT '',
  `role` enum('0','1','2') NOT NULL COMMENT 'admin,floor coordinator,section incharge',
  `creation_date` date DEFAULT NULL,
  `floor_no` varchar(5) DEFAULT NULL,
  `section_code` varchar(5) DEFAULT NULL,
  PRIMARY KEY (`sno`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=29 DEFAULT CHARSET=utf8;

-- Dumping data for table complaint_db.user: ~27 rows (approximately)
INSERT INTO `user` (`sno`, `name`, `mobile`, `email`, `password`, `role`, `creation_date`, `floor_no`, `section_code`) VALUES
	(1, 'sandeep Dond', '', 'admin@gmail.com', 'Sairam124', '0', '2023-06-26', '', ''),
	(2, 'sandeep_incharge', '', 'sandeep_incharge@gmail.com', 'Sandeep123', '2', '2023-06-26', '', '1'),
	(4, 'sandeep_floor', '', 'sandeep_floor@gmail.com', 'San123456', '1', '2023-06-26', '4', ''),
	(5, 'sasiram karnabhadur beeke', '', 'sasiram1234@gmail.com', '123', '1', '2023-07-18', '0', ''),
	(6, 'vishal kale', '', 'vishal@gmail.com', 'test', '1', '2023-07-18', '4', ''),
	(7, 'vikas', '', 'vikas@gmail.com', 'vikas', '1', '2023-07-18', '3', ''),
	(8, 'sagar bhus', '', 'sagar@gmail.com', 'sagar', '1', '2023-07-18', '2', ''),
	(9, 'rahul chopkar', '', 'rahul@gmail.com', 'admin', '1', '2023-07-18', '4', ''),
	(10, 'test user', '', 'testuser@gmail.com', '123456', '1', '2023-07-18', '3', ''),
	(11, 'yogesh bhagat', '8956124578', 'yogesh@gmail.com', '123', '1', '2023-07-18', '1', ''),
	(12, 'yogesh mishra', '8978456525', 'yogesh@gmmail.com', '123', '1', '2023-07-18', '0', ''),
	(13, 'virat kohli', '8600412962', 'virat@gmail.com', '123', '1', '2023-07-18', '3', ''),
	(14, 'test', '8754561223', 'test@gmail.com', '123', '1', '2023-07-18', '0', ''),
	(15, 'test', '9654899636', 'test@gmail.com', '1235', '1', '2023-07-18', '2', ''),
	(16, 'tet', '1223333333', 'test@gmail.com', '1234', '1', '2023-07-18', '1', ''),
	(17, 'test', '3111111111', 'test@gmail.com', '123', '1', '2023-07-18', '4', ''),
	(18, 'test', '7878787878', 'test@gmail.com', '123', '1', '2023-07-18', '2', ''),
	(19, 'gfhgfg', '7567564543', 'fgfdfs@gmail.com', '123', '1', '2023-07-18', '2', ''),
	(20, 'test', '4444444444', 'test@gmail.com', '123', '1', '2023-07-19', '1', ''),
	(21, 'sasiram beeke', '9999999999', 'sasiram1224@gmail.com', 'Sairam123', '2', '2023-07-19', '', '3'),
	(22, 'sasiram beeke', '8888888888', 'sasiram124@gmail.com', 'Sairam123', '2', '2023-07-19', '', '3'),
	(23, 'test', '8888888888', 'sasirram124@gmail.com', '123', '1', '2023-07-19', '4', ''),
	(24, 'test', '8888888888', 'sasiram124@gmail.com', '123', '1', '2023-07-19', '2', ''),
	(25, 'test', '8888888888', 'test@gmail.com', '123', '1', '2023-07-19', '3', ''),
	(26, 'test', '8888888888', 'sasiram124@gmail.com', 'Sairam123', '1', '2023-07-19', '2', ''),
	(27, 'sasiram beeke', '8888888888', 'sairam121@gmail.com', 'Sairam123', '2', '2023-07-19', '', '2'),
	(28, 'ten', '8888888888', 'ten@gmail.com', 'Ten@1234', '1', '2023-07-19', '2', '');

/*!40103 SET TIME_ZONE=IFNULL(@OLD_TIME_ZONE, 'system') */;
/*!40101 SET SQL_MODE=IFNULL(@OLD_SQL_MODE, '') */;
/*!40014 SET FOREIGN_KEY_CHECKS=IFNULL(@OLD_FOREIGN_KEY_CHECKS, 1) */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40111 SET SQL_NOTES=IFNULL(@OLD_SQL_NOTES, 1) */;
