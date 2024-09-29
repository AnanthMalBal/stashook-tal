const {Util} = require('stashook-utils');
const Message = require('../util/message');
const attendanceService = require('../service/attendance-service');

module.exports = {
   
    getMarkedTime: async (req, res, next) => {

        try {
            attendanceService.getMarkedTime(req, res, next)
        }
        catch (excep) {
            Util.sendError500(req, res, excep);
        }
    },

    markAttendance: async (req, res, next) => {

        try {
            res.json(attendanceService.markAttendance(req, res, next));
        }
        catch (excep) {
            Util.sendError500(req, res, excep);
        }
    }

}