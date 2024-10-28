const { Util, Connection, JsonUtil } = require('stashook-utils');
const Queries = require('../util/queries');
const Message = require('../util/message');
const TimesheetModel = require('../model/timesheet');

module.exports = {

    getTimesheetByDateRange: async (req, res, next) => {

        Connection.query(Queries.TimesheetByDateRange, createTimesheetSearchData(req), function (error, results) {
            if (error) res.json(Message.NO_DATA_FOUND);
            else {
                JsonUtil.mask(results, "timesheetId");
                JsonUtil.mask(results, "attendanceId");
                res.json(results);
            }
        });
    },

    updateTimesheet: async (req, res, next) => {

        Connection.query(Queries.UpdateTimesheet, updateTimesheetData(req), function (error, results) {

            if (error || results.affectedRows === 0)
                res.json(Message.TIMESHEET_UPDATE_FAILED);
            else
                res.json(Message.TIMESHEET_UPDATED_SUCCESSFULLY);
        });
    },

    approveTimesheet: async (req, res, next) => {

        let process = req.body.status === 'Approved';

        Connection.query(Queries.ApproveTimesheet, approveTimesheetData(req, false), function (error, tsResults) {

            if (error || tsResults.affectedRows === 0)
                res.json(process ? Message.TIMESHEET_APPROVE_FAILED : Message.TIMESHEET_REFERBACK_FAILED);
            else {
                if (tsResults.affectedRows > 0) {

                    Connection.query(Queries.ApproveAttendance, approveAttendanceData(req, false), function (error, attResults) {

                        if (error || attResults.affectedRows === 0)
                            res.json(Message.TIMESHEET_ATTENDANCE_APPROVE_FAILED); // On Success of Timesheet & But Failed Attendance 
                        else
                            res.json(process ? Message.TIMESHEET_APPROVED_SUCCESSFULLY: Message.TIMESHEET_REFERBACK_SUCCESSFULLY); // On Success of Both Timesheet & Attendance 
                    });
                }
            }
        });
    },

    approveLockedTimesheet: async (req, res, next) => {

        let process = req.body.status === 'Approved';

        Connection.query(Queries.SpecialApproveLockedTimesheet, approveTimesheetData(req, true), function (error, tsResults) {

            if (error || tsResults.affectedRows === 0)
                res.json(process ? Message.TIMESHEET_APPROVE_FAILED : Message.TIMESHEET_REFERBACK_FAILED);
            else {
                if (tsResults.affectedRows > 0) {

                    Connection.query(Queries.SpecialApproveLockedAttendance, approveAttendanceData(req, true), function (error, attResults) {

                        if (error || attResults.affectedRows === 0)
                            res.json(Message.TIMESHEET_ATTENDANCE_APPROVE_FAILED); // On Success of Timesheet & But Failed Attendance 
                        else
                            res.json(process ? Message.TIMESHEET_APPROVED_SUCCESSFULLY: Message.TIMESHEET_REFERBACK_SUCCESSFULLY); // On Success of Both Timesheet & Attendance 
                    });
                }
            }
        });
    },
}

function createTimesheetSearchData(req) {

    return [req.sessionUser.employeeId, Util.getDateRange(req.body.fromDate, req.body.toDate)];
}


function approveAttendanceData(req, isSpecial = false) {

    let special = isSpecial ? 'Special Approval : ' : '';

    let approvalData = [];
    approvalData.push(Util.getDate()); //ApprovedTime
    approvalData.push(req.body.status); //ApproveStatus
    approvalData.push(special + (req.body.comments ? req.body.comments : req.body.status)); //Approval Comments
    approvalData.push(req.sessionUser.employeeId);
    approvalData.push(JsonUtil.unmaskField(req.body.attendanceId));

    return approvalData;
}

function approveTimesheetData(req, isSpecial = false) {

    let special = isSpecial ? 'Special Approval : ' : '';

    let approvalData = [];
    approvalData.push(Util.getDate()); //ApprovedTime
    approvalData.push(req.body.status); //ApproveStatus
    approvalData.push(special + (req.body.comments ? req.body.comments : req.body.status)); //Approval Comments
    approvalData.push(req.sessionUser.employeeId);
    approvalData.push(JsonUtil.unmaskField(req.body.timesheetId));

    return approvalData;
}

function updateTimesheetData(req) {

    let updateData = [];
    updateData.push(req.body.hoursBillable);
    updateData.push(req.body.hoursNBNP);
    updateData.push(req.body.hoursNBP);
    updateData.push(Util.getDate());
    updateData.push(JsonUtil.unmaskField(req.body.timesheetId));

    return updateData;
}
