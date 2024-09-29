module.exports = {

    MarkTime : `SELECT attendanceId, employeeId, DATE_FORMAT(markedTime,'%Y-%m-%d %H:%i:%s') AS markedTime, symbol, SUBSTRING(symbol, 2, 2) AS workingHours FROM usersattendance WHERE employeeId = ? AND attendanceDate LIKE ?`,
    
    CheckMarkedTime : `SELECT attendanceId FROM usersattendance WHERE employeeId = ? AND attendanceDate LIKE ? `,
    
    UpdateAttendanceSymbol : `UPDATE usersattendance SET symbol= ? WHERE attendanceId = ?`,
    
    LMSColorList : `SELECT * FROM user_lms_color WHERE status = 1 Order By displayOrder ASC`,
    
    LeaveTypeList : `SELECT * FROM users_leave_type WHERE status = 1 Order By displayOrder ASC`,

    CancelLeave : `UPDATE usersleavemanagement SET status = 'Cancel', comments = ?, modifiedBy = ?, modifiedDate = ? WHERE leaveId = ?`,

    SearchUserLeaveList : `SELECT *, IF(status="Pending",1,0) AS CancelButton FROM usersleavemanagement WHERE employeeId LIKE ? AND fromDate >= ? AND toDate <= ?`,
    
    SP_HolidayColor : `CALL getLMSNew(?,?)`,
    
    SP_LeaveBalance : `CALL getLMSLeave(?)`,
    
    ProjectList : `SELECT projectId, projectName FROM operational_resource_project WHERE status = 1 ORDER BY displayOrder ASC`,
    
    ProjectProcessList : `SELECT TP.processId, TP.processName, TP.billType, TP.billable, TP.entryType, TP.minutes FROM timesheetprocess TP
    JOIN timesheetprocessproject TPP ON TPP.processId = TP.processId WHERE TP.status = 1 AND TPP.projectId = ? ORDER BY TP.displayOrder ASC`,
    
    ProcessList : `SELECT processId, processName, billType, billable, entryType, minutes FROM timesheetprocess WHERE status = 1 ORDER BY displayOrder ASC`,
}