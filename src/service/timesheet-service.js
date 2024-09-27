const {Util, Connection, Helper, Model} = require('stashook-utils');
const Queries = require('../util/queries');
const Message = require('../util/message');
const TimesheetModel = require('../model/Timesheet');

module.exports = {
    addTimesheet: async (req, res, next) => {

        res.json("Add Timesheet");
    },
    updateTimesheet: async (req, res, next) => {

        res.json("Update Timesheet");
    },
    blockTimesheet: async (req, res, next) => { //softDelete

        res.json("Delete Timesheet");
    },
    searchTimesheet: async (req, res, next) => {

        res.json("Search Timesheet");  
    },

    getTimesheet: async (req, res, next) => {

        res.json("Get Timesheet");  
    }
}