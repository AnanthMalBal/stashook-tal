var express = require('express');
var router = express.Router();
const { AuthToken } = require('stashook-utils');
const HolidaysController = require('../controller/holiday-controller')
const multer = require('multer');

const storage = multer.diskStorage({
    destination: function (req, file, cb) {
        cb(null, process.env.HOLIDAY_UPLOAD_LOCATION); // Specify the directory where you want to store the files
    },
    filename: function (req, file, cb) {
        cb(null, file.originalname); // Use the original file name
    }
});

const upload = multer({ storage: storage });

router.post('/addHoliday', AuthToken.validateToken, HolidaysController.addHoliday);

router.get('/downloadHolidayTemplate', AuthToken.validateToken, HolidaysController.downloadHolidayTemplate);

router.post('/uploadHolidays', AuthToken.validateToken, upload.single('excelFile'), HolidaysController.uploadHolidays);

router.post('/updateHoliday', AuthToken.validateToken, HolidaysController.updateHoliday);

router.post('/blockHoliday', AuthToken.validateToken, HolidaysController.blockHoliday);

router.post('/deleteHoliday', AuthToken.validateToken, HolidaysController.deleteHoliday);

router.post('/searchHoliday', AuthToken.validateToken, HolidaysController.searchHoliday);

router.get('/getHoliday', AuthToken.validateToken, HolidaysController.getHoliday);

router.get('/getHolidayList', AuthToken.validateToken, HolidaysController.getHolidayList);

module.exports = router;
