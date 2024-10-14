const { Connection } = require('stashook-utils');
const Logger = require('../util/logger');
const Queries = require('../util/queries');
const Message = require('../util/message');
const UsersDailyLogModel = require('../model/usersdailylog');

module.exports = {
    addUserDailyLog: async (req, res, next) => {

        Connection.query(Queries.CheckUsersDailyLog, [req.body.timesheetId, req.body.processId], function (error, result) {

            Logger.info(":::SelectUsersDailyLog::: " + JSON.stringify(result));

            if (error || result.length === 0) {
                UsersDailyLogModel.create(UsersDailyLogModel.createData(req), "autoId")
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
            else
            {
                Logger.error("::Queries::Create::UsersDailyLogModel::error: Already Exists ");
                res.json(Message.DAILY_LOG_ALREADY_EXISTS);
            }
        });
    }
}