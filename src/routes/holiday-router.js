var express = require('express');
var router = express.Router();
const HolidaysController = require('../controller/holiday-controller')

router.post('/createHolidays', HolidaysController.addHolidays);

router.post('/updateHolidays', HolidaysController.updateHolidays);

router.post('/blockHolidays', HolidaysController.blockHolidays);

router.post('/deleteHolidays', HolidaysController.deleteHolidays);

router.post('/searchHolidays', HolidaysController.searchHolidays);

router.get('/getHoliday', HolidaysController.getHoliday);

router.get('/getHolidayList', HolidaysController.getHolidayList);

module.exports = router;
