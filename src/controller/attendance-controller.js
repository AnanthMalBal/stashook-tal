const Util = require('stashook-utils');
const attendanceService = require('../service/attendance-service');
const Logger = require('../util/logger');

module.exports = {

    getMarkedTime: async (req, res, next) => {

        try {
           	

            attendanceService.getMarkedTime(req, res, next);
        }
        catch (excep) {
            Util.sendError500(req, res, excep);
        }
    },

    markAttendance: async (req, res, next) => {

        try {
            Logger.info('Testing Info Logger For markAttendance');
            console.log ("::req.userId:: " + req.userId);
            console.log ("::req.employeeId:: " + req.employeeId);
            console.log ("::req.producerId:: " + req.producerId);
            console.log ("::req.userType:: " + req.userType);
            console.log ("::req.isAdmin:: " + req.isAdmin);
            console.log ("::req.roles:: " + JSON.stringify(req.roles)); 	
            attendanceService.markAttendance(req, res, next);
        }
        catch (excep) {
            Logger.error(excep);
            Util.sendError500(req, res, excep);
        }
    }

}