var express = require('express');
var router = express.Router();
const {AuthToken} = require('stashook-utils');
const AttendanceController = require('../controller/attendance-controller')


router.post('/markAttendance', AuthToken.validateToken, AttendanceController.markAttendance);

router.post('/getMarkedAttendance',AuthToken.validateToken, AttendanceController.getMarkedAttendance);

module.exports = router;
