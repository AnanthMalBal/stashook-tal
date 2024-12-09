var express = require('express');
var router = express.Router();
const {AuthToken} = require('stashook-utils');
const AssignedTasksController = require('../controller/assignedtasks-controller');

router.post('/getProjectDurationList', AuthToken.validateToken, AssignedTasksController.getProjectDurationList);

router.post('/addProjectAssigned', AuthToken.validateToken, AssignedTasksController.addProjectAssigned);

router.post('/addAssignedTasks', AuthToken.validateToken, AssignedTasksController.addAssignedTasks);

router.post('/getAssignedTasks', AuthToken.validateToken, AssignedTasksController.getAssignedTasks);

router.post('/deleteAssignedTask', AuthToken.validateToken, AssignedTasksController.deleteAssignedTask);

module.exports = router;
