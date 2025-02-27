var express = require('express');
var router = express.Router();
const {AuthToken} = require('stashook-utils');
const ReportController = require('../controller/report-controller')

router.post('/leaveReport', AuthToken.validateToken, ReportController.leaveReport);

router.post('/dailyLogReport', AuthToken.validateToken, ReportController.dailyLogReport);

router.post('/searchLeave', AuthToken.validateToken, ReportController.leaveReport);

router.post('/searchLeave', AuthToken.validateToken, ReportController.leaveReport);
module.exports = router;
