const { JsonUtil, Util, Model } = require('stashook-utils');
const moment = require('moment');

module.exports = new class HolidayModel extends Model {

  constructor() {
    super('users_holidays_calendar'); // Table Name
  }

  searchExistData(req) {
    let startDate = moment(req.body.startDate).format('YYYY-MM-DD');
    let endDate = moment(req.body.endDate).format('YYYY-MM-DD');

    let searchData = [];
    searchData.push(startDate);
    searchData.push(endDate);
    searchData.push(req.body.zoneArea);

    if (req.body.autoId)
      searchData.push(JsonUtil.unmaskField(req.body.autoId));
    
    return searchData;
  }

  searchData(req) {

    let startDate = req.body.startDate;
    let endDate = req.body.endDate;

    let searchData = [];
    searchData.push(Util.withPercent(req.body.searchTerm)); //1
    searchData.push(Util.withPercent(req.body.searchTerm)); //2
    searchData.push(Util.withPercent(req.body.searchTerm)); //3
    searchData.push(Util.withPercent(req.body.searchTerm)); //4

    if (startDate && endDate) {
      startDate = moment(req.body.startDate).format('YYYY-MM-DD');
      endDate = moment(req.body.endDate).format('YYYY-MM-DD');

      if (moment(startDate, 'YYYY-MM-DD').isAfter(moment(endDate, 'YYYY-MM-DD'), 'day')) {
        startDate = endDate;
        endDate = moment(startDate).add(30, 'day').format('YYYY-MM-DD');
      }
    }
    else {
      startDate = moment(Date.now()).format('YYYY-MM-DD');
      endDate = moment(startDate).add(30, 'day').format('YYYY-MM-DD');
    }

    searchData.push(startDate); //5
    searchData.push(endDate); //6

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
      'approvalStatus': 'Review',
      'createdBy': req.sessionUser.employeeId,
      'createdDate': Util.getDate(),
      'modifiedBy': req.sessionUser.employeeId,
      'modifiedDate': Util.getDate(),
      'status': 0
    }
  }

  blockData(req) {
    let blkData = [];
    blkData.push('Review');
    blkData.push(req.sessionUser.employeeId);
    blkData.push(Util.getDate());
    blkData.push(req.body.status); //Will Be Set On Approval
    blkData.push(JsonUtil.unmaskField(req.body.autoId));

    return blkData;
  }

  approveData(req) {
    let appData = [];
    appData.push(req.body.comments);
    appData.push(req.body.approvalStatus);// Mandatory
    appData.push(req.sessionUser.employeeId);
    appData.push(Util.getDate());
    appData.push(req.body.approvalStatus === 'Approved' ? 1 : 0); // Mandatory

    return appData;
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
    updData.push('Review');// Mandatory
    updData.push(req.sessionUser.employeeId); //ModifiedBy
    updData.push(Util.getDate());//ModifiedDate
    updData.push(0);// Mandatory For Approval
    updData.push(JsonUtil.unmaskField(req.body.autoId));

    return updData;
  }

  createBulkData(req, data) {
    let cols = ['autoId', 'holiday', 'country', 'startDate', 'endDate', 'year', 'symbol', 'zoneArea', 'approvalStatus', 'comments', 'createdBy', 'createdDate', 'modifiedBy', 'modifiedDate', 'status'];
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
      insData.push('Review');
      insData.push(req.uploadFileName);
      insData.push(req.sessionUser.employeeId);
      insData.push(Util.getDate());
      insData.push(req.sessionUser.employeeId);
      insData.push(Util.getDate());
      insData.push(0);

      values.push(insData);

    });

    return { cols, values };
  }

}