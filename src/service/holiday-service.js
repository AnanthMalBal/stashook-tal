const {Util, Connection, Helper, Model} = require('../../node_modules/stashook-utils');
const Queries = require('../util/queries');
const Message = require('../util/message');
const HolidayModel = require('../model/HolidayCalendar');

module.exports = {
    addHoliday: async (req, res, next) => {

        res.json("Add Holiday");
    },
    updateHoliday: async (req, res, next) => {

        res.json("Update Holiday");
    },
    blockHoliday: async (req, res, next) => { //softDelete

        res.json("Block Holiday");
    },
    searchHoliday: async (req, res, next) => {

        res.json("Search Holiday");  
    },

    getHoliday: async (req, res, next) => {

        res.json("Get Holiday");  
    },
    
}