-- --------------------------------------------------------
-- Host:                         127.0.0.1
-- Server version:               8.0.39 - MySQL Community Server - GPL
-- Server OS:                    Win64
-- HeidiSQL Version:             12.8.0.6908
-- --------------------------------------------------------

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET NAMES utf8 */;
/*!50503 SET NAMES utf8mb4 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;



-- Dumping structure for procedure data_process.getDailyLogReport
DELIMITER //
CREATE PROCEDURE `getDailyLogReport`(
	IN `emplId` VARCHAR(50),
	IN `empType` VARCHAR(50),
	IN `fromDate` DATE,
	IN `toDate` DATE
)
    SQL SECURITY INVOKER
BEGIN
SET GLOBAL log_bin_trust_function_creators = 1;
SET wait_timeout = 300;

DROP TEMPORARY TABLE IF EXISTS dlr_temp_table;
CREATE TEMPORARY TABLE IF NOT EXISTS dlr_temp_table
(
 	 empId VARCHAR(50),
    userName VARCHAR(100),
    leaveDays INT,
    totalDays INT,
    presentDays INT,
  	 holiday INT,
  	 dailylogEntry INT,
    missedDays int,
    dates text
);
SET @leaveDays =0;
SET @totalDays =0;
SET @daysPresent =0;
SET @holiday =0;
SET @dailylogEntry=0;
SET @missedDays=0;
SET @dates='';

SET @noOfRows =0;

	SELECT DATEDIFF(toDate, fromDate) INTO @totalDays;
	SELECT COUNT(*) FROM users_holidays_calendar WHERE (startDate BETWEEN fromDate AND  toDate) INTO @holiday;
IF empType='Admin' then

	SET @employeeId ='';
	INSERT INTO  dlr_temp_table	SELECT employeeId, userName, @leaveDays, @totalDays, @daysPresent, @holiday, @dailylogEntry, @missedDays, @dates  FROM users WHERE reportingTo = emplId;
	SELECT COUNT(*) INTO @noOfRows FROM dlr_temp_table ;
	SET @rowCounter=0;

	while @rowCounter <= @noOfRows do
		SET @asd = CONCAT('SELECT empId INTO @employeeId FROM dlr_temp_table LIMIT ',@rowCounter,',',1);
	  	PREPARE zxc FROM @asd;
	  	EXECUTE zxc;
	  	SELECT COUNT(*) INTO @daysPresent FROM users_attendance WHERE employeeId= @employeeId AND (DATE BETWEEN fromDate AND  toDate);
		SET  @leaveDays= @totalDays -(@daysPresent + @holiday);
	   UPDATE dlr_temp_table SET presentDays = @daysPresent,  leaveDays=@leaveDays  WHERE empId= @employeeId;
     	SET @rowCounter = @rowCounter + 1;
   END WHILE;
ELSE
	SELECT COUNT(*) INTO @daysPresent FROM users_attendance WHERE employeeId=emplId AND (DATE BETWEEN fromDate AND  toDate);
	SET  @leaveDays= @totalDays -(@daysPresent + @holiday);
 	INSERT INTO  dlr_temp_table SELECT employeeId, userName, @leaveDays, @totalDays, @daysPresent, @holiday , @dailylogEntry, @missedDays, @dates  FROM users WHERE employeeId = emplId ;

End if;

	select * from  dlr_temp_table order by  empId desc;
 	DROP TEMPORARY TABLE IF EXISTS dlr_temp_table;

END//
DELIMITER ;

-- Dumping structure for procedure data_process.getLeaveReport
DELIMITER //
CREATE PROCEDURE `getLeaveReport`(
	IN `emplId` VARCHAR(50),
	IN `empType` VARCHAR(50),
	IN `fromDate` DATE,
	IN `toDate` DATE
)
    SQL SECURITY INVOKER
BEGIN
SET GLOBAL log_bin_trust_function_creators = 1;
SET wait_timeout = 300;

DROP TEMPORARY TABLE IF EXISTS lr_temp_table;
CREATE TEMPORARY TABLE IF NOT EXISTS lr_temp_table
(
 	 empId VARCHAR(50),
    userName VARCHAR(100),
    leaveDays INT,
    totalDays INT,
    presentDays INT,
  	 holiday INT
);
SET @leaveDays =0;
SET @totalDays =0;
SET @daysPresent =0;
SET @holiday =0;

SET @noOfRows =0;

	SELECT DATEDIFF(toDate, fromDate) INTO @totalDays;
	SELECT COUNT(*) FROM users_holidays_calendar WHERE (startDate BETWEEN fromDate AND  toDate) INTO @holiday;
IF empType='Admin' then

	SET @employeeId ='';
	INSERT INTO  lr_temp_table	SELECT employeeId, userName, @leaveDays, @totalDays, @daysPresent, @holiday  FROM users WHERE reportingTo = emplId;
	SELECT COUNT(*) INTO @noOfRows FROM lr_temp_table ;
	SET @rowCounter=0;

	while @rowCounter <= @noOfRows do
		SET @asd = CONCAT('SELECT empId INTO @employeeId FROM lr_temp_table LIMIT ',@rowCounter,',',1);
	  	PREPARE zxc FROM @asd;
	  	EXECUTE zxc;
	  	SELECT COUNT(*) INTO @daysPresent FROM users_attendance WHERE employeeId= @employeeId AND (DATE BETWEEN fromDate AND  toDate);
		SET  @leaveDays= @totalDays -(@daysPresent + @holiday);
	   UPDATE lr_temp_table SET presentDays =@daysPresent,  leaveDays=@leaveDays  WHERE empId= @employeeId;
     	SET @rowCounter = @rowCounter + 1;
   END WHILE;
ELSE
	SELECT COUNT(*) INTO @daysPresent FROM users_attendance WHERE employeeId=emplId AND (DATE BETWEEN fromDate AND  toDate);
	SET  @leaveDays= @totalDays -(@daysPresent + @holiday);
 	INSERT INTO  lr_temp_table SELECT employeeId, userName, @leaveDays, @totalDays, @daysPresent, @holiday  FROM users WHERE employeeId = emplId ;

End if;

	select * from  lr_temp_table order by  empId desc;
 	DROP TEMPORARY TABLE IF EXISTS lr_temp_table;

END//
DELIMITER ;

/*!40103 SET TIME_ZONE=IFNULL(@OLD_TIME_ZONE, 'system') */;
/*!40101 SET SQL_MODE=IFNULL(@OLD_SQL_MODE, '') */;
/*!40014 SET FOREIGN_KEY_CHECKS=IFNULL(@OLD_FOREIGN_KEY_CHECKS, 1) */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40111 SET SQL_NOTES=IFNULL(@OLD_SQL_NOTES, 1) */;
