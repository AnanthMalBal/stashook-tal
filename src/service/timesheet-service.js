const { Util, Connection, JsonUtil } = require('stashook-utils');
const Queries = require('../util/queries');
const Message = require('../util/message');
const TimesheetModel = require('../model/timesheet');

module.exports = {

    getTimesheetByDateRange: async (req, res, next) => {

        Connection.query(Queries.GetTimesheetByDateRange, TimesheetModel.getTimesheetData(req), function (error, results) {
            if (error || results === undefined|| results === 0) res.json(Message.NO_DATA_FOUND);
            else {
                JsonUtil.mask(results, "timesheetId");
                JsonUtil.mask(results, "attendanceId");
                res.json(results);
            }
        });
    },

    updateTimesheet: async (req, res, next) => {

        Connection.query(Queries.UpdateTimesheet, TimesheetModel.updateTimesheetData(req), function (error, results) {

            if (error || results.affectedRows === 0)
                res.json(Message.TIMESHEET_UPDATE_FAILED);
            else
                res.json(Message.TIMESHEET_UPDATED_SUCCESSFULLY);
        });
    },

    approveTimesheet: async (req, res, next) => {

        let process = req.body.status === 'Approved';

        Connection.query(Queries.ApproveTimesheet, TimesheetModel.approveTimesheetData(req, false), function (error, tsResults) {

            if (error || tsResults.affectedRows === 0)
                res.json(process ? Message.TIMESHEET_APPROVE_FAILED : Message.TIMESHEET_REFERBACK_FAILED);
            else {
                if (tsResults.affectedRows > 0) {

                    Connection.query(Queries.ApproveAttendance, TimesheetModel.approveAttendanceData(req, false), function (error, attResults) {

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

        Connection.query(Queries.SpecialApproveLockedTimesheet, TimesheetModel.approveTimesheetData(req, true), function (error, tsResults) {

            if (error || tsResults.affectedRows === 0)
                res.json(process ? Message.TIMESHEET_APPROVE_FAILED : Message.TIMESHEET_REFERBACK_FAILED);
            else {
                if (tsResults.affectedRows > 0) {

                    Connection.query(Queries.SpecialApproveLockedAttendance, TimesheetModel.approveAttendanceData(req, true), function (error, attResults) {

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

