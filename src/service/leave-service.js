const {Util, Connection, Helper, Model} = require('../../node_modules/stashook-utils');
const Queries = require('../util/queries');
const Message = require('../util/message');
const LeaveModel = require('../model/leave');

module.exports = {
    applyLeave: async (req, res, next) => {

        res.json("Apply Leave");
    },
    updateLeave: async (req, res, next) => {

        res.json("Update Leave");
    },
    cancelLeave: async (req, res, next) => { //softDelete

        res.json("Cancel Leave");
    },
    searchLeave: async (req, res, next) => {

        res.json("Search Leave");  
    },

    getLeave: async (req, res, next) => {

        res.json("Get Leave");  
    }
}