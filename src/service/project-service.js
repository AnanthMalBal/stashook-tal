const { Connection } = require('stashook-utils');
const Queries = require('../util/queries');
const Message = require('../util/message');


module.exports = {
    getProjectList: async (req, res, next) => {

        Connection.query(Queries.ProjectList, [req.body.divisionId], function (error, result) {
            if (error || result === undefined) res.json(Message.NO_ACTIVE_PROJECTS);
            else res.json(result);
        });
    },
    getProcessList: async (req, res, next) => {

        Connection.query(Queries.ProjectProcessList, [req.body.projectId], function (error, result) {
            if (error || result === undefined) res.json(Message.NO_ACTIVE_PROCESS);
            else res.json(result);
        });
    },
}