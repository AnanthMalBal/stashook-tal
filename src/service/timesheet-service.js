const {Util, Connection, Helper, Model} = require('stashook-utils');
const Queries = require('../util/queries');
const Message = require('../util/message');
const TimesheetModel = require('../model/timesheet');

module.exports = {

    getTimesheet: async (req, res, next) => {

        res.json("Get Timesheet");  
    },
   
    updateTimesheet: async (req, res, next) => {

        res.json("Update Timesheet");
    },
}