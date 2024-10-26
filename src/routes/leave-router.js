var express = require('express');
var router = express.Router();
const {AuthToken} = require('stashook-utils');
const LeaveController = require('../controller/leave-controller')

router.post('/searchLeave', AuthToken.validateToken, LeaveController.searchLeave);

router.post('/applyLeave', AuthToken.validateToken, LeaveController.applyLeave);

router.post('/cancelLeave', AuthToken.validateToken, LeaveController.cancelLeave);

router.post('/getLeaveTypeList', AuthToken.validateToken, LeaveController.getLeaveTypeList);

router.post('/getLeaveColorList', AuthToken.validateToken, LeaveController.getLeaveColorList);

router.post('/getLeaveBalance', AuthToken.validateToken, LeaveController.getLeaveBalance);

router.post('/getOnBehalfUsersList', AuthToken.validateToken, LeaveController.getOnBehalfUsersList);

module.exports = router;
