var express = require('express');
var router = express.Router();
const {AuthToken} = require('stashook-utils');
const UserDailyLogController = require('../controller/userdailylog-controller');


router.post('/addUserDailyLog', AuthToken.validateToken, UserDailyLogController.addUserDailyLog);

router.post('/getUserDailyLog', AuthToken.validateToken, UserDailyLogController.getUserDailyLog);

router.post('/getAssignedUserDailyLog', AuthToken.validateToken, UserDailyLogController.getAssignedUserDailyLog);

router.post('/deleteUserDailyLog', AuthToken.validateToken, UserDailyLogController.deleteUserDailyLog);

module.exports = router;
