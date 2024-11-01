var express = require('express');
var router = express.Router();
const { AuthToken } = require('stashook-utils');
const HolidaysController = require('../controller/holiday-controller')
const multer = require('multer');
const moment = require('moment');

const storage = multer.diskStorage({
    destination: function (req, file, cb) {
        cb(null, process.env.HOLIDAY_UPLOAD_LOCATION); // Specify the directory where you want to store the files
    },

    filename: function (req, file, cb) {

        let fName = file.originalname ;
        if(fName.indexOf(".xlsx") > 0)
        {
            fName = fName.substring(0, fName.indexOf(".xlsx")) + '_' + moment(Date.now()).format("DDMMYYYYHHmmss") + '.xlsx';
        }
        req.uploadFileName = fName;
        cb(null, fName); // Use the original file name
    }
});

const upload = multer({ storage: storage });

router.post('/addHoliday', AuthToken.validateToken, HolidaysController.addHoliday);

router.get('/downloadHolidayTemplate', AuthToken.validateToken, HolidaysController.downloadHolidayTemplate);

router.post('/uploadHolidays', AuthToken.validateToken, upload.single('excelFile'), HolidaysController.uploadHolidays);

router.post('/updateHoliday', AuthToken.validateToken, HolidaysController.updateHoliday);

router.post('/blockHoliday', AuthToken.validateToken, HolidaysController.blockHoliday);

router.post('/deleteHoliday', AuthToken.validateToken, HolidaysController.deleteHoliday);

router.post('/approveHoliday', AuthToken.validateToken, HolidaysController.approveHoliday);

router.post('/searchHoliday', AuthToken.validateToken, HolidaysController.searchHoliday);

router.get('/getHoliday', AuthToken.validateToken, HolidaysController.getHoliday);

router.get('/getHolidayList', AuthToken.validateToken, HolidaysController.getHolidayList);

module.exports = router;
