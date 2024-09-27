var express = require('express');
var router = express.Router();
const LeaveController = require('../controller/leave-controller')

router.post('/applyLeave', LeaveController.applyLeave);

router.post('/cancelLeave', LeaveController.cancelLeave);

router.post('/blockLeave', LeaveController.blockLeave);

router.post('/deleteLeave', LeaveController.deleteLeave);

router.post('/searchLeave', LeaveController.searchLeave);

router.post('/getLeave', LeaveController.getLeave);

module.exports = router;
