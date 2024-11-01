const { Util, Connection, JsonUtil } = require('stashook-utils');
const LeaveModel = require('../model/leave');
const Queries = require('../util/queries');
const Message = require('../util/message');
const Logger = require('../util/logger');

module.exports = {

    SearchLeave: async (req, res, next) => {

        let sessionSearchData = [req.sessionUser.employeeId, req.body.fromDate, req.body.toDate];
        if (req.sessionUser.isAdmin) {

            Connection.query(Queries.GetReportingEmployeeList, [req.sessionUser.employeeId], function (error, result) {

                //Logger.info("::Queries::GetReportingEmployeeList::result: " + JSON.stringify(result));

                if (error) setSearchLeaveResult(req, res, sessionSearchData); // Default Search SessionUser

                if (result && result.length > 0) {
                    let employeeIds = [];
                    result.forEach(element => {
                        employeeIds.push(element.employeeId);
                    });
                    let searchData = [];
                    searchData.push(employeeIds);
                    searchData.push(req.body.employeeName ? Util.withPercent(req.body.employeeName) : '%%');
                    searchData.push(req.body.symbol ? Util.withPercent(req.body.symbol) : '%%');
                    searchData.push(req.body.status ? Util.withPercent(req.body.status) : '%%');
                    searchData.push(req.body.fromDate);
                    searchData.push(req.body.toDate);

                    setSearchLeaveResult(req, res, searchData);
                }
            });
        }
        else {
            setSearchLeaveResult(req, res, sessionSearchData); // Default Search SessionUser
        }
    },

    applyLeave: async (req, res, next) => {

        let employeeId = (req.body.employeeId) ? req.body.employeeId : req.sessionUser.employeeId; //By Default Session User

        Connection.query(Queries.SearchLeaveWithInRange, createSearchRangeData(req, employeeId), function (error, outResults) {
            Logger.info("::Queries::SearchLeaveWithInRange::outResults: " + JSON.stringify(outResults));

            if (outResults.length === 0) {

                let lvDetect = parseFloat(LeaveModel.getNoOfLeaveDays(req)) * -1;

                Connection.query(Queries.UpdateUserLeaveBalance, [lvDetect, employeeId], function (error, userResults) {
                    
                    Logger.info("::Queries::UpdateUserLeaveBalance::userResults: " +  JSON.stringify(userResults)) ;

                    if (error || userResults.affectedRows === 0) res.json(Message.UNABLE_TO_UPDATE_LEAVE_BALANCE);

                    if (userResults.affectedRows > 0) {

                        LeaveModel.create(LeaveModel.createData(req), "leaveId")
                            .then(result => {

                                Logger.info("::Queries::Create::LeaveModel::result: " + JSON.stringify(result));

                                if (result && result.affectedRows > 0)
                                    res.json(Message.LEAVE_APPLIED_SUCCESSFULLY);
                                else
                                    res.json(Message.UNABLE_TO_APPLY_LEAVE);

                            }).catch(error => {
                                Logger.error("::Queries::Create::LeaveModel::error: " + error);
                                res.json(Message.UNABLE_TO_APPLY_LEAVE);
                            });

                    }
                });
            }
            else {
                res.json(Message.LEAVE_ALREADY_APPLIED);
            }
        });
    },

    cancelLeave: async (req, res, next) => { //softDelete

        let leaveId = JsonUtil.unmaskField(req.body.leaveId);

        Connection.query(Queries.GetLeaveById, [leaveId], function (error, lvResults) {

            Logger.info("::Queries::SearchLeaveById::: " + JSON.stringify(lvResults));

            if (error || lvResults.length === 0) res.json(Message.UNABLE_TO_CANCEL_LEAVE);

            if (lvResults.length > 0) {

                const lvBalance = parseFloat(lvResults[0].noOfDays) - parseFloat(lvResults[0].detectedLeave);

                Connection.query(Queries.UpdateCancelLeave, createCancelLeaveData(req, lvResults), function (error, cancelResults) {

                    if (error || cancelResults.affectedRows === 0) res.json(Message.UNABLE_TO_CANCEL_LEAVE);

                    if (cancelResults.affectedRows > 0) {
                        Connection.query(Queries.UpdateUserLeaveBalance, [lvBalance, lvResults[0].employeeId], function (error, userResults) {
                            if (error || userResults.affectedRows === 0) res.json(Message.UNABLE_TO_UPDATE_LEAVE_BALANCE);

                            if (userResults.affectedRows > 0)
                                res.json(Message.LEAVE_CANCELLED_SUCCESSFULLY);

                        });
                    }

                });
            }

        });
    },


    getLeaveColorList: async (req, res, next) => {

        Connection.query(Queries.GetLMSColorList, function (error, result) {
            if (error) res.json({});
            Logger.info("::Queries::GetLMSColorList::: " + JSON.stringify(result));
            res.json(result);
        });
    },

    getLeaveTypeList: async (req, res, next) => {

        Connection.query(Queries.GetLeaveTypeList, function (error, results) {
            if (error || results.length === 0) res.json({});
            Logger.info("::Queries::GetLeaveTypeList::: " + JSON.stringify(results));
            res.json(results);
        });
    },

    getLeaveHolidayColor: async (req, res, next) => {

        Connection.query(Queries.SP_HolidayColor, [req.body.cDate, req.body.employeeId], function (error, results) {
            if (error || results.length === 0) res.json(Message.HOLIDAY_INVALID_DATE);
            Logger.info("::Queries::getLeaveHolidayColor::: " + JSON.stringify(results));
            res.json(results);
        });
    },

    getLeaveBalance: async (req, res, next) => {

        Connection.query(Queries.SP_LeaveBalance, [req.body.employeeId], function (error, results) {
            if (error || results.length === 0) res.json(Message.HOLIDAY_INVALID_DATE);
            Logger.info("::Queries::getLeaveBalance::: " + JSON.stringify(results));
            res.json(results);
        });
    }
}

