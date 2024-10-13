const { Util, Connection, Helper, Model } = require('../../node_modules/stashook-utils');

module.exports = new class LeaveModel extends Model {

  constructor() {
    super('usersleavemanagement');// Table Name
  }

  createData(req) {

    const fromDate = new Date(req.body.fromDate);
    const toDate = new Date(req.body.toDate);

    const diffTime = Math.abs(toDate - fromDate);
    const noOfDays = Math.ceil(diffTime / (1000 * 60 * 60 * 24)) + 1;

    return {
      'leaveId': Util.primaryId("LM"),
      'employeeId': req.body.employeeId,
      'noOfDays': noOfDays,
      'symbol': req.body.symbol,
      'fromDate': req.body.fromDate,
      'toDate': req.body.toDate,
      'reason': req.body.reason,
      'status': 'Pending',
      'createdBy': req.body.employeeId,
      'createdDate': Util.getDate(),
      'modifiedBy': req.body.employeeId,
      'modifiedDate': Util.getDate()
    }
  }

}