const {Util} = require('../../node_modules/stashook-utils');
const Message = require('../util/message');
const timesheetService = require('../service/timesheet-service');

module.exports = {
    addTimesheet: async (req, res, next) => {

        try {
            timesheetService.addTimesheet(req, res, next);
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
    blockTimesheet: async (req, res, next) => { //softDelete

        try {
            timesheetService.blockTimesheet(req, res, next);
        }
        catch (excep) {
            Util.sendError500(req, res, excep);
        }
    },
    deleteTimesheet: async (req, res, next) => { //hardDelete

        try {
            timesheetService.deleteTimesheet(req, res, next);
        }
        catch (excep) {
            Util.sendError500(req, res, excep);
        }
    },
    searchTimesheet: async (req, res, next) => {

        try {
            timesheetService.searchTimesheet(req, res, next);
        }
        catch (excep) {
            Util.sendError500(req, res, excep);
        }
    },
    getTimesheet: async (req, res, next) => {

        try {
            timesheetService.getTimesheet(req, res, next);
        }
        catch (excep) {
            Util.sendError500(req, res, excep);
        }
    }

}