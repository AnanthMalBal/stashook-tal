const {Util} = require('stashook-utils');
const projectService = require('../service/project-service');

module.exports = {
    
    getProjectList: async (req, res, next) => {

        try {
            projectService.getProjectList(req, res, next);
        }
        catch (excep) {
            Util.sendError500(req, res, excep);
        }
    },
    
    getProcessList: async (req, res, next) => {

        try {
            projectService.getProcessList(req, res, next);
        }
        catch (excep) {
            Util.sendError500(req, res, excep);
        }
    },
}