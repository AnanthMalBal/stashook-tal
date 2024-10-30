const { JsonUtil, Util, Model } = require('../../node_modules/stashook-utils');
const moment = require('moment');

module.exports = new class HolidayModel extends Model {

  constructor() {
    super('usersholidayscalendar'); // Table Name
  }

  searchData(req) {
    let startDate = req.body.startDate;
    let endDate = req.body.endDate;

    console.log(startDate);
    console.log(endDate);

    let searchData = [];
    searchData.push(Util.withPercent(req.body.searchTerm));
    searchData.push(Util.withPercent(req.body.searchTerm));
    searchData.push(Util.withPercent(req.body.searchTerm));
    searchData.push(Util.withPercent(req.body.searchTerm));

    if (startDate && endDate) {
      startDate = moment(req.body.startDate).format('YYYY-MM-DD');
      endDate = moment(req.body.endDate).format('YYYY-MM-DD');

      if (moment(startDate, 'YYYY-MM-DD').isAfter(moment(endDate, 'YYYY-MM-DD'), 'day')){
        startDate = endDate;
        endDate = startDate.add(30, 'day');
      }
    }
    else {
      startDate = moment(Date.now()).format('YYYY-MM-DD');
      endDate = moment(startDate).add(30, 'day').format('YYYY-MM-DD');
    }

    searchData.push(startDate);
    searchData.push(endDate);

    console.log(searchData);
    return searchData;
  }

  createData(req) {
    return {
      'autoId': Util.primaryId(''),
      'holiday': req.body.holiday,
      'country': req.body.country,
      'startDate': moment(req.body.startDate).format('YYYY-MM-DD'),
      'endDate': moment(req.body.endDate).format('YYYY-MM-DD'),
      'year': req.body.year,
      'symbol': req.body.symbol,
      'zoneArea': req.body.zoneArea,
      'createdBy': req.sessionUser.employeeId,
      'createdDate': Util.getDate(),
      'modifiedBy': req.sessionUser.employeeId,
      'modifiedDate': Util.getDate(),
      'status': 1
    }
  }

  updateData(req) {

    let updData = [];
    updData.push(req.body.holiday);
    updData.push(req.body.country);
    updData.push(moment(req.body.startDate).format('YYYY-MM-DD'));
    updData.push(moment(req.body.endDate).format('YYYY-MM-DD'));
    updData.push(req.body.year);
    updData.push(req.body.symbol);
    updData.push(req.body.zoneArea);
    updData.push(req.sessionUser.employeeId);
    updData.push(Util.getDate());
    updData.push(JsonUtil.unmaskField(req.body.autoId));

    return updData;
  }

  createBulkData(req, data) {
    let cols = ['autoId', 'holiday', 'country', 'startDate', 'endDate', 'year', 'symbol', 'zoneArea', 'createdBy', 'createdDate', 'modifiedBy', 'modifiedDate', 'status'];
    let insData = [];
    let values = [];
    let primaryId = Util.primaryId('');
    data.forEach(elt => {

      primaryId = parseInt(primaryId) + 1;

      insData = [];
      insData.push(primaryId);
      insData.push(elt["Holiday Name"]);
      insData.push(elt["Country Name"]);
      insData.push(moment(new Date(elt["Start Date"])).format('YYYY-MM-DD'));
      insData.push(moment(new Date(elt["End Date"])).format('YYYY-MM-DD'));
      insData.push(elt["Year"]);
      insData.push(elt["Holiday Type"]);
      insData.push(elt["Zone"]);
      insData.push(req.sessionUser.employeeId);
      insData.push(Util.getDate());
      insData.push(req.sessionUser.employeeId);
      insData.push(Util.getDate());
      insData.push(1);

      values.push(insData);

    });

    return { cols, values };
  }

}