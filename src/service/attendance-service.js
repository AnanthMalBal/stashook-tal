const { Util, Connection, JsonUtil, Logger } = require('stashook-utils');
const Queries = require('../util/queries');
const Message = require('../util/message');
const AttendanceModel = require('../model/attendance');
const TimesheetModel = require('../model/timesheet');


module.exports = {

    getMarkedAttendance: async (req, res, next) => {

        Logger.info("::Queries::GetMarkTime::: " + Queries.GetMarkTime);

        let attendanceDate = Util.getDate("YYYY-MM-DD 00:00:00");

        Connection.query(Queries.GetMarkTime, [req.sessionUser.employeeId, attendanceDate], function (error, results) {
            if (error || results === undefined || results.length === 0) { res.json({}); }
            else {
                JsonUtil.mask(results, 'employeeId');
                JsonUtil.mask(results, 'attendanceId');
                JsonUtil.dates(results, 'markedTime', 'DD-MMM-YYYY HH:mm:ss');
                JsonUtil.format(results, 'workingHours', workingHours); //Get Marked Hours By Symbol P4 as 4, P8 as 8, P12 as 12 

                res.json(results[0]);
            }
        });
    },

    markAttendance: async (req, res, next) => {

        Logger.info("::Queries::CheckMarkedTime::: " + Queries.CheckMarkedTime);
        let employeeId = req.body.employeeId;

        if (employeeId == null || employeeId == undefined)
            employeeId = req.sessionUser.employeeId;
        else
            employeeId = JsonUtil.unmaskField(employeeId);

        Logger.info("::Marking Attendance For The Employee Id ::: " + employeeId);

        Connection.query(Queries.CheckMarkedTime, [employeeId, Util.getDate('YYYY-MM-DD 00:00:00')], function (error, attResult) {

            Logger.info(":::CheckMarkedTime::Select::: " + JSON.stringify(attResult));

            if (attResult.length > 0) { // Default Flow // For Select Query use attResult.length 

                Connection.query(Queries.UpdateAttendanceSymbol, AttendanceModel.attendanceUpdateData(req, attResult), function (error, result) {

                    Logger.info(":::UpdateAttendanceSymbol::: " + JSON.stringify(result));

                    if (error || result.affectedRows === 0) // For Update Query use result.affectedRows 
                        res.json(Message.UNABLE_TO_MARK_ATTENDANCE);
                    else {
                        Logger.info(":::CheckTimeSheet::Select::: " + Queries.CheckTimeSheet);
                        Connection.query(Queries.CheckTimeSheet, [attResult[0].attendanceId], function (error, timeResult) {

                            // Logger.info(":::CheckTimeSheet::Select::: " + JSON.stringify(timeResult));

                            if (error || timeResult.length === 0)
                                createTimesheetEntry(attResult[0].attendanceId, res);
                            else
                                res.json(Message.ATTENDANCE_MARKED_SUCCESSFULLY);

                        });
                    }

                });
            }
            else {

                AttendanceModel.create(AttendanceModel.createData(req, employeeId), "attendanceId")
                    .then(result => {

                        // Logger.info("::Queries::Create::AttendanceModel::result: " + JSON.stringify(result));

                        createTimesheetEntry(result.insertId, res);

                    }).catch(error => {
                        // Logger.error("::Queries::Create::AttendanceModel::error: " + error);
                        res.json(Message.UNABLE_TO_MARK_ATTENDANCE);
                    });
            }
        });
    }
}

function workingHours(data) {
    if (data === undefined || data === null)
        return 0;
    else
        return data.replace('P', '');
}

function createTimesheetEntry(attendanceId, res) {
    TimesheetModel.create(TimesheetModel.createData(attendanceId), "timesheetId")
        .then(insResult => {
            if (insResult.affectedRows > 0) {
                // Logger.info("::Queries::Create::TimesheetModel:result:: " + JSON.stringify(insResult));
                res.json(Message.ATTENDANCE_MARKED_SUCCESSFULLY);
            }
        }).catch(error => {
            // Logger.error("::Queries::Create::TimesheetModel::error: " + error);
            res.json(Message.UNABLE_TO_MARK_ATTENDANCE);
        });
}
