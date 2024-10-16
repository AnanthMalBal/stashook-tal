const { Util, Connection, JsonUtil } = require('stashook-utils');
const LeaveModel = require('../model/leave');
const Queries = require('../util/queries');
const Message = require('../util/message');
const Logger = require('../util/logger');

module.exports = {
    
    SearchLeave: async (req, res, next) => {

        const employeeId = (req.isApprover) ? '%%' : Util.withPercent(req.body.employeeId);

        Connection.query(Queries.SearchUserLeave, [employeeId, req.body.fromDate, req.body.toDate], function (error, results) {
            if (error || results.length === 0) res.json(Message.NO_DATA_FOUND);

            if (results.length > 0) 
                {
                    //JsonUtil.ignore(results, ["createdBy","createdDate", "employeeId"]);
                    //JsonUtil.empty(results);
                    JsonUtil.mask(results, "leaveId");
                    console.log(":::::unmaskField:::::" + JsonUtil.unmaskField(results[0]["leaveId"]));
                    res.json(results);
                }
        });
    },

    applyLeave: async (req, res, next) => {

        Connection.query(Queries.SearchLeaveWithInRange, [req.body.employeeId, req.body.fromDate, req.body.toDate], function (error, inResults) {

            if (inResults.length === 0) {
                Connection.query(Queries.SearchLeaveWithOutRange, [req.body.employeeId, req.body.fromDate, req.body.toDate], function (error, outResults) {

                    if (outResults.length === 0) {
                        LeaveModel.create(LeaveModel.createData(req), "leaveId")
                            .then(result => {
                                Logger.info("::Queries::Create::LeaveModel::result: " + JSON.stringify(result));
                                if (result.affectedRows > 0)
                                    res.json(Message.LEAVE_APPLIED_SUCCESSFULLY);
                                else
                                    res.json(Message.UNABLE_TO_APPLY_LEAVE);
                            }).catch(error => {
                                Logger.error("::Queries::Create::LeaveModel::error: " + error);
                                res.json(Message.UNABLE_TO_APPLY_LEAVE);
                            });
                    }
                    else {
                        res.json(Message.LEAVE_ALREADY_APPLIED);
                    }
                });
            }
            else {
                res.json(Message.LEAVE_ALREADY_APPLIED);
            }
        });
    },

    cancelLeave: async (req, res, next) => { //softDelete

        Connection.query(Queries.CancelLeave, [req.body.comments, req.body.employeeId, Util.getDate(), req.body.leaveId], function (error, results) {
            if (error || results.affectedRows === 0) res.json(Message.UNABLE_TO_CANCEL_LEAVE);

            if (results.affectedRows > 0) res.json(Message.LEAVE_CANCELLED_SUCCESSFULLY);

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
