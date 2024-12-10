module.exports = {

    GetMarkTime: `SELECT attendanceId, employeeId, markedTime, symbol, symbol as workingHours FROM usersattendance WHERE employeeId = ? AND date = ?`,

    CheckMarkedTime: `SELECT attendanceId FROM usersattendance WHERE employeeId = ? AND date = ? `,

    CheckTimeSheet: `SELECT timesheetId FROM userstimesheet WHERE attendanceId = ? `,

    UpdateAttendanceSymbol: `UPDATE usersattendance SET symbol= ?, markedTime = ?, markedBy = ?, status = 'Marked', lockStatus = 'None' WHERE attendanceId = ? AND (lockStatus = 'None' OR lockStatus IS NULL) AND status <> 'Approved' `,

    GetLMSColorList: `SELECT colorId, colorName, description FROM users_lms_color WHERE status = 1 Order By displayOrder ASC`,

    GetLeaveTypeList: `SELECT leaveTypeId, leaveTypeName, maxDays FROM users_leave_type WHERE status = 1 Order By displayOrder ASC`,

    GetLeaveById: `SELECT employeeId, noOfDays, detectedLeave, fromDate, toDate FROM usersleavemanagement WHERE leaveId = ?`,

    SearchUserLeave: `SELECT UL.leaveId, CONCAT(UL.noOfDays, ' day(s)') AS noOfDays,  
    CONCAT(UL.detectedLeave, ' day(s)') AS detectedLeave, UL.symbol, UL.fromDate, UL.toDate, UL.leaveDates, UL.status, UL.reason, UL.comments, 
    CONCAT(U2.userName, '(', U2.userId, ')') AS createdBy, UL.createdDate, 
    CONCAT(U3.userName, '(', U3.userId, ')') AS modifiedBy, UL.modifiedDate
    FROM usersleavemanagement UL 
    LEFT JOIN users U2 on U2.employeeId = UL.createdBy 
    LEFT JOIN users U3 on U3.employeeId = UL.modifiedBy
    WHERE UL.employeeId = ? AND UL.fromDate >= ? AND UL.activeToDate <= ? `,

    SearchUserLeaveByAdmin: `SELECT CONCAT(U1.userName, '(', U1.userId, ')') AS userName, UL.leaveId, CONCAT(UL.noOfDays, ' day(s)') AS noOfDays,  
    CONCAT(UL.detectedLeave, ' day(s)') AS detectedLeave, UL.symbol, UL.fromDate, UL.toDate, UL.leaveDates, UL.status, UL.reason, UL.comments, 
    CONCAT(U2.userName, '(', U2.userId, ')') AS createdBy, UL.createdDate, 
    CONCAT(U3.userName, '(', U3.userId, ')') AS modifiedBy, UL.modifiedDate
    FROM usersleavemanagement UL 
    LEFT JOIN users U1 ON U1.employeeId = UL.employeeId 
    LEFT JOIN users U2 on U2.employeeId = UL.createdBy 
    LEFT JOIN users U3 on U3.employeeId = UL.modifiedBy
    WHERE UL.employeeId IN (?) AND U1.userName LIKE ? AND UL.symbol LIKE ? AND UL.status LIKE ? 
    AND UL.fromDate >= ? AND UL.activeToDate <= ? `,

    SearchLeaveWithInRange: `SELECT * FROM usersleavemanagement WHERE status In ('Pending', 'Approved', 'Partially_Availed', 'Partially_Cancel') 
     AND employeeId = ? AND (fromDate >= ? AND activeToDate <= ? OR leaveDates LIKE ? OR leaveDates LIKE ?)`, // () Is Mandatory

    UpdateCancelLeave: `UPDATE usersleavemanagement SET status = ?, comments = ?, leaveDates = ?, activeToDate = ?, modifiedBy = ?, modifiedDate = ?  
    WHERE status In ('Pending', 'Partially_Availed', 'Approved', 'Refer_Back') AND leaveId = ?`,

    UpdateUserLeaveBalance: `UPDATE usershrrecords SET approvedLeaveBalance = (approvedLeaveBalance + ?) WHERE employeeId = ? `,

    GetUserLeaveBalance: `SELECT approvedLeaveBalance AS Count FROM usershrrecords WHERE employeeId = ?`,

    GetReportingEmployeeList: `SELECT employeeId, CONCAT(userName,' (', userId, ')') AS userName FROM users WHERE reportingTo = ?`,

    SP_HolidayColor: `CALL getUsersLeaveCalendarColor(?,?)`,

    GetUsersDailyLog: `SELECT UL.autoId, TP.processId, TP.processName, TP.billType, UL.actualTime, UL.status, UL.description from usersdailylog UL 
    LEFT JOIN timesheetprocess TP ON TP.processId = UL.processId WHERE UL.timesheetId = ?`,

    GetAssignedUsersDailyLog: `SELECT UL.autoId, TP.processId, TP.processName, TP.billType, UL.actualTime, UL.status, UL.description from usersdailylog UL 
    LEFT JOIN timesheetprocess TP ON TP.processId = UL.processId WHERE UL.employeeId = ? AND UL.taskDate BETWEEN ? AND ?`,

    CheckUsersDailyLog: `SELECT * FROM usersdailylog WHERE timesheetId = ? AND processId = ?`,

    DeleteUserDailyLog: `DELETE FROM usersdailylog WHERE autoId = ?`,

    ProjectList: `SELECT projectId, projectName FROM operational_resource_project WHERE status = 1 AND divisionId = ? ORDER BY displayOrder ASC`,

    ProjectProcessList: `SELECT TP.processId, TP.processName, TP.billType, CAST(TP.billable AS UNSIGNED) AS billable, TP.entryType, TP.minutes FROM timesheetprocess TP
    JOIN timesheetprocessproject TPP ON TPP.processId = TP.processId WHERE TP.status = 1 AND TPP.projectId = ? ORDER BY TP.displayOrder ASC`,

    GetTimesheetByDateRange: `SELECT UT.timesheetId, UT.attendanceId, UA.date, UT.hoursBillable, UT.hoursNBNP, UT.hoursNBP, UT.hoursOTApproved,
    CAST(UT.hoursOTLocked AS UNSIGNED) hoursOTLocked, 
    CONCAT(U.userName, ' (', U.UserId, ')' ) AS markedBy, UT.markedTime, 
    CONCAT(U.userName, ' (', U.UserId, ')' ) AS approvedBy, UT.approvedTime, 
    UT.status, UT.comments FROM  userstimesheet UT 
    LEFT JOIN usersattendance UA ON UT.attendanceId = UA.attendanceId 
    LEFT JOIN users U ON UA.employeeId = U.employeeId 
    WHERE UA.employeeId = ? AND UA.date IN ( ? ) `,

    UpdateTimesheet: `UPDATE userstimesheet SET hoursBillable = ? , hoursNBNP = ?, hoursNBP = ?, markedTime = ?, status = 'Pending' 
    WHERE status IN ('None', 'Pending', 'ReferBack') AND lockStatus = 'None' AND timesheetId = ?`,

    ApproveTimesheet: `UPDATE userstimesheet SET approvedTime = ?, status = ?, comments = ?, approvedBy = ? WHERE status IN ('Pending', 'Approved', 'ReferBack') AND 
    lockStatus = 'None' AND timesheetId = ?`,

    ApproveAttendance: `UPDATE usersattendance SET approvedTime = ?, approvalStatus = ?, comments = ?, approvedBy = ? WHERE (lockStatus = 'None' OR lockStatus IS NULL) AND 
    attendanceId = ? ` ,

    SpecialApproveLockedTimesheet: `UPDATE userstimesheet SET approvedTime = ?, status = ?, comments = ?, approvedBy = ? WHERE lockStatus = 'Locked' AND timesheetId = ?`,

    SpecialApproveLockedAttendance: `UPDATE usersattendance SET approvedTime = ?, approvalStatus = ?, comments = ?, approvedBy = ? WHERE lockStatus = 'Locked' AND attendanceId = ?`,

    //Bulk Update
    UpdateApproveHoliday: `UPDATE usersholidayscalendar SET comments = CONCAT(comments,'\n',?),  approvalStatus = ?, approvedBy = ?, approvedDate = ?, status = ? 
    WHERE approvalStatus IN ('Review', 'ReferBack')`,

    UpdateBlockHoliday: `UPDATE usersholidayscalendar SET approvalStatus = ?, modifiedBy = ?, modifiedDate = ?, status = ? WHERE autoId = ?`,

    DeleteHoliday: `DELETE FROM usersholidayscalendar WHERE startDate > ? AND autoId = ? `,

    UpdateHoliday: `UPDATE usersholidayscalendar SET holiday = ?, country = ?, startDate = ?, endDate = ?, year = ?, symbol = ?, zoneArea = ?, 
    approvalStatus = ?, modifiedBy = ?, modifiedDate = ?, status = ? WHERE autoId = ? `,

    SearchHolidayExists: `SELECT HC.holiday FROM usersholidayscalendar HC WHERE HC.startDate >= ? AND HC.endDate <= ? AND HC.zoneArea = ?`,

    SearchHolidayUpdateExists: `SELECT HC.holiday FROM usersholidayscalendar HC WHERE HC.startDate >= ? AND HC.endDate <= ? AND HC.zoneArea = ? AND HC.autoId <> ?`,

    SearchHoliday: `SELECT HC.autoId, HC.holiday, HC.country, HC.startDate, HC.endDate, HC.year, HC.symbol, HC.zoneArea, 
    CONCAT(U1.userName, '(', U1.userId, ')') AS createdBy, HC.createdDate, 
    CONCAT(U2.userName, '(', U2.userId, ')') AS modifiedBy, HC.modifiedDate, 
    CONCAT(U3.userName, '(', U3.userId, ')') AS approvedBy, HC.approvedDate, 
    HC.status FROM usersholidayscalendar HC
    LEFT JOIN users U1 on U1.employeeId = HC.createdBy 
    LEFT JOIN users U2 on U2.employeeId = HC.modifiedBy 
    LEFT JOIN users U3 on U3.employeeId = HC.approvedBy 
    WHERE ( HC.holiday LIKE ? OR HC.country LIKE ? OR HC.symbol LIKE ? OR HC.zoneArea LIKE ? ) AND 
    HC.startDate >= ? AND HC.endDate <= ?`,

    ProjectDurationList: `SELECT projectId, projectName, resourceStartDate AS startDate, resourceEndDate AS endDate FROM operational_resource_project 
    WHERE status = 1 AND divisionId = ? AND resourceEndDate >= ? AND resourceStartDate <= ? ORDER BY displayOrder ASC`,

    GetUserProjectProcess: `SELECT ORP.projectName, TP.processId, TP.processName FROM timesheetprocess TP 
    LEFT JOIN timesheetprocessproject TPP ON TP.processId = TPP.processId
    LEFT JOIN usersresourceproject URP ON URP.projectId = TPP.projectId
    LEFT JOIN operational_resource_project ORP ON ORP.projectId = TPP.projectId
    WHERE TP.status = 1 AND TPP.status = 1 AND URP.status = 1 AND URP.employeeId = ?`,

    DeleteUserAllAssignedTasks: `DELETE FROM usersassignedtasks WHERE employeeId = ?`,

    GetAssignedTasks: `SELECT processInfo FROM usersassignedtasks WHERE employeeId = ?`,

    UpdateAssignedTasks: `UPDATE usersassignedtasks SET processInfo = ? WHERE employeeId = ?`

}