var express = require('express');
var router = express.Router();
const AttendanceController = require('../controller/attendance-controller')


router.post('/markAttendance', AttendanceController.markAttendance);

router.post('/getMarkedTime', AttendanceController.getMarkedTime);

module.exports = router;
