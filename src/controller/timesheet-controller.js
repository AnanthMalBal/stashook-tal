const {Util} = require('stashook-utils');
const timesheetService = require('../service/timesheet-service');

module.exports = {
    
    getTimesheetByDateRange: async (req, res, next) => {

        try {
            timesheetService.getTimesheetByDateRange(req, res, next);
        }
        catch (excep) {
            Util.sendError500(req, res, excep);
        }
    },

    updateTimesheet: async (req, res, next) => {

        try {
            timesheetService.updateTimesheet(req, res, next);
        }
        catch (excep) {
            Util.sendError500(req, res, excep);
        }
    },

    approveTimesheet: async (req, res, next) => {

        try {
            timesheetService.approveTimesheet(req, res, next);
        }
        catch (excep) {
            Util.sendError500(req, res, excep);
        }
    },
    approveLockedTimesheet: async (req, res, next) => {

        try {
            timesheetService.approveLockedTimesheet(req, res, next);
        }
        catch (excep) {
            Util.sendError500(req, res, excep);
        }
    },

}