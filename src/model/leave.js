const {Util, Connection, Helper, Model} = require('../../node_modules/stashook-utils');

module.exports = new class LeaveModel extends Model {

  constructor() {
    super('usersleavemanagement');// Table Name
  }

  createData(req) {
    return { 
      'leaveId' : req.body.leaveId,
      'employeeId' : req.body.employeeId, 
      'createdDate': Util.getDate(),
      'noOfDays' : req.body.noOfDays,
      'symbol' : req.body.symbol,
      'fromDate' : req.body.fromDate,
      'toDate' : req.body.toDate,
      'reason' : req.body.reason,
      'status' : 'Pending',
      'createdBy' : req.body.employeeId,
      'createdDate' : Util.getDate(),
      'modifiedBy' : req.body.employeeId,
      'modifiedDate' : Util.getDate()
    }
  }

}