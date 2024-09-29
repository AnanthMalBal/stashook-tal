const {Util} = require('../../node_modules/stashook-utils');
const Message = require('../util/message');
const timesheetService = require('../service/timesheet-service');
const projectService = require('../service/project-service');
const usersDailyLogService = require('../service/userdailylog-service');

module.exports = {
    
    getProjectList: async (req, res, next) => {

        try {
            projectService.getProjectList(req, res, next);
        }
        catch (excep) {
            Util.sendError500(req, res, excep);
        }
    },
    
    getProcessList: async (req, res, next) => {

        try {
            projectService.getProcessList(req, res, next);
        }
        catch (excep) {
            Util.sendError500(req, res, excep);
        }
    },

    addUserDailyLog: async (req, res, next) => {

        try {
            usersDailyLogService.addUserDailyLog(req, res, next);
        }
        catch (excep) {
            Util.sendError500(req, res, excep);
        }
    }

}