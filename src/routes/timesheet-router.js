var express = require('express');
var router = express.Router();
const {AuthToken} = require('stashook-utils');
const TimesheetController = require('../controller/timesheet-controller');


router.post('/getProjectList', AuthToken.validateToken, TimesheetController.getProjectList);

router.post('/getProcessList', AuthToken.validateToken, TimesheetController.getProcessList);

router.post('/addUserDailyLog', AuthToken.validateToken, TimesheetController.addUserDailyLog);

module.exports = router;
