var express = require('express');
var router = express.Router();
const TimesheetController = require('../controller/timesheet-controller')

router.post('/createTimesheet', TimesheetController.addTimesheet);

router.post('/updateTimesheet', TimesheetController.updateTimesheet);

router.post('/blockTimesheet', TimesheetController.blockTimesheet);

router.post('/deleteTimesheet', TimesheetController.deleteTimesheet);

router.post('/searchTimesheet', TimesheetController.searchTimesheet);

router.post('/getTimesheet', TimesheetController.getTimesheet);

module.exports = router;
