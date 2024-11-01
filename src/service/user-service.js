const { JsonUtil, Connection } = require('stashook-utils');
const Logger = require('../util/logger');
const Queries = require('../util/queries');

module.exports = {

    getOnBehalfUsersList : async (req, res, next) => {
        Connection.query(Queries.GetReportingEmployeeList, [req.sessionUser.employeeId], function (error, results) {
            if (error || results === undefined || results.length === 0) {
                res.json({});
            }
            else
            {
                Logger.info("::GetReportingEmployeeList:: " + JSON.stringify(results))
                JsonUtil.mask(results, "employeeId");
                res.json(results);
            }
        });
    }
}