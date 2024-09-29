const {Util} = require('stashook-utils');
const Message = require('../util/message');
const holidayService = require('../service/holiday-service');

module.exports = {
    addHoliday: async (req, res, next) => {

        try {
            holidayService.addHoliday(req, res, next);
        }
        catch (excep) {
            Util.sendError500(req, res, excep);
        }
    },
    updateHoliday: async (req, res, next) => {

        try {
            holidayService.updateHoliday(req, res, next);
        }
        catch (excep) {
            Util.sendError500(req, res, excep);
        }
    },
    blockHoliday: async (req, res, next) => { //softDelete

        try {
            holidayService.blockHoliday(req, res, next);
        }
        catch (excep) {
            Util.sendError500(req, res, excep);
        }
    },
    deleteHoliday: async (req, res, next) => { //hardDelete

        try {
            holidayService.deleteHoliday(req, res, next);
        }
        catch (excep) {
            Util.sendError500(req, res, excep);
        }
    },
    searchHoliday: async (req, res, next) => {

        try {
            holidayService.searchHoliday(req, res, next);
        }
        catch (excep) {
            Util.sendError500(req, res, excep);
        }
    },
    getHoliday: async (req, res, next) => {

        try {
            holidayService.getHoliday(req, res, next);
        }
        catch (excep) {
            Util.sendError500(req, res, excep);
        }
    },
    getHolidayList: async (req, res, next) => {

        try {
            holidayService.getHolidayList(req, res, next);
        }
        catch (excep) {
            Util.sendError500(req, res, excep);
        }
    }

}