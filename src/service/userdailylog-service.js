const {Util, Connection, Helper, Model} = require('stashook-utils');
const Queries = require('../util/queries');
const Message = require('../util/message');
const UsersDailyLogModel = require('../model/usersdailylog');

module.exports = {
    addUserDailyLog: async (req, res, next) => {
        let results = UsersDailyLogModel.create(UsersDailyLogModel.createData(req));
        if(results)
            res.json(Message.DAILY_LOG_ADDED_SUCCESSFULLY);
        else
            res.json(Message.DAILY_LOG_ADDING_FAILED);
    },
    
}