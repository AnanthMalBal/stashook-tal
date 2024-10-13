var express = require('express');
var router = express.Router();
const LeaveController = require('../controller/leave-controller')

router.post('/searchLeave', LeaveController.searchLeave);

router.post('/applyLeave', LeaveController.applyLeave);

router.post('/cancelLeave', LeaveController.cancelLeave);

router.post('/getLeaveTypeList', LeaveController.getLeaveTypeList);

router.post('/getLeaveColorList', LeaveController.getLeaveColorList);

router.post('/getLeaveBalance', LeaveController.getLeaveBalance);

module.exports = router;