const setSearchLeaveResult = (req, res, searchData) => {
    let LEAVE_QUERY = (req.sessionUser.isAdmin) ? Queries.SearchUserLeaveByAdmin : Queries.SearchUserLeave

    Connection.query(LeaveModel.SearchWithLimit(req, LEAVE_QUERY), searchData, function (error, results) {

        if (error || results === undefined || results.length === 0) { 
            Logger.error("LeaveModel is Error :: " + error);
            Logger.error("LeaveModel is Results Undefined :: " + (results === undefined));
            LeaveModel.searchResults(req, res, []);
        }
        else {
            //JsonUtil.ignore(results, ["createdBy","createdDate", "employeeId"]);
            //JsonUtil.empty(results);
            JsonUtil.mask(results, "leaveId");
            LeaveModel.searchResults(req, res, results);
        }
    });
}


function createCancelLeaveData(req, lvResults) {
    
    const status = lvResults[0].detectedLeave === 0 ? 'Cancel' : 'Partially_Cancel';

    let cancelData = [];
    let leaveDates = LeaveModel.getLeaveDatesOnCancel(lvResults);

    cancelData.push(status);
    cancelData.push(req.body.comments);
    cancelData.push('{' +  leaveDates + '}');
    cancelData.push(leaveDates[leaveDates.length-1]);
    cancelData.push(req.sessionUser.employeeId);
    cancelData.push(Util.getDate());
    cancelData.push(JsonUtil.unmaskField(req.body.leaveId));

    Logger.info(":::Masked Leave Id:: " + req.body.leaveId + " Queries::cancelData::: " + JSON.stringify(cancelData));

    return cancelData;
}

function createSearchRangeData(req, employeeId) {

    let searchData = [];
    searchData.push(employeeId);
    searchData.push(req.body.fromDate);
    searchData.push(req.body.toDate);
    searchData.push(Util.withPercent(req.body.fromDate));
    searchData.push(Util.withPercent(req.body.toDate));
    return searchData;
}

