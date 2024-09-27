const {Util} = require('stashook-utils');
const Message = require('../util/message');
const leaveService = require('../service/leave-service');

module.exports = {
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
    blockLeave: async (req, res, next) => { //softDelete

        try {
            leaveService.blockLeave(req, res, next);
        }
        catch (excep) {
            Util.sendError500(req, res, excep);
        }
    },
    deleteLeave: async (req, res, next) => { //hardDelete

        try {
            leaveService.deleteLeave(req, res, next);
        }
        catch (excep) {
            Util.sendError500(req, res, excep);
        }
    },
    searchLeave: async (req, res, next) => {

        try {
            leaveService.searchLeave(req, res, next);
        }
        catch (excep) {
            Util.sendError500(req, res, excep);
        }
    },
    getLeave: async (req, res, next) => {

        try {
            leaveService.getLeave(req, res, next);
        }
        catch (excep) {
            Util.sendError500(req, res, excep);
        }
    },

}