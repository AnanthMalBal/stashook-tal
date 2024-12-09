const {Util} = require('stashook-utils');
const assignedTasksService = require('../service/assignedtasks-service');

module.exports = {
    
    getProjectDurationList: async (req, res, next) => {

        try {
            assignedTasksService.getProjectDurationList(req, res, next);
        }
        catch (excep) {
            Util.sendError500(req, res, excep);
        }
    },

    addProjectAssigned: async (req, res, next) => {

        try {
            assignedTasksService.addProjectAssigned(req, res, next);
        }
        catch (excep) {
            Util.sendError500(req, res, excep);
        }
    },

    addAssignedTasks: async (req, res, next) => {

        try {
            assignedTasksService.addAssignedTasks(req, res, next);
        }
        catch (excep) {
            Util.sendError500(req, res, excep);
        }
    },

    getAssignedTasks: async (req, res, next) => {

        try {
            assignedTasksService.getAssignedTasks(req, res, next);
        }
        catch (excep) {
            Util.sendError500(req, res, excep);
        }
    },

    deleteAssignedTask: async (req, res, next) => {

        try {
            assignedTasksService.deleteAssignedTask(req, res, next);
        }
        catch (excep) {
            Util.sendError500(req, res, excep);
        }
    }

}