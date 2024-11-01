module.exports = {

    MarkTime : `SELECT attendanceId, employeeId, DATE_FORMAT(markedTime,'%Y-%m-%d %H:%i:%s') AS markedTime, symbol, SUBSTRING(symbol, 2, 2) AS workingHours FROM usersattendance WHERE employeeId = ? AND attendanceDate = ?`,
    
    CheckMarkedTime : `SELECT attendanceId FROM usersattendance WHERE employeeId = ? AND attendanceDate = ? `,

    CheckTimeSheet: `SELECT timesheetId FROM userstimesheet WHERE attendanceId = ? `,
    
    UpdateAttendanceSymbol : `UPDATE usersattendance SET symbol= ?, markedTime = ?, markedBy = ?, status = 'Marked', lockStatus = 'None' WHERE attendanceId = ? AND (lockStatus = 'None' OR lockStatus IS NULL) AND status <> 'Approved' ` ,
    
    GetLMSColorList : `SELECT colorId, colorName, description FROM users_lms_color WHERE status = 1 Order By displayOrder ASC`,
    
    GetLeaveTypeList : `SELECT leaveTypeId, leaveTypeName, maxDays FROM users_leave_type WHERE status = 1 Order By displayOrder ASC`,

    GetLeaveById : `SELECT employeeId, noOfDays, detectedLeave, fromDate, toDate FROM usersleavemanagement WHERE leaveId = ?`,

    SearchUserLeave : `SELECT * FROM usersleavemanagement WHERE employeeId = ? AND fromDate >= ? AND activeToDate <= ?`,
    
    SearchUserLeaveByAdmin : `SELECT CONCAT(U.userName, '(', U.userId, ')') AS userName, UL.* FROM usersleavemanagement UL 
    LEFT JOIN users U ON U.employeeId = UL.employeeId WHERE 
    UL.employeeId IN (?) AND U.userName LIKE ? AND UL.symbol LIKE ? AND UL.status LIKE ? 
    AND UL.fromDate >= ? AND UL.activeToDate <= ? `,

    SearchLeaveWithInRange : `SELECT * FROM usersleavemanagement WHERE status In ('Pending', 'Approved', 'Partially_Availed', 'Partially_Cancel')
     AND employeeId = ? AND (fromDate >= ? AND activeToDate <= ? OR leaveDates LIKE ? OR leaveDates LIKE ?)`, // () Is Mandatory

    UpdateCancelLeave : `UPDATE usersleavemanagement SET status = ?, comments = ?, leaveDates = ?, activeToDate = ?, modifiedBy = ?, modifiedDate = ?  WHERE  status In ('Pending', 'Approved', 'Partially_Availed') AND leaveId = ?`,

    UpdateUserLeaveBalance : `UPDATE usershrrecords SET approvedLeaveBalance = (approvedLeaveBalance + ?) WHERE employeeId = ? `,

    GetUserLeaveBalance : `SELECT approvedLeaveBalance FROM usershrrecords WHERE employeeId = ?`,

    GetReportingEmployeeList : `SELECT employeeId, CONCAT(userName,' (', userId, ')') AS userName FROM users WHERE reportingTo = ?`,

    SP_HolidayColor : `CALL getLMSNew(?,?)`,
    
    SP_LeaveBalance : `CALL getLMSLeave(?)`,

    GetUsersDailyLog: `SELECT TP.processId, TP.processName, TP.billType, UL.actualTime, UL.status, UL.description from usersdailylog UL JOIN timesheetprocess TP ON TP.processId = UL.processId 
    WHERE UL.timesheetId = ?`,

    CheckUsersDailyLog: `SELECT * FROM usersdailylog WHERE timesheetId = ? AND processId = ?` ,

    DeleteUserDailyLog: `DELETE FROM usersdailylog WHERE autoId = ?`,
    
    ProjectList : `SELECT projectId, projectName FROM operational_resource_project WHERE status = 1 ORDER BY displayOrder ASC`,
    
    ProjectProcessList : `SELECT TP.processId, TP.processName, TP.billType, CAST(TP.billable AS UNSIGNED) AS billable, TP.entryType, TP.minutes FROM timesheetprocess TP
    JOIN timesheetprocessproject TPP ON TPP.processId = TP.processId WHERE TP.status = 1 AND TPP.projectId = ? ORDER BY TP.displayOrder ASC`,

    GetTimesheetByDateRange : `SELECT UT.timesheetId, UT.attendanceId, DATE_FORMAT(UA.attendanceDate, '%Y-%m-%d') AS attendanceDate, 
    CONCAT(U.userName, ' (', U.UserId, ')' ) AS approvedBy, UT.hoursBillable, UT.hoursNBNP, UT.hoursNBP, UT.hoursOTApproved, 
    CAST(UT.hoursOTLocked AS UNSIGNED) hoursOTLocked, UT.markedTime, UT.approvedTime, UT.status, UT.comments FROM  userstimesheet UT 
     JOIN usersattendance UA ON UT.attendanceId = UA.attendanceId 
     JOIN users U ON UA.employeeId = U.employeeId 
     WHERE UA.employeeId = ? AND UA.attendanceDate IN ( ? ) `,

    UpdateTimesheet : `UPDATE userstimesheet SET hoursBillable = ? , hoursNBNP = ?, hoursNBP = ?, markedTime = ?, status = 'Pending' 
    WHERE status IN ('None', 'Pending', 'ReferBack') AND lockStatus = 'None' AND timesheetId = ?`,

    ApproveTimesheet : `UPDATE userstimesheet SET approvedTime = ?, status = ?, comments = ?, approvedBy = ? WHERE status IN ('Pending', 'Approved', 'ReferBack') AND 
    lockStatus = 'None' AND timesheetId = ?`,

    ApproveAttendance : `UPDATE usersattendance SET approvedTime = ?, approvalStatus = ?, comments = ?, approvedBy = ? WHERE (lockStatus = 'None' OR lockStatus IS NULL) AND 
    attendanceId = ? ` ,

    SpecialApproveLockedTimesheet : `UPDATE userstimesheet SET approvedTime = ?, status = ?, comments = ?, approvedBy = ? WHERE lockStatus = 'Locked' AND timesheetId = ?`,

    SpecialApproveLockedAttendance : `UPDATE usersattendance SET approvedTime = ?, approvalStatus = ?, comments = ?, approvedBy = ? WHERE lockStatus = 'Locked' AND attendanceId = ?` ,

    //Bulk Update
    UpdateApproveHoliday : `UPDATE usersholidayscalendar SET comments = CONCAT(comments,'\n',?),  approvalStatus = ?, approvedBy = ?, approvedDate = ?, status = ? WHERE approvalStatus IN ('Review')`,

    UpdateBlockHoliday : `UPDATE usersholidayscalendar SET approvalStatus = ?, modifiedBy = ?, modifiedDate = ?, status = ? WHERE autoId = ?`,

    DeleteHoliday :  `DELETE FROM usersholidayscalendar WHERE autoId = ? `,

    UpdateHoliday : `UPDATE usersholidayscalendar SET holiday = ?, country = ?, startDate = ?, endDate = ?, year = ?, symbol = ?, zoneArea = ?, 
    approvalStatus = ?, modifiedBy = ?, modifiedDate = ?, status = ? WHERE autoId = ? `,

    SearchHoliday : `SELECT HC.autoId, HC.holiday, HC.country, HC.startDate, HC.endDate, HC.year, HC.symbol, HC.zoneArea, 
    CONCAT(U1.userName, '(', HC.createdBy, ')') AS createdBy, HC.createdDate, 
    CONCAT(U2.userName, '(', HC.modifiedBy, ')') AS modifiedBy, HC.modifiedDate, 
    CONCAT(U3.userName, '(', HC.approvedBy, ')') AS approvedBy, HC.approvedDate, 
    HC.status FROM usersholidayscalendar HC
    LEFT JOIN users U1 on U1.employeeId = HC.createdBy 
    LEFT JOIN users U2 on U2.employeeId = HC.modifiedBy 
    LEFT JOIN users U3 on U3.employeeId = HC.approvedBy 
    WHERE ( HC.holiday LIKE ? OR HC.country LIKE ? OR HC.symbol LIKE ? OR HC.zoneArea LIKE ? ) AND 
    HC.startDate >= ? AND HC.endDate <= ?`,

}