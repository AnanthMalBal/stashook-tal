const { Connection, JsonUtil, Util } = require('stashook-utils');
const Queries = require('../util/queries');
const Message = require('../util/message');
const HolidayModel = require('../model/holiday');
const Logger = require('../util/logger');
const xlsx = require('xlsx');

module.exports = {

    addHoliday: async (req, res, next) => {

        Connection.query(Queries.SearchHolidayExists, HolidayModel.searchExistData(req), function (error, results) {

            Logger.info("::Queries::SearchHolidayExists::HolidayModel:results:: " + JSON.stringify(error));

            if (results !== undefined && results.length === 0) {
                HolidayModel.create(HolidayModel.createData(req))
                    .then(insResult => {
                        if (insResult.affectedRows > 0) {
                            Logger.info("::Queries::Create::HolidayModel:result:: " + JSON.stringify(insResult));
                            res.json(Message.HOLIDAY_ADDED_SUCCESSFULLY);
                        }
                    }).catch(error => {
                        Logger.error("::Queries::Create::HolidayModel::error: " + error);
                        res.json(Message.UNABLE_TO_ADD_HOLIDAY);
                    });
            }
            else {
                Logger.error("::Queries::Create::HolidayModel::Already Exists::");
                res.json(Message.HOLIDAY_EXISTS);
            }
        });
    },

    uploadHolidays: async (req, res, next) => {

        const workbook = xlsx.readFile(req.uploadFileName);

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

        Connection.query(Queries.SearchHolidayUpdateExists, HolidayModel.searchExistData(req), function (error, results) {

            if (results !== undefined && results.length === 0) {

                Connection.query(Queries.UpdateHoliday, HolidayModel.updateData(req), function (error, results) {

                    if (error || results === undefined || results.affectedRows === 0) res.json(Message.UNABLE_TO_UPDATE_HOLIDAY);
                    else {
                        if (results.affectedRows > 0)
                            res.json(Message.HOLIDAY_UPDATED_SUCCESSFULLY);

                    }
                });
            }
            else {
                Logger.error("::Queries::Update::HolidayModel::Already Exists For Given Date Range::");
                res.json(Message.HOLIDAY_EXISTS);
             }
        });
    },

    blockHoliday: async (req, res, next) => { //softDelete

        Connection.query(Queries.UpdateBlockHoliday, HolidayModel.blockData(req), function (error, results) {

            if (error || results === undefined || results.affectedRows === 0) res.json(Message.UNABLE_TO_BLOCK_HOLIDAY);
            else {
                if (results.affectedRows > 0)
                    res.json(Message.HOLIDAY_BLOCKED_SUCCESSFULLY);

            }
        });
    },

    deleteHoliday: async (req, res, next) => { //permanentDelete

        Connection.query(Queries.DeleteHoliday, [Util.getDate('YYYY-MM-DD 00:00:00'), JsonUtil.unmaskField(req.body.autoId)], function (error, results) {

            if (error || results === undefined || results.affectedRows === 0) res.json(Message.UNABLE_TO_DELETE_HOLIDAY);
            else {
                if (results.affectedRows > 0)
                    res.json(Message.HOLIDAY_DELETED_SUCCESSFULLY);

            }
        });
    },

    approveHoliday: async (req, res, next) => { //approveHoliday

        Connection.query(Queries.UpdateApproveHoliday, HolidayModel.approveData(req), function (error, results) {

            Logger.info("::Queries::UpdateApproveHoliday::HolidayModel:results:: " + JSON.stringify(error));

            if (error || results === undefined || results.affectedRows === 0) res.json(Message.UNABLE_TO_APPROVE_HOLIDAY);
            else {
                if (results.affectedRows > 0)
                    res.json(Message.HOLIDAY_APPROVED_SUCCESSFULLY);

            }
        });
    },

    getHoliday: async (req, res, next) => {

        Connection.query(Queries.GetHolidayById, function (error, result) {
            if (error) res.json(Message.NO_ACTIVE_PROJECTS);
            res.json(result);
        });
    },

    searchHoliday: async (req, res, next) => {

        let cThis = this;

        Connection.query(HolidayModel.SearchWithLimit(req, Queries.SearchHoliday), HolidayModel.searchData(req), function (error, results) {
            if (error || results === undefined || results.length === 0) {
                Logger.error("HolidayModel is Error :: " + error);
                Logger.error("HolidayModel is Results Undefined :: " + (results === undefined));
                HolidayModel.searchResults(req, res, []);
            }
            else {
                JsonUtil.mask(results, "autoId");
                JsonUtil.bitToInt(results, "status");
                JsonUtil.dates(results, "startDate", 'DD-MM-YYYY');
                JsonUtil.dates(results, "endDate", 'DD-MM-YYYY');
                JsonUtil.dates(results, "createdDate", 'DD-MMM-YYYY HH:mm:ss');
                JsonUtil.dates(results, "modifiedDate", 'DD-MMM-YYYY HH:mm:ss');
                HolidayModel.searchResults(req, res, results);
            }
        });
    },


}