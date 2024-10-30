const {Connection, JsonUtil } = require('stashook-utils');
const Queries = require('../util/queries');
const Message = require('../util/message');
const HolidayModel = require('../model/holiday');
const Logger = require('../util/logger');
const xlsx = require('xlsx');

module.exports = {

    addHoliday: async (req, res, next) => {

        HolidayModel.create(HolidayModel.createData(req))
            .then(insResult => {
                if (insResult.affectedRows > 0) {
                    Logger.info("::Queries::Create::HolidayModel:result:: " + JSON.stringify(insResult));
                    res.json(Message.HOLIDAY_ADDED_SUCCESSFULLY);
                }
            }).catch(error => {
                // Logger.error("::Queries::Create::HolidayModel::error: " + error);
                res.json(Message.UNABLE_TO_ADD_HOLIDAY);
            });
    },

    uploadHolidays: async (req, res, next) => {
        
        const workbook = xlsx.readFile(req.file.path);

        if (workbook.SheetNames.length === 1) {
            const worksheet = workbook.Sheets[workbook.SheetNames[0]];
            const data = xlsx.utils.sheet_to_json(worksheet, { header: 2, raw: false }); //1 Represent Row Number 

            HolidayModel.createBulk(HolidayModel.createBulkData(req, data))
            .then(insResult => {
                Logger.info("::Queries::Create::HolidayModel:result:: " + JSON.stringify(insResult));
                if (insResult.affectedRows > 0) {
                    res.json(Message.HOLIDAY_ADDED_SUCCESSFULLY);
                }
            }).catch(error => {
                Logger.error("::Queries::Create::HolidayModel::error: " + error);
                res.json(Message.UNABLE_TO_ADD_HOLIDAY);
            });
        }
    },

    updateHoliday: async (req, res, next) => {

        Connection.query(Queries.UpdateHoliday, HolidayModel.updateData(req), function (error, results) {

            console.log(":::::error:::::: " + error);
            if (error || results === undefined || results.affectedRows === 0) res.json(Message.UNABLE_TO_UPDATE_HOLIDAY);
            else {
                if (results.affectedRows > 0) 
                    res.json(Message.HOLIDAY_UPDATED_SUCCESSFULLY);

            }
        });
    },

    blockHoliday: async (req, res, next) => { //softDelete

        Connection.query(Queries.UpdateBlockHoliday, [req.body.status, JsonUtil.unmaskField(req.body.autoId)], function (error, results) {
            if (error || results === undefined || results.affectedRows === 0) res.json(Message.UNABLE_TO_BLOCK_HOLIDAY);
            else {
                if (results.affectedRows > 0) 
                    res.json(Message.HOLIDAY_BLOCKED_SUCCESSFULLY);

            }
        });
    },

    deleteHoliday: async (req, res, next) => { //softDelete

        Connection.query(Queries.DeleteHoliday, [JsonUtil.unmaskField(req.body.autoId)], function (error, results) {
            if (error || results === undefined || results.affectedRows === 0) res.json(Message.UNABLE_TO_DELETE_HOLIDAY);
            else {
                if (results.affectedRows > 0) 
                    res.json(Message.HOLIDAY_DELETED_SUCCESSFULLY);

            }
        });
    },
    searchHoliday: async (req, res, next) => {

        Connection.query(Queries.SelectHoliday, HolidayModel.searchData(req), function (error, results) {
            if (error) res.json(Message.NO_DATA_FOUND);
            else {
                JsonUtil.mask(results, "autoId");
                JsonUtil.bitToInt(results, "status");
                JsonUtil.dates(results, "startDate", 'DD-MM-YYYY');
                JsonUtil.dates(results, "endDate", 'DD-MM-YYYY');
                JsonUtil.dates(results, "createdDate", 'DD-MMM-YYYY HH:mm:ss');
                JsonUtil.dates(results, "modifiedDate", 'DD-MMM-YYYY HH:mm:ss');
                res.json(results);
            }
        });
    },

    getHoliday: async (req, res, next) => {

        Connection.query(Queries.GetHolidayById, function (error, result) {
            if (error) res.json(Message.NO_ACTIVE_PROJECTS);
            //console.log("::Queries::getProjectList::: " + JSON.stringify(result));
            res.json(result);
        });
    },

}