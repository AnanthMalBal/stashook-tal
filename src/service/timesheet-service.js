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

        Connection.query(Queries.ApproveTimesheet, approveTimesheetData(req), function (error, results) {

            if (error || results.affectedRows === 0)
                res.json(process ? Message.TIMESHEET_APPROVE_FAILED :  Message.TIMESHEET_REFERBACK_FAILED);
            else
                res.json(process ? Message.TIMESHEET_APPROVED_SUCCESSFULLY :  Message.TIMESHEET_REFERBACK_SUCCESSFULLY);
        });
    },
}

function createTimesheetSearchData(req) {

    return [req.sessionUser.employeeId, Util.getDateRange(req.body.fromDate, req.body.toDate)];
}

function approveTimesheetData(req) {

    let approvalData = [];
    approvalData.push(Util.getDate());
    approvalData.push(req.body.status);
    approvalData.push(req.body.comments ? req.body.comments : req.body.status );
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
