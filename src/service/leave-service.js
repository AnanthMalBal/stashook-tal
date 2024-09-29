const { Util, Connection, Helper, Model } = require('stashook-utils');
const Queries = require('../util/queries');
const Message = require('../util/message');
const LeaveModel = require('../model/leave');

module.exports = {
    applyLeave: async (req, res, next) => {

        let results = LeaveModel.create(LeaveModel.createData(req));
        if(results)
            res.json(Message.LEAVE_APPLIED_SUCCESSFULLY);
        else
            res.json(Message.UNABLE_TO_APPLY_LEAVE);

    },

    cancelLeave: async (req, res, next) => { //softDelete

        Connection.query(Queries.CancelLeave, [req.body.comments, req.body.employeeId, Util.getDate(), req.body.leaveId], function (error, results) {
            if (error || results.affectedRows === 0) res.json(Message.UNABLE_TO_CANCEL_LEAVE);

            if (results.affectedRows > 0) res.json(Message.LEAVE_CANCELLED_SUCCESSFULLY);

        });
    },
    
    searchUserLeaveList: async (req, res, next) => {

        const employeeId = (req.isApprover) ? '%%' : Util.withPercent(req.body.employeeId);

        Connection.query(Queries.SearchUserLeaveList, [employeeId, req.body.fromDate, req.body.toDate], function (error, results) {
            if (error || results.length === 0) res.json(Message.NO_DATA_FOUND);

            if (results.length > 0) res.json(results);

        });
    },

    getLeaveColorList: async (req, res, next) => {

        Connection.query(Queries.LMSColorList, function (error, result) {
            if (error) res.json({});
            console.log("::Queries::LMSColorList::: " + JSON.stringify(result));
            res.json(result);
        });
    },

    getLeaveTypeList: async (req, res, next) => {

        Connection.query(Queries.LeaveTypeList, function (error, result) {
            if (error) res.json({});
            console.log("::Queries::LeaveTypeList::: " + JSON.stringify(result));
            res.json(result);
        });
    },

    getLeaveHolidayColor: async (req, res, next) => {

        Connection.query(Queries.SP_HolidayColor, [req.body.cDate, req.body.employeeId], function (error, result) {
            if (error) res.json(Message.HOLIDAY_INVALID_DATE);
            console.log("::Queries::getLeaveHolidayColor::: " + JSON.stringify(result));
            res.json(result);
        });
    },

    getLeaveBalance: async (req, res, next) => {

        Connection.query(Queries.SP_LeaveBalance, [req.body.employeeId], function (error, result) {
            if (error) res.json(Message.HOLIDAY_INVALID_DATE);
            console.log("::Queries::getLeaveBalance::: " + JSON.stringify(result));
            res.json(result);
        });
    }


}