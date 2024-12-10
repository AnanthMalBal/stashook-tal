const { JsonUtil, Connection } = require('stashook-utils');
const Logger = require('../util/logger');
const Queries = require('../util/queries');
const Message = require('../util/message');
const UsersDailyLogModel = require('../model/usersdailylog');
const moment = require('moment');

module.exports = {
    addUserDailyLog: async (req, res, next) => {

        Connection.query(Queries.CheckUsersDailyLog, [JsonUtil.unmaskField(req.body.timesheetId), req.body.processId], function (error, result) {

            Logger.info(":::CheckUsersDailyLog::: " + JSON.stringify(result));

            if (error || result.length === 0) { // For Select Query use result.length 
                UsersDailyLogModel.create(UsersDailyLogModel.createData(req))
                    .then(result => {
                        Logger.info("::Queries::Create::UsersDailyLogModel::result: " + JSON.stringify(result));
                        if (result.affectedRows > 0)
                            res.json(Message.DAILY_LOG_ADDED_SUCCESSFULLY);
                        else
                            res.json(Message.DAILY_LOG_ADDING_FAILED);
                    }).catch(error => {
                        Logger.error("::Queries::Create::UsersDailyLogModel::error: " + error);
                        res.json(Message.DAILY_LOG_ADDING_FAILED);
                    });
            }
            else {
                Logger.error("::Queries::Create::UsersDailyLogModel::error: Already Exists ");
                res.json(Message.DAILY_LOG_ALREADY_EXISTS);
            }
        });
    },

    getUserDailyLog: async (req, res, next) => {

        Connection.query(Queries.GetUsersDailyLog, [JsonUtil.unmaskField(req.body.timesheetId)], function (error, result) {

            Logger.info(":::GetUsersDailyLog::: " + JSON.stringify(result));

            if (error || result === undefined) res.json({});
            else 
            {
                JsonUtil.mask(result, "autoId");
                res.json(result);
            }
        });
    },

    getAssignedUserDailyLog: async (req, res, next) => {

        Connection.query(Queries.GetAssignedTasks, [req.sessionUser.employeeId], function (error, result) {

            Logger.info(":::GetAssignedUserDailyLog:::GetAssignedTasks::: " + JSON.stringify(result));

            if (error || result === undefined || result.length === 0) res.json([]);
            else {
                let searchDate = new Date();
                let startDay;
                let startDate;
                let endDate;

                if (searchDate.getDay() > 1 && searchDate.getDay() < 6) {
                    startDay = searchDate.getDay() - 1;
                }
                else{
                    startDay = 7;
                }

                startDate = moment(searchDate).subtract(startDay, 'day').format('YYYY-MM-DD');
                endDate = moment(startDate).add(6, 'day').format('YYYY-MM-DD');

                let processInfo = JSON.parse(result[0].processInfo);

                Connection.query(Queries.GetAssignedUsersDailyLog, [ req.sessionUser.employeeId, startDate, endDate], function (error, udlResult) {

                    Logger.info(":::GetAssignedUsersDailyLog::udlResult: " + JSON.stringify(udlResult));

                    if (error || udlResult === undefined) res.json({});
                    else 
                    {
                        JsonUtil.mask(udlResult, "autoId");
                        res.json(udlResult);
                    }
                });

            }

        });


    },


    deleteUserDailyLog: async (req, res, next) => {

        Connection.query(Queries.DeleteUserDailyLog, [JsonUtil.unmaskField(req.body.autoId)], function (error, result) {

            Logger.info(":::DeleteUserDailyLog::: " + JSON.stringify(result));

            if (error || result.affectedRows === 0) res.json(Message.DAILY_LOG_UNABLE_TO_DELETE_ENTRY);
            else {

                if (result.affectedRows > 0) {
                    Logger.info("::Queries::DeleteUserDailyLog:::Deleted Successfully");
                    res.json(Message.DAILY_LOG_DELETED_SUCCESSFULLY);
                }
            }
        });
    }
}