const { Util, Model } = require('stashook-utils');
const moment = require('moment');
moment.createFromInputFallback = function (config) {
  // unreliable string magic, or
  config._d = new Date(config._i);
};

module.exports = new class LeaveModel extends Model {

  constructor() {
    super('users_leave_management');// Table Name
  }

  searchData(result, req) {
    let employeeIds = [];
    result.forEach(element => {
      employeeIds.push(element.employeeId);
    });
    let searchData = [];
    searchData.push(employeeIds);
    searchData.push(req.body.employeeName ? Util.withPercent(req.body.employeeName) : '%%');
    searchData.push(req.body.symbol ? Util.withPercent(req.body.symbol) : '%%');
    searchData.push(req.body.status ? Util.withPercent(req.body.status) : '%%');
    searchData.push(req.body.fromDate);
    searchData.push(req.body.toDate);
    return searchData;
  }

  searchRangeData(req, employeeId) {

    let searchData = [];
    searchData.push(employeeId);
    searchData.push(req.body.fromDate);
    searchData.push(req.body.toDate);
    searchData.push(Util.withPercent(req.body.fromDate));
    searchData.push(Util.withPercent(req.body.toDate));
    return searchData;
  }


  createData(req) {

    let employeeId = (req.body.employeeId) ? req.body.employeeId : req.sessionUser.employeeId; //By Default Session User

    return {
      'leaveId': Util.primaryId("LM"),
      'employeeId': employeeId,
      'noOfDays': this.getNoOfLeaveDays(req),
      'symbol': req.body.symbol,
      'fromDate': req.body.fromDate,
      'toDate': req.body.toDate,
      'activeToDate': req.body.toDate,
      'leaveDates': '{' + Util.getDateRange(req.body.fromDate, req.body.toDate) + '}',
      'reason': req.body.reason,
      'status': 'Pending',
      'createdBy': req.sessionUser.employeeId,
      'createdDate': Util.getDate(),
      'modifiedBy': req.sessionUser.employeeId,
      'modifiedDate': Util.getDate()
    }
  }

  getLeaveDatesOnCancel(lvResults) {

    if (parseInt(lvResults[0].detectedLeave) === 0) {
      return Util.getDateRange(moment(lvResults[0].fromDate).format('YYYY-MM-DD'), moment(lvResults[0].toDate).format('YYYY-MM-DD'));
    }
    else {
      let tmpDate = lvResults[0].fromDate;
      const dates = [moment(tmpDate).format('YYYY-MM-DD')];

      let i = 1;

      do {

        tmpDate = moment(tmpDate).add(1, 'day');
        dates.push(tmpDate.format('YYYY-MM-DD'));
      } while (++i < parseInt(lvResults[0].detectedLeave));

      return dates;
    }
  }

  getNoOfLeaveDays(req) {
    const fromDate = new Date(req.body.fromDate);
    const toDate = new Date(req.body.toDate);

    const diffTime = Math.abs(toDate - fromDate);
    const noOfDays = Math.ceil(diffTime / (1000 * 60 * 60 * 24)) + 1;
    return noOfDays;
  }

}