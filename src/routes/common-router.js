var express = require('express');
var router = express.Router();
const {AuthToken} = require('stashook-utils');
const CommonController = require('../controller/common-controller');


router.post('/getProjectList', AuthToken.validateToken, CommonController.getProjectList);

router.post('/getProcessList', AuthToken.validateToken, CommonController.getProcessList);

module.exports = router;
