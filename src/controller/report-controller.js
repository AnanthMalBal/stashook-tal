const {Util} = require('stashook-utils');
const reportService = require('../service/report-service');
const userService = require('../service/user-service');

module.exports = {
    leaveReport: async (req, res, next) => {

        try {
            reportService.LeaveReport(req, res, next);
        }
        catch (excep) {
            Util.sendError500(req, res, excep);
        }
    },
    dailyLogReport: async (req, res, next) => {

        try {
            reportService.DailyLogReport(req, res, next);
        }
        catch (excep) {
            Util.sendError500(req, res, excep);
        }
    },
}