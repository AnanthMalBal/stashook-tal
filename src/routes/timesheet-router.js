var express = require('express');
var router = express.Router();
const TimesheetController = require('../controller/timesheet-controller')

router.post('/getProjectList', TimesheetController.getProjectList);

router.post('/getProcessList', TimesheetController.getProcessList);

router.post('/addUserDailyLog', TimesheetController.addUserDailyLog);

module.exports = router;
