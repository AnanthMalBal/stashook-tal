const {Util,Logger} = require('stashook-utils');
const attendanceService = require('../service/attendance-service');

module.exports = {

    getMarkedAttendance: async (req, res, next) => {

        try {
            attendanceService.getMarkedAttendance(req, res, next);
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
            Util.sendError500(req, res, excep);
        }
    }

}