module.exports = {

    MarkTime : `SELECT attendanceId, employeeId, DATE_FORMAT(markedTime,'%Y-%m-%d %H:%i:%s') AS markedTime, symbol, SUBSTRING(symbol, 2, 2) AS workingHours FROM usersattendance WHERE employeeId = ? AND attendanceDate = ?`,
    
    CheckMarkedTime : `SELECT attendanceId FROM usersattendance WHERE employeeId = ? AND attendanceDate = ? `,

    CheckTimeSheet: `SELECT timesheetId FROM userstimesheet WHERE attendanceId = ? `,
    
    UpdateAttendanceSymbol : `UPDATE usersattendance SET symbol= ?, markedTime = ?, status = 'Marked', lockStatus = 'None' WHERE attendanceId = ? AND (lockStatus = 'None' OR lockStatus IS NULL) AND status <> 'Approved' ` ,
    
    LMSColorList : `SELECT colorId, colorName, description FROM users_lms_color WHERE status = 1 Order By displayOrder ASC`,
    
    LeaveTypeList : `SELECT leaveTypeId, leaveTypeName, maxDays FROM users_leave_type WHERE status = 1 Order By displayOrder ASC`,

    SearchLeaveById : `SELECT employeeId, noOfDays, detectedLeave FROM usersleavemanagement WHERE leaveId = ?`,

    SearchUserLeave : `SELECT * FROM usersleavemanagement WHERE employeeId = ? AND fromDate >= ? AND toDate <= ?`,
    
    SearchUserLeaveByAdmin : `SELECT CONCAT(U.userName, '(', U.userId, ')') AS userName, UL.* FROM usersleavemanagement UL JOIN users U ON U.employeeId = UL.employeeId 
    WHERE UL.employeeId IN (?) AND U.userName LIKE ? AND UL.symbol LIKE ? AND UL.status LIKE ? AND UL.fromDate >= ? AND UL.toDate <= ? `,

    SearchLeaveWithInRange : `SELECT * FROM usersleavemanagement WHERE status In ('Pending', 'Approved') AND employeeId = ? AND fromDate >= ? AND toDate <= ? `, 

    SearchLeaveWithOutRange : `SELECT * FROM usersleavemanagement WHERE status In ('Pending', 'Approved') AND employeeId = ? AND fromDate <= ? AND toDate >= ? `, 

    UpdateCancelLeave : `UPDATE usersleavemanagement SET status = ?, comments = ?, modifiedBy = ?, modifiedDate = ?  WHERE  status In ('Pending', 'Approved') AND leaveId = ?`,

    UpdateUserLeaveBalance : `UPDATE usershrrecords SET approvedLeaveBalance = (approvedLeaveBalance + ?) WHERE employeeId = ? `,

    GetReportingEmployeeList : `SELECT employeeId FROM users WHERE reportingTo = ?`,

    SP_HolidayColor : `CALL getLMSNew(?,?)`,
    
    SP_LeaveBalance : `CALL getLMSLeave(?)`,

    CheckUsersDailyLog: `Select * FROM usersdailylog WHERE timesheetId = ? AND processId = ?` ,
    
    ProjectList : `SELECT projectId, projectName FROM operational_resource_project WHERE status = 1 ORDER BY displayOrder ASC`,
    
    ProjectProcessList : `SELECT TP.processId, TP.processName, TP.billType, CAST(TP.billable AS UNSIGNED) AS billable, TP.entryType, TP.minutes FROM timesheetprocess TP
    JOIN timesheetprocessproject TPP ON TPP.processId = TP.processId WHERE TP.status = 1 AND TPP.projectId = ? ORDER BY TP.displayOrder ASC`,
    
    ProcessList : `SELECT TP.processId, TP.processName, TP.billType, CAST(TP.billable AS UNSIGNED) AS billable, TP.entryType, TP.minutes FROM timesheetprocess TP, timesheetprocessproject TPP WHERE TP.projectId = TPP.projectId AND TP.status = 1 AND TPP.projectId = ? ORDER BY displayOrder ASC`,
}