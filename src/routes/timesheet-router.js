var express = require('express');
var router = express.Router();
const {AuthToken} = require('stashook-utils');
const TimesheetController = require('../controller/timesheet-controller');


router.post('/getTimesheetByDateRange', AuthToken.validateToken, TimesheetController.getTimesheetByDateRange);

router.post('/updateTimesheet', AuthToken.validateToken, TimesheetController.updateTimesheet);

router.post('/approveTimesheet', AuthToken.validateToken, TimesheetController.approveTimesheet);

router.post('/approveLockedTimesheet', AuthToken.validateToken, TimesheetController.approveLockedTimesheet);

module.exports = router;
