const { Util, Connection, JsonUtil, Logger } = require('stashook-utils');
const LeaveModel = require('../model/leave');
const Queries = require('../util/queries');
const Message = require('../util/message');
const moment = require('moment');

module.exports = {

    LeaveReport: async (req, res, next) => {

        let sessionSearchData = [req.sessionUser.employeeId, req.body.empId];



            Connection.query(Queries.SP_LeaveReport, [req.sessionUser.employeeId, req.body.empType,req.body.fromDate,req.body.toDate], function (error, result) {

                Logger.info("::Queries::SP_LeaveReport::result: " + JSON.stringify(result));

                if (result && result.length > 0) {
                    res.json(result);
                }
            });
    
    },
    DailyLogReport: async (req, res, next) => {

        let sessionSearchData = [req.sessionUser.employeeId, req.body.empId];



            Connection.query(Queries.SP_DailyLogReport, [req.sessionUser.employeeId, req.body.empType,req.body.fromDate,req.body.toDate], function (error, result) {

                Logger.info("::Queries::SP_DailyLogReport::result: " + JSON.stringify(result));

                if (result && result.length > 0) {
                    res.json(result);
                }
            });
    
    },



}

function formatLeaveDates(results) {

    results.forEach(row => {
        let dates = row['leaveDates'].replace('{', '').replace('}', '').split(',');

        if (dates === undefined || dates === null)
            row['leaveDates'] = '';
        else {
            let leaveDates = '';
            dates.forEach(dt => {
                leaveDates = leaveDates + (moment(dt + '').format('DD-MMM-YYYY') + '\n');
            });
            row['leaveDates'] = leaveDates.trim();
        }
    });
}


