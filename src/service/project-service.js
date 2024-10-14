const {Util, Connection, Helper, Model} = require('stashook-utils');
const Queries = require('../util/queries');
const Message = require('../util/message');

module.exports = {
    getProjectList: async (req, res, next) => {

        Connection.query(Queries.ProjectList,function (error, result) {
            if (error) res.json(Message.NO_ACTIVE_PROJECTS);
            //console.log("::Queries::getProjectList::: " + JSON.stringify(result));
            res.json(result);
        });
    },
    getProcessList: async (req, res, next) => {

        Connection.query(Queries.ProjectProcessList, [req.body.projectId], function (error, result) {
            if (error) res.json(Message.NO_ACTIVE_PROCESS);
            //console.log("::Queries::getProcessList::: " + JSON.stringify(result));
            res.json(result);
        });
    }
}