const {Util} = require('stashook-utils');
const usersDailyLogService = require('../service/userdailylog-service');

module.exports = {
    

    addUserDailyLog: async (req, res, next) => {

        try {
            usersDailyLogService.addUserDailyLog(req, res, next);
        }
        catch (excep) {
            Util.sendError500(req, res, excep);
        }
    },

    getUserDailyLog: async (req, res, next) => {

        try {
            usersDailyLogService.getUserDailyLog(req, res, next);
        }
        catch (excep) {
            Util.sendError500(req, res, excep);
        }
    },

    getAssignedUserDailyLog: async (req, res, next) => {

        try {
            usersDailyLogService.getAssignedUserDailyLog(req, res, next);
        }
        catch (excep) {
            Util.sendError500(req, res, excep);
        }
    },

    deleteUserDailyLog: async (req, res, next) => {

        try {
            usersDailyLogService.deleteUserDailyLog(req, res, next);
        }
        catch (excep) {
            Util.sendError500(req, res, excep);
        }
    }

}