-- --------------------------------------------------------
-- Host:                         127.0.0.1
-- Server version:               8.0.35 - MySQL Community Server - GPL
-- Server OS:                    Win64
-- HeidiSQL Version:             12.6.0.6765
-- --------------------------------------------------------

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET NAMES utf8 */;
/*!50503 SET NAMES utf8mb4 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;


-- Dumping database structure for data_process
CREATE DATABASE IF NOT EXISTS `data_process` /*!40100 DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci */ /*!80016 DEFAULT ENCRYPTION='N' */;
USE `data_process`;

-- Dumping structure for table data_process.access_privilege
CREATE TABLE IF NOT EXISTS `access_privilege` (
  `accessId` varchar(50) NOT NULL DEFAULT 'AUTO_INCREMENT',
  `groupName` varchar(50) NOT NULL,
  `requestName` varchar(50) NOT NULL,
  `requestPath` varchar(50) NOT NULL,
  `status` bit(1) NOT NULL DEFAULT b'1'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- Dumping data for table data_process.access_privilege: ~61 rows (approximately)
INSERT INTO `access_privilege` (`accessId`, `groupName`, `requestName`, `requestPath`, `status`) VALUES
	('AddUser', 'User', 'Add User', '/addUser', b'1'),
	('AddUserSKills', 'Admin', 'Add User SKills', '/addUserSkill', b'1'),
	('BlockUser', 'User', 'Block User', '/blockUser', b'1'),
	('ActiveRoleList', 'Role', 'Active Role List', '/getActiveRoleList', b'1'),
	('ActiveSkillSetList', 'Admin', 'Active Skill Set List', '/getActiveSkillSetList', b'1'),
	('DepartmentList', 'Task', 'Department List', '/getDepartmentList/**', b'1'),
	('ResourceGroupByEmployeeAndDivision', 'Task', 'Resource Group By Employee And Division', '/getGroupList/{divisionId}', b'1'),
	('ResourceTeamByEmployeeAndRole', 'Task', 'Resource Team By Employee And Role', '/getTeamList/{skillId}/{groupId}', b'1'),
	('GetUserByProducer', 'User', 'Get User By Producer', '/getUserByProducer', b'1'),
	('UserRolesSearch', 'User', 'User Roles Search', '/getUserRoleList/{search}', b'1'),
	('SearchRoles', 'Role', 'Search Roles', '/searchRole', b'1'),
	('SearchUser', 'User', 'Search User', '/searchUser', b'1'),
	('UpdateHRRecord', 'User', 'Update HR Record', '/updateHRRecord', b'1'),
	('UpdateUser', 'User', 'Update User ', '/updateUser', b'1'),
	('CityList', 'User', 'City List', '/searchCity', b'1'),
	('OperationalSearch', 'Task', 'Operational Search', '/searchOperations', b'1'),
	('UpdateOperationalRecord', 'Admin', 'Update Operational Record', '/updateOperationalRecord', b'1'),
	('GetAssignedQueueList', 'Task', 'Get Assigned Queue List', '/getQueueList', b'1'),
	('GetTasks', 'Task', 'Get Tasks', '/searchTask', b'1'),
	('UpdateTask', 'Task', 'Update Task', '/updateTask', b'1'),
	('CountryList', 'User', 'Country List', '/searchCountry', b'1'),
	('StateList', 'User', 'State List', '/searchState', b'1'),
	('ActiveRoleListDivisionId', 'Role', 'Active Role By Division', '/getActiveRoleList/{divisionId}', b'1'),
	('DistrictList', 'User', 'DistrictList', '/searchDistrict', b'1'),
	('ResourceGroupByEmployee', 'Task', 'Resource Group By Employee', '/getGroupList', b'1'),
	('ReAllocateTask', 'Task', 'ReAllocate Task', '/reAllocateTask', b'1'),
	('GetAllotedUserGroup', 'Admin', 'Get Assigned Queue List', '/getAllotedUserGroup', b'1'),
	('GetDivisionList', 'Task', 'Get Division List', '/getDivisionList', b'1'),
	('GetDivisionListDepartmentId', 'Task', 'Get Division List', '/getDivisionList/{departmentId}', b'1'),
	('GetHRRecords', 'User', 'Get HR Records', '/getHRRecord', b'1'),
	('GetProjectsList', 'Task', 'Get Projects List', '/getProjectList/{divisionId}', b'1'),
	('GetTaskUsersList', 'Task', 'Get Task Users List', '/getTaskUsersList/{skillSet}', b'1'),
	('GetUser', 'User', 'Get User', '/getUser', b'1'),
	('GetUserSkillMatrix', 'Admin', 'Get User Skill Matrix', '/getSkillSetMatrixList', b'1'),
	('GetUserSkillSet', 'Admin', 'Get User Skill Set', '/getSkillSetList/{search}', b'1'),
	('UIHeaderMenu', 'Menu', 'UI Header Menu', '/getHeaderMenu', b'1'),
	('SearchApprovalAttendance', 'Attendance', 'Search Approval Attendance', '/searchApprovalAttendance', b'1'),
	('ApproveAttendance', 'Attendance', 'Approve Attendance ', '/approveAttendance', b'1'),
	('MarkAttendance', 'Attendance', 'Mark Attendance', '/markAttendance', b'1'),
	('AttendanceComboList', 'Attendance', 'Attendance Combo List', '/getAttendanceComboList', b'1'),
	('SearchTimesheet', 'Timesheet', 'SearchTimesheet', '/searchTimesheet', b'1'),
	('SaveDailyActivity', 'Timesheet', 'Save Daily Activity', '/saveDailyLog', b'1'),
	('SubmitDailyActivityLogs', 'Timesheet', 'Submit Daily Activity Logs', '/submitDailyLog', b'1'),
	('GetDailyActivity', 'Timesheet', 'Get Daily  Activity', '/getDailyActivities', b'1'),
	('ApprovalTimesheet', 'Timesheet', 'Approval Timesheet', '/approveTimesheet', b'1'),
	('DeleteDailyActivityLogs', 'Timesheet', 'Submit Daily Activity Logs', '/deleteDailyLog', b'1'),
	('GetProcessList', 'Timesheet', 'Get Process List', '/getProcessList', b'1'),
	('StartScheduler', 'Scheduler', 'StartScheduler', '/startScheduler', b'1'),
	('SearchScheduler', 'Scheduler', 'Search Scheduler', '/searchScheduler', b'1'),
	('GetHierarchcyUsersList', 'User', 'Get Hierarchcy Users List', '/getUserList', b'1'),
	('SearchTimesheetApproval', 'Timesheet', 'Search Timesheet Approval', '/searchApprovalTimesheet', b'1'),
	('ApprovalLeave', 'Leave', 'Approval Leave', '/approveLeave', b'1'),
	('SearchLeave', 'Leave', 'Search Leave', '/searchLeave', b'1'),
	('SelectedActiveRoleList', 'Role', 'Selected Active Role List', '/getSelectedRoleList/{divisionId}', b'1'),
	('ResourceGroupByEmployee', 'Task', 'Resource Group By Employee', '/getAllGroupList/{type}', b'1'),
	('ResourceTeamByEmployeeAndRole', 'Task', 'Resource Team By Employee And Role', '/getTeamList/{skillId}', b'1'),
	('ChangePassword', 'User', 'Change Password', '/updatePassword', b'1'),
	('ApplyLeave', 'Leave', 'Apply Leave', '/applyLeave', b'1'),
	('CancelLeave', 'Leave', 'Cancel Leave', '/cancelLeave', b'1'),
	('MarkAttendanceBehalf', 'Attendance', 'Mark Attendance On Behalf', '/markAttendanceOnBehalf', b'1'),
	('SearchApprovalLeave', 'Leave', 'Search Approval Leave', '/searchApprovalLeave', b'1');

-- Dumping structure for table data_process.access_privilege_role
CREATE TABLE IF NOT EXISTS `access_privilege_role` (
  `autoId` int NOT NULL AUTO_INCREMENT,
  `accessId` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `roleId` varchar(50) NOT NULL,
  PRIMARY KEY (`autoId`)
) ENGINE=InnoDB AUTO_INCREMENT=100082 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- Dumping data for table data_process.access_privilege_role: ~61 rows (approximately)
INSERT INTO `access_privilege_role` (`autoId`, `accessId`, `roleId`) VALUES
	(100000, 'ActiveSkillSetList', 'Admin'),
	(100001, 'AddUserSKills', 'Admin'),
	(100002, 'GetAllotedUserGroup', 'Admin'),
	(100003, 'GetUserSkillMatrix', 'Admin'),
	(100004, 'GetUserSkillSet', 'Admin'),
	(100005, 'UpdateOperationalRecord', 'Admin'),
	(100006, 'ApproveAttendance', 'Admin'),
	(100007, 'AttendanceComboList', 'Admin'),
	(100008, 'MarkAttendanceBehalf', 'Admin'),
	(100009, 'SearchApprovalAttendance', 'Admin'),
	(100011, 'ApprovalLeave', 'Admin'),
	(100013, 'SearchApprovalLeave', 'Admin'),
	(100015, 'ActiveRoleList', 'Admin'),
	(100016, 'ActiveRoleListDivisionId', 'Admin'),
	(100017, 'SearchRoles', 'Admin'),
	(100018, 'SelectedActiveRoleList', 'Admin'),
	(100019, 'SearchScheduler', 'Admin'),
	(100020, 'StartScheduler', 'Admin'),
	(100021, 'DepartmentList', 'Admin'),
	(100022, 'GetAssignedQueueList', 'Admin'),
	(100023, 'GetDivisionList', 'Admin'),
	(100024, 'GetDivisionListDepartmentId', 'Admin'),
	(100026, 'GetTasks', 'Admin'),
	(100027, 'GetTaskUsersList', 'Admin'),
	(100028, 'OperationalSearch', 'Admin'),
	(100029, 'ReAllocateTask', 'Admin'),
	(100030, 'ResourceGroupByEmployee', 'Admin'),
	(100031, 'ResourceGroupByEmployee', 'Admin'),
	(100032, 'ResourceGroupByEmployeeAndDivision', 'Admin'),
	(100033, 'ResourceTeamByEmployeeAndRole', 'Admin'),
	(100034, 'ResourceTeamByEmployeeAndRole', 'Admin'),
	(100035, 'UpdateTask', 'Admin'),
	(100036, 'ApprovalTimesheet', 'Admin'),
	(100042, 'SearchTimesheetApproval', 'Admin'),
	(100044, 'AddUser', 'Admin'),
	(100045, 'BlockUser', 'Admin'),
	(100050, 'GetHierarchcyUsersList', 'Admin'),
	(100054, 'SearchUser', 'Admin'),
	(100056, 'UpdateHRRecord', 'Admin'),
	(100058, 'UserRolesSearch', 'Admin'),
	(100061, 'UIHeaderMenu', 'Employee'),
	(100062, 'ChangePassword', 'Employee'),
	(100063, 'GetUser', 'Employee'),
	(100064, 'GetUserByProducer', 'Employee'),
	(100065, 'UpdateUser', 'Employee'),
	(100066, 'CityList', 'Employee'),
	(100067, 'DistrictList', 'Employee'),
	(100068, 'StateList', 'Employee'),
	(100069, 'CountryList', 'Employee'),
	(100070, 'GetHRRecords', 'Employee'),
	(100071, 'MarkAttendance', 'Employee'),
	(100072, 'SearchLeave', 'Employee'),
	(100073, 'ApplyLeave', 'Employee'),
	(100074, 'CancelLeave', 'Employee'),
	(100075, 'SearchTimesheet', 'Employee'),
	(100076, 'GetProjectsList', 'Employee'),
	(100077, 'GetProcessList', 'Employee'),
	(100078, 'GetDailyActivity', 'Employee'),
	(100079, 'SaveDailyActivity', 'Employee'),
	(100080, 'SubmitDailyActivityLogs', 'Employee'),
	(100081, 'DeleteDailyActivityLogs', 'Employee');

-- Dumping structure for table data_process.application_schedulers
CREATE TABLE IF NOT EXISTS `application_schedulers` (
  `schedulerId` varchar(50) NOT NULL,
  `batchName` varchar(50) NOT NULL,
  `batchTime` varchar(50) NOT NULL,
  `batchStatus` varchar(50) NOT NULL,
  `batchEvent` varchar(50) NOT NULL,
  `description` varchar(500) DEFAULT NULL,
  `eventTrack` longtext,
  `executedBy` varchar(50) DEFAULT NULL,
  `lastExecutionTime` datetime DEFAULT NULL,
  `nextScheduledTime` datetime DEFAULT NULL,
  `retry` varchar(500) DEFAULT NULL,
  `status` bit(1) NOT NULL DEFAULT b'1',
  PRIMARY KEY (`schedulerId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- Dumping data for table data_process.application_schedulers: ~6 rows (approximately)
INSERT INTO `application_schedulers` (`schedulerId`, `batchName`, `batchTime`, `batchStatus`, `batchEvent`, `description`, `eventTrack`, `executedBy`, `lastExecutionTime`, `nextScheduledTime`, `retry`, `status`) VALUES
	('DailyAttendance', 'DailyAttendance', 'RUN_ON_00AM_12PM_3PM', 'Pending', 'Default', 'RUN_ON_00AM_12PM_3PM', NULL, NULL, NULL, NULL, '{ "count" : 0, "maxCount": 1}\r\n	', b'1'),
	('HolidayAttendance', 'HolidayAttendance', 'MIDNIGHT_12', 'Pending', 'Default', 'MIDNIGHT_12', NULL, NULL, NULL, NULL, '{ "count" : 0, "maxCount": 1}\r\n	', b'1'),
	('LockOnPayRoll', 'LockOnPayRoll', 'MIDNIGHT_12_ON_DAY3', 'Pending', 'Default', 'MIDNIGHT_12_ON_DAY3', NULL, NULL, NULL, NULL, '{ "count" : 0, "maxCount": 1}\r\n	', b'0'),
	('LockOnWeek', 'LockOnWeek', 'MIDNIGHT_12_TUESDAY', 'Pending', 'Default', 'MIDNIGHT_12_TUESDAY', NULL, NULL, NULL, NULL, '{ "count" : 0, "maxCount": 1}\r\n	', b'1'),
	('MarkAbsentees', 'MarkAbsentees', 'MIDNIGHT_12', 'Pending', 'Default', 'MIDNIGHT_12', NULL, NULL, NULL, NULL, '{ "count" : 0, "maxCount": 1}\r\n	', b'1'),
	('WeekEndHolidayAttendance', 'WeekEndHolidayAttendance', 'ON_DECEMBER_31', 'Pending', 'Default', 'ON_DECEMBER_31', NULL, NULL, NULL, NULL, '{ "count" : 0, "maxCount": 1}\r\n	', b'1');

-- Dumping structure for table data_process.citys
CREATE TABLE IF NOT EXISTS `citys` (
  `city` varchar(50) NOT NULL,
  `state` varchar(50) DEFAULT NULL,
  `zipCode` varchar(10) DEFAULT NULL,
  `status` bit(1) DEFAULT b'1',
  PRIMARY KEY (`city`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- Dumping data for table data_process.citys: ~18 rows (approximately)
INSERT INTO `citys` (`city`, `state`, `zipCode`, `status`) VALUES
	('Bangalore', 'Karnataka', NULL, b'1'),
	('Chennai', 'Tamil Nadu', NULL, b'1'),
	('Coimbatore', 'Tamil Nadu', NULL, b'1'),
	('Dharmapuri', 'Tamil Nadu', NULL, b'1'),
	('Erode', 'Tamil Nadu', NULL, b'1'),
	('Hyderabad', 'Andhra Pradesh', NULL, b'1'),
	('Kanyakumari', 'Tamil Nadu', NULL, b'1'),
	('Kodaikanal', 'Tamil Nadu', NULL, b'1'),
	('Madurai', 'Tamil Nadu', NULL, b'1'),
	('Mysore', 'Karnataka', NULL, b'1'),
	('Nammakkal', 'Tamil Nadu', NULL, b'1'),
	('Ooty', 'Tamil Nadu', NULL, b'1'),
	('Salem', 'Tamil Nadu', NULL, b'1'),
	('Theni', 'Tamil Nadu', NULL, b'1'),
	('Thenkasi', 'Tamil Nadu', NULL, b'1'),
	('Tirunelveli', 'Tamil Nadu', NULL, b'1'),
	('Trichy', 'Tamil Nadu', NULL, b'1'),
	('Vizagapatnam', 'Andhra Pradesh', NULL, b'1');

-- Dumping structure for table data_process.countrys
CREATE TABLE IF NOT EXISTS `countrys` (
  `country` varchar(20) NOT NULL,
  `countryName` varchar(50) NOT NULL,
  `status` bit(1) NOT NULL DEFAULT b'0',
  `displayOrder` int NOT NULL DEFAULT '0',
  PRIMARY KEY (`country`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- Dumping data for table data_process.countrys: ~474 rows (approximately)
INSERT INTO `countrys` (`country`, `countryName`, `status`, `displayOrder`) VALUES
	('Africa/Abidjan', 'Africa/Abidjan', b'0', 0),
	('Africa/Accra', 'Africa/Accra', b'0', 0),
	('Africa/Addis_Ababa', 'Africa/Addis_Ababa', b'0', 0),
	('Africa/Algiers', 'Africa/Algiers', b'0', 0),
	('Africa/Asmara', 'Africa/Asmara', b'0', 0),
	('Africa/Asmera', 'Africa/Asmera', b'0', 0),
	('Africa/Bamako', 'Africa/Bamako', b'0', 0),
	('Africa/Bangui', 'Africa/Bangui', b'0', 0),
	('Africa/Banjul', 'Africa/Banjul', b'0', 0),
	('Africa/Bissau', 'Africa/Bissau', b'0', 0),
	('Africa/Blantyre', 'Africa/Blantyre', b'0', 0),
	('Africa/Brazzaville', 'Africa/Brazzaville', b'0', 0),
	('Africa/Bujumbura', 'Africa/Bujumbura', b'0', 0),
	('Africa/Cairo', 'Africa/Cairo', b'0', 0),
	('Africa/Casablanca', 'Africa/Casablanca', b'0', 0),
	('Africa/Ceuta', 'Africa/Ceuta', b'0', 0),
	('Africa/Conakry', 'Africa/Conakry', b'0', 0),
	('Africa/Dakar', 'Africa/Dakar', b'0', 0),
	('Africa/Dar_es_Salaam', 'Africa/Dar_es_Salaam', b'0', 0),
	('Africa/Djibouti', 'Africa/Djibouti', b'0', 0),
	('Africa/Douala', 'Africa/Douala', b'0', 0),
	('Africa/El_Aaiun', 'Africa/El_Aaiun', b'0', 0),
	('Africa/Freetown', 'Africa/Freetown', b'0', 0),
	('Africa/Gaborone', 'Africa/Gaborone', b'0', 0),
	('Africa/Harare', 'Africa/Harare', b'0', 0),
	('Africa/Johannesburg', 'Africa/Johannesburg', b'0', 0),
	('Africa/Juba', 'Africa/Juba', b'0', 0),
	('Africa/Kampala', 'Africa/Kampala', b'0', 0),
	('Africa/Khartoum', 'Africa/Khartoum', b'0', 0),
	('Africa/Kigali', 'Africa/Kigali', b'0', 0),
	('Africa/Kinshasa', 'Africa/Kinshasa', b'0', 0),
	('Africa/Lagos', 'Africa/Lagos', b'0', 0),
	('Africa/Libreville', 'Africa/Libreville', b'0', 0),
	('Africa/Lome', 'Africa/Lome', b'0', 0),
	('Africa/Luanda', 'Africa/Luanda', b'0', 0),
	('Africa/Lubumbashi', 'Africa/Lubumbashi', b'0', 0),
	('Africa/Lusaka', 'Africa/Lusaka', b'0', 0),
	('Africa/Malabo', 'Africa/Malabo', b'0', 0),
	('Africa/Maputo', 'Africa/Maputo', b'0', 0),
	('Africa/Maseru', 'Africa/Maseru', b'0', 0),
	('Africa/Mbabane', 'Africa/Mbabane', b'0', 0),
	('Africa/Mogadishu', 'Africa/Mogadishu', b'0', 0),
	('Africa/Monrovia', 'Africa/Monrovia', b'0', 0),
	('Africa/Nairobi', 'Africa/Nairobi', b'0', 0),
	('Africa/Ndjamena', 'Africa/Ndjamena', b'0', 0),
	('Africa/Niamey', 'Africa/Niamey', b'0', 0),
	('Africa/Nouakchott', 'Africa/Nouakchott', b'0', 0),
	('Africa/Ouagadougou', 'Africa/Ouagadougou', b'0', 0),
	('Africa/Porto-Novo', 'Africa/Porto-Novo', b'0', 0),
	('Africa/Sao_Tome', 'Africa/Sao_Tome', b'0', 0),
	('Africa/Timbuktu', 'Africa/Timbuktu', b'0', 0),
	('Africa/Tripoli', 'Africa/Tripoli', b'0', 0),
	('Africa/Tunis', 'Africa/Tunis', b'0', 0),
	('Africa/Windhoek', 'Africa/Windhoek', b'0', 0),
	('America/Adak', 'America/Adak', b'0', 0),
	('America/Anchorage', 'America/Anchorage', b'0', 0),
	('America/Anguilla', 'America/Anguilla', b'0', 0),
	('America/Antigua', 'America/Antigua', b'0', 0),
	('America/Araguaina', 'America/Araguaina', b'0', 0),
	('America/Aruba', 'America/Aruba', b'0', 0),
	('America/Asuncion', 'America/Asuncion', b'0', 0),
	('America/Atikokan', 'America/Atikokan', b'0', 0),
	('America/Atka', 'America/Atka', b'0', 0),
	('America/Bahia', 'America/Bahia', b'0', 0),
	('America/Barbados', 'America/Barbados', b'0', 0),
	('America/Belem', 'America/Belem', b'0', 0),
	('America/Belize', 'America/Belize', b'0', 0),
	('America/Blanc-Sablon', 'America/Blanc-Sablon', b'0', 0),
	('America/Boa_Vista', 'America/Boa_Vista', b'0', 0),
	('America/Bogota', 'America/Bogota', b'0', 0),
	('America/Boise', 'America/Boise', b'0', 0),
	('America/Buenos_Aires', 'America/Buenos_Aires', b'0', 0),
	('America/Campo_Grande', 'America/Campo_Grande', b'0', 0),
	('America/Cancun', 'America/Cancun', b'0', 0),
	('America/Caracas', 'America/Caracas', b'0', 0),
	('America/Catamarca', 'America/Catamarca', b'0', 0),
	('America/Cayenne', 'America/Cayenne', b'0', 0),
	('America/Cayman', 'America/Cayman', b'0', 0),
	('America/Chicago', 'America/Chicago', b'0', 0),
	('America/Chihuahua', 'America/Chihuahua', b'0', 0),
	('America/Cordoba', 'America/Cordoba', b'0', 0),
	('America/Costa_Rica', 'America/Costa_Rica', b'0', 0),
	('America/Creston', 'America/Creston', b'0', 0),
	('America/Cuiaba', 'America/Cuiaba', b'0', 0),
	('America/Curacao', 'America/Curacao', b'0', 0),
	('America/Danmarkshavn', 'America/Danmarkshavn', b'0', 0),
	('America/Dawson', 'America/Dawson', b'0', 0),
	('America/Dawson_Creek', 'America/Dawson_Creek', b'0', 0),
	('America/Denver', 'America/Denver', b'0', 0),
	('America/Detroit', 'America/Detroit', b'0', 0),
	('America/Dominica', 'America/Dominica', b'0', 0),
	('America/Edmonton', 'America/Edmonton', b'0', 0),
	('America/Eirunepe', 'America/Eirunepe', b'0', 0),
	('America/El_Salvador', 'America/El_Salvador', b'0', 0),
	('America/Ensenada', 'America/Ensenada', b'0', 0),
	('America/Fort_Nelson', 'America/Fort_Nelson', b'0', 0),
	('America/Fort_Wayne', 'America/Fort_Wayne', b'0', 0),
	('America/Fortaleza', 'America/Fortaleza', b'0', 0),
	('America/Glace_Bay', 'America/Glace_Bay', b'0', 0),
	('America/Godthab', 'America/Godthab', b'0', 0),
	('America/Goose_Bay', 'America/Goose_Bay', b'0', 0),
	('America/Grand_Turk', 'America/Grand_Turk', b'0', 0),
	('America/Grenada', 'America/Grenada', b'0', 0),
	('America/Guadeloupe', 'America/Guadeloupe', b'0', 0),
	('America/Guatemala', 'America/Guatemala', b'0', 0),
	('America/Guayaquil', 'America/Guayaquil', b'0', 0),
	('America/Guyana', 'America/Guyana', b'0', 0),
	('America/Halifax', 'America/Halifax', b'0', 0),
	('America/Havana', 'America/Havana', b'0', 0),
	('America/Hermosillo', 'America/Hermosillo', b'0', 0),
	('America/Indiana/Knox', 'America/Indiana/Knox', b'0', 0),
	('America/Indianapolis', 'America/Indianapolis', b'0', 0),
	('America/Inuvik', 'America/Inuvik', b'0', 0),
	('America/Iqaluit', 'America/Iqaluit', b'0', 0),
	('America/Jamaica', 'America/Jamaica', b'0', 0),
	('America/Jujuy', 'America/Jujuy', b'0', 0),
	('America/Juneau', 'America/Juneau', b'0', 0),
	('America/Knox_IN', 'America/Knox_IN', b'0', 0),
	('America/Kralendijk', 'America/Kralendijk', b'0', 0),
	('America/La_Paz', 'America/La_Paz', b'0', 0),
	('America/Lima', 'America/Lima', b'0', 0),
	('America/Los_Angeles', 'America/Los_Angeles', b'0', 0),
	('America/Louisville', 'America/Louisville', b'0', 0),
	('America/Maceio', 'America/Maceio', b'0', 0),
	('America/Managua', 'America/Managua', b'0', 0),
	('America/Manaus', 'America/Manaus', b'0', 0),
	('America/Marigot', 'America/Marigot', b'0', 0),
	('America/Martinique', 'America/Martinique', b'0', 0),
	('America/Matamoros', 'America/Matamoros', b'0', 0),
	('America/Mazatlan', 'America/Mazatlan', b'0', 0),
	('America/Mendoza', 'America/Mendoza', b'0', 0),
	('America/Menominee', 'America/Menominee', b'0', 0),
	('America/Merida', 'America/Merida', b'0', 0),
	('America/Metlakatla', 'America/Metlakatla', b'0', 0),
	('America/Mexico_City', 'America/Mexico_City', b'0', 0),
	('America/Miquelon', 'America/Miquelon', b'0', 0),
	('America/Moncton', 'America/Moncton', b'0', 0),
	('America/Monterrey', 'America/Monterrey', b'0', 0),
	('America/Montevideo', 'America/Montevideo', b'0', 0),
	('America/Montreal', 'America/Montreal', b'0', 0),
	('America/Montserrat', 'America/Montserrat', b'0', 0),
	('America/Nassau', 'America/Nassau', b'0', 0),
	('America/New_York', 'America/New_York', b'0', 0),
	('America/Nipigon', 'America/Nipigon', b'0', 0),
	('America/Nome', 'America/Nome', b'0', 0),
	('America/Noronha', 'America/Noronha', b'0', 0),
	('America/Ojinaga', 'America/Ojinaga', b'0', 0),
	('America/Panama', 'America/Panama', b'0', 0),
	('America/Pangnirtung', 'America/Pangnirtung', b'0', 0),
	('America/Paramaribo', 'America/Paramaribo', b'0', 0),
	('America/Phoenix', 'America/Phoenix', b'0', 0),
	('America/Porto_Acre', 'America/Porto_Acre', b'0', 0),
	('America/Porto_Velho', 'America/Porto_Velho', b'0', 0),
	('America/Puerto_Rico', 'America/Puerto_Rico', b'0', 0),
	('America/Punta_Arenas', 'America/Punta_Arenas', b'0', 0),
	('America/Rainy_River', 'America/Rainy_River', b'0', 0),
	('America/Rankin_Inlet', 'America/Rankin_Inlet', b'0', 0),
	('America/Recife', 'America/Recife', b'0', 0),
	('America/Regina', 'America/Regina', b'0', 0),
	('America/Resolute', 'America/Resolute', b'0', 0),
	('America/Rio_Branco', 'America/Rio_Branco', b'0', 0),
	('America/Rosario', 'America/Rosario', b'0', 0),
	('America/Santa_Isabel', 'America/Santa_Isabel', b'0', 0),
	('America/Santarem', 'America/Santarem', b'0', 0),
	('America/Santiago', 'America/Santiago', b'0', 0),
	('America/Sao_Paulo', 'America/Sao_Paulo', b'0', 0),
	('America/Scoresbysund', 'America/Scoresbysund', b'0', 0),
	('America/Shiprock', 'America/Shiprock', b'0', 0),
	('America/Sitka', 'America/Sitka', b'0', 0),
	('America/St_Johns', 'America/St_Johns', b'0', 0),
	('America/St_Kitts', 'America/St_Kitts', b'0', 0),
	('America/St_Lucia', 'America/St_Lucia', b'0', 0),
	('America/St_Thomas', 'America/St_Thomas', b'0', 0),
	('America/St_Vincent', 'America/St_Vincent', b'0', 0),
	('America/Tegucigalpa', 'America/Tegucigalpa', b'0', 0),
	('America/Thule', 'America/Thule', b'0', 0),
	('America/Thunder_Bay', 'America/Thunder_Bay', b'0', 0),
	('America/Tijuana', 'America/Tijuana', b'0', 0),
	('America/Toronto', 'America/Toronto', b'0', 0),
	('America/Tortola', 'America/Tortola', b'0', 0),
	('America/Vancouver', 'America/Vancouver', b'0', 0),
	('America/Virgin', 'America/Virgin', b'0', 0),
	('America/Whitehorse', 'America/Whitehorse', b'0', 0),
	('America/Winnipeg', 'America/Winnipeg', b'0', 0),
	('America/Yakutat', 'America/Yakutat', b'0', 0),
	('America/Yellowknife', 'America/Yellowknife', b'0', 0),
	('Antarctica/Casey', 'Antarctica/Casey', b'0', 0),
	('Antarctica/Davis', 'Antarctica/Davis', b'0', 0),
	('Antarctica/Macquarie', 'Antarctica/Macquarie', b'0', 0),
	('Antarctica/Mawson', 'Antarctica/Mawson', b'0', 0),
	('Antarctica/McMurdo', 'Antarctica/McMurdo', b'0', 0),
	('Antarctica/Palmer', 'Antarctica/Palmer', b'0', 0),
	('Antarctica/Rothera', 'Antarctica/Rothera', b'0', 0),
	('Antarctica/Syowa', 'Antarctica/Syowa', b'0', 0),
	('Antarctica/Troll', 'Antarctica/Troll', b'0', 0),
	('Antarctica/Vostok', 'Antarctica/Vostok', b'0', 0),
	('Arctic/Longyearbyen', 'Arctic/Longyearbyen', b'0', 0),
	('Asia/Aden', 'Asia/Aden', b'0', 0),
	('Asia/Almaty', 'Asia/Almaty', b'0', 0),
	('Asia/Amman', 'Asia/Amman', b'0', 0),
	('Asia/Anadyr', 'Asia/Anadyr', b'0', 0),
	('Asia/Aqtau', 'Asia/Aqtau', b'0', 0),
	('Asia/Aqtobe', 'Asia/Aqtobe', b'0', 0),
	('Asia/Ashgabat', 'Asia/Ashgabat', b'0', 0),
	('Asia/Ashkhabad', 'Asia/Ashkhabad', b'0', 0),
	('Asia/Atyrau', 'Asia/Atyrau', b'0', 0),
	('Asia/Baghdad', 'Asia/Baghdad', b'0', 0),
	('Asia/Bahrain', 'Bahrain', b'0', 12),
	('Asia/Baku', 'Asia/Baku', b'0', 0),
	('Asia/Bangkok', 'Thailand', b'0', 15),
	('Asia/Barnaul', 'Asia/Barnaul', b'0', 0),
	('Asia/Beirut', 'Asia/Beirut', b'0', 0),
	('Asia/Bishkek', 'Asia/Bishkek', b'0', 0),
	('Asia/Brunei', 'Asia/Brunei', b'0', 0),
	('Asia/Calcutta', 'Asia/Calcutta', b'0', 0),
	('Asia/Chita', 'Asia/Chita', b'0', 0),
	('Asia/Choibalsan', 'Asia/Choibalsan', b'0', 0),
	('Asia/Chongqing', 'Asia/Chongqing', b'0', 0),
	('Asia/Chungking', 'Asia/Chungking', b'0', 0),
	('Asia/Colombo', 'Sri Lanka', b'0', 3),
	('Asia/Damascus', 'Asia/Damascus', b'0', 0),
	('Asia/Dhaka', 'Bangladesh', b'0', 17),
	('Asia/Dili', 'Asia/Dili', b'0', 0),
	('Asia/Dubai', 'Dubai', b'0', 13),
	('Asia/Dushanbe', 'Asia/Dushanbe', b'0', 0),
	('Asia/Famagusta', 'Asia/Famagusta', b'0', 0),
	('Asia/Gaza', 'Asia/Gaza', b'0', 0),
	('Asia/Harbin', 'Asia/Harbin', b'0', 0),
	('Asia/Hebron', 'Asia/Hebron', b'0', 0),
	('Asia/Ho_Chi_Minh', 'Asia/Ho_Chi_Minh', b'0', 0),
	('Asia/Hong_Kong', 'Asia/Hong_Kong', b'0', 0),
	('Asia/Hovd', 'Asia/Hovd', b'0', 0),
	('Asia/Irkutsk', 'Asia/Irkutsk', b'0', 0),
	('Asia/Istanbul', 'Asia/Istanbul', b'0', 0),
	('Asia/Jakarta', 'Indonesia', b'0', 4),
	('Asia/Jayapura', 'Asia/Jayapura', b'0', 0),
	('Asia/Jerusalem', 'Asia/Jerusalem', b'0', 0),
	('Asia/Kabul', 'Pakistan', b'0', 22),
	('Asia/Kamchatka', 'Asia/Kamchatka', b'0', 0),
	('Asia/Karachi', 'Asia/Karachi', b'0', 0),
	('Asia/Kashgar', 'Asia/Kashgar', b'0', 0),
	('Asia/Kathmandu', 'Nepal', b'0', 23),
	('Asia/Katmandu', 'Asia/Katmandu', b'0', 14),
	('Asia/Khandyga', 'Asia/Khandyga', b'0', 0),
	('Asia/Kolkata', 'India', b'1', 1),
	('Asia/Krasnoyarsk', 'Asia/Krasnoyarsk', b'0', 0),
	('Asia/Kuala_Lumpur', 'Malaysia', b'0', 5),
	('Asia/Kuching', 'Asia/Kuching', b'0', 0),
	('Asia/Kuwait', 'Kuwait', b'0', 19),
	('Asia/Macao', 'Asia/Macao', b'0', 0),
	('Asia/Macau', 'Asia/Macau', b'0', 0),
	('Asia/Magadan', 'Asia/Magadan', b'0', 0),
	('Asia/Makassar', 'Asia/Makassar', b'0', 0),
	('Asia/Manila', 'Phillippines', b'0', 20),
	('Asia/Muscat', 'Oman', b'0', 6),
	('Asia/Nicosia', 'Asia/Nicosia', b'0', 0),
	('Asia/Novokuznetsk', 'Asia/Novokuznetsk', b'0', 0),
	('Asia/Novosibirsk', 'Asia/Novosibirsk', b'0', 0),
	('Asia/Omsk', 'Asia/Omsk', b'0', 0),
	('Asia/Oral', 'Asia/Oral', b'0', 0),
	('Asia/Phnom_Penh', 'Asia/Phnom_Penh', b'0', 0),
	('Asia/Pontianak', 'Asia/Pontianak', b'0', 0),
	('Asia/Pyongyang', 'Asia/Pyongyang', b'0', 0),
	('Asia/Qatar', 'Qatar', b'0', 7),
	('Asia/Qyzylorda', 'Asia/Qyzylorda', b'0', 0),
	('Asia/Rangoon', 'Asia/Rangoon', b'0', 0),
	('Asia/Riyadh', 'Riyadh', b'0', 8),
	('Asia/Saigon', 'Asia/Saigon', b'0', 0),
	('Asia/Sakhalin', 'Asia/Sakhalin', b'0', 0),
	('Asia/Samarkand', 'Asia/Samarkand', b'0', 0),
	('Asia/Seoul', 'Asia/Seoul', b'0', 0),
	('Asia/Shanghai', 'Asia/Shanghai', b'0', 0),
	('Asia/Singapore', 'Singapore', b'0', 2),
	('Asia/Srednekolymsk', 'Asia/Srednekolymsk', b'0', 0),
	('Asia/Taipei', 'Asia/Taipei', b'0', 0),
	('Asia/Tashkent', 'Asia/Tashkent', b'0', 0),
	('Asia/Tbilisi', 'Asia/Tbilisi', b'0', 0),
	('Asia/Tehran', 'Asia/Tehran', b'0', 0),
	('Asia/Tel_Aviv', 'Asia/Tel_Aviv', b'0', 0),
	('Asia/Thimbu', 'Asia/Thimbu', b'0', 0),
	('Asia/Thimphu', 'Asia/Thimphu', b'0', 0),
	('Asia/Tokyo', 'Asia/Tokyo', b'0', 0),
	('Asia/Tomsk', 'Asia/Tomsk', b'0', 0),
	('Asia/Ujung_Pandang', 'Asia/Ujung_Pandang', b'0', 0),
	('Asia/Ulaanbaatar', 'Asia/Ulaanbaatar', b'0', 0),
	('Asia/Ulan_Bator', 'Asia/Ulan_Bator', b'0', 0),
	('Asia/Urumqi', 'Asia/Urumqi', b'0', 0),
	('Asia/Ust-Nera', 'Asia/Ust-Nera', b'0', 0),
	('Asia/Vientiane', 'Asia/Vientiane', b'0', 0),
	('Asia/Vladivostok', 'Asia/Vladivostok', b'0', 0),
	('Asia/Yakutsk', 'Asia/Yakutsk', b'0', 0),
	('Asia/Yangon', 'Asia/Yangon', b'0', 0),
	('Asia/Yekaterinburg', 'Asia/Yekaterinburg', b'0', 0),
	('Asia/Yerevan', 'Asia/Yerevan', b'0', 0),
	('Atlantic/Azores', 'Atlantic/Azores', b'0', 0),
	('Atlantic/Bermuda', 'Atlantic/Bermuda', b'0', 0),
	('Atlantic/Canary', 'Atlantic/Canary', b'0', 0),
	('Atlantic/Cape_Verde', 'Atlantic/Cape_Verde', b'0', 0),
	('Atlantic/Faeroe', 'Atlantic/Faeroe', b'0', 0),
	('Atlantic/Faroe', 'Atlantic/Faroe', b'0', 0),
	('Atlantic/Jan_Mayen', 'Atlantic/Jan_Mayen', b'0', 0),
	('Atlantic/Madeira', 'Atlantic/Madeira', b'0', 0),
	('Atlantic/Reykjavik', 'Atlantic/Reykjavik', b'0', 0),
	('Atlantic/St_Helena', 'Atlantic/St_Helena', b'0', 0),
	('Atlantic/Stanley', 'Atlantic/Stanley', b'0', 0),
	('Australia/ACT', 'Australia/ACT', b'0', 0),
	('Australia/Adelaide', 'Australia/Adelaide', b'0', 0),
	('Australia/Brisbane', 'Australia/Brisbane', b'0', 0),
	('Australia/Canberra', 'Australia/Canberra', b'0', 0),
	('Australia/Currie', 'Australia/Currie', b'0', 0),
	('Australia/Darwin', 'Australia/Darwin', b'0', 0),
	('Australia/Eucla', 'Australia/Eucla', b'0', 0),
	('Australia/Hobart', 'Australia/Hobart', b'0', 0),
	('Australia/LHI', 'Australia/LHI', b'0', 0),
	('Australia/Lindeman', 'Australia/Lindeman', b'0', 0),
	('Australia/Lord_Howe', 'Australia/Lord_Howe', b'0', 0),
	('Australia/Melbourne', 'Australia/Melbourne', b'0', 0),
	('Australia/North', 'Australia/North', b'0', 0),
	('Australia/NSW', 'Australia/NSW', b'0', 0),
	('Australia/Perth', 'Australia/Perth', b'0', 0),
	('Australia/Queensland', 'Australia/Queensland', b'0', 0),
	('Australia/South', 'Australia/South', b'0', 0),
	('Australia/Sydney', 'Australia/Sydney', b'0', 0),
	('Australia/Tasmania', 'Australia/Tasmania', b'0', 0),
	('Australia/Victoria', 'Australia/Victoria', b'0', 0),
	('Australia/West', 'Australia/West', b'0', 0),
	('Australia/Yancowinna', 'Australia/Yancowinna', b'0', 0),
	('Brazil/Acre', 'Brazil/Acre', b'0', 0),
	('Brazil/DeNoronha', 'Brazil/DeNoronha', b'0', 0),
	('Brazil/East', 'Brazil/East', b'0', 0),
	('Brazil/West', 'Brazil/West', b'0', 0),
	('Canada/Atlantic', 'Canada/Atlantic', b'0', 0),
	('Canada/Central', 'Canada/Central', b'0', 0),
	('Canada/Eastern', 'Canada/Eastern', b'0', 0),
	('Canada/Mountain', 'Canada/Mountain', b'0', 0),
	('Canada/Newfoundland', 'Canada/Newfoundland', b'0', 0),
	('Canada/Pacific', 'Canada/Pacific', b'0', 0),
	('Canada/Saskatchewan', 'Canada/Saskatchewan', b'0', 0),
	('Canada/Yukon', 'Canada/Yukon', b'0', 0),
	('Chile/Continental', 'Chile/Continental', b'0', 0),
	('Chile/EasterIsland', 'Chile/EasterIsland', b'0', 0),
	('Europe/Amsterdam', 'Europe/Amsterdam', b'0', 0),
	('Europe/Andorra', 'Europe/Andorra', b'0', 0),
	('Europe/Astrakhan', 'Europe/Astrakhan', b'0', 0),
	('Europe/Athens', 'Europe/Athens', b'0', 0),
	('Europe/Belfast', 'Europe/Belfast', b'0', 0),
	('Europe/Belgrade', 'Europe/Belgrade', b'0', 0),
	('Europe/Berlin', 'Europe/Berlin', b'0', 0),
	('Europe/Bratislava', 'Europe/Bratislava', b'0', 0),
	('Europe/Brussels', 'Europe/Brussels', b'0', 0),
	('Europe/Bucharest', 'Europe/Bucharest', b'0', 0),
	('Europe/Budapest', 'Europe/Budapest', b'0', 0),
	('Europe/Busingen', 'Europe/Busingen', b'0', 0),
	('Europe/Chisinau', 'Europe/Chisinau', b'0', 0),
	('Europe/Copenhagen', 'Europe/Copenhagen', b'0', 0),
	('Europe/Dublin', 'Europe/Dublin', b'0', 0),
	('Europe/Gibraltar', 'Europe/Gibraltar', b'0', 0),
	('Europe/Guernsey', 'Europe/Guernsey', b'0', 0),
	('Europe/Helsinki', 'Europe/Helsinki', b'0', 0),
	('Europe/Isle_of_Man', 'Europe/Isle_of_Man', b'0', 0),
	('Europe/Istanbul', 'Europe/Istanbul', b'0', 0),
	('Europe/Jersey', 'Europe/Jersey', b'0', 0),
	('Europe/Kaliningrad', 'Europe/Kaliningrad', b'0', 0),
	('Europe/Kiev', 'Europe/Kiev', b'0', 0),
	('Europe/Kirov', 'Europe/Kirov', b'0', 0),
	('Europe/Lisbon', 'Europe/Lisbon', b'0', 0),
	('Europe/Ljubljana', 'Europe/Ljubljana', b'0', 0),
	('Europe/London', 'United Kingdom', b'0', 9),
	('Europe/Luxembourg', 'Europe/Luxembourg', b'0', 0),
	('Europe/Madrid', 'Europe/Madrid', b'0', 0),
	('Europe/Malta', 'Europe/Malta', b'0', 0),
	('Europe/Mariehamn', 'Europe/Mariehamn', b'0', 0),
	('Europe/Minsk', 'Europe/Minsk', b'0', 0),
	('Europe/Monaco', 'Europe/Monaco', b'0', 0),
	('Europe/Moscow', 'Europe/Moscow', b'0', 0),
	('Europe/Nicosia', 'Europe/Nicosia', b'0', 0),
	('Europe/Oslo', 'Europe/Oslo', b'0', 0),
	('Europe/Paris', 'Europe/Paris', b'0', 0),
	('Europe/Podgorica', 'Europe/Podgorica', b'0', 0),
	('Europe/Prague', 'Europe/Prague', b'0', 0),
	('Europe/Riga', 'Europe/Riga', b'0', 0),
	('Europe/Rome', 'Europe/Rome', b'0', 0),
	('Europe/Samara', 'Europe/Samara', b'0', 0),
	('Europe/San_Marino', 'Europe/San_Marino', b'0', 0),
	('Europe/Sarajevo', 'Europe/Sarajevo', b'0', 0),
	('Europe/Saratov', 'Europe/Saratov', b'0', 0),
	('Europe/Simferopol', 'Europe/Simferopol', b'0', 0),
	('Europe/Skopje', 'Europe/Skopje', b'0', 0),
	('Europe/Sofia', 'Europe/Sofia', b'0', 0),
	('Europe/Stockholm', 'Europe/Stockholm', b'0', 0),
	('Europe/Tallinn', 'Europe/Tallinn', b'0', 0),
	('Europe/Tirane', 'Europe/Tirane', b'0', 0),
	('Europe/Tiraspol', 'Europe/Tiraspol', b'0', 0),
	('Europe/Ulyanovsk', 'Europe/Ulyanovsk', b'0', 0),
	('Europe/Uzhgorod', 'Europe/Uzhgorod', b'0', 0),
	('Europe/Vaduz', 'Europe/Vaduz', b'0', 0),
	('Europe/Vatican', 'Europe/Vatican', b'0', 0),
	('Europe/Vienna', 'Europe/Vienna', b'0', 0),
	('Europe/Vilnius', 'Europe/Vilnius', b'0', 0),
	('Europe/Volgograd', 'Europe/Volgograd', b'0', 0),
	('Europe/Warsaw', 'Europe/Warsaw', b'0', 0),
	('Europe/Zagreb', 'Europe/Zagreb', b'0', 0),
	('Europe/Zaporozhye', 'Europe/Zaporozhye', b'0', 0),
	('Europe/Zurich', 'Europe/Zurich', b'0', 0),
	('Indian/Antananarivo', 'Indian/Antananarivo', b'0', 0),
	('Indian/Chagos', 'Indian/Chagos', b'0', 0),
	('Indian/Christmas', 'Indian/Christmas', b'0', 0),
	('Indian/Cocos', 'Indian/Cocos', b'0', 0),
	('Indian/Comoro', 'Indian/Comoro', b'0', 0),
	('Indian/Kerguelen', 'Indian/Kerguelen', b'0', 0),
	('Indian/Mahe', 'Mahe', b'0', 10),
	('Indian/Maldives', 'Maldives', b'0', 11),
	('Indian/Mauritius', 'Mauritius', b'0', 21),
	('Indian/Mayotte', 'Indian/Mayotte', b'0', 0),
	('Indian/Reunion', 'Indian/Reunion', b'0', 0),
	('Mexico/BajaNorte', 'Mexico/BajaNorte', b'0', 0),
	('Mexico/BajaSur', 'Mexico/BajaSur', b'0', 0),
	('Mexico/General', 'Mexico/General', b'0', 0),
	('Pacific/Apia', 'Pacific/Apia', b'0', 0),
	('Pacific/Auckland', 'Pacific/Auckland', b'0', 0),
	('Pacific/Bougainville', 'Pacific/Bougainville', b'0', 0),
	('Pacific/Chatham', 'Pacific/Chatham', b'0', 0),
	('Pacific/Chuuk', 'Pacific/Chuuk', b'0', 0),
	('Pacific/Easter', 'Pacific/Easter', b'0', 0),
	('Pacific/Efate', 'Pacific/Efate', b'0', 0),
	('Pacific/Enderbury', 'Pacific/Enderbury', b'0', 0),
	('Pacific/Fakaofo', 'Pacific/Fakaofo', b'0', 0),
	('Pacific/Fiji', 'Pacific/Fiji', b'0', 0),
	('Pacific/Funafuti', 'Pacific/Funafuti', b'0', 0),
	('Pacific/Galapagos', 'Pacific/Galapagos', b'0', 0),
	('Pacific/Gambier', 'Pacific/Gambier', b'0', 0),
	('Pacific/Guadalcanal', 'Pacific/Guadalcanal', b'0', 0),
	('Pacific/Guam', 'Pacific/Guam', b'0', 0),
	('Pacific/Honolulu', 'Pacific/Honolulu', b'0', 0),
	('Pacific/Johnston', 'Pacific/Johnston', b'0', 0),
	('Pacific/Kiritimati', 'Pacific/Kiritimati', b'0', 0),
	('Pacific/Kosrae', 'Pacific/Kosrae', b'0', 0),
	('Pacific/Kwajalein', 'Pacific/Kwajalein', b'0', 0),
	('Pacific/Majuro', 'Pacific/Majuro', b'0', 0),
	('Pacific/Marquesas', 'Pacific/Marquesas', b'0', 0),
	('Pacific/Midway', 'Pacific/Midway', b'0', 0),
	('Pacific/Nauru', 'Pacific/Nauru', b'0', 0),
	('Pacific/Niue', 'Pacific/Niue', b'0', 0),
	('Pacific/Norfolk', 'Pacific/Norfolk', b'0', 0),
	('Pacific/Noumea', 'Pacific/Noumea', b'0', 0),
	('Pacific/Pago_Pago', 'Pacific/Pago_Pago', b'0', 0),
	('Pacific/Palau', 'Pacific/Palau', b'0', 0),
	('Pacific/Pitcairn', 'Pacific/Pitcairn', b'0', 0),
	('Pacific/Pohnpei', 'Pacific/Pohnpei', b'0', 0),
	('Pacific/Ponape', 'Pacific/Ponape', b'0', 0),
	('Pacific/Port_Moresby', 'Pacific/Port_Moresby', b'0', 0),
	('Pacific/Rarotonga', 'Pacific/Rarotonga', b'0', 0),
	('Pacific/Saipan', 'Pacific/Saipan', b'0', 0),
	('Pacific/Samoa', 'Pacific/Samoa', b'0', 0),
	('Pacific/Tahiti', 'Pacific/Tahiti', b'0', 0),
	('Pacific/Tarawa', 'Pacific/Tarawa', b'0', 0),
	('Pacific/Tongatapu', 'Pacific/Tongatapu', b'0', 0),
	('Pacific/Truk', 'Pacific/Truk', b'0', 0),
	('Pacific/Wake', 'Pacific/Wake', b'0', 0),
	('Pacific/Wallis', 'Pacific/Wallis', b'0', 0),
	('Pacific/Yap', 'Pacific/Yap', b'0', 0),
	('US/Alaska', 'US/Alaska', b'0', 0),
	('US/Aleutian', 'US/Aleutian', b'0', 0),
	('US/Arizona', 'US/Arizona', b'0', 0),
	('US/Central', 'US/Central', b'0', 0),
	('US/East-Indiana', 'US/East-Indiana', b'0', 0),
	('US/Eastern', 'US/Eastern', b'0', 0),
	('US/Hawaii', 'US/Hawaii', b'0', 0),
	('US/Indiana-Starke', 'US/Indiana-Starke', b'0', 0),
	('US/Michigan', 'US/Michigan', b'0', 0),
	('US/Mountain', 'US/Mountain', b'0', 0),
	('US/Pacific', 'US/Pacific', b'0', 0),
	('US/Pacific-New', 'US/Pacific-New', b'0', 0),
	('US/Samoa', 'US/Samoa', b'0', 0);

-- Dumping structure for table data_process.districts
CREATE TABLE IF NOT EXISTS `districts` (
  `district` varchar(50) NOT NULL,
  `districtName` varchar(50) NOT NULL,
  `description` varchar(50) NOT NULL,
  `displayOrder` int NOT NULL,
  `status` bit(1) NOT NULL DEFAULT b'1',
  PRIMARY KEY (`district`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- Dumping data for table data_process.districts: ~2 rows (approximately)
INSERT INTO `districts` (`district`, `districtName`, `description`, `displayOrder`, `status`) VALUES
	('Chennai', 'Chennai', 'Chennai/Kanchepuram/Chengalpattu/Thiruvallur', 1, b'1'),
	('OtherDistricts', 'Other Districts', 'Other Districts', 2, b'1');

-- Dumping structure for procedure data_process.getReportProjectStatus
DELIMITER //
CREATE PROCEDURE `getReportProjectStatus`(
	IN `isCount` BIT,
	IN `fromDate` DATETIME,
	IN `toDate` DATETIME,
	IN `loggedInUser` VARCHAR(50),
	IN `divisionId` VARCHAR(50),
	IN `groupId` VARCHAR(50),
	IN `projectId` VARCHAR(50),
	IN `_page` INT,
	IN `_pageSize` INT


)
    SQL SECURITY INVOKER
BEGIN

DECLARE _ROWCOUNT INT DEFAULT 0;
DECLARE altId VARCHAR(50);
DECLARE dtId VARCHAR(50);
DECLARE _BatchNo VARCHAR(50);
DECLARE _DoneBy VARCHAR(50); 
DECLARE _AllottedDate DATETIME;
DECLARE _CompletedDate DATETIME; 
DECLARE _CompletedMiles VARCHAR(50); 
DECLARE _TimeTaken VARCHAR(50);
DECLARE _EstimatedTime VARCHAR(50); 
DECLARE _Efficiency VARCHAR(50); 
DECLARE _Status VARCHAR(50); 
DECLARE _Reason VARCHAR(100); 
DECLARE _Remarks VARCHAR(500); 
DECLARE _TeamName VARCHAR(50); 

DELETE FROM ProjectStatus WHERE loggedInUser = loggedInUser ;
 
SET @selectCountPart = 'Select Count(OD.receivedDate) As total' ;

SET @roadName = 'JSON_UNQUOTE(JSON_EXTRACT( OD.roadType,''$.roadName'')) As roadTypeClassification, ';

SET @insertINTO = 'Insert INTO ProjectStatus (rowNo, loggedInUser, AllocationId, DataId, Department, Division, GroupName, Project, ReceivedDate, WorkUnitId, SubCountry, RoadType, WUMiles, Remarks) ';

SET @selectPart = CONCAT( @insertINTO, ' Select 0, ''', loggedInUser ,''', OT.allocationId, OD.dataId, DT.departmentName, ');
SET @selectPart = CONCAT( @selectPart, 'DN.divisionName, OG.groupName, OP.projectName, ');
SET @selectPart = CONCAT( @selectPart, 'OD.receivedDate, OD.workUnitId, OC.countryName,', @roadName, ' CAST(OD.wuMiles AS DECIMAL(12,4)) wuMiles, OT.remarks ');

SET @fromPart = ' FROM operational_task OT, operational_data OD, operational_reason ORN, operational_resource_group OG, ' ;
SET @fromPart = CONCAT (@fromPart, 'operational_resource_department DT, operational_resource_division DN, operational_resource_project OP, ');
SET @fromPart = CONCAT (@fromPart, 'operational_subcountry OC, users U, operational_queue OQ');

SET @wherePart = ' WHERE OD.projectId = OP.projectId AND OT.dataId = OD.dataId AND OD.groupId = OG.groupId AND ORN.reasonId = OT.reasonId';
SET @wherePart = CONCAT(@wherePart, ' AND OD.subCountry = OC.country AND OT.allotedTo = U.employeeId AND OQ.queueId = OT.queueId AND DN.divisionId = OG.divisionId');
SET @wherePart = CONCAT(@wherePart, ' AND DT.departmentId = DN.departmentId AND OT.queueId = ''Group''');

IF projectId <> '' THEN
	SET @filter = CONCAT (@filter, ' AND OD.projectId = ''', projectId, '''');
END IF;

SET @filter = '';

IF projectId <> '' THEN
	SET @filter = CONCAT (@filter, ' AND OD.projectId = ''', projectId, '''');
END IF;

IF divisionId <> '' THEN
	SET @filter = CONCAT (@filter, ' AND OG.divisionId = ''', divisionId, '''');
END IF;

IF groupId <> '' THEN
	SET @filter = CONCAT (@filter, ' AND OD.groupId = ''', groupId, '''');
END IF;

IF fromDate IS NOT NULL AND toDate IS NOT NULL THEN
	SET @filter = CONCAT (@filter, ' AND OT.allotedDate Between ''', fromDate, ''' AND ''', toDate, '''' );
END IF;

IF isCount = 1 THEN
	SET @FinalSQL = CONCAT(@selectCountPart, @fromPart, @wherePart, @filter);
END IF;

SET @pagination = CONCAT( ' LIMIT ', _page, ',', _pageSize);

IF isCount = 0 THEN
	SET @FinalSQL = CONCAT(@selectPart, @fromPart, @wherePart, @filter,@pagination);
END IF;

PREPARE stmt FROM @FinalSQL;
EXECUTE stmt;
DEALLOCATE PREPARE stmt;

IF isCount = 0 THEN
	SET _ROWCOUNT = _page ;
	
	WHILE EXISTS (SELECT dataId FROM ProjectStatus WHERE loggedInUser = loggedInUser AND rowNo = 0) DO
	SET @datId=0;	
	SELECT dataId INTO @datId FROM ProjectStatus WHERE loggedInUser = loggedInUser AND rowNo = 0 Limit 1;

	SET @pdCount=0;
	SELECT COUNT(*) INTO @pdCount FROM Operational_Task OT,  Users PU where	 OT.processedBy = PU.employeeId AND OT.dataId = @datId AND OT.queueId = 'Production' Limit 1;
		IF @pdCount > 0 THEN	
			SELECT CONCAT(PU.userName, ' (', PU.userId, ')'), OT.allotedDate, OT.processedDate, '', 
			JSON_UNQUOTE(JSON_EXTRACT( OD.roadType , '$.benchMark.production.actualTime')), JSON_UNQUOTE(JSON_EXTRACT( OD.roadType , '$.benchMark.production.estimatedTime')),
			CAST(((JSON_UNQUOTE(JSON_EXTRACT( OD.roadType , '$.benchMark.production.estimatedTime'))/JSON_UNQUOTE(JSON_EXTRACT( OD.roadType , '$.benchMark.production.actualTime')))*100) 
			AS DECIMAL(12,1)), OT.statusId, RN.reason, OT.remarks, OGT.groupName
			INTO _DoneBy, _AllottedDate, _CompletedDate, _CompletedMiles , _TimeTaken , _EstimatedTime , _Efficiency, _Status, _Reason, _Remarks, _TeamName  
			FROM Operational_Task OT, Operational_Data OD, Users PU, Operational_Reason RN, operational_resource_group OGT
			WHERE 
			OT.dataId = OD.dataId AND OT.teamId = OGT.groupId AND OT.processedBy = PU.employeeId AND RN.reasonId = OT.reasonId AND 
			OT.dataId = @datId AND OT.queueId = 'Production' Limit 1;
			
			SET _ROWCOUNT = _ROWCOUNT+1;
			
			Update ProjectStatus SET rowNo = _ROWCOUNT, PDDoneBy = _DoneBy, PDAllottedDate = _AllottedDate, PDCompletedDate = _CompletedDate,
			PDCompletedMiles = _CompletedMiles, PDTimeTaken = _TimeTaken , PDEstimatedTime = _EstimatedTime, PDEfficiency = _Efficiency,
			PDStatus = _Status, PDReason = _Reason, PDRemarks = _Remarks, PDTeam = _TeamName Where DataId = @datId;
	
			SET @qcCount=0;
			SELECT COUNT(*) INTO @qcCount FROM Operational_Task OT, Operational_Data OD, Users PU, Operational_Reason RN WHERE OT.dataId = OD.dataId AND OT.processedBy = PU.employeeId 
			AND RN.reasonId = OT.reasonId AND OT.dataId = @datId AND OT.queueId = 'QualityControl' Limit 1;
			IF @qcCount > 0 THEN		
				SELECT CONCAT(PU.userName, ' (', PU.userId, ')'), OT.allotedDate, OT.processedDate, '', 
				JSON_UNQUOTE(JSON_EXTRACT( OD.roadType , '$.benchMark.qualityControl.actualTime')), 
				JSON_UNQUOTE(JSON_EXTRACT( OD.roadType , '$.benchMark.qualityControl.estimatedTime')),
				CAST(((JSON_UNQUOTE(JSON_EXTRACT( OD.roadType , '$.benchMark.qualityControl.estimatedTime'))/JSON_UNQUOTE(JSON_EXTRACT( OD.roadType , '$.benchMark.qualityControl.actualTime')))*100) AS DECIMAL(12,1)), OT.statusId, RN.reason, OT.remarks, OGT.groupName
				INTO 
				_DoneBy, _AllottedDate, _CompletedDate, _CompletedMiles , _TimeTaken , _EstimatedTime , _Efficiency, _Status, _Reason, _Remarks, _TeamName 
				FROM Operational_Task OT, Operational_Data OD, Users PU, Operational_Reason RN, operational_resource_group OGT
				WHERE 
				OT.dataId = OD.dataId AND OT.teamId = OGT.groupId AND OT.processedBy = PU.employeeId AND RN.reasonId = OT.reasonId 
				AND OT.dataId = @datId AND OT.queueId = 'QualityControl' Limit 1;
				
				Update ProjectStatus SET QCDoneBy = _DoneBy, QCAllottedDate = _AllottedDate, QCCompletedDate = _CompletedDate,
				QCCompletedMiles = _CompletedMiles, QCTimeTaken = _TimeTaken , QCEstimatedTime = _EstimatedTime, QCEfficiency = _Efficiency,
				QCStatus = _Status, QCReason = _Reason, QCRemarks = _Remarks, QCTeam = _TeamName Where DataId = @datId AND rowNo = _ROWCOUNT;
	
				SET @qaCount=0;
				SELECT COUNT(*) INTO @qaCount FROM Operational_Task OT, Operational_Data OD, Users PU, Operational_Reason RN where	OT.dataId = OD.dataId 
				AND OT.processedBy = PU.employeeId AND OT.dataId = @datId AND OT.queueId = 'QualityAssurance' Limit 1;
				IF @qaCount > 0 THEN		
					
					SELECT CONCAT(PU.userName, ' (', PU.userId, ')'), OT.allotedDate, OT.processedDate, OD.batchId, OT.statusId, OT.remarks, OGT.groupName 
					INTO _DoneBy, _AllottedDate, _CompletedDate, _BatchNo, _Status, _Remarks, _TeamName 
					FROM Operational_Task OT, Operational_Data OD, Users PU, operational_resource_group OGT
					WHERE 
					OT.dataId = OD.dataId AND OT.teamId = OGT.groupId AND OT.processedBy = PU.employeeId AND OT.dataId = @datId AND OT.queueId = 'QualityAssurance' Limit 1;
					
					Update ProjectStatus SET QADoneBy = _DoneBy, QAAllottedDate = _AllottedDate, QACompletedDate = _CompletedDate, QABatchNumber = _BatchNo,
					QAStatus = _Status, QARemarks = _Remarks, QATeam = _TeamName Where DataId = @datId AND rowNo = _ROWCOUNT;
					
					SELECT OT.statusId, OT.processedDate INTO _Status, _CompletedDate FROM Operational_Task OT
					WHERE OT.dataId = @datId AND OT.queueId = 'DeliveryToClient' Limit 1;
					
					Update ProjectStatus SET DeliveryStatus = _Status, DeliveredDate = _CompletedDate  Where DataId = @datId AND rowNo = _ROWCOUNT;
				END IF ;		
			END IF ;	
		ELSE
			SET _ROWCOUNT = _ROWCOUNT+1;
			Update ProjectStatus SET rowNo = _ROWCOUNT  Where DataId = @datId;
		END IF ;		
	END WHILE ;
	 
	SELECT * FROM ProjectStatus ; 
END IF;

DELETE FROM ProjectStatus WHERE loggedInUser = loggedInUser ;
END//
DELIMITER ;

-- Dumping structure for procedure data_process.getReportProjectSummary
DELIMITER //
CREATE PROCEDURE `getReportProjectSummary`(
	IN `fromDate` DATETIME,
	IN `toDate` DATETIME,
	IN `loggedInUser` VARCHAR(50),
	IN `divisionId` VARCHAR(50),
	IN `groupId` VARCHAR(50),
	IN `projectId` VARCHAR(50)
)
BEGIN

DECLARE lastRows INT;
DECLARE startRows INT;

DECLARE _roadId VARCHAR(50) DEFAULT NULL;
DECLARE _roadName VARCHAR(50) DEFAULT NULL;
DECLARE sumWU FLOAT;
DECLARE sumPDYet FLOAT;
DECLARE sumPDTeamYet FLOAT;
DECLARE sumPDInProgress FLOAT;
DECLARE sumPDCompleted FLOAT;

DECLARE sumQATeamYet FLOAT;
DECLARE sumQATeamCompleted FLOAT;
DECLARE sumQAYet FLOAT;
DECLARE sumQAInProgress FLOAT;
DECLARE sumQACompleted FLOAT;

DECLARE sumQCYet FLOAT;
DECLARE sumQCTeamYet FLOAT;
DECLARE sumQCInProgress FLOAT;
DECLARE sumQCCompleted FLOAT;

DECLARE sumDlyYet FLOAT;
DECLARE sumDlyNotYet FLOAT;
DECLARE sumHold FLOAT;

SELECT COUNT(*) INTO lastRows FROM Operational_Road_Type ORT WHERE ORT.projectId = projectId ;

SET startRows=0;

WHILE startRows < lastRows DO
	SELECT roadId, roadName INTO _roadId, _roadName FROM Operational_Road_Type ORT WHERE ORT.projectId = projectId ORDER BY ORT.roadId LIMIT startRows, 1;
		
	SELECT CAST(IFNULL(SUM(OD.wuMiles), 0) AS DECIMAL(12,3)) INTO sumWU FROM operational_task OT, operational_data OD, operational_resource_group OG 
	WHERE OT.dataId = OD.dataId AND OD.groupId = OG.groupId AND OD.projectId = projectId AND JSON_UNQUOTE(JSON_EXTRACT( OD.roadType,'$.roadId')) = _roadId 
	AND OT.queueId = 'Group' AND OD.receivedDate Between fromDate AND toDate;
	
	SELECT CAST(IFNULL(SUM(OD.wuMiles), 0) AS DECIMAL(12,3)) INTO sumPDCompleted FROM operational_task OT, operational_data OD, operational_resource_group OG 
	WHERE OT.dataId = OD.dataId AND OD.groupId = OG.groupId AND OD.projectId = projectId AND JSON_UNQUOTE(JSON_EXTRACT( OD.roadType,'$.roadId')) = _roadId 
	AND OT.queueId = 'Production' AND OT.statusId = 'Completed' AND OD.receivedDate Between fromDate AND toDate;
	
	SELECT CAST(IFNULL(SUM(OD.wuMiles), 0) AS DECIMAL(12,3)) INTO sumPDInProgress FROM operational_task OT, operational_data OD, operational_resource_group OG 
	WHERE OT.dataId = OD.dataId AND OD.groupId = OG.groupId AND OD.projectId = projectId AND JSON_UNQUOTE(JSON_EXTRACT( OD.roadType,'$.roadId')) = _roadId 
	AND OT.queueId = 'Production' AND OT.statusId = 'InProgress' AND OD.receivedDate Between fromDate AND toDate;
	
	SELECT CAST(IFNULL(SUM(OD.wuMiles), 0) AS DECIMAL(12,3)) INTO sumPDYet FROM operational_task OT, operational_data OD, operational_resource_group OG 
	WHERE OT.dataId = OD.dataId AND OD.groupId = OG.groupId AND OD.projectId = projectId AND JSON_UNQUOTE(JSON_EXTRACT( OD.roadType,'$.roadId')) = _roadId 
	AND OT.queueId = 'Production' AND OT.statusId = 'Ready' AND OD.receivedDate Between fromDate AND toDate;
	
	SELECT CAST(IFNULL(SUM(OD.wuMiles), 0) AS DECIMAL(12,3)) INTO sumPDTeamYet FROM operational_task OT, operational_data OD, operational_resource_group OG 
	WHERE OT.dataId = OD.dataId AND OD.groupId = OG.groupId AND OD.projectId = projectId AND JSON_UNQUOTE(JSON_EXTRACT( OD.roadType,'$.roadId')) = _roadId 
	AND OT.queueId = 'ProductionTeam' AND OT.statusId = 'Ready' AND OD.receivedDate Between fromDate AND toDate;
	
	SELECT CAST(IFNULL(SUM(OD.wuMiles), 0) AS DECIMAL(12,3)) INTO sumQCCompleted FROM operational_task OT, operational_data OD, operational_resource_group OG 
	WHERE OT.dataId = OD.dataId AND OD.groupId = OG.groupId AND OD.projectId = projectId AND JSON_UNQUOTE(JSON_EXTRACT( OD.roadType,'$.roadId')) = _roadId 
	AND OT.queueId = 'QualityControl' AND OT.statusId = 'Completed' AND OD.receivedDate Between fromDate AND toDate;
	
	SELECT CAST(IFNULL(SUM(OD.wuMiles), 0) AS DECIMAL(12,3)) INTO sumQCInProgress FROM operational_task OT, operational_data OD, operational_resource_group OG 
	WHERE OT.dataId = OD.dataId AND OD.groupId = OG.groupId AND OD.projectId = projectId AND JSON_UNQUOTE(JSON_EXTRACT( OD.roadType,'$.roadId')) = _roadId 
	AND OT.queueId = 'QualityControl' AND OT.statusId = 'InProgress' AND OD.receivedDate Between fromDate AND toDate;
	
	SELECT CAST(IFNULL(SUM(OD.wuMiles), 0) AS DECIMAL(12,3)) INTO sumQCYet FROM operational_task OT, operational_data OD, operational_resource_group OG 
	WHERE OT.dataId = OD.dataId AND OD.groupId = OG.groupId AND OD.projectId = projectId AND JSON_UNQUOTE(JSON_EXTRACT( OD.roadType,'$.roadId')) = _roadId 
	AND OT.queueId = 'QualityControl' AND OT.statusId = 'Ready' AND OD.receivedDate Between fromDate AND toDate;
	
	SELECT CAST(IFNULL(SUM(OD.wuMiles), 0) AS DECIMAL(12,3)) INTO sumQCTeamYet FROM operational_task OT, operational_data OD, operational_resource_group OG 
	WHERE OT.dataId = OD.dataId AND OD.groupId = OG.groupId AND OD.projectId = projectId AND JSON_UNQUOTE(JSON_EXTRACT( OD.roadType,'$.roadId')) = _roadId 
	AND OT.queueId = 'QualityControlTeam' AND OT.statusId = 'Ready' AND OD.receivedDate Between fromDate AND toDate;
	
	SELECT CAST(IFNULL(SUM(OD.wuMiles), 0) AS DECIMAL(12,3)) INTO sumQAInProgress FROM operational_task OT, operational_data OD, operational_resource_group OG 
	WHERE OT.dataId = OD.dataId AND OD.groupId = OG.groupId AND OD.projectId = projectId AND JSON_UNQUOTE(JSON_EXTRACT( OD.roadType,'$.roadId')) = _roadId 
	AND OT.queueId = 'QualityAssurance' AND OT.statusId = 'InProgress' AND OD.receivedDate Between fromDate AND toDate;
	
	SELECT CAST(IFNULL(SUM(OD.wuMiles), 0) AS DECIMAL(12,3)) INTO sumQACompleted FROM operational_task OT, operational_data OD, operational_resource_group OG 
	WHERE OT.dataId = OD.dataId AND OD.groupId = OG.groupId AND OD.projectId = projectId AND JSON_UNQUOTE(JSON_EXTRACT( OD.roadType,'$.roadId')) = _roadId 
	AND OT.queueId = 'QualityAssurance' AND OT.statusId = 'Completed' AND OD.receivedDate Between fromDate AND toDate;
	
	SELECT CAST(IFNULL(SUM(OD.wuMiles), 0) AS DECIMAL(12,3)) INTO sumQAYet FROM operational_task OT, operational_data OD, operational_resource_group OG 
	WHERE OT.dataId = OD.dataId AND OD.groupId = OG.groupId AND OD.projectId = projectId AND JSON_UNQUOTE(JSON_EXTRACT( OD.roadType,'$.roadId')) = _roadId 
	AND OT.queueId = 'QualityAssurance' AND OT.statusId = 'Ready' AND OD.receivedDate Between fromDate AND toDate;
	
	SELECT CAST(IFNULL(SUM(OD.wuMiles), 0) AS DECIMAL(12,3)) INTO sumQATeamYet FROM operational_task OT, operational_data OD, operational_resource_group OG 
	WHERE OT.dataId = OD.dataId AND OD.groupId = OG.groupId AND OD.projectId = projectId AND JSON_UNQUOTE(JSON_EXTRACT( OD.roadType,'$.roadId')) = _roadId 
	AND OT.queueId = 'QualityAssuranceTeam' AND OT.statusId = 'Ready' AND OD.receivedDate Between fromDate AND toDate;
		
	SELECT CAST(IFNULL(SUM(OD.wuMiles), 0) AS DECIMAL(12,3)) INTO sumDlyYet FROM operational_task OT, operational_data OD, operational_resource_group OG 
	WHERE OT.dataId = OD.dataId AND OD.groupId = OG.groupId AND OD.projectId = projectId AND JSON_UNQUOTE(JSON_EXTRACT( OD.roadType,'$.roadId')) = _roadId 
	AND OT.queueId = 'ReadyForDelivery' AND OD.receivedDate Between fromDate AND toDate;
	
	SELECT CAST(IFNULL(SUM(OD.wuMiles), 0) AS DECIMAL(12,3)) INTO sumHold FROM operational_task OT, operational_data OD, operational_resource_group OG 
	WHERE OT.dataId = OD.dataId AND OD.groupId = OG.groupId AND OD.projectId = projectId AND JSON_UNQUOTE(JSON_EXTRACT( OD.roadType,'$.roadId')) = _roadId 
	AND OT.queueId = 'HoldQueue' AND OD.receivedDate Between fromDate AND toDate;
	
	SELECT CAST(IFNULL(SUM(OD.wuMiles), 0) AS DECIMAL(12,3)) INTO sumQATeamCompleted FROM operational_task OT, operational_data OD, operational_resource_group OG 
	WHERE OT.dataId = OD.dataId AND OD.groupId = OG.groupId AND OD.projectId = projectId AND JSON_UNQUOTE(JSON_EXTRACT( OD.roadType,'$.roadId')) = _roadId 
	AND OT.queueId = 'QualityAssuranceTeam' AND OT.statusId = 'Completed' AND OT.nextAllocationId IS NOT NULL AND OT.nextAllocationId In (SELECT OT.allocationId FROM operational_task OT, 
	operational_data OD, operational_resource_group OG WHERE OT.dataId = OD.dataId AND OD.groupId = OG.groupId AND OD.projectId = projectId 
	AND JSON_UNQUOTE(JSON_EXTRACT( OD.roadType,'$.roadId')) = _roadId AND OT.queueId = 'ReadyForDelivery' AND OD.receivedDate Between fromDate AND toDate);
		

	INSERT INTO projectstatussummary (loggedInUser, projectId, RoadId, RoadType, ReceivedMiles, ProdCompletedMiles, ProdInProgressMiles, ProdYetToStartMiles
	, QCCompletedMiles, QCInProgressMiles, QCYetToStartMiles, QACompletedMiles, QAInProgressMiles, QAYetToStartMiles, DeliveredMiles, OnHoldMiles, UndeliveredMiles) VALUES 
	(loggedInUser, projectId, _roadId, _roadName, sumWU, sumPDCompleted, sumPDInProgress, (sumPDYet+sumPDTeamYet), sumQCCompleted, sumQCInProgress, 
	(sumQCYet + sumQCTeamYet), (sumQACompleted+ sumQATeamCompleted), sumQAInProgress, (sumQAYet + sumQATeamYet) , sumDlyYet , sumHold, (sumWU - sumDlyYet));
	
	SET startRows = startRows + 1;
	
END WHILE;

SELECT RoadType, CAST(ReceivedMiles AS DECIMAL(12,3)) ReceivedMiles, CAST(ProdCompletedMiles AS DECIMAL(12,3)) ProdCompletedMiles, CAST(ProdInProgressMiles AS DECIMAL(12,3)) ProdInProgressMiles, CAST(ProdYetToStartMiles  AS DECIMAL(12,3)) ProdYetToStartMiles, CAST(QCCompletedMiles AS DECIMAL(12,3)) QCCompletedMiles, CAST(QCInProgressMiles AS DECIMAL(12,3)) QCInProgressMiles, CAST(QCYetToStartMiles AS DECIMAL(12,3)) QCYetToStartMiles, CAST(QACompletedMiles AS DECIMAL(12,3)) QACompletedMiles, CAST(QAInProgressMiles AS DECIMAL(12,3)) QAInProgressMiles, CAST(QAYetToStartMiles AS DECIMAL(12,3)) QAYetToStartMiles, CAST(DeliveredMiles AS DECIMAL(12,3)) DeliveredMiles, CAST(OnHoldMiles AS DECIMAL(12,3)) OnHoldMiles, CAST(UndeliveredMiles AS DECIMAL(12,3)) UndeliveredMiles FROM projectstatussummary;


DELETE FROM projectstatussummary;
END//
DELIMITER ;

-- Dumping structure for procedure data_process.getTimesheetApproval
DELIMITER //
CREATE PROCEDURE `getTimesheetApproval`(
	IN `searchTerm` VARCHAR(50),
	IN `employeeList` TEXT,
	IN `fromDate` VARCHAR(50),
	IN `toDate` VARCHAR(50)
)
BEGIN
		
	DECLARE aDate VARCHAR(50);
	DECLARE iterDate DATE;
	DECLARE iterToDate DATE;
	DECLARE likeSearchTerm VARCHAR(50);
	DECLARE equalSearchTerm VARCHAR(50);
	DECLARE Filter VARCHAR(50);

	SET @tUser = 'Select u.employeeId, u.userId, u.userName, u.lastName, h.employmentStatus, ' ;
	SET @tReportTo = 'rep.userId reportToId, rep.userName reportToName, rep.lastName reportToLastName, ' ;
	SET @tDepartment = 'rdep.departmentId, rdep.departmentName, ' ;
	SET @tDivision = 'rd.divisionId, rd.divisionName, ' ;
	SET @tGroup = 'rgp.groupId, rgp.groupName, ' ;
	SET @tTeam = 'rtm.groupId teamId, rtm.groupName teamName ' ;
	SET @tableName1 = ' From users u, users rep, usershrrecords h, userstimesheet ut, usersattendance ua, operational_resource_group rgp, ';
	SET @tableName2 = 'operational_resource_group rtm, operational_resource_department rdep , operational_resource_division rd ';
	SET @tableLink1 = 'Where ua.attendanceId = ut.attendanceId And u.reportingTo = rep.employeeId And ua.employeeId = u.employeeId And h.employeeId = u.employeeId ';
	SET @tableLink2 = 'And u.departmentId = rdep.departmentId And u.divisionId = rd.divisionId And u.groupId = rgp.groupId And u.teamId = rtm.groupId And u.employeeId In (';
	SET @groupBy    = ' Group By u.employeeId';
	
	IF( searchTerm IS NOT NULL AND searchTerm <> '') THEN
		SET likeSearchTerm = CONCAT (' Like ''%', searchTerm, '%''');
		SET equalSearchTerm = CONCAT (' = ''', searchTerm, '''');
		SET @Filter = ' And (';
		SET @Filter = CONCAT(@Filter, 'u.userId', likeSearchTerm, ' Or ' );
		SET @Filter = CONCAT(@Filter, 'u.userName', likeSearchTerm, ' Or ' );
		SET @Filter = CONCAT(@Filter, 'u.lastName', likeSearchTerm, ' Or ' );
		SET @Filter = CONCAT(@Filter, 'rep.userName', likeSearchTerm, ' Or ' );
		SET @Filter = CONCAT(@Filter, 'rep.lastName', likeSearchTerm, ' Or ' );
		SET @Filter = CONCAT(@Filter, 'rdep.departmentName', likeSearchTerm, ' Or ' );
		SET @Filter = CONCAT(@Filter, 'rd.divisionName', likeSearchTerm, ' Or ' );
		SET @Filter = CONCAT(@Filter, 'rgp.groupName', likeSearchTerm, ' Or ' );
		SET @Filter = CONCAT(@Filter, 'rtm.groupName', likeSearchTerm, ' Or ' );
		SET @Filter = CONCAT(@Filter, 'ut.status', equalSearchTerm, ' Or ' );
		SET @Filter = CONCAT(@Filter, 'ua.status', equalSearchTerm, ' Or ' );
		SET @Filter = CONCAT(@Filter, 'ua.symbol', equalSearchTerm, ' Or ' );
		SET @Filter = CONCAT(@Filter, 'h.employmentStatus', equalSearchTerm, ' ) ' );
	END IF;
	
	SET @tDate ='';
	
	SET iterDate = DATE(fromDate);
	SET iterToDate = DATE_ADD(toDate, INTERVAL 1 DAY );
	
	WHILE( iterDate < iterToDate) DO
	
		SET @tempDate = CONCAT(iterDate, ' 00:00:00');
		SET @asDate = CONCAT( DAY(iterDate) ,'/', MONTH(iterDate));
		SET @tDate = CONCAT (@tDate, ', MAX(CASE WHEN ua.date = ''', @tempDate, ''' THEN CONCAT( ua.date, ''#'', ut.hoursBillable, ''#'', (ut.hoursNBP + ut.hoursNBNP), ''#'', ut.hoursOTApproved, ''#'', ua.status , ''#'', ua.symbol, ''#'', ua.mode , ''#'', ut.status, ''#'', ut.lockStatus, ''#'', ut.timesheetId, ''#'', ut.comments ) END ) AS ''', @asDate, ''''); 
		SET iterDate = DATE_ADD(iterDate, INTERVAL 1 DAY );
	END WHILE ;
	
SET @FinalSQL = CONCAT(@tUser, @tReportTo, @tDepartment, @tDivision, @tGroup, @tTeam, @tDate, @tableName1, @tableName2, @tableLink1, @tableLink2, employeeList , ')');

IF( searchTerm IS NOT NULL AND searchTerm <> '') THEN
	SET @FinalSQL = CONCAT(@FinalSQL, @Filter);
END IF;

SET @FinalSQL = CONCAT(@FinalSQL, @groupBy);

PREPARE stmt FROM @FinalSQL;
EXECUTE stmt;
DEALLOCATE PREPARE stmt;
END//
DELIMITER ;

-- Dumping structure for procedure data_process.getUsersLeaveCalendarColor
DELIMITER //
CREATE PROCEDURE `getUsersLeaveCalendarColor`(
	IN `startDate` VARCHAR(50),
	IN `employeePrimaryId` VARCHAR(50)
)
BEGIN
	DECLARE increment INT DEFAULT 0;
DROP TEMPORARY TABLE IF EXISTS temp_table;

-- Declaration of Temp Table
CREATE TEMPORARY TABLE IF NOT EXISTS temp_table
(
	cDate DATE,
	title VARCHAR(20),
	color VARCHAR(20),
	employeeId VARCHAR(50)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci; 

SET @color =''; 
SET @title = '';
SET @firstDate = DATE_SUB(startDate, INTERVAL DAYOFMONTH(startDate)-1 DAY) ; 
SET @lastDate = LAST_DAY(startDate);
SET @currentDate = DATE_SUB(startDate, INTERVAL DAYOFMONTH(startDate)-1 DAY) ; SET @lastDate= LAST_DAY(startDate);

-- Iterate From Start Date To End Date
WHILE @currentDate <= @lastDate DO 

   -- Default Colour Scheme Normal - White	
	SET @LeaveType= 'Normal';
	SELECT `description` INTO @title FROM users_lms_color WHERE colorId = @LeaveType ;
	SELECT `colorName`   INTO @color FROM users_lms_color WHERE colorId = @LeaveType ;
	
	
	-- Check Colour Scheme Leave Approval Status - Grey/Green
	SELECT `status` INTO @LeaveType FROM users_leave_management WHERE employeeId = employeePrimaryId AND DATE(@currentDate) BETWEEN fromDate AND toDate;
		
	IF @LeaveType <> '' THEN
		SELECT `description` INTO @title FROM users_lms_color WHERE colorId = @LeaveType ;
		SELECT `colorName`   INTO @color FROM users_lms_color WHERE colorId = @LeaveType ;
	END IF;
	
	-- Check Colour Scheme Holiday Calendar Entry - Orange
	SELECT UHC.symbol INTO @LeaveType FROM users_holidays_calendar UHC WHERE UHC.startDate = @currentDate;
	
	IF @LeaveType <> '' THEN
		SELECT `description` INTO @title FROM users_lms_color WHERE colorId = @LeaveType ;
		SELECT `colorName`   INTO @color FROM users_lms_color WHERE colorId = @LeaveType ;
	END IF;

	-- Check Colour Scheme For UsersAttendance LossOfPay Status - Red
	SELECT UA.`status` INTO @LeaveType FROM users_attendance UA WHERE employeeId = employeePrimaryId AND UA.`date` = @currentDate;
	
	IF @LeaveType = 'LossOfPay' THEN
		SELECT `description` INTO @title FROM users_lms_color WHERE colorId = @LeaveType ;
		SELECT `colorName`   INTO @color FROM users_lms_color WHERE colorId = @LeaveType ;
	END IF;
	
	-- Insert consolidated information in to the Temp Table
	INSERT INTO temp_table (cDate, title, color, employeeId) VALUES (@currentDate, @title, @color, employeePrimaryId);
	
	-- Increment Date By 1 Day
	SET @currentDate = DATE_SUB(@currentDate, INTERVAL -1 DAY); 

END WHILE;

-- Return Color Scheme Data Table
SELECT cDate,title,color  FROM temp_table WHERE employeeId = employeePrimaryId ;

-- Return Color Scheme Data Count Table
SELECT title, color, COUNT(*) AS count FROM temp_table WHERE employeeId = employeePrimaryId GROUP BY title, color;

DROP TEMPORARY TABLE IF EXISTS temp_table;
END//
DELIMITER ;

-- Dumping structure for table data_process.menu
CREATE TABLE IF NOT EXISTS `menu` (
  `menuId` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `parentId` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL,
  `menuName` varchar(50) DEFAULT NULL COMMENT 'title in Metronic',
  `cssClassIcon` varchar(100) DEFAULT NULL COMMENT 'icon in Metronic',
  `actionURL` varchar(200) DEFAULT NULL COMMENT 'page in Metronic',
  `cssClass` varchar(100) DEFAULT NULL,
  `level` varchar(10) DEFAULT NULL COMMENT 'root in Metronic',
  `alignment` varchar(50) NOT NULL DEFAULT 'left',
  `toggle` varchar(50) DEFAULT 'click',
  `translate` varchar(50) DEFAULT NULL,
  `bullet` varchar(50) DEFAULT NULL,
  `title` varchar(50) NOT NULL,
  PRIMARY KEY (`menuId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- Dumping data for table data_process.menu: ~39 rows (approximately)
INSERT INTO `menu` (`menuId`, `parentId`, `menuName`, `cssClassIcon`, `actionURL`, `cssClass`, `level`, `alignment`, `toggle`, `translate`, `bullet`, `title`) VALUES
	('ApplyLeave', 'LeaveManagement', 'Apply Leave', 'icon-tag', 'lms/applyleave', 'title\r\n', 'FA', 'left', 'click', 'MENU.LEAVEHISTORY', '', 'My Leave'),
	('ApproveLeave', 'LeaveManagement', 'Approve Leave', 'icon-tag', '/leave-management/approveLeave', 'title\r\n', 'FB', 'left', 'click', 'MENU.APPROVELEAVE', '', 'Approve Leave'),
	('Attendance', 'Attendance', 'Attendance', 'icon-tag', 'javascript:loadContent(\'a9dc3f7729b51d26dc20af48c03dfee6\', \'\',\'false\');', 'title\r\n', 'C', 'left', 'click', 'MENU.ATTENDANCE', '', 'Attendance'),
	('DailyLog', 'Attendance', 'Daily Log', 'icon-pencil\r\n', 'lms/lmscalendar', 'title\r\n', 'CA', 'left', 'click', 'MENU.DAILY LOG', '', 'Daily Log'),
	('Dashboard', 'Dashboard', 'Dashboard', 'icon-home\r\n', '/dashboard', 'title\r\n', 'A', 'left', 'click', 'MENU.DASHBOARD\r\n', 'dot', 'Dashboard'),
	('DeliveryList', 'Reports', 'Delivery List', 'icon-tag', '/report/deliverylist', 'title\r\n', 'GC', 'left', 'click', 'MENU.DELIVERYLIST', '', 'Delivery List'),
	('FileUpload', 'WorkAllocation', 'File Upload', 'icon-tag', '/web-upload/file-upload', 'title\r\n', 'BA', 'left', 'click', 'MENU.WORKUPLOAD', '', 'Work Upload'),
	('GroupList', 'ProjectManagement', ' Group List', 'icon-bar-chart\r\n', '/project-management/project-group', 'title\r\n', 'HE', 'left', 'click', 'MENU.GROUP', '', 'Group List'),
	('GroupTeamTransfer', 'ProjectManagement', ' Group Team Transfer', 'icon-bar-chart\r\n', '/project-management/team-transfer', 'title\r\n', 'HE', 'left', 'click', 'MENU.GROUPTEAMTRANSFER', '', 'Group Team Transfer'),
	('HROperation', 'UserManagement', 'HROperation', 'icon-bar-chart\r\n', '/user-management/hr-employee-list', 'title\r\n', 'EA', 'left', 'click', 'MENU.HROPERATIONS', '', 'HR Records'),
	('ITOperation', 'UserManagement', 'ITOperation', 'icon-bar-chart\r\n', '/user-management/it-employee-list', 'title\r\n', 'EA', 'left', 'click', 'MENU.ITOPERATIONS', '', 'IT Records'),
	('LeaveManagement', 'LeaveManagement', 'Leave Management', 'icon-tag', 'javascript:loadContent(\'a9dc3f7729b51d26dc20af48c03dfee6\', \'\',\'false\');', 'title\r\n', 'F', 'left', 'click', 'MENU.LEAVEMANAGEMENT', '', 'Leave Management'),
	('MyAttendance', 'Attendance', 'My Attendance', 'icon-pencil\r\n', 'lms/myattendance', 'title\r\n', 'CB', 'left', 'click', 'MENU.MYATTENDANCE', '', 'My Attendance'),
	('MyWork', 'WorkAllocation', 'My Work', 'icon-tag', '/web-upload/my-work', 'title\r\n', 'BB', 'left', 'click', 'MENU.MYWORK', '', 'My Work'),
	('OprOperation', 'UserManagement', 'OprOperation', 'icon-bar-chart\r\n', '/user-management/opr-employee-list', 'title\r\n', 'EA', 'left', 'click', 'MENU.OPERATIONALOPERATIONS', '', 'Operational Records'),
	('PasswordUpdate', 'UserManagement', 'Password Update', 'icon-bar-chart\r\n', '/user-management/update-password', 'title\r\n', 'EF', 'left', 'click', 'MENU.PASSWORDUPDATE', '', 'Password Update'),
	('Performance', 'DailyLog', 'Performance', 'icon-bar-chart\r\n', 'javascript:loadContent(\'bcca2120ed2c00bcf732c74ca8026490/Consumer\', \'\',\'false\');', 'title\r\n', 'CAA', 'left', 'click', 'MENU.PERFORMANCE', '', 'Performance'),
	('ProjectList', 'ProjectManagement', 'ProjectList', 'icon-bar-chart\r\n', '/project-management/project-list', 'title\r\n', 'HA', 'left', 'click', 'MENU.PROJECTLIST', '', 'Project List'),
	('ProjectManagement', 'ProjectManagement', 'ProjectManagement', 'icon-bar-chart\r\n', 'javascript:loadContent(\'bcca2120ed2c00bcf732c74ca8026490/Employee\', \'\',\'false\');', 'title\r\n', 'H', 'left', 'click', 'MENU.PROJECTMANAGEMENT', '', 'Project Master'),
	('ProjectRoadTypeList', 'ProjectManagement', 'Project Road Type List', 'icon-bar-chart\r\n', '/project-management/project-road-type-list', 'title\r\n', 'HB', 'left', 'click', 'MENU.PROJECTROADTYPELIST', '', 'Project Road Type List'),
	('ProjectStatus', 'Reports', 'Project Status', 'icon-tag', '/report/projectstatus', 'title\r\n', 'GD', 'left', 'click', 'MENU.PROJECTSTATUS', '', 'Project Status'),
	('ProjectSubCountryList', 'ProjectManagement', 'Project SubCountry List', 'icon-bar-chart\r\n', '/project-management/project-subcountry-List', 'title\r\n', 'HC', 'left', 'click', 'MENU.PROJECTSUBCOUNTRYLIST', '', 'Project SubCountry List'),
	('ProjectTemplate', 'ProjectManagement', ' Project Template', 'icon-bar-chart\r\n', '/project-management/project-template', 'title\r\n', 'HE', 'left', 'click', 'MENU.PROJECTTEMPLATE', '', 'Project Template'),
	('Reports', 'Reports', 'Reports', 'icon-tag', 'javascript:loadContent(\'a9dc3f7729b51d26dc20af48c03dfee6\', \'\',\'false\');', 'title\r\n', 'G', 'left', 'click', 'MENU.REPORTS', '', 'Reports'),
	('Roles', 'UserManagement', 'Roles', 'icon-bar-chart\r\n', '/user-management/roles', 'title\r\n', 'EB', 'left', 'click', 'MENU.ROLES', '', 'Roles'),
	('SkillSetMatrix', 'UserManagement', 'SkillSet Matrix', 'icon-bar-chart', '/user-management/skillset-matrix-list', 'title', 'ED', 'left', 'click', 'MENU.SKILLSET MATRIX', NULL, 'SkillSet Matrix'),
	('TaskCreation:ist', 'ProjectManagement', 'Task Creation :ist', 'icon-bar-chart\r\n', '/project-management/project-task-List', 'title\r\n', 'HD', 'left', 'click', 'MENU.TASKLIST', '', 'Task Creation List'),
	('TeamAttendance', 'Attendance', 'Team Attendance', 'icon-pencil\r\n', '/attendance/groupAttendance', 'title\r\n', 'CC', 'left', 'click', 'MENU.GROUPATTENDANCE', '', 'Group Attendance'),
	('TeamList', 'ProjectManagement', ' Team List', 'icon-bar-chart\r\n', '/project-management/project-team', 'title\r\n', 'HE', 'left', 'click', 'MENU.TEAM', '', 'Team List'),
	('TeamTimeSheet', 'Attendance', 'Team TimeSheet', 'icon-pencil\r\n', '/attendance/approveTimeSheet', 'title\r\n', 'CC', 'left', 'click', 'MENU.APPROVETIMESHEET', '', 'Approve Time Sheet'),
	('UploadedFiles', 'WorkAllocation', 'Uploaded Files', 'icon-tag', '/web-upload/uploaded-files', 'title\r\n', 'BC', 'left', 'click', 'MENU.UPLOADEDFILES', '', 'Uploaded Files Summary'),
	('UserManagement', 'UserManagement', 'UserManagement', 'icon-bar-chart\r\n', 'javascript:loadContent(\'bcca2120ed2c00bcf732c74ca8026490/Employee\', \'\',\'false\');', 'title\r\n', 'E', 'left', 'click', 'MENU.USERMANAGEMENT', '', 'Employee Management'),
	('WebUpload', 'Reports', 'Web Upload', 'icon-tag', '/report/webupload', 'title\r\n', 'GA', 'left', 'click', 'MENU.WEBUPLOAD', '', 'Web Upload'),
	('WorkAllocation', 'WorkAllocation', 'WorkAllocation', 'icon-settings\r\n', 'javascript:;', 'title\r\n', 'B', 'left', 'click', 'MENU.WORKALLOCATION', '', 'WorkAllocation'),
	('WorkflowQueue', 'ProjectManagement', ' Workflow Queue', 'icon-bar-chart\r\n', '/project-management/worklow-queue', 'title\r\n', 'HE', 'left', 'click', 'MENU.WORKFLOWQUEUE', '', 'Workflow Queue'),
	('WUDeliverySummary', 'Reports', 'WU Delivery Summary', 'icon-tag', '/report/deliverysummary', 'title\r\n', 'GF', 'left', 'click', 'MENU.DELIVERYSUM', '', 'WU Delivery Summary'),
	('WUHoldList', 'Reports', 'WU Hold List', 'icon-tag', '/report/wuholdlist', 'title\r\n', 'GB', 'left', 'click', 'MENU.WUHOLD', '', 'WU Hold List'),
	('WUHoldSummary', 'Reports', 'WU Hold Summary', 'icon-tag', '/report/holdsummary', 'title\r\n', 'GE', 'left', 'click', 'MENU.HOLDSUM', '', 'WU Hold Summary'),
	('WUOverAllSummary', 'Reports', 'WU OverAll Summary', 'icon-tag', '/report/overallsummary', 'title\r\n', 'GG', 'left', 'click', 'MENU.OVERALLSUM', '', 'WU OverAll Summary');

-- Dumping structure for table data_process.menu_role
CREATE TABLE IF NOT EXISTS `menu_role` (
  `autoId` int NOT NULL AUTO_INCREMENT,
  `producerId` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL DEFAULT 'PRD000001',
  `menuId` varchar(50) NOT NULL,
  `roleId` varchar(50) NOT NULL,
  PRIMARY KEY (`autoId`),
  KEY `FK_mamenurole_mamenu` (`menuId`),
  KEY `FK_mamenurole_producers` (`producerId`),
  KEY `FK_mamenurole_roles` (`roleId`),
  CONSTRAINT `FK_mamenurole_producers` FOREIGN KEY (`producerId`) REFERENCES `producers` (`producerId`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- Dumping data for table data_process.menu_role: ~8 rows (approximately)
INSERT INTO `menu_role` (`autoId`, `producerId`, `menuId`, `roleId`) VALUES
	(1, 'PRD000001', 'Dashboard', 'Employee'),
	(2, 'PRD000001', 'Attendance', 'Employee'),
	(3, 'PRD000001', 'DailyLog', 'Employee'),
	(4, 'PRD000001', 'LeaveManagement', 'Employee'),
	(5, 'PRD000001', 'ProjectManagement', 'Admin'),
	(6, 'PRD000001', 'Reports', 'Admin'),
	(7, 'PRD000001', 'UserManagement', 'Admin'),
	(8, 'PRD000001', 'WorkAllocation', 'Admin');

-- Dumping structure for table data_process.messages
CREATE TABLE IF NOT EXISTS `messages` (
  `messageId` varchar(50) NOT NULL,
  `message` longtext NOT NULL,
  `messageName` varchar(50) NOT NULL,
  `subject` varchar(200) DEFAULT NULL,
  `media` varchar(20) NOT NULL,
  `producerId` varchar(50) NOT NULL,
  `dataMapTemplateName` varchar(100) DEFAULT NULL,
  `createdDate` datetime NOT NULL,
  `modifiedDate` datetime NOT NULL,
  `status` bit(1) NOT NULL DEFAULT b'1',
  `textHTML` bit(1) DEFAULT b'1',
  PRIMARY KEY (`messageId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- Dumping data for table data_process.messages: ~6 rows (approximately)
INSERT INTO `messages` (`messageId`, `message`, `messageName`, `subject`, `media`, `producerId`, `dataMapTemplateName`, `createdDate`, `modifiedDate`, `status`, `textHTML`) VALUES
	('Create_User_Admin', 'Hi ${user_producerName} <BR> <BR>  User ${user_userName} from ${user_country_countryName} has been created. Pls verify the user. <BR> Please click here <a href="${tokenURL}">Activation Link</a><BR><BR>By<BR> ${user_producerName}.', 'Create_User_Admin', 'Hi ${user_producerName} User Created Info Admin ', 'Email', 'PRD000001', NULL, '2021-01-01 00:00:00', '2021-01-01 00:00:00', b'1', b'1'),
	('Create_User_Employee', 'data_process: Your Account has been created successfully', 'Create_User_Employee', 'User Created Info Employee', 'Email', 'PRD000001', NULL, '2021-01-01 00:00:00', '2021-01-01 00:00:00', b'1', b'1'),
	('Create_User_Employee_SMS', 'data_process: Your Account has been created successfully', 'Create_User_Employee_SMS', 'User Created Info Employee SMS', 'SMS', 'PRD000001', NULL, '2021-01-01 00:00:00', '2021-01-01 00:00:00', b'1', b'1'),
	('CreateIncidentEmail', '<style>\r\n	.details {\r\n		font-family:"Calibri (Body)", sans-serif;\r\n		margin: 10px 0;\r\n		padding: 10px;\r\n		background-color: #fff;\r\n		border: 1px solid #ddd;\r\n		border-radius: 5px;\r\n	}\r\n	.details p {\r\n		margin: 5px 0;\r\n	}\r\n	.footer {\r\n		margin-top: 20px;\r\n		font-size: 0.9em;\r\n		color: #777;\r\n	}\r\n</style>\r\n\r\n<div style="font-family:Arial,Helvetica,sans-serif; line-height: 1.5; font-weight: normal; font-size: 15px; color: #2F3044; min-height: 100%; margin:0; padding:0; width:100%; background-color:#edf2f7">\r\n\r\n    <table align="center" border="0" cellpadding="0" cellspacing="0" width="100%" style="border-collapse:collapse;margin:0 auto; padding:0; max-width:600px">\r\n        <tbody>\r\n            <tr>\r\n                <td align="center" valign="center" style="text-align:center; padding: 40px">\r\n                    <a href="https://stashook.com" rel="noopener" target="_blank">\r\n                        <img alt="Logo" src="https://assets.zyrosite.com/cdn-cgi/image/format=auto,w=224,fit=crop,q=95/mk38qrkq0WcJX2p5/focus_main-Y4LV7rbvoxtGZ2e3.png"/>\r\n                    </a>\r\n                </td>\r\n            </tr>\r\n\r\n            <tr>\r\n                <td align="left" valign="center">\r\n                    <div style="text-align:left; margin: 0 20px; padding: 40px; background-color:#ffffff; border-radius: 6px">\r\n                        <h3 style="color: #0056b3">New Incident Report</h3>\r\n						<p>Dear {{incident.customerName}},</p>\r\n						<p>I am writing to report an incident that requires attention in our ticketing system. Below are the details:</p>\r\n						\r\n						<div class="details">\r\n							<p><strong>Description:</strong> {{incident.description}}</p>\r\n							<p><strong>Priority Level:</strong> {{incident.supportType}}/{{incident.priority}}</p>\r\n							<p><strong>Date and Time of Occurrence:</strong> {{incident.modifiedDate}}</p>\r\n							<p><strong>Steps Taken So Far:</strong> {{incident.cookBookName}}</p>\r\n						</div>\r\n\r\n						<p>Attachments: Not Available</p>\r\n						\r\n						<p>Please confirm receipt of this email and let me know if further details are needed. I look forward to your assistance in resolving this matter promptly.</p>\r\n						\r\n						<p>Thank you for your support.</p>\r\n						\r\n						<p>Best regards,<br>Focus Support Team.<br><br>Mobile: +91 9999999999</p>\r\n						<div class="footer">\r\n							<p>Note: This email is intended for the designated recipient(s) only. Please do not share or forward without permission.</p>\r\n						</div>\r\n                    </div>\r\n					\r\n                </td>\r\n            </tr>\r\n\r\n            <tr>\r\n                <td align="center" valign="center" style="font-size: 13px; text-align:center;padding: 20px; color: #6d6e7c;">\r\n                    <p>Floor 5, 450 Avenue of the Red Field, Chennai, 601110, INDIA.</p>\r\n                    <p>  Copyright &copy; <a href="https://stashook.com" rel="noopener" target="_blank">Stashook.com</a>.</p>\r\n                </td>\r\n            </tr>\r\n        </tbody>\r\n    </table>\r\n</div>', 'CreateIncidentEmail', 'Incident Created {{incident.incidentId}} - Status - {{incident.taskStatus}}', 'Email', 'PRD000001', NULL, '2024-12-29 17:59:29', '2024-12-29 17:59:30', b'1', b'1'),
	('User_Change_Password', '<style>\r\n    html,body {\r\n        padding: 0;\r\n        margin:0;\r\n    }\r\n</style>\r\n\r\n<div style="font-family:Arial,Helvetica,sans-serif; line-height: 1.5; font-weight: normal; font-size: 15px; color: #2F3044; min-height: 100%; margin:0; padding:0; width:100%; background-color:#edf2f7">\r\n    <table align="center" border="0" cellpadding="0" cellspacing="0" width="100%" style="border-collapse:collapse;margin:0 auto; padding:0; max-width:600px">\r\n        <tbody>\r\n            <tr>\r\n                <td align="center" valign="center" style="text-align:center; padding: 40px">\r\n                    <a href="https://stashook.com" rel="noopener" target="_blank">\r\n                        <img alt="Logo" src="https://assets.zyrosite.com/cdn-cgi/image/format=auto,w=224,fit=crop,q=95/mk38qrkq0WcJX2p5/focus_main-Y4LV7rbvoxtGZ2e3.png"/>\r\n                    </a>\r\n                </td>\r\n            </tr>\r\n\r\n            <tr>\r\n                <td align="left" valign="center">\r\n                    <div style="text-align:left; margin: 0 20px; padding: 40px; background-color:#ffffff; border-radius: 6px">\r\n\r\n                            <!--begin:Email content-->\r\n    <div style="padding-bottom: 30px; font-size: 17px;">\r\n        <strong>Hello {{user.userName}}!</strong>\r\n    </div>\r\n\r\n    <div style="padding-bottom: 30px">\r\n        You are receiving this email because we received a password reset request for your account. To proceed with the password reset, use this one time passcode.\r\n    </div>\r\n\r\n    <div style="padding-bottom: 40px; text-align:center;">\r\n        <p\r\n           style="text-decoration:none;display:inline-block;text-align:center;padding:0.75575rem 1.3rem;font-size:0.925rem;line-height:1.5;border-radius:0.35rem;color:#ffffff;background-color:#009ef7;border:0px;margin-right:0.75rem!important;font-weight:600!important;outline:none!important;vertical-align:middle"\r\n           >\r\n            {{user.otp}}\r\n        </p>\r\n    </div>\r\n\r\n    <div style="padding-bottom: 30px">\r\n        This One Time Passcode will expire in {{expiresIn}} minutes.\r\n        If you did not request a password reset, no further action is required.\r\n    </div>\r\n\r\n    <div style="border-bottom: 1px solid #eeeeee; margin: 15px 0"></div>\r\n\r\n    \r\n    <!--end:Email content-->\r\n                        \r\n                        <div style="padding-bottom: 10px">\r\n                            Kind Regards,<br>\r\n                            The Focus Application Team.\r\n                        </div>\r\n                    </div>\r\n                </td>\r\n            </tr>\r\n\r\n            <tr>\r\n                <td align="center" valign="center" style="font-size: 13px; text-align:center;padding: 20px; color: #6d6e7c;">\r\n                    <p>Floor 5, 450 Avenue of the Red Field, Chennai, 601110, INDIA.</p>\r\n                    <p>  Copyright &copy; <a href="https://stashook.com" rel="noopener" target="_blank">Stashook.com</a>.</p>\r\n                </td>\r\n            </tr>\r\n        </tbody>\r\n    </table>\r\n</div>', 'User_Change_Password', 'Focus Application Password Reset Email OTP Code', 'Email', 'PRD000001', NULL, '2021-01-01 00:00:00', '2021-01-01 00:00:00', b'1', b'1'),
	('User_Reset_Password', 'Hi ${user_userName} <BR> <BR>  Pls click the link to reset the password. <BR> Please click here <a href="${tokenURL}">Password Reset Link</a><BR><BR>By<BR> ${user_producerName}.', 'User_Reset_Password', '[${user_userName}] Your data_process Account Password Reset Link', 'Email', 'PRD000001', NULL, '2021-01-01 00:00:00', '2021-01-01 00:00:00', b'1', b'1');

-- Dumping structure for table data_process.producers
CREATE TABLE IF NOT EXISTS `producers` (
  `producerId` varchar(50) NOT NULL,
  `producerType` varchar(50) NOT NULL DEFAULT 'Producer',
  `producerName` varchar(50) DEFAULT NULL,
  `pwdExpiryDays` datetime DEFAULT NULL,
  `domainContext` varchar(100) DEFAULT NULL,
  `logoImageUrl` varchar(500) DEFAULT NULL,
  `employeeId` varchar(50) DEFAULT NULL,
  `createdBy` varchar(50) DEFAULT NULL,
  `createdDate` datetime DEFAULT NULL,
  `modifiedDate` datetime DEFAULT NULL,
  `modifiedBy` varchar(50) DEFAULT NULL,
  `status` bit(1) NOT NULL DEFAULT b'0',
  `isPrimary` bit(1) DEFAULT b'0',
  `emailId` varchar(50) DEFAULT NULL,
  `mobileNo` varchar(15) DEFAULT NULL,
  `phoneNo` varchar(20) DEFAULT NULL,
  `whatsAppNo` varchar(15) DEFAULT NULL,
  `description` varchar(250) DEFAULT NULL,
  `registrationDate` varchar(20) DEFAULT NULL,
  `customerStatus` varchar(25) DEFAULT 'Pending',
  PRIMARY KEY (`producerId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- Dumping data for table data_process.producers: ~0 rows (approximately)
INSERT INTO `producers` (`producerId`, `producerType`, `producerName`, `pwdExpiryDays`, `domainContext`, `logoImageUrl`, `employeeId`, `createdBy`, `createdDate`, `modifiedDate`, `modifiedBy`, `status`, `isPrimary`, `emailId`, `mobileNo`, `phoneNo`, `whatsAppNo`, `description`, `registrationDate`, `customerStatus`) VALUES
	('PRD000001', 'Producer', 'Main Branch', '2025-01-01 00:00:00', '/focus', NULL, 'PRODUCERUSER', 'PRODUCERUSER', '2025-01-01 00:00:00', '2025-01-01 00:00:00', 'PRODUCERUSER', b'1', b'0', NULL, NULL, NULL, NULL, NULL, NULL, 'Pending');

-- Dumping structure for table data_process.producers_attachments
CREATE TABLE IF NOT EXISTS `producers_attachments` (
  `autoId` int NOT NULL AUTO_INCREMENT,
  `producerId` varchar(50) DEFAULT NULL,
  `documentStatus` varchar(50) DEFAULT NULL,
  `documentDesc` varchar(100) DEFAULT NULL,
  `uploadFileDate` datetime DEFAULT NULL,
  `uploadFileFolderURL` varchar(500) DEFAULT NULL,
  `uploadFileLastModifiedDate` datetime DEFAULT NULL,
  `uploadFileName` varchar(100) DEFAULT NULL,
  `uploadFileNameForDisplay` varchar(50) DEFAULT NULL,
  `uploadFileSize` bigint NOT NULL,
  `uploadResourceHandler` varchar(50) DEFAULT NULL,
  `uploadDocumentForType` varchar(50) DEFAULT NULL,
  `createdDate` datetime DEFAULT NULL,
  `modifiedDate` datetime DEFAULT NULL,
  `createdBy` varchar(50) DEFAULT NULL,
  `modifiedBy` varchar(50) DEFAULT NULL,
  `status` bit(1) NOT NULL DEFAULT b'1',
  PRIMARY KEY (`autoId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- Dumping data for table data_process.producers_attachments: ~0 rows (approximately)

-- Dumping structure for table data_process.producers_collabrate
CREATE TABLE IF NOT EXISTS `producers_collabrate` (
  `autoId` bigint NOT NULL AUTO_INCREMENT,
  `producerId` varchar(50) NOT NULL,
  `collabraterId` varchar(50) NOT NULL,
  `createdBy` varchar(50) NOT NULL,
  `modifiedBy` varchar(50) NOT NULL,
  `createdDate` datetime NOT NULL,
  `modifiedDate` datetime NOT NULL,
  `status` bit(1) NOT NULL DEFAULT b'1',
  PRIMARY KEY (`autoId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- Dumping data for table data_process.producers_collabrate: ~0 rows (approximately)

-- Dumping structure for table data_process.producers_property
CREATE TABLE IF NOT EXISTS `producers_property` (
  `autoId` varchar(50) NOT NULL,
  `producerId` varchar(50) NOT NULL,
  `groupName` varchar(50) NOT NULL,
  `property` varchar(200) NOT NULL,
  `value` mediumtext NOT NULL,
  `status` bit(1) NOT NULL DEFAULT b'1',
  `createdBy` varchar(50) DEFAULT NULL,
  `modifiedBy` varchar(50) DEFAULT NULL,
  `createdDate` datetime DEFAULT NULL,
  `modifiedDate` datetime DEFAULT NULL,
  `comments` varchar(500) DEFAULT NULL,
  `media` varchar(50) NOT NULL,
  `mediaMode` varchar(50) NOT NULL,
  `mediaType` varchar(50) NOT NULL,
  PRIMARY KEY (`autoId`),
  UNIQUE KEY `property` (`property`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- Dumping data for table data_process.producers_property: ~0 rows (approximately)
INSERT INTO `producers_property` (`autoId`, `producerId`, `groupName`, `property`, `value`, `status`, `createdBy`, `modifiedBy`, `createdDate`, `modifiedDate`, `comments`, `media`, `mediaMode`, `mediaType`) VALUES
	('1', 'PRD000001', 'Hostinger', 'SupportEmail', '{\r\n    "host": "smtp.hostinger.com",\r\n    "service": "Hostinger",\r\n    "port": 465,\r\n    "secure": true,\r\n    "auth": {\r\n        "displayName" : "Support Team",\r\n        "user": "support-focus@stashook.com",\r\n        "pass": "Stashook@2022"\r\n    }\r\n}', b'1', 'Admin', 'Admin', '2021-01-01 00:00:00', '2021-01-01 00:00:00', NULL, 'Email', 'External', 'Primary');

-- Dumping structure for table data_process.roles
CREATE TABLE IF NOT EXISTS `roles` (
  `roleId` varchar(50) NOT NULL,
  `roleName` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `roleShortName` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `roleType` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL DEFAULT 'Role',
  `status` bit(1) NOT NULL DEFAULT b'1',
  `isAdmin` bit(1) NOT NULL DEFAULT b'0',
  `hierarchy` varchar(50) NOT NULL COMMENT 'TopLevel - A , SubTopLevel - AA to AZ, \\\\\\\\r\\\\\\\\nNextLevel - B, SubNextLevel - BA to BZ and soon\\\\\\\\r\\\\\\\\nBottomLevel - Z\\\\\\\\r\\\\\\\\n',
  `displayOrder` int NOT NULL,
  `producerId` varchar(50) NOT NULL,
  `description` varchar(50) NOT NULL,
  `createdBy` varchar(50) NOT NULL,
  `createdDate` datetime NOT NULL,
  `modifiedBy` varchar(50) DEFAULT NULL,
  `modifiedDate` datetime DEFAULT NULL,
  PRIMARY KEY (`roleId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- Dumping data for table data_process.roles: ~6 rows (approximately)
INSERT INTO `roles` (`roleId`, `roleName`, `roleShortName`, `roleType`, `status`, `isAdmin`, `hierarchy`, `displayOrder`, `producerId`, `description`, `createdBy`, `createdDate`, `modifiedBy`, `modifiedDate`) VALUES
	('Admin', 'Administrator', 'Admin', 'Role', b'1', b'1', 'A', 1, 'PRD000001', 'Administrator', 'PRODUCERUSER', '2025-01-01 00:00:00', 'PRODUCERUSER', '2025-01-01 00:00:00'),
	('Employee', 'Employee', 'TM', 'Role', b'1', b'0', 'Z', 1000, 'PRD000001', 'Employee', 'PRODUCERUSER', '2025-01-01 00:00:00', 'PRODUCERUSER', '2025-01-01 00:00:00'),
	('Executive', 'Executive', 'TR', 'Role', b'1', b'0', 'C', 2, 'PRD000001', 'Executive Personals', 'PRODUCERUSER', '2025-01-01 00:00:00', 'PRODUCERUSER', '2025-01-01 00:00:00'),
	('Report', 'Report', 'RPT', 'Role', b'1', b'0', 'Y', 999, 'PRD000001', 'Report', 'PRODUCERUSER', '2025-01-01 00:00:00', 'PRODUCERUSER', '2025-01-01 00:00:00'),
	('Support', 'Support', 'SPT', 'Role', b'1', b'0', 'X', 998, 'PRD000001', 'Support', 'PRODUCERUSER', '2025-01-01 00:00:00', 'PRODUCERUSER', '2025-01-01 00:00:00'),
	('TeamLeader', 'Team Leader', 'TL', 'Role', b'1', b'0', 'B', 1, 'PRD000001', 'Team Leader', 'PRODUCERUSER', '2025-01-01 00:00:00', 'PRODUCERUSER', '2025-01-01 00:00:00');

-- Dumping structure for table data_process.states
CREATE TABLE IF NOT EXISTS `states` (
  `state` varchar(50) NOT NULL,
  `country` varchar(20) NOT NULL,
  `displayOrder` int NOT NULL DEFAULT '0',
  `status` bit(1) DEFAULT NULL,
  PRIMARY KEY (`state`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- Dumping data for table data_process.states: ~35 rows (approximately)
INSERT INTO `states` (`state`, `country`, `displayOrder`, `status`) VALUES
	('Andhra Pradesh', 'Asia/Kolkata', 1, b'1'),
	('Arunachal Pradesh', 'Asia/Kolkata', 1, b'1'),
	('Assam', 'Asia/Kolkata', 1, b'1'),
	('Bihar', 'Asia/Kolkata', 1, b'1'),
	('Chandigarh', 'Asia/Kolkata', 1, b'1'),
	('Chhattisgarh', 'Asia/Kolkata', 1, b'1'),
	('Dadra and Nagar Haveli', 'Asia/Kolkata', 1, b'1'),
	('Daman & Diu', 'Asia/Kolkata', 1, b'1'),
	('Delhi', 'Asia/Kolkata', 1, b'1'),
	('Goa', 'Asia/Kolkata', 1, b'1'),
	('Gujarat', 'Asia/Kolkata', 1, b'1'),
	('Haryana', 'Asia/Kolkata', 1, b'1'),
	('Himachal Pradesh', 'Asia/Kolkata', 1, b'1'),
	('Jammu & Kashmir', 'Asia/Kolkata', 1, b'1'),
	('Jharkhand', 'Asia/Kolkata', 1, b'1'),
	('Karnataka', 'Asia/Kolkata', 1, b'1'),
	('Kerala', 'Asia/Kolkata', 1, b'1'),
	('Lakshadweep', 'Asia/Kolkata', 1, b'1'),
	('Madhya Pradesh', 'Asia/Kolkata', 1, b'1'),
	('Maharashtra', 'Asia/Kolkata', 1, b'1'),
	('Manipur', 'Asia/Kolkata', 1, b'1'),
	('Meghalaya', 'Asia/Kolkata', 1, b'1'),
	('Mizoram', 'Asia/Kolkata', 1, b'1'),
	('Nagaland', 'Asia/Kolkata', 1, b'1'),
	('No State', 'Asia/Kolkata', 1, b'1'),
	('Odisha', 'Asia/Kolkata', 1, b'1'),
	('Punjab', 'Asia/Kolkata', 1, b'1'),
	('Rajasthan', 'Asia/Kolkata', 1, b'1'),
	('Sikkim', 'Asia/Kolkata', 1, b'1'),
	('Tamil Nadu', 'Asia/Kolkata', 1, b'1'),
	('Telangana', 'Asia/Kolkata', 1, b'1'),
	('Tripura', 'Asia/Kolkata', 1, b'1'),
	('Uttar Pradesh', 'Asia/Kolkata', 1, b'1'),
	('Uttarakhand', 'Asia/Kolkata', 1, b'1'),
	('West Bengal', 'Asia/Kolkata', 1, b'1');

-- Dumping structure for table data_process.timesheet_process
CREATE TABLE IF NOT EXISTS `timesheet_process` (
  `processId` varchar(50) NOT NULL,
  `processName` varchar(50) DEFAULT NULL,
  `billType` varchar(50) NOT NULL DEFAULT 'None',
  `billable` bit(1) NOT NULL DEFAULT b'1',
  `entryType` varchar(50) NOT NULL DEFAULT 'None',
  `skillSet` varchar(50) DEFAULT NULL,
  `minutes` bigint NOT NULL DEFAULT '0',
  `displayOrder` int NOT NULL DEFAULT '1',
  `status` bit(1) NOT NULL DEFAULT b'1',
  `description` varchar(200) DEFAULT NULL,
  PRIMARY KEY (`processId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- Dumping data for table data_process.timesheet_process: ~47 rows (approximately)
INSERT INTO `timesheet_process` (`processId`, `processName`, `billType`, `billable`, `entryType`, `skillSet`, `minutes`, `displayOrder`, `status`, `description`) VALUES
	('Break_1', 'Break 1', 'NBP', b'1', 'System', NULL, 50, 37, b'1', NULL),
	('Break_2', 'Break 2', 'NBP', b'1', 'System', NULL, 40, 38, b'1', NULL),
	('ClientFeedbackAnalysis', 'Client Feedback Analysis', 'NBP', b'1', 'Manual', NULL, 0, 12, b'1', NULL),
	('ClientMeeting', 'Client Meeting', 'NBP', b'1', 'Manual', NULL, 0, 16, b'1', NULL),
	('DailyStatusReviewMeeting', 'Daily status review meeting', 'NBP', b'1', 'Manual', NULL, 0, 19, b'1', NULL),
	('DatabaseConnIssue', 'Database conn. Issue', 'NBP', b'1', 'Manual', NULL, 0, 26, b'1', NULL),
	('DoubtClarification', 'Doubt Clarification', 'NBP', b'1', 'Manual', NULL, 0, 15, b'1', NULL),
	('EarlyGoing', 'Early Going', 'NBNP', b'0', 'Manual', NULL, 0, 32, b'1', NULL),
	('FinalValidation', 'Final Validation', 'B', b'1', 'Manual', NULL, 0, 6, b'1', NULL),
	('HR_Admin_Support', 'HR Admin Support', 'NBP', b'1', 'Manual', NULL, 0, 29, b'1', NULL),
	('IdleNoWork', 'Idle No Work', 'NBP', b'1', 'Manual', NULL, 0, 29, b'1', NULL),
	('InputPreparation', 'Input Preparation', 'B', b'1', 'Manual', NULL, 0, 4, b'1', NULL),
	('InternetProblem', 'Internet Problem', 'NBP', b'1', 'Manual', NULL, 0, 27, b'1', NULL),
	('IT_Support', 'IT Support', 'NBP', b'1', 'Manual', NULL, 0, 29, b'1', NULL),
	('KnowledgeTransfer', 'Knowledge Transfer', 'NBP', b'1', 'Manual', NULL, 0, 35, b'1', NULL),
	('LateComing', 'Late Coming', 'NBNP', b'0', 'Manual', NULL, 0, 30, b'1', NULL),
	('Meeting', 'Meeting', 'NBP', b'1', 'Manual', NULL, 0, 36, b'1', NULL),
	('MeetingWithLeaders', 'Meeting with Leaders', 'NBP', b'1', 'Manual', NULL, 0, 18, b'1', NULL),
	('NewSpecUpdateMeeting', 'New Spec. Update meeting', 'NBP', b'1', 'Manual', NULL, 0, 20, b'1', NULL),
	('OnlineQC', 'Online QC', 'NBP', b'1', 'Manual', NULL, 0, 13, b'1', NULL),
	('PCS1725291661267', 'Discussion', 'NBP', b'1', 'Manual', NULL, 1, 120, b'1', NULL),
	('PCS1725291694033', 'FrontEnd(FE)', 'B', b'1', 'Manual', NULL, 1, 120, b'1', NULL),
	('PCS1725291707667', 'BackEnd(BE)', 'B', b'1', 'Manual', NULL, 1, 120, b'1', NULL),
	('PCS1725291726165', 'Database(DB)', 'B', b'1', 'Manual', NULL, 1, 120, b'1', NULL),
	('PCS1725293137960', 'Angular Session', 'NBP', b'1', 'Manual', NULL, 1, 120, b'1', NULL),
	('Permission', 'Permission', 'NBNP', b'0', 'Manual', NULL, 0, 33, b'1', NULL),
	('PGY_AT', 'PGY_AT', 'B', b'1', 'Manual', NULL, 0, 9, b'1', NULL),
	('PowerFailure', 'Power Failure', 'NBP', b'1', 'Manual', NULL, 0, 28, b'1', NULL),
	('ProcessTraining', 'Process Training', 'NBP', b'1', 'Manual', NULL, 0, 11, b'1', NULL),
	('Production', 'Production', 'B', b'1', 'System', 'Production', 0, 1, b'1', NULL),
	('Production_Manual', 'Production Manual Entry', 'B', b'1', 'Manual', NULL, 0, 1, b'1', NULL),
	('ProjectManagement', 'Project Management', 'NBP', b'1', 'Manual', NULL, 0, 29, b'1', NULL),
	('ProjectTraining_NBP', 'Project Training', 'NBP', b'1', 'Manual', NULL, 0, 10, b'1', NULL),
	('QA', 'Quality Assurance Manual Entry', 'B', b'1', 'Manual', NULL, 0, 2, b'1', NULL),
	('QC', 'Quality Control Manual Entry', 'B', b'1', 'Manual', NULL, 0, 3, b'1', NULL),
	('QCFeedbackMeeting', 'QC Feedback meeting', 'NBP', b'1', 'Manual', NULL, 0, 21, b'1', NULL),
	('QualityAssurance', 'Quality Assurance', 'B', b'1', 'System', 'QualityAssurance', 0, 2, b'1', NULL),
	('QualityControl', 'Quality Control', 'B', b'1', 'System', 'QualityControl', 0, 3, b'1', NULL),
	('QualityReviewTask', 'Quality Review Task', 'B', b'1', 'Manual', NULL, 0, 8, b'1', NULL),
	('Rework', 'Rework', 'B', b'1', 'Manual', NULL, 0, 7, b'1', NULL),
	('RoadTypeClassification', 'Road Type Classification', 'B', b'1', 'Manual', NULL, 0, 5, b'1', NULL),
	('SoftwareIssue', 'Software Issue', 'NBP', b'1', 'Manual', NULL, 0, 25, b'1', NULL),
	('StatusUpdate', 'Status Update', 'NBP', b'1', 'Manual', NULL, 0, 22, b'1', NULL),
	('SystemProblem', 'System Problem', 'NBP', b'1', 'Manual', NULL, 0, 24, b'1', NULL),
	('TeamManagement', 'Team Management(TL)', 'NBP', b'1', 'Manual', NULL, 0, 23, b'1', NULL),
	('TeamMeeting', 'Team Meeting', 'NBP', b'1', 'Manual', NULL, 0, 17, b'1', NULL),
	('TechnicalSupport', 'Technical Support', 'NBP', b'1', 'Manual', NULL, 0, 14, b'1', NULL);

-- Dumping structure for table data_process.timesheet_process_project
CREATE TABLE IF NOT EXISTS `timesheet_process_project` (
  `autoId` bigint NOT NULL AUTO_INCREMENT,
  `processId` varchar(50) NOT NULL,
  `projectId` varchar(50) DEFAULT NULL,
  `displayOrder` int NOT NULL DEFAULT '1',
  `status` bit(1) NOT NULL DEFAULT b'1',
  PRIMARY KEY (`autoId`),
  KEY `FK_timesheetprocessproject_timesheetprocess` (`processId`),
  KEY `FK_timesheetprocessproject_operational_resource_project` (`projectId`),
  CONSTRAINT `FK_timesheetprocessproject_operational_resource_project` FOREIGN KEY (`projectId`) REFERENCES `tix_projects` (`projectId`),
  CONSTRAINT `FK_timesheetprocessproject_timesheetprocess` FOREIGN KEY (`processId`) REFERENCES `timesheet_process` (`processId`)
) ENGINE=InnoDB AUTO_INCREMENT=1074 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- Dumping data for table data_process.timesheet_process_project: ~66 rows (approximately)
INSERT INTO `timesheet_process_project` (`autoId`, `processId`, `projectId`, `displayOrder`, `status`) VALUES
	(1008, 'ClientMeeting', 'DEV1725282861622', 1, b'1'),
	(1009, 'ClientMeeting', 'DEV1725282861622', 2, b'1'),
	(1010, 'ClientMeeting', 'DEV1725282861622', 3, b'1'),
	(1011, 'ClientMeeting', 'DEV1725282861622', 4, b'1'),
	(1012, 'KnowledgeTransfer', 'DEV1725282861622', 5, b'1'),
	(1013, 'KnowledgeTransfer', 'DEV1725282861622', 6, b'1'),
	(1014, 'KnowledgeTransfer', 'DEV1725282861622', 7, b'1'),
	(1015, 'KnowledgeTransfer', 'DEV1725282861622', 8, b'1'),
	(1016, 'Meeting', 'DEV1725282861622', 9, b'1'),
	(1017, 'Meeting', 'DEV1725282861622', 10, b'1'),
	(1018, 'Meeting', 'DEV1725282861622', 11, b'1'),
	(1019, 'Meeting', 'DEV1725282861622', 12, b'1'),
	(1020, 'PCS1725291694033', 'DEV1725282861622', 13, b'1'),
	(1021, 'PCS1725291707667', 'DEV1725282861622', 14, b'1'),
	(1022, 'PCS1725291726165', 'DEV1725282861622', 15, b'1'),
	(1023, 'PCS1725291661267', 'DEV1725282861622', 16, b'1'),
	(1024, 'EarlyGoing', 'DEV1725282861622', 17, b'1'),
	(1025, 'IdleNoWork', 'DEV1725282861622', 18, b'1'),
	(1026, 'InternetProblem', 'DEV1725282861622', 19, b'1'),
	(1027, 'Permission', 'DEV1725282861622', 20, b'1'),
	(1028, 'PCS1725291707667', 'ProFoc0001', 1, b'1'),
	(1029, 'PCS1725291726165', 'ProFoc0001', 2, b'1'),
	(1030, 'PCS1725291661267', 'ProFoc0001', 3, b'1'),
	(1031, 'PCS1725291694033', 'ProFoc0001', 4, b'1'),
	(1032, 'Meeting', 'ProFoc0001', 5, b'1'),
	(1033, 'KnowledgeTransfer', 'ProFoc0001', 6, b'1'),
	(1034, 'ClientMeeting', 'ProFoc0001', 7, b'1'),
	(1035, 'EarlyGoing', 'ProFoc0001', 8, b'1'),
	(1036, 'IdleNoWork', 'ProFoc0001', 9, b'1'),
	(1037, 'LateComing', 'ProFoc0001', 10, b'1'),
	(1038, 'Permission', 'ProFoc0001', 11, b'1'),
	(1039, 'TeamMeeting', 'ProFoc0001', 12, b'1'),
	(1040, 'ClientFeedbackAnalysis', 'NoProjectDEV', 1, b'1'),
	(1041, 'ClientMeeting', 'NoProjectDEV', 2, b'1'),
	(1042, 'DailyStatusReviewMeeting', 'NoProjectDEV', 3, b'1'),
	(1043, 'DatabaseConnIssue', 'NoProjectDEV', 4, b'1'),
	(1044, 'DoubtClarification', 'NoProjectDEV', 5, b'1'),
	(1045, 'EarlyGoing', 'NoProjectDEV', 6, b'1'),
	(1046, 'FinalValidation', 'NoProjectDEV', 7, b'1'),
	(1047, 'IdleNoWork', 'NoProjectDEV', 8, b'1'),
	(1048, 'InputPreparation', 'NoProjectDEV', 9, b'1'),
	(1049, 'InternetProblem', 'NoProjectDEV', 10, b'1'),
	(1050, 'KnowledgeTransfer', 'NoProjectDEV', 11, b'1'),
	(1051, 'KnowledgeTransfer', 'NoProjectDEV', 12, b'1'),
	(1052, 'LateComing', 'NoProjectDEV', 13, b'1'),
	(1053, 'Meeting', 'NoProjectDEV', 14, b'1'),
	(1054, 'Meeting', 'NoProjectDEV', 15, b'1'),
	(1055, 'MeetingWithLeaders', 'NoProjectDEV', 16, b'1'),
	(1056, 'NewSpecUpdateMeeting', 'NoProjectDEV', 17, b'1'),
	(1057, 'OnlineQC', 'NoProjectDEV', 18, b'1'),
	(1058, 'Permission', 'NoProjectDEV', 19, b'1'),
	(1059, 'PGY_AT', 'NoProjectDEV', 20, b'1'),
	(1060, 'PowerFailure', 'NoProjectDEV', 21, b'1'),
	(1061, 'ProcessTraining', 'NoProjectDEV', 22, b'1'),
	(1062, 'ProjectTraining_NBP', 'NoProjectDEV', 23, b'1'),
	(1063, 'QCFeedbackMeeting', 'NoProjectDEV', 24, b'1'),
	(1064, 'QualityReviewTask', 'NoProjectDEV', 25, b'1'),
	(1065, 'Rework', 'NoProjectDEV', 26, b'1'),
	(1066, 'RoadTypeClassification', 'NoProjectDEV', 27, b'1'),
	(1067, 'SoftwareIssue', 'NoProjectDEV', 28, b'1'),
	(1068, 'StatusUpdate', 'NoProjectDEV', 29, b'1'),
	(1069, 'SystemProblem', 'NoProjectDEV', 30, b'1'),
	(1070, 'TeamManagement', 'NoProjectDEV', 31, b'1'),
	(1071, 'TeamMeeting', 'NoProjectDEV', 32, b'1'),
	(1072, 'TechnicalSupport', 'NoProjectDEV', 33, b'1'),
	(1073, 'PCS1725293137960', 'NoProjectDEV', 34, b'1');

-- Dumping structure for table data_process.tix_category
CREATE TABLE IF NOT EXISTS `tix_category` (
  `categoryId` varchar(50) NOT NULL,
  `parentCategoryId` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `categoryName` varchar(50) NOT NULL,
  `displayOrder` tinyint NOT NULL,
  `status` bit(1) NOT NULL DEFAULT (1),
  PRIMARY KEY (`categoryId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- Dumping data for table data_process.tix_category: ~6 rows (approximately)
INSERT INTO `tix_category` (`categoryId`, `parentCategoryId`, `categoryName`, `displayOrder`, `status`) VALUES
	('CID1000001', 'CID1000001', 'Solar', 1, b'1'),
	('CID1000002', 'CID1000002', 'RO', 2, b'1'),
	('CID1000003', 'CID1000002', 'RO250LPH', 3, b'1'),
	('CID1000004', 'CID1000002', 'RO500LPH', 4, b'1'),
	('CID1000005', 'CID1000002', 'RO1000LPH', 5, b'1'),
	('CID1000006', 'CID1000001', 'Inverter', 6, b'1');

-- Dumping structure for table data_process.tix_cook_book
CREATE TABLE IF NOT EXISTS `tix_cook_book` (
  `cookId` varchar(50) NOT NULL,
  `cookBookName` varchar(50) NOT NULL,
  `categoryId` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `goLinks` text CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `description` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `keywords` tinytext CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `createdBy` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `createdDate` datetime NOT NULL,
  `modifiedBy` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `modifiedDate` datetime NOT NULL,
  `status` bit(1) NOT NULL,
  PRIMARY KEY (`cookId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- Dumping data for table data_process.tix_cook_book: ~5 rows (approximately)
INSERT INTO `tix_cook_book` (`cookId`, `cookBookName`, `categoryId`, `goLinks`, `description`, `keywords`, `createdBy`, `createdDate`, `modifiedBy`, `modifiedDate`, `status`) VALUES
	('CB10001', 'SOLAR_BLINKER', 'CID1000001', 'www.google.com', 'Inverter-specific:\r\nDifferent inverter brands will have their own set of error codes, so consult the manufacturer\'s manual for accurate interpretations. \r\nCommon errors:\r\nGrid issues: Codes related to grid voltage, frequency, or connection problems. \r\nPanel faults: Insulation faults, hot spots, shading issues. \r\nCommunication errors: Issues with data transfer between panels and inverter. \r\nInternal faults: Inverter malfunctioning due to internal components. \r\nExamples of solar panel error codes:\r\nE018 (Leak Fault): Indicates a leakage current issue within the system \r\nE025 (Riso Low): Potential insulation fault on the solar array \r\nE031 (Error Read V): Incorrect voltage reading from the panels \r\nW003 (Grid Voltage Error): Issue with the grid voltage \r\nEvent 301 (Grid Fault): Inverter detects a problem with the grid connection \r\nError Code 3501 (Insulation Failure): Ground fault detected within the PV array \r\nWhat to do when you encounter a solar panel error code:\r\nConsult the manual: Refer to your inverter\'s user manual to understand the meaning of the specific error code. \r\nCheck connections: Ensure all connections between panels and the inverter are secure. \r\nInspect panels: Visually check the panels for damage, dirt, or shading issues \r\nMonitor system performance: Use the inverter display to observe if the error persists \r\nContact a professional: If you cannot identify the cause or resolve the issue, contact a qualified solar technician', 'inverter, Incorrect voltage, malfunction, hot, Panel E025', '10504', '2024-09-22 16:34:47', '10504', '2024-09-22 16:34:54', b'1'),
	('CBK1733061459464', 'Solar Panel Beep Sound', 'CID1000001', 'https://www.anewsolar.com.au/solar-inverter-error-codes/', 'Error Code 314\nError Code 314 on a Fronius inverter means that there is a current sensor calibration timeout or there is an internal system error. Usually, this problem just fixes itself as the inverter repeats its startup routine. If the problem persists, you should contact us on (08) 7078-7620 to investigate the issue.\n\nError Code 509\nIf your Fronius inverter encounters Error Code or State Code 509, it means that there is no energy fed into the grid in the last 24 hours. There could be a lot of reasons for this and one of them is that the solar panels are covered in dirt. One of Anew Solar’s service is solar panel cleaning so you might want to contact us to solve this problem. If it still does not work, we will inspect your inverter further.\n\nGrowatt Inverter Error Codes\nWhenever a Growatt solar inverter experiences faults, it will display the fault or error code. These codes indicate a particular problem or fault that the inverter is in. Listed below are some common error and fault codes that Growatt inverter users may face in the future and how it can be fixed:\n\nError Code 102\nWhen your Growatt solar inverter displays the Error Code 102, it means that the two CPU sampling date is inconsistent. To fix this problem, turn off the DC switch and wait until the inverter is totally shut down. Turn the inverter on again and observe if it still displays the same error.\n\nError Code 111\nAn Error Code 111 usually happens with a Growatt TL3 inverter series. When this error shows up, it means that there is an IGBT drive fault and that you should already contact your solar inverter installer for a checkup.\n\nError Code 117\nAn Error Code 117 on a Growatt solar inverter means that there is a problem in the relay circuit. Try to restart the inverter and if the problem persists, you should already contact your solar inverter installer.\n\nError Code 120\nWhen a Growatt solar inverter displays the Error Code 120, it means that there is a problem with the current sensor. This Error Code is also known as an HCT Fault.\n\nFault Codes\nGrowatt solar inverters can experience two types of faults: system faults and inverter faults.\n\nHCT Fault\nAs stated above, an HCT Fault means that the inverter is having problems with its current sensor. To repair this, simply restart the inverter and if it still isn’t fixed, contact your solar inverter installer.\n\nPV Isolation Low\nPV Isolation Low is a system fault on a Growatt solar inverter. This means that the inverter’s PV insulation impedance is too low or out of range.', 'PV insulation Growatt UpdateUpdateUpdate Test', '10504', '2024-12-01 19:27:39', '15006', '2024-12-31 14:22:45', b'0'),
	('CBK1735368444135', 'Solar Panel Beep Sound', 'CID1000001', 'https://www.anewsolar.com.au/solar-inverter-error-codes/', 'Error Code 314\nError Code 314 on a Fronius inverter means that there is a current sensor calibration timeout or there is an internal system error. Usually, this problem just fixes itself as the inverter repeats its startup routine. If the problem persists, you should contact us on (08) 7078-7620 to investigate the issue.\n\nError Code 509\nIf your Fronius inverter encounters Error Code or State Code 509, it means that there is no energy fed into the grid in the last 24 hours. There could be a lot of reasons for this and one of them is that the solar panels are covered in dirt. One of Anew Solar’s service is solar panel cleaning so you might want to contact us to solve this problem. If it still does not work, we will inspect your inverter further.\n\nGrowatt Inverter Error Codes\nWhenever a Growatt solar inverter experiences faults, it will display the fault or error code. These codes indicate a particular problem or fault that the inverter is in. Listed below are some common error and fault codes that Growatt inverter users may face in the future and how it can be fixed:\n\nError Code 102\nWhen your Growatt solar inverter displays the Error Code 102, it means that the two CPU sampling date is inconsistent. To fix this problem, turn off the DC switch and wait until the inverter is totally shut down. Turn the inverter on again and observe if it still displays the same error.\n\nError Code 111\nAn Error Code 111 usually happens with a Growatt TL3 inverter series. When this error shows up, it means that there is an IGBT drive fault and that you should already contact your solar inverter installer for a checkup.\n\nError Code 117\nAn Error Code 117 on a Growatt solar inverter means that there is a problem in the relay circuit. Try to restart the inverter and if the problem persists, you should already contact your solar inverter installer.\n\nError Code 120\nWhen a Growatt solar inverter displays the Error Code 120, it means that there is a problem with the current sensor. This Error Code is also known as an HCT Fault.\n\nFault Codes\nGrowatt solar inverters can experience two types of faults: system faults and inverter faults.\n\nHCT Fault\nAs stated above, an HCT Fault means that the inverter is having problems with its current sensor. To repair this, simply restart the inverter and if it still isn’t fixed, contact your solar inverter installer.\n\nPV Isolation Low\nPV Isolation Low is a system fault on a Growatt solar inverter. This means that the inverter’s PV insulation impedance is too low or out of range.', 'PV insulation Growatt', '15006', '2024-12-28 12:17:24', '15006', '2024-12-28 12:17:24', b'0'),
	('CBK1735368450638', 'Solar Panel Beep Sound1', 'CID1000001', 'https://www.anewsolar.com.au/solar-inverter-error-codes/', 'Error Code 314\nError Code 314 on a Fronius inverter means that there is a current sensor calibration timeout or there is an internal system error. Usually, this problem just fixes itself as the inverter repeats its startup routine. If the problem persists, you should contact us on (08) 7078-7620 to investigate the issue.\n\nError Code 509\nIf your Fronius inverter encounters Error Code or State Code 509, it means that there is no energy fed into the grid in the last 24 hours. There could be a lot of reasons for this and one of them is that the solar panels are covered in dirt. One of Anew Solar’s service is solar panel cleaning so you might want to contact us to solve this problem. If it still does not work, we will inspect your inverter further.\n\nGrowatt Inverter Error Codes\nWhenever a Growatt solar inverter experiences faults, it will display the fault or error code. These codes indicate a particular problem or fault that the inverter is in. Listed below are some common error and fault codes that Growatt inverter users may face in the future and how it can be fixed:\n\nError Code 102\nWhen your Growatt solar inverter displays the Error Code 102, it means that the two CPU sampling date is inconsistent. To fix this problem, turn off the DC switch and wait until the inverter is totally shut down. Turn the inverter on again and observe if it still displays the same error.\n\nError Code 111\nAn Error Code 111 usually happens with a Growatt TL3 inverter series. When this error shows up, it means that there is an IGBT drive fault and that you should already contact your solar inverter installer for a checkup.\n\nError Code 117\nAn Error Code 117 on a Growatt solar inverter means that there is a problem in the relay circuit. Try to restart the inverter and if the problem persists, you should already contact your solar inverter installer.\n\nError Code 120\nWhen a Growatt solar inverter displays the Error Code 120, it means that there is a problem with the current sensor. This Error Code is also known as an HCT Fault.\n\nFault Codes\nGrowatt solar inverters can experience two types of faults: system faults and inverter faults.\n\nHCT Fault\nAs stated above, an HCT Fault means that the inverter is having problems with its current sensor. To repair this, simply restart the inverter and if it still isn’t fixed, contact your solar inverter installer.\n\nPV Isolation Low\nPV Isolation Low is a system fault on a Growatt solar inverter. This means that the inverter’s PV insulation impedance is too low or out of range.', 'PV insulation Growatt', '15006', '2024-12-28 12:17:30', '15006', '2024-12-28 12:17:30', b'0'),
	('CBK1735635164856', 'Solar Panel Beep Sound1', 'CID1000001', 'https://www.anewsolar.com.au/solar-inverter-error-codes/', 'Error Code 314\nError Code 314 on a Fronius inverter means that there is a current sensor calibration timeout or there is an internal system error. Usually, this problem just fixes itself as the inverter repeats its startup routine. If the problem persists, you should contact us on (08) 7078-7620 to investigate the issue.\n\nError Code 509\nIf your Fronius inverter encounters Error Code or State Code 509, it means that there is no energy fed into the grid in the last 24 hours. There could be a lot of reasons for this and one of them is that the solar panels are covered in dirt. One of Anew Solar’s service is solar panel cleaning so you might want to contact us to solve this problem. If it still does not work, we will inspect your inverter further.\n\nGrowatt Inverter Error Codes\nWhenever a Growatt solar inverter experiences faults, it will display the fault or error code. These codes indicate a particular problem or fault that the inverter is in. Listed below are some common error and fault codes that Growatt inverter users may face in the future and how it can be fixed:\n\nError Code 102\nWhen your Growatt solar inverter displays the Error Code 102, it means that the two CPU sampling date is inconsistent. To fix this problem, turn off the DC switch and wait until the inverter is totally shut down. Turn the inverter on again and observe if it still displays the same error.\n\nError Code 111\nAn Error Code 111 usually happens with a Growatt TL3 inverter series. When this error shows up, it means that there is an IGBT drive fault and that you should already contact your solar inverter installer for a checkup.\n\nError Code 117\nAn Error Code 117 on a Growatt solar inverter means that there is a problem in the relay circuit. Try to restart the inverter and if the problem persists, you should already contact your solar inverter installer.\n\nError Code 120\nWhen a Growatt solar inverter displays the Error Code 120, it means that there is a problem with the current sensor. This Error Code is also known as an HCT Fault.\n\nFault Codes\nGrowatt solar inverters can experience two types of faults: system faults and inverter faults.\n\nHCT Fault\nAs stated above, an HCT Fault means that the inverter is having problems with its current sensor. To repair this, simply restart the inverter and if it still isn’t fixed, contact your solar inverter installer.\n\nPV Isolation Low\nPV Isolation Low is a system fault on a Growatt solar inverter. This means that the inverter’s PV insulation impedance is too low or out of range.', 'PV insulation Growatt', '15006', '2024-12-31 14:22:44', '15006', '2024-12-31 14:22:44', b'0');

-- Dumping structure for table data_process.tix_customer
CREATE TABLE IF NOT EXISTS `tix_customer` (
  `customerId` varchar(50) NOT NULL,
  `customerName` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL,
  `mobileNumber` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL,
  `alternateNumber` varchar(20) DEFAULT NULL,
  `address` varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL,
  `createdBy` varchar(50) DEFAULT NULL,
  `createdDate` datetime DEFAULT NULL,
  `status` bit(1) DEFAULT NULL,
  PRIMARY KEY (`customerId`) USING BTREE,
  UNIQUE KEY `phoneNumber` (`mobileNumber`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- Dumping data for table data_process.tix_customer: ~21 rows (approximately)
INSERT INTO `tix_customer` (`customerId`, `customerName`, `mobileNumber`, `alternateNumber`, `address`, `createdBy`, `createdDate`, `status`) VALUES
	('CID10001', 'Muthu', '9884080613', NULL, 'AID100001', '15006', '2024-09-28 21:48:08', b'1'),
	('CID10002', 'Muthu', '9003925051', NULL, 'AID100002', '15006', '2024-09-28 21:48:11', b'1'),
	('CID10003', 'Tamil', '9790756096', NULL, 'AID100003', '15006', '2024-09-28 21:48:13', b'1'),
	('CID10004', 'Ravi', '9003925054', NULL, 'AID100004', '15006', '2024-09-28 21:48:14', b'1'),
	('CID10005', 'Arjun', '9003925059', NULL, 'AID100005', '15006', '2024-09-28 21:48:16', b'1'),
	('CID10006', 'Kumar', '9003925058', NULL, 'AID100006', '15006', '2024-09-28 21:48:18', b'1'),
	('CST1735125454274', 'Hariharan', '9677101113', '9500395591', '77/1 Sannathi Street, TPK, Madurai - 625005', '15006', '2024-12-25 16:47:34', b'1'),
	('CST1735130898518', 'Hariharan', '9677101112', '9500395591', '77/1 Sannathi Street, TPK, Madurai - 625005', '15006', '2024-12-25 18:18:18', b'1'),
	('CST1736771979425', 'TamilSelvan', '96771012222', '9500393444', '7/1 Ganthi Street, TPK, Madurai - 625005', '15006', '2025-01-13 18:09:39', b'1'),
	('CST1736772440845', 'Baskar', '2233444444', '3333444432', 'Mohanue', '15002', '2025-01-13 18:17:20', b'1'),
	('CST1736786253855', 'Muthu', '8833445566', '9884080612', 'Nkl', '15002', '2025-01-13 22:07:33', b'1'),
	('CST1736786601887', 'Selenium', '88334455333', '9884080612', 'Nkl', '15002', '2025-01-13 22:13:21', b'1'),
	('CST1736838208412', 'jaya', '88776655', '77889900', 'kolimalai', '15002', '2025-01-14 12:33:28', b'1'),
	('CST1736838320106', 'quin', '998877', '778899', 'salem', '15002', '2025-01-14 12:35:20', b'1'),
	('CST1736838558483', 'Raja', '445566', '667788', 'Karur', '15002', '2025-01-14 12:39:18', b'1'),
	('CST1736847144781', 'Siva', '2345', '34567', 'Belukurichi', '15002', '2025-01-14 15:02:24', b'1'),
	('CST1736847160537', 'Kumar', '787878', '878787', 'Belukurichi', '15002', '2025-01-14 15:02:40', b'1'),
	('CST1736847184790', 'Selvan', '889977', '889900', 'Chennai', '15002', '2025-01-14 15:03:04', b'1'),
	('CST1736847202290', 'Rajak', '8877554', '6778999', 'Belukirichi', '15002', '2025-01-14 15:03:22', b'1'),
	('CST1736862203461', 'Selenium34', '0988888888', '9884080612', 'Nkl', '15002', '2025-01-14 19:13:23', b'1'),
	('CST1737131844295', 'Kalaiyarasan', '09003925059', 's222', '19/1, V. A Plaza\n80 Ft Rd,', '15002', '2025-01-17 22:07:24', b'1'),
	('CST1737618913569', 'HariKumar', '9677101333', '9500395522', '77/1 Sannathi Street, TPK, Madurai - 625005', '15006', '2025-01-23 13:25:13', b'1'),
	('CST1738154548651', 'Naga', '4455', '66666', 'mohanur', '15002', '2025-01-29 18:12:28', b'1');

-- Dumping structure for table data_process.tix_incident
CREATE TABLE IF NOT EXISTS `tix_incident` (
  `incidentId` varchar(50) NOT NULL,
  `cookId` varchar(50) DEFAULT NULL,
  `customerId` varchar(50) DEFAULT NULL,
  `priority` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL DEFAULT 'Low' COMMENT 'Low/Medium/High/Urgent',
  `supportType` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL COMMENT 'Internal/ External',
  `description` varchar(500) DEFAULT NULL,
  `taskStatus` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL COMMENT 'Accepted, Transformed',
  `taskDuration` int DEFAULT '0',
  `eventTrack` mediumtext CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci,
  `createdBy` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL,
  `createdDate` datetime DEFAULT NULL,
  `modifiedBy` varchar(50) DEFAULT NULL,
  `modifiedDate` datetime DEFAULT NULL,
  PRIMARY KEY (`incidentId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- Dumping data for table data_process.tix_incident: ~0 rows (approximately)
INSERT INTO `tix_incident` (`incidentId`, `cookId`, `customerId`, `priority`, `supportType`, `description`, `taskStatus`, `taskDuration`, `eventTrack`, `createdBy`, `createdDate`, `modifiedBy`, `modifiedDate`) VALUES
	('IN001', 'CB10001', 'CID10001', 'Low', 'Internal', NULL, 'Open', 0, NULL, '15002', '2025-01-11 16:48:27', '15002', '2025-01-11 16:48:27'),
	('INC1737620095467', NULL, 'CST1735130898518', 'Low', 'Internal', NULL, 'Open', 0, NULL, '15006', '2025-01-23 13:44:55', '15006', '2025-01-23 13:44:55');

-- Dumping structure for table data_process.tix_media_group
CREATE TABLE IF NOT EXISTS `tix_media_group` (
  `groupId` varchar(50) NOT NULL DEFAULT '',
  `groupName` varchar(50) DEFAULT NULL,
  `mediaType` varchar(50) DEFAULT NULL COMMENT 'Email/SMS/WhatsApp',
  `messageId` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL COMMENT 'Message  Id From Messages Table',
  `toGroup` mediumtext CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci,
  `ccGroup` mediumtext CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci,
  `bccGroup` mediumtext CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci,
  `status` bit(1) NOT NULL DEFAULT (0x01),
  PRIMARY KEY (`groupId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- Dumping data for table data_process.tix_media_group: ~0 rows (approximately)
INSERT INTO `tix_media_group` (`groupId`, `groupName`, `mediaType`, `messageId`, `toGroup`, `ccGroup`, `bccGroup`, `status`) VALUES
	('NTN1234567890', 'IncidentEmailGroup', 'Email', 'CreateIncidentEmail', '', '', 'anandb.hbs@gmail.com, soundaravalli2021@gmail.com, tamils1978@gmail.com, muthuslm@gmail.com', b'1');

-- Dumping structure for table data_process.tix_projects
CREATE TABLE IF NOT EXISTS `tix_projects` (
  `projectId` varchar(50) NOT NULL,
  `projectName` varchar(50) NOT NULL,
  `divisionId` varchar(50) NOT NULL,
  `displayOrder` int DEFAULT '0',
  `status` bit(1) NOT NULL DEFAULT b'1',
  `template` mediumtext,
  `mode` varchar(50) NOT NULL DEFAULT 'Info',
  `templateUploadDate` datetime DEFAULT NULL,
  `clientName` varchar(50) DEFAULT NULL,
  `projectType` varchar(50) DEFAULT NULL,
  `projectManagerId` varchar(50) DEFAULT 'EDRAdmin',
  `poNumber` varchar(50) DEFAULT NULL,
  `poDated` varchar(50) DEFAULT NULL,
  `billingCycle` varchar(50) DEFAULT NULL,
  `projectStatus` varchar(50) DEFAULT NULL,
  `deliverables` varchar(50) DEFAULT NULL,
  `modeOfDelivery` varchar(50) DEFAULT NULL,
  `inputReceivingMode` varchar(50) DEFAULT NULL,
  `inputType` varchar(50) DEFAULT NULL,
  `displayInOtherUIProjectList` varchar(50) DEFAULT NULL,
  `totalProjectedWorkVolume` varchar(50) DEFAULT NULL,
  `unitsOfMeasurement` varchar(50) DEFAULT NULL,
  `receivedWorkVolume` varchar(50) DEFAULT NULL,
  `estimatedTotalHours` varchar(50) DEFAULT NULL,
  `plannedNoOfResources` varchar(50) DEFAULT NULL,
  `noOfDaysRequiredToComplete` varchar(50) DEFAULT NULL,
  `resourceStartDate` datetime DEFAULT NULL,
  `resourceEndDate` datetime DEFAULT NULL,
  `bpsStartDate` varchar(50) DEFAULT NULL,
  `bpsPlannedCompletionDate` varchar(50) DEFAULT NULL,
  `clientExpectedCompletionDate` varchar(50) DEFAULT NULL,
  `actualCompletedDate` varchar(50) DEFAULT NULL,
  `createdBy` varchar(50) DEFAULT NULL,
  `createdDate` datetime DEFAULT NULL,
  `modifiedBy` varchar(50) DEFAULT NULL,
  `modifiedDate` datetime DEFAULT NULL,
  PRIMARY KEY (`projectId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- Dumping data for table data_process.tix_projects: ~8 rows (approximately)
INSERT INTO `tix_projects` (`projectId`, `projectName`, `divisionId`, `displayOrder`, `status`, `template`, `mode`, `templateUploadDate`, `clientName`, `projectType`, `projectManagerId`, `poNumber`, `poDated`, `billingCycle`, `projectStatus`, `deliverables`, `modeOfDelivery`, `inputReceivingMode`, `inputType`, `displayInOtherUIProjectList`, `totalProjectedWorkVolume`, `unitsOfMeasurement`, `receivedWorkVolume`, `estimatedTotalHours`, `plannedNoOfResources`, `noOfDaysRequiredToComplete`, `resourceStartDate`, `resourceEndDate`, `bpsStartDate`, `bpsPlannedCompletionDate`, `clientExpectedCompletionDate`, `actualCompletedDate`, `createdBy`, `createdDate`, `modifiedBy`, `modifiedDate`) VALUES
	('Admin', 'Admin', 'Accounts', 7, b'1', '{\r\n   "discardPercentage":1,\r\n   "skipRows":2,\r\n   "columnMetaData":[\r\n      {\r\n         "cellIndex":1,\r\n         "fieldName":"receivedDate",\r\n         "parentCellIndex":1,\r\n         "parentFieldName":"receivedDate"\r\n      },\r\n      {\r\n         "cellIndex":2,\r\n         "fieldName":"workUnitId",\r\n         "parentCellIndex":2,\r\n         "parentFieldName":"workUnitId"\r\n      },\r\n      {\r\n         "cellIndex":3,\r\n         "fieldName":"subCountry",\r\n         "parentCellIndex":3,\r\n         "parentFieldName":"subCountry"\r\n      },\r\n      {\r\n         "cellIndex":4,\r\n         "fieldName":"wuMiles",\r\n         "parentCellIndex":4,\r\n         "parentFieldName":"wuMiles"\r\n      },\r\n      {\r\n         "cellIndex":5,\r\n         "fieldName":"roadType",\r\n         "parentCellIndex":5,\r\n         "parentFieldName":"roadType"\r\n      },\r\n      {\r\n         "cellIndex":6,\r\n         "fieldName":"PRIMARYNONDIVIDEDMOTORWAYS",\r\n         "parentCellIndex":5,\r\n         "parentFieldName":"roadType"\r\n      },\r\n      {\r\n         "cellIndex":7,\r\n         "fieldName":"PRIMARYNONDIVIDEDTRUNK",\r\n         "parentCellIndex":5,\r\n         "parentFieldName":"roadType"\r\n      },\r\n      {\r\n         "cellIndex":8,\r\n         "fieldName":"PRIMARYNONDIVIDEDURBAN",\r\n         "parentCellIndex":5,\r\n         "parentFieldName":"roadType"\r\n      },\r\n      {\r\n         "cellIndex":9,\r\n         "fieldName":"group",\r\n         "parentCellIndex":9,\r\n         "parentFieldName":"group"\r\n      }\r\n   ],\r\n   "mandateColumnMetaData":[\r\n      {\r\n         "cellIndex":1,\r\n         "fieldName":"receivedDate",\r\n         "parentCellIndex":1,\r\n         "parentFieldName":"receivedDate"\r\n      },\r\n      {\r\n         "cellIndex":2,\r\n         "fieldName":"workUnitId",\r\n         "parentCellIndex":2,\r\n         "parentFieldName":"workUnitId"\r\n      }\r\n   ]\r\n}', 'Info', NULL, NULL, NULL, '15001', NULL, NULL, NULL, 'InProgress', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2024-12-01 00:00:00', '2025-12-01 00:00:00', NULL, NULL, NULL, NULL, '15001', '2022-11-01 00:00:00', '15001', '2022-11-01 00:00:00'),
	('DEV1725282861622', 'Acco', 'DEV', 8, b'1', '{\r\n   "columnMetaData":[\r\n      {\r\n	"cellIndex":0,\r\n	"fieldName":"slNo",\r\n	"parentCellIndex":0,\r\n        "parentFieldName":"slNo"\r\n      },\r\n      {\r\n         "cellIndex":1,\r\n         "fieldName":"receivedDate",\r\n         "parentCellIndex":1,\r\n         "parentFieldName":"receivedDate"\r\n      },\r\n      {\r\n         "cellIndex":2,\r\n         "fieldName":"group",\r\n         "parentCellIndex":2,\r\n         "parentFieldName":"group"\r\n      },\r\n      {\r\n         "cellIndex":3,\r\n         "fieldName":"project",\r\n         "parentCellIndex":3,\r\n         "parentFieldName":"project"\r\n      },\r\n      {\r\n         "cellIndex":4,\r\n         "fieldName":"workUnitId",\r\n         "parentCellIndex":4,\r\n         "parentFieldName":"workUnitId"\r\n      },\r\n      {\r\n         "cellIndex":5,\r\n         "fieldName":"subCountry",\r\n         "parentCellIndex":5,\r\n         "parentFieldName":"subCountry"\r\n      },\r\n      {\r\n         "cellIndex":6,\r\n         "fieldName":"wuMiles",\r\n         "parentCellIndex":6,\r\n         "parentFieldName":"wuMiles"\r\n      },\r\n      {\r\n         "cellIndex":7,\r\n         "fieldName":"remarks",\r\n         "parentCellIndex":7,\r\n         "parentFieldName":"remarks"\r\n      },\r\n      {\r\n         "cellIndex":8,\r\n         "fieldName":"roadType",\r\n         "parentCellIndex":8,\r\n         "parentFieldName":"roadType"\r\n      }\r\n   ],\r\n   "discardPercentage":1,\r\n   "mandateColumnMetaData":[\r\n      {\r\n         "cellIndex":1,\r\n         "fieldName":"receivedDate",\r\n         "parentCellIndex":1,\r\n         "parentFieldName":"receivedDate"\r\n      },\r\n      {\r\n         "cellIndex":4,\r\n         "fieldName":"workUnitId",\r\n         "parentCellIndex":4,\r\n         "parentFieldName":"workUnitId"\r\n      }\r\n   ],\r\n   "skipRows":2\r\n}', 'Info', '2024-09-02 18:44:22', '', 'Angular Node', '15003', '', '', '', 'InProgress', '', 'DirectToClientServer', '', '', 'Active', '100', '', '', '360', '3', '90', '2024-12-01 00:00:00', '2025-12-01 00:00:00', '', '', '', '', '15001', '2024-09-02 18:44:22', '15001', '2024-09-02 18:44:22'),
	('ITAdmin', 'IT Admin', 'IT', 1, b'1', '{\r\n   "discardPercentage":1,\r\n   "skipRows":2,\r\n   "columnMetaData":[\r\n      {\r\n         "cellIndex":1,\r\n         "fieldName":"receivedDate",\r\n         "parentCellIndex":1,\r\n         "parentFieldName":"receivedDate"\r\n      },\r\n      {\r\n         "cellIndex":2,\r\n         "fieldName":"workUnitId",\r\n         "parentCellIndex":2,\r\n         "parentFieldName":"workUnitId"\r\n      },\r\n      {\r\n         "cellIndex":3,\r\n         "fieldName":"subCountry",\r\n         "parentCellIndex":3,\r\n         "parentFieldName":"subCountry"\r\n      },\r\n      {\r\n         "cellIndex":4,\r\n         "fieldName":"wuMiles",\r\n         "parentCellIndex":4,\r\n         "parentFieldName":"wuMiles"\r\n      },\r\n      {\r\n         "cellIndex":5,\r\n         "fieldName":"roadType",\r\n         "parentCellIndex":5,\r\n         "parentFieldName":"roadType"\r\n      },\r\n      {\r\n         "cellIndex":6,\r\n         "fieldName":"PRIMARYNONDIVIDEDMOTORWAYS",\r\n         "parentCellIndex":5,\r\n         "parentFieldName":"roadType"\r\n      },\r\n      {\r\n         "cellIndex":7,\r\n         "fieldName":"PRIMARYNONDIVIDEDTRUNK",\r\n         "parentCellIndex":5,\r\n         "parentFieldName":"roadType"\r\n      },\r\n      {\r\n         "cellIndex":8,\r\n         "fieldName":"PRIMARYNONDIVIDEDURBAN",\r\n         "parentCellIndex":5,\r\n         "parentFieldName":"roadType"\r\n      },\r\n      {\r\n         "cellIndex":9,\r\n         "fieldName":"group",\r\n         "parentCellIndex":9,\r\n         "parentFieldName":"group"\r\n      }\r\n   ],\r\n   "mandateColumnMetaData":[\r\n      {\r\n         "cellIndex":1,\r\n         "fieldName":"receivedDate",\r\n         "parentCellIndex":1,\r\n         "parentFieldName":"receivedDate"\r\n      },\r\n      {\r\n         "cellIndex":2,\r\n         "fieldName":"workUnitId",\r\n         "parentCellIndex":2,\r\n         "parentFieldName":"workUnitId"\r\n      }\r\n   ]\r\n}', 'Info', NULL, NULL, NULL, '15001', NULL, NULL, NULL, 'InProgress', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2024-12-01 00:00:00', '2025-12-01 00:00:00', NULL, NULL, NULL, NULL, '15001', '2022-11-01 00:00:00', '15001', '2022-11-01 00:00:00'),
	('None', 'No Project', 'NODIVISION', 1, b'0', '{}', 'Info', NULL, NULL, NULL, '15001', NULL, NULL, NULL, 'InProgress', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2024-12-01 00:00:00', '2025-12-01 00:00:00', NULL, NULL, NULL, NULL, '15001', '2022-11-01 00:00:00', '15001', '2022-11-01 00:00:00'),
	('NoProjectDEV', 'No Project', 'DEV', 1, b'1', '{\r\n   "columnMetaData":[\r\n      {\r\n	"cellIndex":0,\r\n	"fieldName":"slNo",\r\n	"parentCellIndex":0,\r\n        "parentFieldName":"slNo"\r\n      },\r\n      {\r\n         "cellIndex":1,\r\n         "fieldName":"receivedDate",\r\n         "parentCellIndex":1,\r\n         "parentFieldName":"receivedDate"\r\n      },\r\n      {\r\n         "cellIndex":2,\r\n         "fieldName":"group",\r\n         "parentCellIndex":2,\r\n         "parentFieldName":"group"\r\n      },\r\n      {\r\n         "cellIndex":3,\r\n         "fieldName":"project",\r\n         "parentCellIndex":3,\r\n         "parentFieldName":"project"\r\n      },\r\n      {\r\n         "cellIndex":4,\r\n         "fieldName":"workUnitId",\r\n         "parentCellIndex":4,\r\n         "parentFieldName":"workUnitId"\r\n      },\r\n      {\r\n         "cellIndex":5,\r\n         "fieldName":"subCountry",\r\n         "parentCellIndex":5,\r\n         "parentFieldName":"subCountry"\r\n      },\r\n      {\r\n         "cellIndex":6,\r\n         "fieldName":"wuMiles",\r\n         "parentCellIndex":6,\r\n         "parentFieldName":"wuMiles"\r\n      },\r\n      {\r\n         "cellIndex":7,\r\n         "fieldName":"remarks",\r\n         "parentCellIndex":7,\r\n         "parentFieldName":"remarks"\r\n      },\r\n      {\r\n         "cellIndex":8,\r\n         "fieldName":"roadType",\r\n         "parentCellIndex":8,\r\n         "parentFieldName":"roadType"\r\n      }\r\n   ],\r\n   "discardPercentage":1,\r\n   "mandateColumnMetaData":[\r\n      {\r\n         "cellIndex":1,\r\n         "fieldName":"receivedDate",\r\n         "parentCellIndex":1,\r\n         "parentFieldName":"receivedDate"\r\n      },\r\n      {\r\n         "cellIndex":4,\r\n         "fieldName":"workUnitId",\r\n         "parentCellIndex":4,\r\n         "parentFieldName":"workUnitId"\r\n      }\r\n   ],\r\n   "skipRows":2\r\n}', 'Info', NULL, NULL, NULL, '15001', NULL, NULL, NULL, 'InProgress', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2024-12-01 00:00:00', '2025-12-01 00:00:00', NULL, NULL, NULL, NULL, '15001', '2022-11-01 00:00:00', '15001', '2022-11-01 00:00:00'),
	('NoProjectHR', 'No Project', 'HRAdmin', 1, b'1', '{\r\n   "columnMetaData":[\r\n      {\r\n	"cellIndex":0,\r\n	"fieldName":"slNo",\r\n	"parentCellIndex":0,\r\n        "parentFieldName":"slNo"\r\n      },\r\n      {\r\n         "cellIndex":1,\r\n         "fieldName":"receivedDate",\r\n         "parentCellIndex":1,\r\n         "parentFieldName":"receivedDate"\r\n      },\r\n      {\r\n         "cellIndex":2,\r\n         "fieldName":"group",\r\n         "parentCellIndex":2,\r\n         "parentFieldName":"group"\r\n      },\r\n      {\r\n         "cellIndex":3,\r\n         "fieldName":"project",\r\n         "parentCellIndex":3,\r\n         "parentFieldName":"project"\r\n      },\r\n      {\r\n         "cellIndex":4,\r\n         "fieldName":"workUnitId",\r\n         "parentCellIndex":4,\r\n         "parentFieldName":"workUnitId"\r\n      },\r\n      {\r\n         "cellIndex":5,\r\n         "fieldName":"subCountry",\r\n         "parentCellIndex":5,\r\n         "parentFieldName":"subCountry"\r\n      },\r\n      {\r\n         "cellIndex":6,\r\n         "fieldName":"wuMiles",\r\n         "parentCellIndex":6,\r\n         "parentFieldName":"wuMiles"\r\n      },\r\n      {\r\n         "cellIndex":7,\r\n         "fieldName":"remarks",\r\n         "parentCellIndex":7,\r\n         "parentFieldName":"remarks"\r\n      },\r\n      {\r\n         "cellIndex":8,\r\n         "fieldName":"roadType",\r\n         "parentCellIndex":8,\r\n         "parentFieldName":"roadType"\r\n      }\r\n   ],\r\n   "discardPercentage":1,\r\n   "mandateColumnMetaData":[\r\n      {\r\n         "cellIndex":1,\r\n         "fieldName":"receivedDate",\r\n         "parentCellIndex":1,\r\n         "parentFieldName":"receivedDate"\r\n      },\r\n      {\r\n         "cellIndex":4,\r\n         "fieldName":"workUnitId",\r\n         "parentCellIndex":4,\r\n         "parentFieldName":"workUnitId"\r\n      }\r\n   ],\r\n   "skipRows":2\r\n}', 'Info', NULL, NULL, NULL, '15001', NULL, NULL, NULL, 'InProgress', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2024-12-01 00:00:00', '2025-12-01 00:00:00', NULL, NULL, NULL, NULL, '15001', '2022-11-01 00:00:00', '15001', '2022-11-01 00:00:00'),
	('NoProjectIT', 'No Project', 'IT', 1, b'1', '{\r\n   "columnMetaData":[\r\n      {\r\n	"cellIndex":0,\r\n	"fieldName":"slNo",\r\n	"parentCellIndex":0,\r\n        "parentFieldName":"slNo"\r\n      },\r\n      {\r\n         "cellIndex":1,\r\n         "fieldName":"receivedDate",\r\n         "parentCellIndex":1,\r\n         "parentFieldName":"receivedDate"\r\n      },\r\n      {\r\n         "cellIndex":2,\r\n         "fieldName":"group",\r\n         "parentCellIndex":2,\r\n         "parentFieldName":"group"\r\n      },\r\n      {\r\n         "cellIndex":3,\r\n         "fieldName":"project",\r\n         "parentCellIndex":3,\r\n         "parentFieldName":"project"\r\n      },\r\n      {\r\n         "cellIndex":4,\r\n         "fieldName":"workUnitId",\r\n         "parentCellIndex":4,\r\n         "parentFieldName":"workUnitId"\r\n      },\r\n      {\r\n         "cellIndex":5,\r\n         "fieldName":"subCountry",\r\n         "parentCellIndex":5,\r\n         "parentFieldName":"subCountry"\r\n      },\r\n      {\r\n         "cellIndex":6,\r\n         "fieldName":"wuMiles",\r\n         "parentCellIndex":6,\r\n         "parentFieldName":"wuMiles"\r\n      },\r\n      {\r\n         "cellIndex":7,\r\n         "fieldName":"remarks",\r\n         "parentCellIndex":7,\r\n         "parentFieldName":"remarks"\r\n      },\r\n      {\r\n         "cellIndex":8,\r\n         "fieldName":"roadType",\r\n         "parentCellIndex":8,\r\n         "parentFieldName":"roadType"\r\n      }\r\n   ],\r\n   "discardPercentage":1,\r\n   "mandateColumnMetaData":[\r\n      {\r\n         "cellIndex":1,\r\n         "fieldName":"receivedDate",\r\n         "parentCellIndex":1,\r\n         "parentFieldName":"receivedDate"\r\n      },\r\n      {\r\n         "cellIndex":4,\r\n         "fieldName":"workUnitId",\r\n         "parentCellIndex":4,\r\n         "parentFieldName":"workUnitId"\r\n      }\r\n   ],\r\n   "skipRows":2\r\n}', 'Info', NULL, NULL, NULL, '15001', NULL, NULL, NULL, 'InProgress', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2024-12-01 00:00:00', '2025-12-01 00:00:00', NULL, NULL, NULL, NULL, '15001', '2022-11-01 00:00:00', '15001', '2022-11-01 00:00:00'),
	('ProFoc0001', 'Focus', 'DEV', 1, b'1', NULL, 'Info', NULL, 'Stashook', NULL, '15235', NULL, NULL, NULL, 'InProgress', NULL, 'Online', 'Online', 'Text', NULL, NULL, NULL, NULL, '600', '3', '35', '2024-12-01 00:00:00', '2025-12-01 00:00:00', NULL, NULL, NULL, NULL, '15235', '2024-08-21 00:00:00', '15235', '2024-08-21 00:00:00');

-- Dumping structure for table data_process.tix_queue
CREATE TABLE IF NOT EXISTS `tix_queue` (
  `queueId` varchar(50) NOT NULL,
  `queueName` varchar(50) DEFAULT NULL,
  `shortName` varchar(5) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL,
  `level` int DEFAULT '0',
  `displayOrder` int NOT NULL DEFAULT '0',
  `status` bit(1) NOT NULL DEFAULT b'1',
  `reAllocate` bit(1) NOT NULL DEFAULT b'0',
  PRIMARY KEY (`queueId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- Dumping data for table data_process.tix_queue: ~16 rows (approximately)
INSERT INTO `tix_queue` (`queueId`, `queueName`, `shortName`, `level`, `displayOrder`, `status`, `reAllocate`) VALUES
	('Final', 'Final Queue', 'RFD', 100, 60, b'1', b'1'),
	('GroupQ', 'Group Queue', 'GRP', 20, 10, b'1', b'1'),
	('HoldQ', 'Hold Queue', 'HLD', 99, 100, b'1', b'0'),
	('Initial', 'Initial Queue', 'INI', 10, 11, b'1', b'1'),
	('Installation', 'Installation', 'INS', 40, 30, b'1', b'1'),
	('InstallationTeam', 'Installation Team', 'ITM', 30, 20, b'1', b'1'),
	('QASInstallation', 'Quality Assurance', 'IQAS', 50, 20, b'1', b'1'),
	('QASInstallationTeam', 'Quality Assurance Team', 'IQAST', 50, 20, b'1', b'1'),
	('QASService', 'Quality Assurance', 'SQAS', 60, 20, b'1', b'1'),
	('QASServiceTeam', 'Quality Assurance Team', 'SQAST', 60, 20, b'1', b'1'),
	('QCInstallation', 'Quality Control', 'IQC', 50, 20, b'1', b'1'),
	('QCInstallationTeam', 'Quality Control Team', 'IQCT', 50, 20, b'1', b'1'),
	('QCService', 'Quality Control', 'SQC', 60, 20, b'1', b'1'),
	('QCServiceTeam', 'Quality Control Team', 'SQCT', 60, 20, b'1', b'1'),
	('Service', 'Service', 'SRV', 40, 50, b'1', b'1'),
	('ServiceTeam', 'Service Team', 'STM', 30, 40, b'1', b'1');

-- Dumping structure for table data_process.tix_queue_role
CREATE TABLE IF NOT EXISTS `tix_queue_role` (
  `autoId` int NOT NULL AUTO_INCREMENT,
  `queueId` varchar(50) NOT NULL,
  `roleId` varchar(100) NOT NULL,
  `editable` bit(1) NOT NULL DEFAULT b'0',
  PRIMARY KEY (`autoId`)
) ENGINE=InnoDB AUTO_INCREMENT=15 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- Dumping data for table data_process.tix_queue_role: ~14 rows (approximately)
INSERT INTO `tix_queue_role` (`autoId`, `queueId`, `roleId`, `editable`) VALUES
	(1, 'Initial', 'Support', b'1'),
	(2, 'GroupQ', 'TeamLeader', b'1'),
	(3, 'InstallationTeam', 'TeamLeader', b'1'),
	(4, 'ServiceTeam', 'TeamLeader', b'1'),
	(5, 'Installation', 'Executive', b'1'),
	(6, 'Service', 'Executive', b'1'),
	(7, 'Final', 'Executive', b'0'),
	(8, 'Hold', 'Executive', b'1'),
	(9, 'Final', 'TeamLeader', b'0'),
	(10, 'Hold', 'TeamLeader', b'1'),
	(11, 'QASInstallationTeam', 'TeamLeader', b'1'),
	(12, 'QCInstallationTeam', 'TeamLeader', b'1'),
	(13, 'QASInstallation', 'Executive', b'1'),
	(14, 'QCInstallation', 'Executive', b'1');

-- Dumping structure for table data_process.tix_queue_status_reason
CREATE TABLE IF NOT EXISTS `tix_queue_status_reason` (
  `autoId` int NOT NULL AUTO_INCREMENT,
  `queueId` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `statusId` varchar(50) NOT NULL DEFAULT 'Ready',
  `reasonId` varchar(100) NOT NULL DEFAULT 'NoReason',
  `nextQueueId` varchar(50) DEFAULT NULL,
  `division` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT 'No_Division',
  `displayOrder` int NOT NULL DEFAULT '1',
  `status` bit(1) NOT NULL DEFAULT b'1',
  PRIMARY KEY (`autoId`)
) ENGINE=InnoDB AUTO_INCREMENT=25 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- Dumping data for table data_process.tix_queue_status_reason: ~23 rows (approximately)
INSERT INTO `tix_queue_status_reason` (`autoId`, `queueId`, `statusId`, `reasonId`, `nextQueueId`, `division`, `displayOrder`, `status`) VALUES
	(1, 'GroupQ', 'Ready', 'NoReason', 'GroupQ', 'No_Division', 100, b'1'),
	(2, 'GroupQ', 'Assigned', 'NoReason', 'GroupQ', 'Execution', 110, b'1'),
	(3, 'GroupQ', 'Assigned', 'NoReason', 'GroupQ', 'Repair', 120, b'1'),
	(4, 'InstallationTeam', 'Ready', 'NoReason', 'InstallationTeam', 'Execution', 130, b'1'),
	(5, 'InstallationTeam', 'Assigned', 'NoReason', 'Installation', 'Execution', 140, b'1'),
	(6, 'ServiceTeam', 'Ready', 'NoReason', 'ServiceTeam', 'Repair', 150, b'1'),
	(7, 'ServiceTeam', 'Assigned', 'NoReason', 'Service', 'Repair', 160, b'1'),
	(8, 'QASInstallationTeam', 'Ready', 'NoReason', 'QASInstallationTeam', 'Execution', 170, b'1'),
	(9, 'QASInstallationTeam', 'Assigned', 'NoReason', 'QASInstallation', 'Execution', 180, b'1'),
	(10, 'QCInstallationTeam', 'Ready', 'NoReason', 'QCInstallationTeam', 'Execution', 190, b'1'),
	(11, 'QCInstallationTeam', 'Assigned', 'NoReason', 'QCInstallation', 'Execution', 200, b'1'),
	(12, 'QASServiceTeam', 'Ready', 'NoReason', 'QASServiceTeam', 'Service', 210, b'1'),
	(13, 'QASServiceTeam', 'Assigned', 'NoReason', 'QASService', 'Service', 220, b'1'),
	(14, 'QCServiceTeam', 'Ready', 'NoReason', 'QCServiceTeam', 'Service', 230, b'1'),
	(15, 'QCServiceTeam', 'Assigned', 'NoReason', 'QCService', 'Service', 240, b'1'),
	(16, 'Installation', 'Ready', 'NoReason', 'Installation', 'Execution', 250, b'1'),
	(17, 'Installation', 'InProgress', 'NoReason', 'Installation', 'Execution', 260, b'1'),
	(18, 'Installation', 'Completed', 'NoReason', 'Final', 'Execution', 270, b'1'),
	(19, 'Installation', 'Hold', 'SolarPanelBroken', 'HoldQ', 'Execution', 280, b'1'),
	(20, 'Service', 'Ready', 'NoReason', 'Service', 'Repair', 290, b'1'),
	(21, 'Service', 'InProgress', 'NoReason', 'Service', 'Repair', 300, b'1'),
	(22, 'Service', 'Completed', 'NoReason', 'Final', 'Repair', 310, b'1'),
	(23, 'Service', 'Hold', 'SolarPanelICFailure', 'HoldQ', 'Repair', 320, b'1');

-- Dumping structure for table data_process.tix_reason
CREATE TABLE IF NOT EXISTS `tix_reason` (
  `reasonId` varchar(100) NOT NULL,
  `reason` varchar(100) NOT NULL,
  `divisionId` varchar(50) NOT NULL,
  `displayOrder` int NOT NULL DEFAULT '0',
  `status` bit(1) NOT NULL DEFAULT b'1',
  PRIMARY KEY (`reasonId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- Dumping data for table data_process.tix_reason: ~3 rows (approximately)
INSERT INTO `tix_reason` (`reasonId`, `reason`, `divisionId`, `displayOrder`, `status`) VALUES
	('NoReason', 'No Reason', 'No_Division', 0, b'1'),
	('SolarPanelBroken', 'Solar Panel Broken', 'No_Division', 1, b'1'),
	('SolarPanelICFailure', 'Solar Panel IC Failure', 'No_Division', 1, b'1');

-- Dumping structure for table data_process.tix_ticket
CREATE TABLE IF NOT EXISTS `tix_ticket` (
  `allocationId` varchar(50) NOT NULL,
  `nextAllocationId` varchar(50) DEFAULT NULL,
  `ticketId` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `queueId` varchar(50) NOT NULL,
  `statusId` varchar(50) DEFAULT NULL,
  `allotedTo` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL,
  `allotedDate` datetime NOT NULL,
  `processedBy` varchar(50) DEFAULT NULL,
  `processedDate` datetime DEFAULT NULL,
  `reasonId` varchar(50) DEFAULT NULL,
  `startTime` datetime DEFAULT NULL,
  `endTime` datetime DEFAULT NULL,
  `remarks` longtext,
  PRIMARY KEY (`allocationId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- Dumping data for table data_process.tix_ticket: ~0 rows (approximately)

-- Dumping structure for table data_process.tix_ticket_data
CREATE TABLE IF NOT EXISTS `tix_ticket_data` (
  `ticketId` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `parentTicketId` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL,
  `incidentId` varchar(50) DEFAULT NULL,
  `cookId` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL,
  `customerId` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL,
  `mediaBoxLocation` mediumtext,
  `createdBy` varchar(50) DEFAULT NULL,
  `createdDate` datetime DEFAULT NULL,
  `description` varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL,
  `producerId` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL,
  `eventTrack` mediumtext,
  PRIMARY KEY (`ticketId`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- Dumping data for table data_process.tix_ticket_data: ~0 rows (approximately)

-- Dumping structure for table data_process.tix_ticket_status
CREATE TABLE IF NOT EXISTS `tix_ticket_status` (
  `statusId` varchar(50) NOT NULL,
  `statusName` varchar(50) NOT NULL,
  `displayOrder` int NOT NULL DEFAULT '0',
  `status` bit(1) NOT NULL DEFAULT b'1',
  PRIMARY KEY (`statusId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- Dumping data for table data_process.tix_ticket_status: ~7 rows (approximately)
INSERT INTO `tix_ticket_status` (`statusId`, `statusName`, `displayOrder`, `status`) VALUES
	('Assigned', 'Assigned', 2, b'1'),
	('Completed', 'Completed', 4, b'1'),
	('Hold', 'Hold', 6, b'1'),
	('InProgress', 'In Progress', 3, b'1'),
	('Ready', 'Ready', 1, b'1'),
	('Reject', 'Reject', 5, b'1'),
	('Revoke', 'Revoke', 7, b'1');

-- Dumping structure for table data_process.tix_user_department
CREATE TABLE IF NOT EXISTS `tix_user_department` (
  `departmentId` varchar(50) NOT NULL,
  `departmentName` varchar(50) NOT NULL,
  `displayOrder` int NOT NULL DEFAULT '0',
  `status` bit(1) NOT NULL DEFAULT b'1',
  PRIMARY KEY (`departmentId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- Dumping data for table data_process.tix_user_department: ~6 rows (approximately)
INSERT INTO `tix_user_department` (`departmentId`, `departmentName`, `displayOrder`, `status`) VALUES
	('Administration', 'Administration', 1, b'1'),
	('Installation', 'Installation', 2, b'1'),
	('Marketing', 'Marketing', 3, b'1'),
	('No_Department', 'No Department', 0, b'1'),
	('Operations', 'Operations', 4, b'1'),
	('Service', 'Service', 5, b'1');

-- Dumping structure for table data_process.tix_user_division
CREATE TABLE IF NOT EXISTS `tix_user_division` (
  `divisionId` varchar(50) NOT NULL,
  `divisionName` varchar(50) NOT NULL,
  `departmentId` varchar(50) NOT NULL,
  `displayOrder` int NOT NULL DEFAULT '0',
  `status` bit(1) NOT NULL DEFAULT b'1',
  PRIMARY KEY (`divisionId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- Dumping data for table data_process.tix_user_division: ~10 rows (approximately)
INSERT INTO `tix_user_division` (`divisionId`, `divisionName`, `departmentId`, `displayOrder`, `status`) VALUES
	('Advertisement', 'Advertisement', 'Marketing', 25, b'1'),
	('All_Division', 'All Division', 'Administration', 1000, b'1'),
	('Dev', 'Development', 'Operations', 60, b'1'),
	('Execution', 'Execution', 'Installation', 10, b'1'),
	('Finance', 'Finance', 'Operations', 30, b'1'),
	('HR', 'HR', 'Operations', 40, b'1'),
	('Inventory', 'Inventory', 'Administration', 70, b'1'),
	('No_Division', 'No Division', 'No_Department', 999, b'1'),
	('Repair', 'Repair', 'Service', 50, b'1'),
	('Sales', 'Sales', 'Marketing', 20, b'1');

-- Dumping structure for table data_process.users
CREATE TABLE IF NOT EXISTS `users` (
  `employeeId` varchar(50) NOT NULL,
  `producerId` varchar(50) DEFAULT NULL,
  `parentProducerId` varchar(50) DEFAULT NULL,
  `userId` varchar(50) DEFAULT NULL,
  `userName` varchar(50) DEFAULT '0',
  `lastName` varchar(50) DEFAULT NULL,
  `fatherName` varchar(50) DEFAULT NULL,
  `userStatus` varchar(50) DEFAULT 'Pending',
  `reportingTo` varchar(50) DEFAULT NULL,
  `departmentId` varchar(50) DEFAULT NULL,
  `divisionId` varchar(50) DEFAULT NULL,
  `dob` datetime DEFAULT NULL,
  `sex` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL,
  `country` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL DEFAULT 'IN',
  `userPwd` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL,
  `userPwdModDate` datetime DEFAULT NULL,
  `userType` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL,
  `createdBy` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL,
  `createdDate` datetime DEFAULT NULL,
  `modifiedBy` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL,
  `modifiedDate` datetime DEFAULT NULL,
  `status` bit(1) DEFAULT (0x01),
  PRIMARY KEY (`employeeId`),
  KEY `FK_users_producers` (`producerId`),
  KEY `FK_users_country` (`country`),
  CONSTRAINT `FK_users_producers` FOREIGN KEY (`producerId`) REFERENCES `producers` (`producerId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- Dumping data for table data_process.users: ~16 rows (approximately)
INSERT INTO `users` (`employeeId`, `producerId`, `parentProducerId`, `userId`, `userName`, `lastName`, `fatherName`, `userStatus`, `reportingTo`, `departmentId`, `divisionId`, `dob`, `sex`, `country`, `userPwd`, `userPwdModDate`, `userType`, `createdBy`, `createdDate`, `modifiedBy`, `modifiedDate`, `status`) VALUES
	('15001', 'PRD000001', 'PRD000001', '15001', 'Soundaravalli', '', '', 'Activated', 'Admin', 'Administration', 'All_Division', '1978-01-13 00:00:00', 'Female', 'Asia/Kolkata', '$2a$10$z/h4gKgrVrSp9C1LQhxpPec0TT/EIa1FyDMKvP/xe7NOCnG3Qiv8q', NULL, 'Employee', 'Admin', '2025-01-01 00:00:00', 'Admin', '2025-01-01 00:00:00', b'1'),
	('15002', 'PRD000001', 'PRD000001', '15002', 'Muthalagan', '', 'Navakodi', 'Activated', '15003', 'Service', 'Repair', '1983-02-26 00:00:00', 'Male', 'Asia/Kolkata', '$2a$10$z/h4gKgrVrSp9C1LQhxpPec0TT/EIa1FyDMKvP/xe7NOCnG3Qiv8q', '2022-07-06 21:15:53', 'Employee', 'Admin', '2025-01-01 00:00:00', 'Admin', '2025-01-01 00:00:00', b'1'),
	('15003', 'PRD000001', 'PRD000001', '15003', 'Tamilselvan', '', 'Kadirvel Murugan', 'Activated', '15001', 'Installation', 'Execution', '2006-09-13 00:00:00', 'Male', 'Asia/Kolkata', '$2a$10$z/h4gKgrVrSp9C1LQhxpPec0TT/EIa1FyDMKvP/xe7NOCnG3Qiv8q', NULL, 'Employee', 'Admin', '2025-01-01 00:00:00', 'Admin', '2025-01-01 00:00:00', b'1'),
	('15006', 'PRD000001', 'PRD000001', '15006', 'Ananthi', '', '', 'Activated', '15001', 'Installation', 'Execution', '1982-06-29 00:00:00', 'Female', 'Asia/Kolkata', '$2a$10$W9SPFkE7Lb0sPgtCXFzZbeXkh5dr5KbO3FrfYPQxA0r7qhyj8cjFC', '2024-12-16 10:57:48', 'Employee', 'Admin', '2025-01-01 00:00:00', 'Admin', '2025-01-01 00:00:00', b'1'),
	('15007', 'PRD000001', 'PRD000001', '15007', 'Anupama', '', '', 'Activated', '15002', 'Service', 'Repair', '1984-12-20 00:00:00', 'Female', 'Asia/Kolkata', '$2a$10$z/h4gKgrVrSp9C1LQhxpPec0TT/EIa1FyDMKvP/xe7NOCnG3Qiv8q', NULL, 'Employee', 'Admin', '2025-01-01 00:00:00', 'Admin', '2025-01-01 00:00:00', b'1'),
	('15008', 'PRD000001', 'PRD000001', '15008', 'Hari', '', '', 'Activated', '15002', 'Service', 'Repair', '1996-06-07 00:00:00', 'Male', 'Asia/Kolkata', '$2a$10$z/h4gKgrVrSp9C1LQhxpPec0TT/EIa1FyDMKvP/xe7NOCnG3Qiv8q', '2023-01-07 12:27:47', 'Employee', 'Admin', '2025-01-01 00:00:00', 'Admin', '2025-01-01 00:00:00', b'1'),
	('15009', 'PRD000001', 'PRD000001', '15009', 'Radhika', '', '', 'Activated', '15002', 'Service', 'Repair', '1995-05-18 00:00:00', 'Female', 'Asia/Kolkata', '$2a$10$z/h4gKgrVrSp9C1LQhxpPec0TT/EIa1FyDMKvP/xe7NOCnG3Qiv8q', NULL, 'Employee', 'Admin', '2025-01-01 00:00:00', 'Admin', '2025-01-01 00:00:00', b'1'),
	('15010', 'PRD000001', 'PRD000001', '15010', 'Kayathiri', '', '', 'Activated', '15002', 'Service', 'Repair', '1994-07-02 00:00:00', 'Female', 'Asia/Kolkata', '$2a$10$z/h4gKgrVrSp9C1LQhxpPec0TT/EIa1FyDMKvP/xe7NOCnG3Qiv8q', NULL, 'Employee', 'Admin', '2025-01-01 00:00:00', 'Admin', '2025-01-01 00:00:00', b'1'),
	('15011', 'PRD000001', 'PRD000001', '15011', 'Malini', '', '', 'Activated', '15006', 'Service', 'Repair', '1996-05-25 00:00:00', 'Female', 'Asia/Kolkata', '$2a$10$z/h4gKgrVrSp9C1LQhxpPec0TT/EIa1FyDMKvP/xe7NOCnG3Qiv8q', NULL, 'Employee', 'Admin', '2025-01-01 00:00:00', 'Admin', '2025-01-01 00:00:00', b'1'),
	('15012', 'PRD000001', 'PRD000001', '15012', 'Ramya', '', '', 'Activated', '15006', 'Service', 'Repair', '1996-06-20 00:00:00', 'Female', 'Asia/Kolkata', '$2a$10$z/h4gKgrVrSp9C1LQhxpPec0TT/EIa1FyDMKvP/xe7NOCnG3Qiv8q', '2023-01-02 13:39:46', 'Employee', 'Admin', '2025-01-01 00:00:00', 'Admin', '2025-01-01 00:00:00', b'1'),
	('15013', 'PRD000001', 'PRD000001', '15013', 'Keerthana', '', '', 'Activated', '15006', 'Service', 'Repair', '1997-02-14 00:00:00', 'Female', 'Asia/Kolkata', '$2a$10$z/h4gKgrVrSp9C1LQhxpPec0TT/EIa1FyDMKvP/xe7NOCnG3Qiv8q', NULL, 'Employee', 'Admin', '2025-01-01 00:00:00', 'Admin', '2025-01-01 00:00:00', b'1'),
	('15014', 'PRD000001', 'PRD000001', '15014', 'Revathi', '', '', 'Activated', '15002', 'Service', 'Repair', '1990-01-15 00:00:00', 'Female', 'Asia/Kolkata', '$2a$10$z/h4gKgrVrSp9C1LQhxpPec0TT/EIa1FyDMKvP/xe7NOCnG3Qiv8q', '2022-12-22 10:10:01', 'Employee', 'Admin', '2025-01-01 00:00:00', 'Admin', '2025-01-01 00:00:00', b'1'),
	('15015', 'PRD000001', 'PRD000001', '15015', 'Keerthana', '', '', 'Activated', '15002', 'Service', 'Repair', '1995-09-06 00:00:00', 'Female', 'Asia/Kolkata', '$2a$10$z/h4gKgrVrSp9C1LQhxpPec0TT/EIa1FyDMKvP/xe7NOCnG3Qiv8q', NULL, 'Employee', 'Admin', '2025-01-01 00:00:00', 'Admin', '2025-01-01 00:00:00', b'1'),
	('Admin', 'PRD000001', 'PRD000001', 'Admin', 'AdminUser', '', '', 'Activated', 'Admin', 'Administration', 'All_Division', '2021-09-02 05:30:00', 'Male', 'Asia/Kolkata', '$2a$10$z/h4gKgrVrSp9C1LQhxpPec0TT/EIa1FyDMKvP/xe7NOCnG3Qiv8q', NULL, 'Employee', 'PRODUCERUSER', '2025-01-01 00:00:00', 'PRODUCERUSER', '2025-01-01 00:00:00', b'1'),
	('PRODUCERUSER', 'PRD000001', 'PRD000001', 'Super-Admin', 'SuperAdmin', '', '', 'Activated', 'Admin', 'Administration', 'All_Division', '2021-09-02 05:30:00', 'Male', 'Asia/Kolkata', '$2a$10$z/h4gKgrVrSp9C1LQhxpPec0TT/EIa1FyDMKvP/xe7NOCnG3Qiv8q', NULL, 'Producer', 'Admin', '2025-01-01 00:00:00', 'Admin', '2025-01-01 00:00:00', b'1'),
	('SystemUser', 'PRD000001', 'PRD000001', 'SystemUser', 'System', '', '', 'Activated', 'Admin', 'Administration', 'All_Division', '2021-09-02 05:30:00', 'Male', 'Asia/Kolkata', '$2a$10$z/h4gKgrVrSp9C1LQhxpPec0TT/EIa1FyDMKvP/xe7NOCnG3Qiv8q', NULL, 'Employee', 'PRODUCERUSER', '2025-01-01 00:00:00', 'PRODUCERUSER', '2025-01-01 00:00:00', b'1');

-- Dumping structure for table data_process.users_assigned_tasks
CREATE TABLE IF NOT EXISTS `users_assigned_tasks` (
  `autoId` varchar(50) NOT NULL DEFAULT '',
  `employeeId` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `processInfo` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  PRIMARY KEY (`autoId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- Dumping data for table data_process.users_assigned_tasks: ~0 rows (approximately)
INSERT INTO `users_assigned_tasks` (`autoId`, `employeeId`, `processInfo`) VALUES
	('AST1735635809556', '15006', '[{"projectName":"Acco","tasks":[{"taskId":1003,"processId":"ClientMeeting","processName":"Client Meeting"},{"taskId":1004,"processId":"KnowledgeTransfer","processName":"Knowledge Transfer"},{"taskId":1007,"processId":"KnowledgeTransfer","processName":"Knowledge Transfer"},{"taskId":1008,"processId":"Meeting","processName":"Meeting"},{"taskId":1009,"processId":"Meeting","processName":"Meeting"},{"taskId":1010,"processId":"Meeting","processName":"Meeting"},{"taskId":1011,"processId":"Meeting","processName":"Meeting"},{"taskId":1012,"processId":"PCS1725291694033","processName":"FrontEnd(FE)"},{"taskId":1013,"processId":"PCS1725291707667","processName":"BackEnd(BE)"},{"taskId":1014,"processId":"PCS1725291726165","processName":"Database(DB)"},{"taskId":1015,"processId":"PCS1725291661267","processName":"Discussion"},{"taskId":1016,"processId":"EarlyGoing","processName":"Early Going"},{"taskId":1017,"processId":"IdleNoWork","processName":"Idle No Work"},{"taskId":1018,"processId":"InternetProblem","processName":"Internet Problem"},{"taskId":1019,"processId":"Permission","processName":"Permission"}]},{"projectName":"Focus","tasks":[{"taskId":1020,"processId":"PCS1725291707667","processName":"BackEnd(BE)"},{"taskId":1021,"processId":"PCS1725291726165","processName":"Database(DB)"},{"taskId":1022,"processId":"PCS1725291661267","processName":"Discussion"},{"taskId":1023,"processId":"PCS1725291694033","processName":"FrontEnd(FE)"},{"taskId":1024,"processId":"Meeting","processName":"Meeting"},{"taskId":1025,"processId":"KnowledgeTransfer","processName":"Knowledge Transfer"},{"taskId":1026,"processId":"ClientMeeting","processName":"Client Meeting"},{"taskId":1027,"processId":"EarlyGoing","processName":"Early Going"},{"taskId":1028,"processId":"IdleNoWork","processName":"Idle No Work"},{"taskId":1029,"processId":"LateComing","processName":"Late Coming"},{"taskId":1030,"processId":"Permission","processName":"Permission"},{"taskId":1031,"processId":"TeamMeeting","processName":"Team Meeting"}]},{"projectName":"Acco","tasks":[{"taskId":1032,"processId":"ClientMeeting","processName":"Client Meeting"},{"taskId":1033,"processId":"ClientMeeting","processName":"Client Meeting"},{"taskId":1034,"processId":"ClientMeeting","processName":"Client Meeting"},{"taskId":1035,"processId":"ClientMeeting","processName":"Client Meeting"},{"taskId":1036,"processId":"KnowledgeTransfer","processName":"Knowledge Transfer"},{"taskId":1037,"processId":"KnowledgeTransfer","processName":"Knowledge Transfer"},{"taskId":1038,"processId":"KnowledgeTransfer","processName":"Knowledge Transfer"},{"taskId":1039,"processId":"KnowledgeTransfer","processName":"Knowledge Transfer"},{"taskId":1040,"processId":"Meeting","processName":"Meeting"},{"taskId":1041,"processId":"Meeting","processName":"Meeting"},{"taskId":1042,"processId":"Meeting","processName":"Meeting"},{"taskId":1043,"processId":"Meeting","processName":"Meeting"},{"taskId":1044,"processId":"PCS1725291694033","processName":"FrontEnd(FE)"},{"taskId":1045,"processId":"PCS1725291707667","processName":"BackEnd(BE)"},{"taskId":1046,"processId":"PCS1725291726165","processName":"Database(DB)"},{"taskId":1047,"processId":"PCS1725291661267","processName":"Discussion"},{"taskId":1048,"processId":"EarlyGoing","processName":"Early Going"},{"taskId":1049,"processId":"IdleNoWork","processName":"Idle No Work"},{"taskId":1050,"processId":"InternetProblem","processName":"Internet Problem"},{"taskId":1051,"processId":"Permission","processName":"Permission"}]},{"projectName":"Focus","tasks":[{"taskId":1052,"processId":"PCS1725291707667","processName":"BackEnd(BE)"},{"taskId":1053,"processId":"PCS1725291726165","processName":"Database(DB)"},{"taskId":1054,"processId":"PCS1725291661267","processName":"Discussion"},{"taskId":1055,"processId":"PCS1725291694033","processName":"FrontEnd(FE)"},{"taskId":1056,"processId":"Meeting","processName":"Meeting"},{"taskId":1057,"processId":"KnowledgeTransfer","processName":"Knowledge Transfer"},{"taskId":1058,"processId":"ClientMeeting","processName":"Client Meeting"},{"taskId":1059,"processId":"EarlyGoing","processName":"Early Going"},{"taskId":1060,"processId":"IdleNoWork","processName":"Idle No Work"},{"taskId":1061,"processId":"LateComing","processName":"Late Coming"},{"taskId":1062,"processId":"Permission","processName":"Permission"},{"taskId":1063,"processId":"TeamMeeting","processName":"Team Meeting"}]}]');

-- Dumping structure for table data_process.users_attachments
CREATE TABLE IF NOT EXISTS `users_attachments` (
  `autoId` int NOT NULL AUTO_INCREMENT,
  `employeeId` varchar(50) DEFAULT NULL,
  `uploadDocumentForType` varchar(50) DEFAULT NULL,
  `uploadFileFolderURL` varchar(500) DEFAULT NULL,
  `uploadResourceHandler` varchar(50) NOT NULL DEFAULT 'Default',
  `uploadFileName` varchar(100) DEFAULT NULL,
  `uploadFileDate` datetime DEFAULT NULL,
  `uploadFileLastModifiedDate` datetime DEFAULT NULL,
  `uploadFileSize` bigint NOT NULL,
  `createdDate` datetime DEFAULT NULL,
  `modifiedDate` datetime DEFAULT NULL,
  `createdBy` varchar(50) DEFAULT NULL,
  `modifiedBy` varchar(50) DEFAULT NULL,
  `status` bit(1) NOT NULL DEFAULT b'1',
  PRIMARY KEY (`autoId`),
  KEY `FK_userattachments_users` (`employeeId`),
  CONSTRAINT `FK_userattachments_users` FOREIGN KEY (`employeeId`) REFERENCES `users` (`employeeId`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- Dumping data for table data_process.users_attachments: ~0 rows (approximately)

-- Dumping structure for table data_process.users_attendance
CREATE TABLE IF NOT EXISTS `users_attendance` (
  `attendanceId` varchar(50) NOT NULL,
  `leaveId` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL,
  `employeeId` varchar(50) NOT NULL,
  `markedBy` varchar(50) DEFAULT NULL,
  `approvedBy` varchar(50) DEFAULT NULL,
  `symbol` varchar(50) NOT NULL,
  `mode` varchar(50) NOT NULL,
  `holidayName` varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL,
  `date` datetime NOT NULL,
  `markedTime` datetime DEFAULT NULL,
  `approvedTime` datetime DEFAULT NULL,
  `status` varchar(50) DEFAULT NULL,
  `approvalStatus` varchar(50) DEFAULT NULL,
  `ipAddress` varchar(50) DEFAULT NULL,
  `comments` varchar(500) DEFAULT NULL,
  `tamper` varchar(200) DEFAULT NULL,
  `eventTrack` longtext,
  `lockStatus` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`attendanceId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- Dumping data for table data_process.users_attendance: ~6 rows (approximately)
INSERT INTO `users_attendance` (`attendanceId`, `leaveId`, `employeeId`, `markedBy`, `approvedBy`, `symbol`, `mode`, `holidayName`, `date`, `markedTime`, `approvedTime`, `status`, `approvalStatus`, `ipAddress`, `comments`, `tamper`, `eventTrack`, `lockStatus`) VALUES
	('AT1736164325583', NULL, '15006', '15006', '15006', 'P12', 'WFO', NULL, '2025-01-06 00:00:00', '2025-01-06 17:22:10', '2025-01-06 17:39:44', 'Marked', 'Approved', NULL, 'ReferBack Approved', NULL, NULL, 'None'),
	('AT1737618762042', NULL, '15006', '15006', NULL, 'P8', 'WFO', NULL, '2025-01-23 00:00:00', '2025-01-23 13:22:42', NULL, 'Marked', NULL, NULL, NULL, NULL, NULL, 'None'),
	('AT1737734198142', NULL, '15002', '15002', NULL, 'P4', 'WFH', NULL, '2025-01-24 00:00:00', '2025-01-24 21:26:38', NULL, 'Marked', NULL, NULL, NULL, NULL, NULL, 'None'),
	('AT1737805862366', NULL, '15002', '15002', NULL, 'P6', 'WFH', NULL, '2025-01-25 00:00:00', '2025-01-25 17:21:02', NULL, 'Marked', NULL, NULL, NULL, NULL, NULL, 'None'),
	('AT1738155018077', NULL, '15002', '15002', NULL, 'P4', 'WFH', NULL, '2025-01-29 00:00:00', '2025-01-29 18:20:18', NULL, 'Marked', NULL, NULL, NULL, NULL, NULL, 'None'),
	('AT1738587200650', NULL, '15002', '15002', NULL, 'P4', 'WFH', NULL, '2025-02-03 00:00:00', '2025-02-03 18:23:20', NULL, 'Marked', NULL, NULL, NULL, NULL, NULL, 'None');

-- Dumping structure for table data_process.users_daily_log
CREATE TABLE IF NOT EXISTS `users_daily_log` (
  `autoId` bigint NOT NULL AUTO_INCREMENT,
  `employeeId` varchar(50) NOT NULL,
  `taskDate` datetime DEFAULT NULL,
  `projectId` varchar(50) NOT NULL,
  `processId` varchar(50) NOT NULL,
  `timesheetId` varchar(50) NOT NULL,
  `allocationId` varchar(50) DEFAULT NULL,
  `taskEvent` varchar(50) DEFAULT NULL,
  `actualTime` bigint NOT NULL DEFAULT '0',
  `status` varchar(50) NOT NULL DEFAULT 'Pending',
  `remarks` varchar(100) DEFAULT NULL,
  `billType` varchar(5) DEFAULT NULL,
  `description` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`autoId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- Dumping data for table data_process.users_daily_log: ~0 rows (approximately)

-- Dumping structure for table data_process.users_holidays_calendar
CREATE TABLE IF NOT EXISTS `users_holidays_calendar` (
  `autoId` bigint NOT NULL AUTO_INCREMENT,
  `holiday` varchar(50) DEFAULT NULL,
  `country` varchar(50) NOT NULL,
  `startDate` date NOT NULL,
  `endDate` date NOT NULL,
  `year` int NOT NULL,
  `symbol` varchar(50) NOT NULL DEFAULT '0',
  `zoneArea` varchar(50) DEFAULT NULL,
  `approvedBy` varchar(50) DEFAULT NULL,
  `approvalStatus` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL,
  `approvedDate` datetime DEFAULT NULL,
  `comments` text,
  `createdBy` varchar(50) DEFAULT NULL,
  `createdDate` datetime DEFAULT NULL,
  `modifiedBy` varchar(50) DEFAULT NULL,
  `modifiedDate` datetime DEFAULT NULL,
  `status` bit(1) NOT NULL DEFAULT b'1',
  PRIMARY KEY (`autoId`),
  KEY `FK_user_holidays_calendar_countrys` (`country`),
  CONSTRAINT `FK_user_holidays_calendar_countrys` FOREIGN KEY (`country`) REFERENCES `countrys` (`country`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- Dumping data for table data_process.users_holidays_calendar: ~0 rows (approximately)

-- Dumping structure for table data_process.users_hr_records
CREATE TABLE IF NOT EXISTS `users_hr_records` (
  `autoId` varchar(50) NOT NULL,
  `employeeId` varchar(50) NOT NULL COMMENT 'Users',
  `dateOfJoin` datetime DEFAULT NULL,
  `infoAPL` varchar(50) DEFAULT NULL,
  `employmentStatus` varchar(50) DEFAULT NULL,
  `idCardEDR` varchar(50) DEFAULT NULL,
  `lastDesignation` varchar(50) DEFAULT NULL,
  `lastEmployer` varchar(50) DEFAULT NULL,
  `experienceInEDR` float DEFAULT '0',
  `experienceOutEDR` float DEFAULT '0',
  `fromNoticePeriod` datetime DEFAULT NULL,
  `toNoticePeriod` datetime DEFAULT NULL,
  `lastWorkDay` datetime DEFAULT NULL,
  `accountNo` varchar(50) DEFAULT NULL COMMENT 'BankAccounts',
  `bankName` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT ' ' COMMENT 'BankAccounts',
  `bankBranch` varchar(50) DEFAULT NULL COMMENT 'BankAccounts',
  `ifscCode` varchar(50) DEFAULT NULL COMMENT 'BankAccounts',
  `aadharNo` varchar(50) DEFAULT NULL COMMENT 'TaxInfo',
  `esicNo` varchar(50) DEFAULT NULL COMMENT 'TaxInfo',
  `panNo` varchar(50) DEFAULT NULL COMMENT 'TaxInfo',
  `providentFund` varchar(50) DEFAULT NULL COMMENT 'TaxInfo',
  `uanNo` varchar(50) DEFAULT ' ' COMMENT 'TaxInfo',
  `highestGraduate` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL COMMENT 'EducationalInfo',
  `institution` varchar(50) DEFAULT NULL COMMENT 'EducationalInfo',
  `year` varchar(50) DEFAULT NULL COMMENT 'EducationalInfo',
  `markGrade` varchar(50) DEFAULT ' ' COMMENT 'EducationalInfo',
  `isApprentice` bit(1) NOT NULL DEFAULT b'0' COMMENT 'EducationalInfo',
  `isFileCreated` bit(1) NOT NULL DEFAULT b'0' COMMENT 'EducationalInfo',
  `isOfferIssued` bit(1) NOT NULL DEFAULT b'0' COMMENT 'EducationalInfo',
  `longLeaveFromDate` datetime DEFAULT NULL COMMENT 'EducationalInfo',
  `longLeaveToDate` datetime DEFAULT NULL COMMENT 'EducationalInfo',
  `longLeaveReason` varchar(50) DEFAULT NULL COMMENT 'EducationalInfo',
  `recruitmentType` varchar(50) DEFAULT NULL COMMENT 'EducationalInfo',
  `costToCompany` varchar(50) DEFAULT NULL COMMENT 'EducationalInfo',
  `vaccinateInfo` varchar(50) DEFAULT NULL,
  `approvedLeaveBalance` double DEFAULT '0',
  `leaveBalanceFlag` bit(1) NOT NULL DEFAULT b'1',
  `leaveBalanceDate` datetime DEFAULT NULL,
  `esiEligible` bit(1) NOT NULL DEFAULT b'0',
  `resignedFAndF` bit(1) NOT NULL DEFAULT b'0',
  `lastDrawnSalary` varchar(50) DEFAULT NULL,
  `nativeDistrict` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`autoId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- Dumping data for table data_process.users_hr_records: ~15 rows (approximately)
INSERT INTO `users_hr_records` (`autoId`, `employeeId`, `dateOfJoin`, `infoAPL`, `employmentStatus`, `idCardEDR`, `lastDesignation`, `lastEmployer`, `experienceInEDR`, `experienceOutEDR`, `fromNoticePeriod`, `toNoticePeriod`, `lastWorkDay`, `accountNo`, `bankName`, `bankBranch`, `ifscCode`, `aadharNo`, `esicNo`, `panNo`, `providentFund`, `uanNo`, `highestGraduate`, `institution`, `year`, `markGrade`, `isApprentice`, `isFileCreated`, `isOfferIssued`, `longLeaveFromDate`, `longLeaveToDate`, `longLeaveReason`, `recruitmentType`, `costToCompany`, `vaccinateInfo`, `approvedLeaveBalance`, `leaveBalanceFlag`, `leaveBalanceDate`, `esiEligible`, `resignedFAndF`, `lastDrawnSalary`, `nativeDistrict`) VALUES
	('15001', '15001', '2022-08-01 00:00:00', NULL, 'Active', NULL, NULL, NULL, 0, 0, NULL, NULL, NULL, NULL, ' ', NULL, NULL, NULL, NULL, NULL, NULL, '', 'DEEE', NULL, NULL, ' ', b'0', b'0', b'0', NULL, NULL, NULL, 'New_Joiner', NULL, 'CoviShield1stDose', 5, b'1', '2024-09-16 07:08:44', b'0', b'0', NULL, 'Chennai'),
	('15002', '15002', '2022-08-01 00:00:00', NULL, 'Active', NULL, NULL, NULL, 0, 0, NULL, NULL, NULL, NULL, ' ', NULL, NULL, NULL, NULL, NULL, NULL, '', 'DEEE', NULL, NULL, ' ', b'0', b'0', b'0', NULL, NULL, NULL, 'New_Joiner', NULL, 'CoviShield1stDose', 5, b'1', NULL, b'0', b'0', NULL, 'Chennai'),
	('15003', '15003', '2022-08-01 00:00:00', NULL, 'Active', NULL, NULL, NULL, 0, 0, NULL, NULL, NULL, NULL, ' ', NULL, NULL, NULL, NULL, NULL, NULL, '', 'DEEE', NULL, NULL, ' ', b'0', b'0', b'0', NULL, NULL, NULL, 'New_Joiner', NULL, 'CoviShield1stDose', 5, b'1', NULL, b'0', b'0', NULL, 'Chennai'),
	('15004', '15004', '2022-08-01 00:00:00', NULL, 'Active', NULL, NULL, NULL, 0, 0, NULL, NULL, NULL, NULL, ' ', NULL, NULL, NULL, NULL, NULL, NULL, '', 'DEEE', NULL, NULL, ' ', b'0', b'0', b'0', NULL, NULL, NULL, 'New_Joiner', NULL, 'CoviShield1stDose', 5, b'1', NULL, b'0', b'0', NULL, 'Chennai'),
	('15005', '15005', '2022-08-01 00:00:00', NULL, 'Active', NULL, NULL, NULL, 0, 0, NULL, NULL, NULL, NULL, ' ', NULL, NULL, NULL, NULL, NULL, NULL, '', 'DEEE', NULL, NULL, ' ', b'0', b'0', b'0', NULL, NULL, NULL, 'New_Joiner', NULL, 'CoviShield1stDose', 5, b'1', NULL, b'0', b'0', NULL, 'Chennai'),
	('15006', '15006', '2022-09-01 00:00:00', NULL, 'Active', NULL, NULL, NULL, 0, 0, NULL, NULL, NULL, NULL, ' ', NULL, NULL, NULL, NULL, NULL, NULL, '', 'DEEE', NULL, NULL, ' ', b'0', b'0', b'0', NULL, NULL, NULL, 'New_Joiner', NULL, 'CoviShield1stDose', 4, b'1', NULL, b'0', b'0', NULL, 'Chennai'),
	('15007', '15007', '2022-09-01 00:00:00', NULL, 'Active', NULL, NULL, NULL, 0, 0, NULL, NULL, NULL, NULL, ' ', NULL, NULL, NULL, NULL, NULL, NULL, '', 'DEEE', NULL, NULL, ' ', b'0', b'0', b'0', NULL, NULL, NULL, 'New_Joiner', NULL, 'CoviShield1stDose', 5, b'1', NULL, b'0', b'0', NULL, 'Chennai'),
	('15008', '15008', '2024-06-01 00:00:00', NULL, 'Active', NULL, NULL, NULL, 0, 0, NULL, NULL, NULL, NULL, ' ', NULL, NULL, NULL, NULL, NULL, NULL, '', 'DEEE', NULL, NULL, ' ', b'0', b'0', b'0', NULL, NULL, NULL, 'New_Joiner', NULL, 'CoviShield1stDose', 5, b'1', NULL, b'0', b'0', NULL, 'Chennai'),
	('15009', '15009', '2024-06-01 00:00:00', NULL, 'Active', NULL, NULL, NULL, 0, 0, NULL, NULL, NULL, NULL, ' ', NULL, NULL, NULL, NULL, NULL, NULL, '', 'DEEE', NULL, NULL, ' ', b'0', b'0', b'0', NULL, NULL, NULL, 'New_Joiner', NULL, 'CoviShield1stDose', 5, b'1', NULL, b'0', b'0', NULL, 'Chennai'),
	('15010', '15010', '2024-06-01 00:00:00', NULL, 'Active', NULL, NULL, NULL, 0, 0, NULL, NULL, NULL, NULL, ' ', NULL, NULL, NULL, NULL, NULL, NULL, '', 'DEEE', NULL, NULL, ' ', b'0', b'0', b'0', NULL, NULL, NULL, 'New_Joiner', NULL, 'CoviShield1stDose', 5, b'1', NULL, b'0', b'0', NULL, 'Chennai'),
	('15011', '15011', '2024-06-01 00:00:00', NULL, 'Active', NULL, NULL, NULL, 0, 0, NULL, NULL, NULL, NULL, ' ', NULL, NULL, NULL, NULL, NULL, NULL, '', 'DEEE', NULL, NULL, ' ', b'0', b'0', b'0', NULL, NULL, NULL, 'New_Joiner', NULL, 'CoviShield1stDose', 2, b'1', NULL, b'0', b'0', NULL, 'Chennai'),
	('15012', '15012', '2024-06-01 00:00:00', NULL, 'Active', NULL, NULL, NULL, 0, 0, NULL, NULL, NULL, NULL, ' ', NULL, NULL, NULL, NULL, NULL, NULL, '', 'DEEE', NULL, NULL, ' ', b'0', b'0', b'0', NULL, NULL, NULL, 'New_Joiner', NULL, 'CoviShield1stDose', 5, b'1', NULL, b'0', b'0', NULL, 'Chennai'),
	('15013', '15013', '2024-06-01 00:00:00', NULL, 'Active', NULL, NULL, NULL, 0, 0, NULL, NULL, NULL, NULL, ' ', NULL, NULL, NULL, NULL, NULL, NULL, '', 'DEEE', NULL, NULL, ' ', b'0', b'0', b'0', NULL, NULL, NULL, 'New_Joiner', NULL, 'CoviShield1stDose', 5, b'1', NULL, b'0', b'0', NULL, 'Chennai'),
	('15014', '15014', '2024-06-01 00:00:00', NULL, 'Active', NULL, NULL, NULL, 0, 0, NULL, NULL, NULL, NULL, ' ', NULL, NULL, NULL, NULL, NULL, NULL, '', 'DEEE', NULL, NULL, ' ', b'0', b'0', b'0', NULL, NULL, NULL, 'New_Joiner', NULL, 'CoviShield1stDose', 5, b'1', NULL, b'0', b'0', NULL, 'Chennai'),
	('15015', '15015', '2024-06-01 00:00:00', NULL, 'Active', NULL, NULL, NULL, 0, 0, NULL, NULL, NULL, NULL, ' ', NULL, NULL, NULL, NULL, NULL, NULL, '', 'DEEE', NULL, NULL, ' ', b'0', b'0', b'0', NULL, NULL, NULL, 'New_Joiner', NULL, 'CoviShield1stDose', 5, b'1', NULL, b'0', b'0', NULL, 'Chennai');

-- Dumping structure for table data_process.users_leave_management
CREATE TABLE IF NOT EXISTS `users_leave_management` (
  `leaveId` varchar(50) NOT NULL,
  `employeeId` varchar(50) NOT NULL,
  `noOfDays` double NOT NULL DEFAULT '0',
  `detectedLeave` double NOT NULL DEFAULT '0',
  `leaveDates` varchar(2500) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL,
  `symbol` varchar(50) NOT NULL,
  `fromDate` datetime NOT NULL,
  `toDate` datetime NOT NULL,
  `activeToDate` datetime NOT NULL,
  `status` varchar(50) NOT NULL,
  `reason` varchar(500) NOT NULL,
  `comments` varchar(500) DEFAULT NULL,
  `createdBy` varchar(50) NOT NULL,
  `createdDate` datetime NOT NULL,
  `modifiedBy` varchar(50) NOT NULL,
  `modifiedDate` datetime NOT NULL,
  PRIMARY KEY (`leaveId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- Dumping data for table data_process.users_leave_management: ~3 rows (approximately)
INSERT INTO `users_leave_management` (`leaveId`, `employeeId`, `noOfDays`, `detectedLeave`, `leaveDates`, `symbol`, `fromDate`, `toDate`, `activeToDate`, `status`, `reason`, `comments`, `createdBy`, `createdDate`, `modifiedBy`, `modifiedDate`) VALUES
	('LM1736164342973', '15011', 3, 0, '{2024-12-29,2024-12-30,2024-12-31}', 'Leave', '2024-12-29 00:00:00', '2024-12-31 00:00:00', '2024-12-31 00:00:00', 'Cancel', 'Test Leave', 'No Needed at present LMbxpsbsqpqczxp', '15006', '2025-01-06 17:22:22', '15006', '2025-01-06 17:23:49'),
	('LM1736164448471', '15006', 3, 0, '{2025-01-29,2025-01-30,2025-01-31}', 'Leave', '2025-01-29 00:00:00', '2025-01-31 00:00:00', '2025-01-31 00:00:00', 'Pending', 'Test Leave', NULL, '15006', '2025-01-06 17:24:08', '15006', '2025-01-06 17:24:08'),
	('LM1736164578826', '15011', 3, 0, '{2025-01-29,2025-01-30,2025-01-31}', 'Leave', '2025-01-29 00:00:00', '2025-01-31 00:00:00', '2025-01-31 00:00:00', 'Pending', 'Test Leave', NULL, '15011', '2025-01-06 17:26:18', '15011', '2025-01-06 17:26:18');

-- Dumping structure for table data_process.users_leave_type
CREATE TABLE IF NOT EXISTS `users_leave_type` (
  `leaveTypeId` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `leaveTypeName` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `maxDays` float NOT NULL,
  `displayOrder` tinyint NOT NULL,
  `status` bit(1) NOT NULL DEFAULT (0),
  PRIMARY KEY (`leaveTypeId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- Dumping data for table data_process.users_leave_type: ~7 rows (approximately)
INSERT INTO `users_leave_type` (`leaveTypeId`, `leaveTypeName`, `maxDays`, `displayOrder`, `status`) VALUES
	('Half_Day', 'Half Day Leave', 0.5, 1, b'1'),
	('Leave', 'Casual/Sick Leave', 1, 2, b'1'),
	('Long_Leave', 'Long Leave', 30, 3, b'1'),
	('Maternity_Leave', 'Maternity Leave', 180, 6, b'1'),
	('Medical_Leave', 'Medical Leave', 90, 4, b'1'),
	('Partially_Cancel', 'Partially Cancel', 0, 7, b'0'),
	('Paternity_Leave', 'Paternity Leave', 5, 5, b'1');

-- Dumping structure for table data_process.users_lms_color
CREATE TABLE IF NOT EXISTS `users_lms_color` (
  `colorId` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `colorName` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL,
  `description` varchar(50) DEFAULT NULL,
  `displayOrder` tinyint NOT NULL,
  `status` bit(1) NOT NULL DEFAULT (0x01),
  PRIMARY KEY (`colorId`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- Dumping data for table data_process.users_lms_color: ~8 rows (approximately)
INSERT INTO `users_lms_color` (`colorId`, `colorName`, `description`, `displayOrder`, `status`) VALUES
	('Approved', 'Green', 'Approved Leave', 1, b'1'),
	('Holiday', 'Orange', 'Holiday', 3, b'1'),
	('Leave', 'Yellow', 'Leave', 4, b'1'),
	('LossOfPay', 'Red', 'Loss Of Pay', 5, b'1'),
	('Normal', 'White', 'Normal', 2, b'1'),
	('Pending', 'Grey', 'Approval Pending', 6, b'1'),
	('Saturday', 'Orange', 'Saturday', 7, b'1'),
	('Sunday', 'Orange', 'Sunday', 7, b'1');

-- Dumping structure for table data_process.users_log
CREATE TABLE IF NOT EXISTS `users_log` (
  `autoId` int NOT NULL AUTO_INCREMENT,
  `employeeId` varchar(50) NOT NULL DEFAULT '0',
  `userLoginTime` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `userLogoutTime` datetime DEFAULT '0000-00-00 00:00:00',
  `ipAddress` varchar(50) NOT NULL DEFAULT '0',
  `fetchBlock` bit(1) DEFAULT b'0',
  PRIMARY KEY (`autoId`),
  KEY `FK_LogUser_User_idx` (`employeeId`)
) ENGINE=InnoDB AUTO_INCREMENT=225 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- Dumping data for table data_process.users_log: ~189 rows (approximately)
INSERT INTO `users_log` (`autoId`, `employeeId`, `userLoginTime`, `userLogoutTime`, `ipAddress`, `fetchBlock`) VALUES
	(1, '15002', '2025-01-11 14:51:39', '0000-00-00 00:00:00', '0', b'1'),
	(2, '15002', '2025-01-11 15:12:20', '0000-00-00 00:00:00', '0', b'1'),
	(3, '15002', '2025-01-11 15:21:13', '0000-00-00 00:00:00', '0', b'1'),
	(4, '15002', '2025-01-11 15:32:10', '0000-00-00 00:00:00', '0', b'1'),
	(5, '15002', '2025-01-11 15:39:32', '0000-00-00 00:00:00', '0', b'1'),
	(6, '15002', '2025-01-11 15:45:41', '0000-00-00 00:00:00', '0', b'1'),
	(7, '15002', '2025-01-11 16:44:08', '0000-00-00 00:00:00', '0', b'1'),
	(8, '15006', '2025-01-11 16:46:10', '0000-00-00 00:00:00', '0', b'1'),
	(9, '15006', '2025-01-11 16:46:20', '0000-00-00 00:00:00', '0', b'1'),
	(10, '15006', '2025-01-11 16:49:11', '0000-00-00 00:00:00', '0', b'1'),
	(11, '15006', '2025-01-11 16:49:41', '0000-00-00 00:00:00', '0', b'1'),
	(12, '15002', '2025-01-11 16:50:41', '0000-00-00 00:00:00', '0', b'1'),
	(13, '15002', '2025-01-11 16:56:48', '0000-00-00 00:00:00', '0', b'1'),
	(14, '15002', '2025-01-11 17:07:43', '0000-00-00 00:00:00', '0', b'1'),
	(15, '15002', '2025-01-13 10:56:36', '0000-00-00 00:00:00', '0', b'1'),
	(16, '15002', '2025-01-13 11:04:20', '0000-00-00 00:00:00', '0', b'1'),
	(17, '15006', '2025-01-13 11:08:49', '0000-00-00 00:00:00', '0', b'1'),
	(18, '15002', '2025-01-13 11:09:59', '0000-00-00 00:00:00', '0', b'1'),
	(19, '15002', '2025-01-13 11:15:43', '0000-00-00 00:00:00', '0', b'1'),
	(20, '15002', '2025-01-13 11:23:30', '0000-00-00 00:00:00', '0', b'1'),
	(21, '15002', '2025-01-13 12:20:46', '0000-00-00 00:00:00', '0', b'1'),
	(22, '15002', '2025-01-13 12:28:53', '0000-00-00 00:00:00', '0', b'1'),
	(23, '15002', '2025-01-13 17:48:41', '0000-00-00 00:00:00', '0', b'1'),
	(24, '15002', '2025-01-13 18:00:42', '0000-00-00 00:00:00', '0', b'1'),
	(25, '15006', '2025-01-13 18:09:39', '0000-00-00 00:00:00', '0', b'1'),
	(26, '15002', '2025-01-13 18:10:32', '0000-00-00 00:00:00', '0', b'1'),
	(27, '15002', '2025-01-13 18:16:38', '0000-00-00 00:00:00', '0', b'1'),
	(28, '15002', '2025-01-13 20:47:57', '0000-00-00 00:00:00', '0', b'1'),
	(29, '15002', '2025-01-13 21:39:23', '0000-00-00 00:00:00', '0', b'1'),
	(30, '15002', '2025-01-13 21:47:32', '0000-00-00 00:00:00', '0', b'1'),
	(31, '15002', '2025-01-13 21:49:48', '0000-00-00 00:00:00', '0', b'1'),
	(32, '15002', '2025-01-13 21:55:28', '0000-00-00 00:00:00', '0', b'1'),
	(33, '15002', '2025-01-13 21:55:53', '0000-00-00 00:00:00', '0', b'1'),
	(34, '15002', '2025-01-13 21:57:09', '0000-00-00 00:00:00', '0', b'1'),
	(35, '15002', '2025-01-13 21:59:46', '0000-00-00 00:00:00', '0', b'1'),
	(36, '15002', '2025-01-13 22:01:50', '0000-00-00 00:00:00', '0', b'1'),
	(37, '15002', '2025-01-13 22:06:30', '0000-00-00 00:00:00', '0', b'1'),
	(38, '15002', '2025-01-13 22:09:38', '0000-00-00 00:00:00', '0', b'1'),
	(39, '15002', '2025-01-13 22:14:25', '0000-00-00 00:00:00', '0', b'1'),
	(40, '15002', '2025-01-13 22:19:35', '0000-00-00 00:00:00', '0', b'1'),
	(41, '15002', '2025-01-13 22:40:42', '0000-00-00 00:00:00', '0', b'1'),
	(42, '15002', '2025-01-13 22:44:43', '0000-00-00 00:00:00', '0', b'1'),
	(43, '15002', '2025-01-13 22:46:35', '0000-00-00 00:00:00', '0', b'1'),
	(44, '15002', '2025-01-13 22:49:52', '0000-00-00 00:00:00', '0', b'1'),
	(45, '15002', '2025-01-13 22:56:26', '0000-00-00 00:00:00', '0', b'1'),
	(46, '15002', '2025-01-13 22:57:29', '0000-00-00 00:00:00', '0', b'1'),
	(47, '15002', '2025-01-13 22:58:45', '0000-00-00 00:00:00', '0', b'1'),
	(48, '15002', '2025-01-13 23:01:12', '0000-00-00 00:00:00', '0', b'1'),
	(49, '15002', '2025-01-14 10:42:35', '0000-00-00 00:00:00', '0', b'1'),
	(50, '15002', '2025-01-14 11:21:15', '0000-00-00 00:00:00', '0', b'1'),
	(51, '15002', '2025-01-14 11:27:08', '0000-00-00 00:00:00', '0', b'1'),
	(52, '15002', '2025-01-14 12:33:03', '0000-00-00 00:00:00', '0', b'1'),
	(53, '15002', '2025-01-14 12:39:03', '0000-00-00 00:00:00', '0', b'1'),
	(54, '15002', '2025-01-14 15:00:11', '0000-00-00 00:00:00', '0', b'1'),
	(55, '15002', '2025-01-14 19:12:43', '0000-00-00 00:00:00', '0', b'1'),
	(56, '15002', '2025-01-14 19:23:16', '0000-00-00 00:00:00', '0', b'1'),
	(57, '15002', '2025-01-15 09:36:22', '0000-00-00 00:00:00', '0', b'1'),
	(58, '15002', '2025-01-15 09:48:43', '0000-00-00 00:00:00', '0', b'1'),
	(59, '15002', '2025-01-15 11:12:39', '0000-00-00 00:00:00', '0', b'1'),
	(60, '15002', '2025-01-15 11:25:32', '0000-00-00 00:00:00', '0', b'1'),
	(61, '15002', '2025-01-15 11:27:33', '0000-00-00 00:00:00', '0', b'1'),
	(62, '15002', '2025-01-15 11:31:57', '0000-00-00 00:00:00', '0', b'1'),
	(63, '15002', '2025-01-15 11:35:10', '0000-00-00 00:00:00', '0', b'1'),
	(64, '15002', '2025-01-15 11:35:22', '0000-00-00 00:00:00', '0', b'1'),
	(65, '15002', '2025-01-15 11:41:01', '0000-00-00 00:00:00', '0', b'1'),
	(66, '15002', '2025-01-15 11:42:41', '0000-00-00 00:00:00', '0', b'1'),
	(67, '15002', '2025-01-15 11:44:03', '0000-00-00 00:00:00', '0', b'1'),
	(68, '15002', '2025-01-15 11:47:05', '0000-00-00 00:00:00', '0', b'1'),
	(69, '15002', '2025-01-15 11:54:30', '0000-00-00 00:00:00', '0', b'1'),
	(70, '15002', '2025-01-15 11:56:56', '0000-00-00 00:00:00', '0', b'1'),
	(71, '15002', '2025-01-15 12:01:02', '0000-00-00 00:00:00', '0', b'1'),
	(72, '15002', '2025-01-15 12:01:46', '0000-00-00 00:00:00', '0', b'1'),
	(73, '15002', '2025-01-15 12:02:22', '0000-00-00 00:00:00', '0', b'1'),
	(74, '15002', '2025-01-15 12:04:31', '0000-00-00 00:00:00', '0', b'1'),
	(75, '15002', '2025-01-15 19:02:40', '0000-00-00 00:00:00', '0', b'1'),
	(76, '15002', '2025-01-15 19:03:36', '0000-00-00 00:00:00', '0', b'1'),
	(77, '15002', '2025-01-15 19:12:28', '0000-00-00 00:00:00', '0', b'1'),
	(78, '15002', '2025-01-15 19:13:15', '0000-00-00 00:00:00', '0', b'1'),
	(79, '15002', '2025-01-15 19:13:41', '0000-00-00 00:00:00', '0', b'1'),
	(80, '15002', '2025-01-15 19:15:07', '0000-00-00 00:00:00', '0', b'1'),
	(81, '15002', '2025-01-15 19:15:55', '0000-00-00 00:00:00', '0', b'1'),
	(82, '15002', '2025-01-15 19:22:01', '0000-00-00 00:00:00', '0', b'1'),
	(83, '15002', '2025-01-15 19:22:20', '0000-00-00 00:00:00', '0', b'1'),
	(84, '15002', '2025-01-15 19:23:42', '0000-00-00 00:00:00', '0', b'1'),
	(85, '15002', '2025-01-15 19:23:56', '0000-00-00 00:00:00', '0', b'1'),
	(86, '15002', '2025-01-17 20:23:25', '0000-00-00 00:00:00', '0', b'1'),
	(87, '15002', '2025-01-17 20:31:14', '0000-00-00 00:00:00', '0', b'1'),
	(88, '15002', '2025-01-17 20:48:28', '0000-00-00 00:00:00', '0', b'1'),
	(89, '15006', '2025-01-17 20:49:11', '0000-00-00 00:00:00', '0', b'1'),
	(90, '15002', '2025-01-17 20:56:12', '0000-00-00 00:00:00', '0', b'1'),
	(91, '15002', '2025-01-17 21:28:08', '0000-00-00 00:00:00', '0', b'1'),
	(92, '15002', '2025-01-17 21:37:48', '0000-00-00 00:00:00', '0', b'1'),
	(93, '15002', '2025-01-17 21:43:22', '0000-00-00 00:00:00', '0', b'1'),
	(94, '15002', '2025-01-17 21:52:02', '0000-00-00 00:00:00', '0', b'1'),
	(95, '15002', '2025-01-17 22:00:51', '0000-00-00 00:00:00', '0', b'1'),
	(96, '15002', '2025-01-17 22:07:08', '0000-00-00 00:00:00', '0', b'1'),
	(97, '15002', '2025-01-18 10:23:57', '0000-00-00 00:00:00', '0', b'1'),
	(98, '15002', '2025-01-20 21:01:53', '0000-00-00 00:00:00', '0', b'1'),
	(99, '15002', '2025-01-20 21:03:42', '0000-00-00 00:00:00', '0', b'1'),
	(100, '15002', '2025-01-20 21:36:08', '0000-00-00 00:00:00', '0', b'1'),
	(101, '15002', '2025-01-21 10:05:40', '0000-00-00 00:00:00', '0', b'1'),
	(102, '15002', '2025-01-21 10:12:16', '0000-00-00 00:00:00', '0', b'1'),
	(103, '15002', '2025-01-21 10:56:47', '0000-00-00 00:00:00', '0', b'1'),
	(104, '15002', '2025-01-21 13:20:51', '0000-00-00 00:00:00', '0', b'1'),
	(105, '15002', '2025-01-21 13:42:31', '0000-00-00 00:00:00', '0', b'1'),
	(106, '15002', '2025-01-21 13:54:42', '0000-00-00 00:00:00', '0', b'1'),
	(107, '15002', '2025-01-21 15:00:11', '0000-00-00 00:00:00', '0', b'1'),
	(108, '15002', '2025-01-23 12:03:16', '0000-00-00 00:00:00', '0', b'1'),
	(109, '15002', '2025-01-23 12:34:41', '0000-00-00 00:00:00', '0', b'1'),
	(110, '15002', '2025-01-23 12:40:19', '0000-00-00 00:00:00', '0', b'1'),
	(111, '15002', '2025-01-23 12:43:47', '0000-00-00 00:00:00', '0', b'1'),
	(112, '15002', '2025-01-23 12:44:45', '0000-00-00 00:00:00', '0', b'1'),
	(113, '15002', '2025-01-23 12:48:31', '0000-00-00 00:00:00', '0', b'1'),
	(114, '15002', '2025-01-23 12:50:03', '0000-00-00 00:00:00', '0', b'1'),
	(115, '15006', '2025-01-23 12:58:04', '0000-00-00 00:00:00', '0', b'1'),
	(116, '15006', '2025-01-23 12:58:49', '0000-00-00 00:00:00', '0', b'1'),
	(117, '15006', '2025-01-23 12:59:09', '0000-00-00 00:00:00', '0', b'1'),
	(118, '15006', '2025-01-23 13:00:54', '0000-00-00 00:00:00', '0', b'1'),
	(119, '15006', '2025-01-23 13:01:46', '0000-00-00 00:00:00', '0', b'1'),
	(120, '15006', '2025-01-23 13:03:31', '0000-00-00 00:00:00', '0', b'1'),
	(121, '15006', '2025-01-23 13:04:13', '0000-00-00 00:00:00', '0', b'1'),
	(122, '15006', '2025-01-23 13:07:08', '0000-00-00 00:00:00', '0', b'1'),
	(123, '15006', '2025-01-23 13:08:04', '0000-00-00 00:00:00', '0', b'1'),
	(124, '15006', '2025-01-23 13:08:18', '0000-00-00 00:00:00', '0', b'1'),
	(125, '15006', '2025-01-23 13:14:47', '0000-00-00 00:00:00', '0', b'1'),
	(126, '15006', '2025-01-23 13:15:30', '0000-00-00 00:00:00', '0', b'1'),
	(127, '15006', '2025-01-23 13:16:15', '0000-00-00 00:00:00', '0', b'1'),
	(128, '15006', '2025-01-23 13:16:18', '0000-00-00 00:00:00', '0', b'1'),
	(129, '15006', '2025-01-23 13:17:13', '0000-00-00 00:00:00', '0', b'1'),
	(130, '15006', '2025-01-23 13:22:34', '0000-00-00 00:00:00', '0', b'1'),
	(131, '15006', '2025-01-23 13:22:41', '0000-00-00 00:00:00', '0', b'1'),
	(132, '15006', '2025-01-23 13:24:43', '0000-00-00 00:00:00', '0', b'1'),
	(133, '15006', '2025-01-23 13:25:13', '0000-00-00 00:00:00', '0', b'1'),
	(134, '15006', '2025-01-23 13:25:31', '0000-00-00 00:00:00', '0', b'1'),
	(135, '15006', '2025-01-23 13:26:22', '0000-00-00 00:00:00', '0', b'1'),
	(136, '15006', '2025-01-23 13:26:58', '0000-00-00 00:00:00', '0', b'1'),
	(137, '15006', '2025-01-23 13:29:50', '0000-00-00 00:00:00', '0', b'1'),
	(138, '15006', '2025-01-23 13:30:00', '0000-00-00 00:00:00', '0', b'1'),
	(139, '15006', '2025-01-23 13:38:27', '0000-00-00 00:00:00', '0', b'1'),
	(140, '15006', '2025-01-23 13:38:57', '0000-00-00 00:00:00', '0', b'1'),
	(141, '15006', '2025-01-23 13:39:05', '0000-00-00 00:00:00', '0', b'1'),
	(142, '15006', '2025-01-23 13:42:48', '0000-00-00 00:00:00', '0', b'1'),
	(143, '15006', '2025-01-23 13:44:55', '0000-00-00 00:00:00', '0', b'1'),
	(144, '15002', '2025-01-23 14:58:00', '0000-00-00 00:00:00', '0', b'1'),
	(145, '15002', '2025-01-23 15:55:57', '0000-00-00 00:00:00', '0', b'1'),
	(146, '15002', '2025-01-23 16:02:06', '0000-00-00 00:00:00', '0', b'1'),
	(147, '15002', '2025-01-23 16:06:09', '0000-00-00 00:00:00', '0', b'1'),
	(148, '15002', '2025-01-23 16:12:53', '0000-00-00 00:00:00', '0', b'1'),
	(149, '15002', '2025-01-23 16:14:48', '0000-00-00 00:00:00', '0', b'1'),
	(150, '15002', '2025-01-23 16:15:52', '0000-00-00 00:00:00', '0', b'1'),
	(151, '15002', '2025-01-23 16:16:39', '0000-00-00 00:00:00', '0', b'1'),
	(152, '15002', '2025-01-23 16:23:33', '0000-00-00 00:00:00', '0', b'1'),
	(153, '15002', '2025-01-23 17:18:23', '0000-00-00 00:00:00', '0', b'1'),
	(154, '15002', '2025-01-23 17:18:59', '0000-00-00 00:00:00', '0', b'1'),
	(155, '15002', '2025-01-23 17:19:17', '0000-00-00 00:00:00', '0', b'1'),
	(156, '15002', '2025-01-23 17:20:38', '0000-00-00 00:00:00', '0', b'1'),
	(157, '15002', '2025-01-23 17:20:44', '0000-00-00 00:00:00', '0', b'1'),
	(158, '15002', '2025-01-23 17:20:45', '0000-00-00 00:00:00', '0', b'1'),
	(159, '15002', '2025-01-23 17:20:45', '0000-00-00 00:00:00', '0', b'1'),
	(160, '15002', '2025-01-23 17:20:57', '0000-00-00 00:00:00', '0', b'1'),
	(161, '15002', '2025-01-23 17:23:19', '0000-00-00 00:00:00', '0', b'1'),
	(162, '15002', '2025-01-23 17:25:38', '0000-00-00 00:00:00', '0', b'1'),
	(163, '15002', '2025-01-23 17:26:35', '0000-00-00 00:00:00', '0', b'1'),
	(164, '15001', '2025-01-23 17:26:39', '0000-00-00 00:00:00', '0', b'1'),
	(165, '15001', '2025-01-23 17:26:41', '0000-00-00 00:00:00', '0', b'1'),
	(166, '15002', '2025-01-24 21:24:10', '0000-00-00 00:00:00', '0', b'1'),
	(167, '15002', '2025-01-24 21:24:59', '0000-00-00 00:00:00', '0', b'1'),
	(168, '15002', '2025-01-24 21:26:17', '0000-00-00 00:00:00', '0', b'1'),
	(169, '15002', '2025-01-24 22:03:24', '0000-00-00 00:00:00', '0', b'1'),
	(170, '15002', '2025-01-24 22:16:56', '0000-00-00 00:00:00', '0', b'1'),
	(171, '15002', '2025-01-24 22:22:30', '0000-00-00 00:00:00', '0', b'1'),
	(172, '15002', '2025-01-25 17:13:59', '0000-00-00 00:00:00', '0', b'1'),
	(173, '15002', '2025-01-25 17:20:43', '0000-00-00 00:00:00', '0', b'1'),
	(174, '15006', '2025-01-28 17:05:32', '0000-00-00 00:00:00', '0', b'1'),
	(175, '15006', '2025-01-28 17:06:18', '0000-00-00 00:00:00', '0', b'1'),
	(176, '15006', '2025-01-28 17:06:33', '0000-00-00 00:00:00', '0', b'1'),
	(177, '15006', '2025-01-28 17:07:28', '0000-00-00 00:00:00', '0', b'1'),
	(178, '15006', '2025-01-28 17:07:43', '0000-00-00 00:00:00', '0', b'1'),
	(179, '15006', '2025-01-28 17:07:55', '0000-00-00 00:00:00', '0', b'1'),
	(180, '15006', '2025-01-28 17:08:23', '0000-00-00 00:00:00', '0', b'1'),
	(181, '15006', '2025-01-28 17:09:04', '0000-00-00 00:00:00', '0', b'1'),
	(182, '15006', '2025-01-28 17:10:22', '0000-00-00 00:00:00', '0', b'1'),
	(183, '15006', '2025-01-28 17:10:42', '0000-00-00 00:00:00', '0', b'1'),
	(184, '15002', '2025-01-29 12:42:01', '0000-00-00 00:00:00', '0', b'1'),
	(185, '15006', '2025-01-29 12:43:19', '0000-00-00 00:00:00', '0', b'1'),
	(186, '15006', '2025-01-29 12:43:35', '0000-00-00 00:00:00', '0', b'1'),
	(187, '15006', '2025-01-29 12:44:02', '0000-00-00 00:00:00', '0', b'1'),
	(188, '15002', '2025-01-29 15:49:03', '0000-00-00 00:00:00', '0', b'1'),
	(189, '15002', '2025-01-29 17:54:26', '0000-00-00 00:00:00', '0', b'1'),
	(190, '15002', '2025-01-29 18:08:47', '0000-00-00 00:00:00', '0', b'1'),
	(191, '15002', '2025-01-29 18:14:59', '0000-00-00 00:00:00', '0', b'1'),
	(192, '15002', '2025-01-29 18:17:43', '0000-00-00 00:00:00', '0', b'1'),
	(193, '15002', '2025-01-29 18:19:52', '0000-00-00 00:00:00', '0', b'1'),
	(194, '15002', '2025-02-03 17:16:24', '0000-00-00 00:00:00', '0', b'1'),
	(195, '15002', '2025-02-03 17:17:03', '0000-00-00 00:00:00', '0', b'1'),
	(196, '15002', '2025-02-03 18:19:16', '0000-00-00 00:00:00', '0', b'1'),
	(197, '15002', '2025-02-03 18:23:07', '0000-00-00 00:00:00', '0', b'1'),
	(198, '15006', '2025-02-05 14:37:49', '0000-00-00 00:00:00', '0', b'1'),
	(199, '15006', '2025-02-05 14:38:22', '0000-00-00 00:00:00', '0', b'1'),
	(200, '15006', '2025-02-05 14:39:04', '0000-00-00 00:00:00', '0', b'1'),
	(201, '15006', '2025-02-05 14:42:11', '0000-00-00 00:00:00', '0', b'1'),
	(202, '15006', '2025-02-05 14:42:56', '0000-00-00 00:00:00', '0', b'1'),
	(203, '15006', '2025-02-05 14:43:18', '0000-00-00 00:00:00', '0', b'1'),
	(204, '15006', '2025-02-05 14:44:09', '0000-00-00 00:00:00', '0', b'1'),
	(205, '15006', '2025-02-05 14:44:33', '0000-00-00 00:00:00', '0', b'1'),
	(206, '15006', '2025-02-05 14:45:11', '0000-00-00 00:00:00', '0', b'1'),
	(207, '15006', '2025-02-05 14:46:54', '0000-00-00 00:00:00', '0', b'1'),
	(208, '15006', '2025-02-05 14:54:45', '0000-00-00 00:00:00', '0', b'1'),
	(209, '15006', '2025-02-05 15:01:59', '0000-00-00 00:00:00', '0', b'1'),
	(210, '15006', '2025-02-05 15:03:33', '0000-00-00 00:00:00', '0', b'1'),
	(211, '15006', '2025-02-05 15:05:24', '0000-00-00 00:00:00', '0', b'1'),
	(212, '15006', '2025-02-05 15:06:35', '0000-00-00 00:00:00', '0', b'1'),
	(213, '15006', '2025-02-05 15:06:48', '0000-00-00 00:00:00', '0', b'1'),
	(214, '15006', '2025-02-05 15:09:10', '0000-00-00 00:00:00', '0', b'1'),
	(215, '15006', '2025-02-05 15:14:42', '0000-00-00 00:00:00', '0', b'1'),
	(216, '15006', '2025-02-05 15:15:44', '0000-00-00 00:00:00', '0', b'1'),
	(217, '15006', '2025-02-05 15:16:27', '0000-00-00 00:00:00', '0', b'1'),
	(218, '15006', '2025-02-05 15:17:49', '0000-00-00 00:00:00', '0', b'1'),
	(219, '15006', '2025-02-05 15:18:32', '0000-00-00 00:00:00', '0', b'1'),
	(220, '15006', '2025-02-05 15:19:39', '0000-00-00 00:00:00', '0', b'1'),
	(221, '15006', '2025-02-05 15:22:01', '0000-00-00 00:00:00', '0', b'1'),
	(222, '15006', '2025-02-05 15:35:55', '0000-00-00 00:00:00', '0', b'1'),
	(223, '15006', '2025-02-05 15:36:29', '0000-00-00 00:00:00', '0', b'1'),
	(224, '15006', '2025-02-05 15:36:36', '0000-00-00 00:00:00', '0', b'1');

-- Dumping structure for table data_process.users_media
CREATE TABLE IF NOT EXISTS `users_media` (
  `mediaId` varchar(50) NOT NULL,
  `employeeId` varchar(50) NOT NULL,
  `mediaType` varchar(20) NOT NULL,
  `emailId` varchar(50) DEFAULT NULL,
  `mobileNo` varchar(20) DEFAULT NULL,
  `alternateMobile` varchar(20) DEFAULT NULL,
  `emergencyContactNo` varchar(20) DEFAULT NULL,
  `communicationAddress` varchar(500) DEFAULT NULL,
  `permanentAddress` varchar(500) DEFAULT NULL,
  PRIMARY KEY (`mediaId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- Dumping data for table data_process.users_media: ~14 rows (approximately)
INSERT INTO `users_media` (`mediaId`, `employeeId`, `mediaType`, `emailId`, `mobileNo`, `alternateMobile`, `emergencyContactNo`, `communicationAddress`, `permanentAddress`) VALUES
	('15001', '15001', 'Primary', 'soundaravalli2021@gmail.com', '9790756096', NULL, NULL, NULL, NULL),
	('15002', '15002', 'Primary', 'muthuslm@gmail.com', '9790756096', NULL, NULL, NULL, NULL),
	('15003', '15003', 'Primary', 'tamils1978@gmail.com', '9790756096', NULL, NULL, NULL, NULL),
	('15006', '15006', 'Primary', 'ananthee89@gmail.com', '9790756096', NULL, NULL, NULL, NULL),
	('15007', '15007', 'Primary', 'whizantanu4@gmail.com', '9790756096', NULL, NULL, NULL, NULL),
	('15008', '15008', 'Primary', NULL, '9790756096', NULL, NULL, NULL, NULL),
	('15009', '15009', 'Primary', NULL, '9790756096', NULL, NULL, NULL, NULL),
	('15010', '15010', 'Primary', NULL, '9790756096', NULL, NULL, NULL, NULL),
	('15011', '15011', 'Primary', NULL, '9790756096', NULL, NULL, NULL, NULL),
	('15012', '15012', 'Primary', NULL, '9790756096', NULL, NULL, NULL, NULL),
	('15013', '15013', 'Primary', NULL, '9790756096', NULL, NULL, NULL, NULL),
	('15014', '15014', 'Primary', NULL, '9790756096', NULL, NULL, NULL, NULL),
	('15015', '15015', 'Primary', NULL, '9790756096', NULL, NULL, NULL, NULL),
	('MEDIA0', 'Admin', 'Primary', 'soundaravalli2021@gmail.com', '9790756096', NULL, NULL, NULL, NULL);

-- Dumping structure for table data_process.users_resource_project
CREATE TABLE IF NOT EXISTS `users_resource_project` (
  `autoId` varchar(50) NOT NULL,
  `employeeId` varchar(50) NOT NULL,
  `projectId` varchar(50) NOT NULL,
  `startDate` datetime NOT NULL,
  `endDate` datetime NOT NULL,
  `status` bit(1) NOT NULL DEFAULT b'1',
  PRIMARY KEY (`autoId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- Dumping data for table data_process.users_resource_project: ~4 rows (approximately)
INSERT INTO `users_resource_project` (`autoId`, `employeeId`, `projectId`, `startDate`, `endDate`, `status`) VALUES
	('UPA1733832749811', '15006', 'DEV1725282861622', '2024-12-01 00:00:00', '2025-12-01 00:00:00', b'1'),
	('UPA1733832749812', '15006', 'ProFoc0001', '2024-12-01 00:00:00', '2025-12-01 00:00:00', b'1'),
	('UPA1735635805468', '15006', 'DEV1725282861622', '2024-12-01 00:00:00', '2025-12-01 00:00:00', b'1'),
	('UPA1735635805469', '15006', 'ProFoc0001', '2024-12-01 00:00:00', '2025-12-01 00:00:00', b'1');

-- Dumping structure for table data_process.users_roles
CREATE TABLE IF NOT EXISTS `users_roles` (
  `autoId` bigint NOT NULL AUTO_INCREMENT,
  `employeeId` varchar(50) NOT NULL,
  `roleId` varchar(50) NOT NULL,
  `createdBy` varchar(50) DEFAULT NULL,
  `createdDate` datetime DEFAULT NULL,
  `modifiedBy` varchar(50) DEFAULT NULL,
  `modifiedDate` datetime DEFAULT NULL,
  `status` bit(1) NOT NULL DEFAULT b'1',
  PRIMARY KEY (`autoId`)
) ENGINE=InnoDB AUTO_INCREMENT=25 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- Dumping data for table data_process.users_roles: ~22 rows (approximately)
INSERT INTO `users_roles` (`autoId`, `employeeId`, `roleId`, `createdBy`, `createdDate`, `modifiedBy`, `modifiedDate`, `status`) VALUES
	(1, 'PRODUCERUSER', 'Admin', 'Admin', '2025-01-01 00:00:00', 'Admin', '2025-01-01 00:00:00', b'1'),
	(2, 'SystemUser', 'Admin', 'Admin', '2025-01-01 00:00:00', 'Admin', '2025-01-01 00:00:00', b'1'),
	(5, '15001', 'Employee', 'Admin', '2025-01-01 00:00:00', 'Admin', '2025-01-01 00:00:00', b'1'),
	(6, '15002', 'Employee', 'Admin', '2025-01-01 00:00:00', 'Admin', '2025-01-01 00:00:00', b'1'),
	(7, '15003', 'Employee', 'Admin', '2025-01-01 00:00:00', 'Admin', '2025-01-01 00:00:00', b'1'),
	(8, '15006', 'Employee', 'Admin', '2025-01-01 00:00:00', 'Admin', '2025-01-01 00:00:00', b'1'),
	(9, '15007', 'Employee', 'Admin', '2025-01-01 00:00:00', 'Admin', '2025-01-01 00:00:00', b'1'),
	(10, '15008', 'Employee', 'Admin', '2025-01-01 00:00:00', 'Admin', '2025-01-01 00:00:00', b'1'),
	(11, '15009', 'Employee', 'Admin', '2025-01-01 00:00:00', 'Admin', '2025-01-01 00:00:00', b'1'),
	(12, '15010', 'Employee', 'Admin', '2025-01-01 00:00:00', 'Admin', '2025-01-01 00:00:00', b'1'),
	(13, '15011', 'Employee', 'Admin', '2025-01-01 00:00:00', 'Admin', '2025-01-01 00:00:00', b'1'),
	(14, '15012', 'Employee', 'Admin', '2025-01-01 00:00:00', 'Admin', '2025-01-01 00:00:00', b'1'),
	(15, '15013', 'Employee', 'Admin', '2025-01-01 00:00:00', 'Admin', '2025-01-01 00:00:00', b'1'),
	(16, '15014', 'Employee', 'Admin', '2025-01-01 00:00:00', 'Admin', '2025-01-01 00:00:00', b'1'),
	(17, '15015', 'Employee', 'Admin', '2025-01-01 00:00:00', 'Admin', '2025-01-01 00:00:00', b'1'),
	(18, '15003', 'Admin', 'Admin', '2025-01-01 00:00:00', 'Admin', '2025-01-01 00:00:00', b'1'),
	(19, '15006', 'Admin', 'Admin', '2025-01-01 00:00:00', 'Admin', '2025-01-01 00:00:00', b'1'),
	(20, '15002', 'TeamLeader', 'Admin', '2025-01-01 00:00:00', 'Admin', '2025-01-01 00:00:00', b'1'),
	(21, '15007', 'ServicePersonal', 'Admin', '2025-01-01 00:00:00', 'Admin', '2025-01-01 00:00:00', b'1'),
	(22, '15008', 'ServicePersonal', 'Admin', '2025-01-01 00:00:00', 'Admin', '2025-01-01 00:00:00', b'1'),
	(23, 'PRODUCERUSER', 'Employee', 'Admin', '2025-01-01 00:00:00', 'Admin', '2025-01-01 00:00:00', b'1'),
	(24, 'SystemUser', 'Employee', 'Admin', '2025-01-01 00:00:00', 'Admin', '2025-01-01 00:00:00', b'1');

-- Dumping structure for table data_process.users_timesheet
CREATE TABLE IF NOT EXISTS `users_timesheet` (
  `timesheetId` varchar(50) NOT NULL,
  `attendanceId` varchar(50) NOT NULL,
  `approvedBy` varchar(50) DEFAULT NULL,
  `hoursBillable` bigint NOT NULL DEFAULT '0',
  `hoursNBNP` bigint NOT NULL DEFAULT '0',
  `hoursNBP` bigint NOT NULL DEFAULT '0',
  `hoursOTApproved` bigint NOT NULL DEFAULT '0',
  `hoursOTLocked` bit(1) NOT NULL DEFAULT b'0',
  `markedTime` datetime DEFAULT NULL,
  `approvedTime` datetime DEFAULT NULL,
  `status` varchar(50) DEFAULT NULL,
  `comments` varchar(500) DEFAULT NULL,
  `tamper` varchar(200) DEFAULT NULL,
  `eventTrack` longtext,
  `lockStatus` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`timesheetId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- Dumping data for table data_process.users_timesheet: ~6 rows (approximately)
INSERT INTO `users_timesheet` (`timesheetId`, `attendanceId`, `approvedBy`, `hoursBillable`, `hoursNBNP`, `hoursNBP`, `hoursOTApproved`, `hoursOTLocked`, `markedTime`, `approvedTime`, `status`, `comments`, `tamper`, `eventTrack`, `lockStatus`) VALUES
	('TS1736164325590', 'AT1736164325583', '15006', 125, 100, 70, 0, b'0', '2025-01-06 17:39:22', '2025-01-06 17:39:44', 'Approved', 'ReferBack Approved', NULL, NULL, 'None'),
	('TS1737618762055', 'AT1737618762042', NULL, 0, 0, 0, 0, b'0', NULL, NULL, 'None', NULL, NULL, NULL, 'None'),
	('TS1737734198154', 'AT1737734198142', NULL, 0, 0, 0, 0, b'0', NULL, NULL, 'None', NULL, NULL, NULL, 'None'),
	('TS1737805862378', 'AT1737805862366', NULL, 0, 0, 0, 0, b'0', NULL, NULL, 'None', NULL, NULL, NULL, 'None'),
	('TS1738155018083', 'AT1738155018077', NULL, 0, 0, 0, 0, b'0', NULL, NULL, 'None', NULL, NULL, NULL, 'None'),
	('TS1738587200654', 'AT1738587200650', NULL, 0, 0, 0, 0, b'0', NULL, NULL, 'None', NULL, NULL, NULL, 'None');

/*!40103 SET TIME_ZONE=IFNULL(@OLD_TIME_ZONE, 'system') */;
/*!40101 SET SQL_MODE=IFNULL(@OLD_SQL_MODE, '') */;
/*!40014 SET FOREIGN_KEY_CHECKS=IFNULL(@OLD_FOREIGN_KEY_CHECKS, 1) */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40111 SET SQL_NOTES=IFNULL(@OLD_SQL_NOTES, 1) */;
