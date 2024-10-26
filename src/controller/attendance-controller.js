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
                        
            attendanceService.markAttendance(req, res, next);
        }
        catch (excep) {
            Logger.error(excep);
            Util.sendError500(req, res, excep);
        }
    }

}