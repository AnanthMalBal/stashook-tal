const { JsonUtil, Util, Connection } = require('stashook-utils');
const Logger = require('../util/logger');
const Queries = require('../util/queries');
const Message = require('../util/message');
const UsersAssignedTasksModel = require('../model/assignedtasks');
const UsersProjectModel = require('../model/usersproject.js');

module.exports = {

    getProjectDurationList: async (req, res, next) => {

        Connection.query(Queries.ProjectDurationList, [req.body.divisionId, Util.getDate(), Util.getDate()], function (error, result) {
            if (error || result === undefined) res.json(Message.NO_ACTIVE_PROJECTS);
            else {
                JsonUtil.dates(result, "startDate");
                JsonUtil.dates(result, "endDate");

                let finalResult = [];
                let buffer = '';
                result.forEach(element => {
                    buffer = Buffer.from(element.projectId + ',' + element.startDate + ',' + element.endDate, "utf8");
                    finalResult.push({
                        'name': element.projectName,
                        'value': buffer.toString('base64')
                    });
                });

                res.json(finalResult);
            }
        });
    },

    addProjectAssigned: async (req, res, next) => {

        UsersProjectModel.createBulk(UsersProjectModel.createBulkData(req))
            .then(result => {
                Logger.info("::Queries::Create::UsersProjectModel::result: " + JSON.stringify(result));
                if (result.affectedRows > 0)
                    res.json(Message.PROJECT_ASSIGNED_ADDED_SUCCESSFULLY);
                else
                    res.json(Message.PROJECT_ASSIGNED_ADDING_FAILED);
            }).catch(error => {
                Logger.error("::Queries::Create::UsersProjectModel::error: " + error);
                res.json(Message.PROJECT_ASSIGNED_ADDING_FAILED);
            });
    },

    addAssignedTasks: async (req, res, next) => {

        let employeeId = req.body.employeeId ? JsonUtil.unmaskField(req.body.employeeId) : req.sessionUser.employeeId;

        Connection.query(Queries.GetUserProjectProcess, [employeeId], function (error, result) {

            Logger.info(":::GetUserProjectProcess::: " + JSON.stringify(result));

            if (result.length > 0) { // For Select Query use result.length 

                Connection.query(Queries.DeleteUserAllAssignedTasks, [employeeId], function (error, delResult) {
                    Logger.info("::Queries::Delete::DeleteUserAssignedTask::result: " + JSON.stringify(delResult));
                });

                UsersAssignedTasksModel.create(UsersAssignedTasksModel.createData(req, result))
                    .then(result => {
                        Logger.info("::Queries::Create::UsersAssignedTasksModel::result: " + JSON.stringify(result));
                        if (result.affectedRows > 0)
                            res.json(Message.ASSIGNED_TASKS_ADDED_SUCCESSFULLY);
                        else
                            res.json(Message.ASSIGNED_TASKS_ADDING_FAILED);
                    }).catch(error => {
                        Logger.error("::Queries::Create::UsersAssignedTasksModel::error: " + error);
                        res.json(Message.ASSIGNED_TASKS_ADDING_FAILED);
                    });
            }
        });
    },

    getAssignedTasks: async (req, res, next) => {

        Connection.query(Queries.GetAssignedTasks, [req.sessionUser.employeeId], function (error, result) {

            Logger.info(":::GetAssignedTasks::: " + JSON.stringify(result));

            if (error || result === undefined || result.length === 0) res.json([]);
            else res.json(JSON.parse(result[0].processInfo));

        });
    },

    deleteAssignedTask: async (req, res, next) => {

        Connection.query(Queries.GetAssignedTasks, [req.sessionUser.employeeId], function (error, result) {

            if (error || result === undefined || result.length === 0) res.json(Message.ASSIGNED_TASKS_UNABLE_TO_DELETE_ENTRY);
            else {
                let taskFound = false;
                let processInfo = JSON.parse(result[0].processInfo);

                req.body.taskIds.forEach(taskId => {

                    let projectIdx = 0;
                    let delProjectIdx; // Should be undefined

                    processInfo.forEach(project => {

                        let taskIdx = 0;
                        let delTaskIdx; // Should be undefined

                        project.tasks.forEach(task => {

                            if (task.taskId === taskId) {
                                delTaskIdx = taskIdx;
                                taskFound = true; // Avoid Unavailable Task Delete
                            }
                            taskIdx++; // Increase Task Count

                        });

                        if (delTaskIdx !== undefined)
                            project.tasks.splice(delTaskIdx, 1);

                        if (project.tasks.length === 0)
                            delProjectIdx = projectIdx;

                        projectIdx++; // Increase Project Count

                    });

                    if (delProjectIdx !== undefined)
                        processInfo.splice(delProjectIdx, 1);
                });

                if (taskFound) {
                    Connection.query(Queries.UpdateAssignedTasks, [JSON.stringify(processInfo), req.sessionUser.employeeId], function (error, result) {
                        if (error || result === undefined || result.affectedRows === 0) res.json(Message.ASSIGNED_TASKS_UNABLE_TO_DELETE_ENTRY);
                        else res.json(Message.ASSIGNED_TASKS_DELETED_SUCCESSFULLY);
                    });
                }
                else {
                    res.json(Message.ASSIGNED_TASKS_UNABLE_TO_FOUND);
                }

            }
        });
    },

}