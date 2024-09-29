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

        return new Promise(function (myResolve, myReject) {

            let isUpdated = false;
            Connection.query(Queries.CheckMarkedTime, [req.body.employeeId, Util.getDate('YYYY-MM-DD')], function (error, markResult) {
                
                console.log("::Queries::CheckMarkedTime::: " + JSON.stringify(markResult));

                if (markResult.length > 0) {
                
                    Connection.query(Queries.UpdateAttendanceSymbol, [req.body.symbol, markResult[0].attendanceId], function (error, result) {
                
                        console.log("::Queries::UpdateAttendanceSymbol::: " + JSON.stringify(result));
                
                        if (result.affectedRows > 0) {
                            isUpdated = true;
                            myResolve(Message.ATTENDANCE_MARKED_SUCCESSFULLY);
                        }
                    });
                }
            });

            if (!isUpdated) {
                
                let result = AttendanceModel.create(AttendanceModel.createData(req));
                
                console.log("::Queries::Create::AttendanceModel::: " + JSON.stringify(result));

                if (result.affectedRows > 0) {
                    
                    result = TimesheetModel.create(TimesheetModel.createData(result.insertId));
                    
                    console.log("::Queries::Create::TimesheetModel::: " + JSON.stringify(result));
                    
                    myResolve(Message.ATTENDANCE_MARKED_SUCCESSFULLY);
                }
            }
            else {
                myResolve(Message.UNABLE_TO_MARK_ATTENDANCE);
            }
        });
    },


}