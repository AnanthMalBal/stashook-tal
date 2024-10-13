const {Util} = require('stashook-utils');
const leaveService = require('../service/leave-service');

module.exports = {
    searchLeave: async (req, res, next) => {

        try {
            leaveService.SearchLeave(req, res, next);
        }
        catch (excep) {
            Util.sendError500(req, res, excep);
        }
    },
    applyLeave: async (req, res, next) => {

        try {
            leaveService.applyLeave(req, res, next);
        }
        catch (excep) {
            Util.sendError500(req, res, excep);
        }
    },
    cancelLeave: async (req, res, next) => {

        try {
            leaveService.cancelLeave(req, res, next);
        }
        catch (excep) {
            Util.sendError500(req, res, excep);
        }
    },
    
    getLeaveTypeList: async (req, res, next) => {

        try {
            leaveService.getLeaveTypeList(req, res, next);
        }
        catch (excep) {
            Util.sendError500(req, res, excep);
        }
    },

    getLeaveColorList: async (req, res, next) => {

        try {
            leaveService.getLeaveColorList(req, res, next);
        }
        catch (excep) {
            Util.sendError500(req, res, excep);
        }
    },

    getLeaveBalance: async (req, res, next) => {

        try {
            leaveService.getLeaveBalance(req, res, next);
        }
        catch (excep) {
            Util.sendError500(req, res, excep);
        }
    },
}