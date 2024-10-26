const {Util, Connection, JsonUtil} = require('stashook-utils');
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

        res.json("Update Timesheet");
    },
}

function createTimesheetSearchData(req) {

    return [req.sessionUser.employeeId, Util.getDateRange(req.body.fromDate, req.body.toDate)];
}
