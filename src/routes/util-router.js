var express = require('express');
var router = express.Router();
const {JsonUtil} = require('stashook-utils');

router.post('/', async (req, res, next) => {

    let result = req.query.mask ? JsonUtil.maskField(req.query.mask) : JsonUtil.unmaskField(req.query.unmask)   ;
    res.json(result);
});

module.exports = router;
