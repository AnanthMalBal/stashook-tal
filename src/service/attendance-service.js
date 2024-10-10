const { Util, Connection, Helper, Model } = require('stashook-utils');
const Queries = require('../util/queries');
const Message = require('../util/message');
const AttendanceModel = require('../model/attendance');
const TimesheetModel = require('../model/timesheet');

module.exports = {

    getMarkedTime: async (req, res, next) => {

        Connection.query(Queries.MarkTime, [req.body.employeeId, req.body.attendancDate], function (error, results) {
            if (error) res.json(Message.NO_DATA_FOUND);
            else
                res.json(results)
        });
    },

    markAttendance: async (req, res, next) => {

        //console.log("::Queries::CheckMarkedTime::: " + Queries.CheckMarkedTime);
        Connection.query(Queries.CheckMarkedTime, [req.body.employeeId, Util.getDate('YYYY-MM-DD 00:00:00')], function (error, attResult) {

            //console.log("::Queries::CheckMarkedTime::Result::: " + JSON.stringify(attResult));

            if (attResult.length > 0) { // Default Flow

                Connection.query(Queries.UpdateAttendanceSymbol, [req.body.symbol, Util.getDate(), attResult[0].attendanceId], function (error, result) {

                    //console.log("::Queries::UpdateAttendanceSymbol::: " + JSON.stringify(result));

                    if (error || result.affectedRows === 0)
                        res.json(Message.UNABLE_TO_MARK_ATTENDANCE);
                    else
                    {
                        console.log("::Queries::CheckTimeSheet::: " + Queries.CheckTimeSheet);
                        Connection.query(Queries.CheckTimeSheet, [attResult[0].attendanceId], function (error, timeResult) {
                            
                            console.log("::Queries::timeResult::: " + JSON.stringify(timeResult));

                            if (error || timeResult.length === 0)
                            {
                                createTimesheetEntry(attResult[0].attendanceId, res);
                            }   
                            else
                            {
                                res.json(Message.ATTENDANCE_MARKED_SUCCESSFULLY);
                            }

                        });
                    }   

                });
            }
            else {

                AttendanceModel.create(AttendanceModel.createData(req), "attendanceId")
                    .then(result => {
                        
                        console.log("::Queries::Create::AttendanceModel:result>>>>>>>>>>>>>>> " + JSON.stringify(result));

                        createTimesheetEntry(result.insertId, res);

                    }).catch(error => {
                        console.log("::Queries::Create::AttendanceModel::error: " + error);
                        res.json(Message.UNABLE_TO_MARK_ATTENDANCE);
                    });
            }
        });
    }
}

async function createTimesheetEntry(attendanceId, res) {
    TimesheetModel.create(TimesheetModel.createData(attendanceId), "timesheetId")
        .then(insResult => {
            if (insResult.affectedRows > 0) {
                console.log("::Queries::Create::TimesheetModel:result:: " + JSON.stringify(insResult));
                res.json(Message.ATTENDANCE_MARKED_SUCCESSFULLY);
            }
        }).catch(error => {
            console.log("::Queries::Create::TimesheetModel::error: " + error);
            res.json(Message.UNABLE_TO_MARK_ATTENDANCE);
        });
}
