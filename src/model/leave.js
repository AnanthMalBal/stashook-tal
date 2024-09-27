const {Util, Connection, Helper, Model} = require('../../node_modules/stashook-utils');

module.exports = new class LeaveModel extends Model {

  constructor() {
    super('usersleavemanagement');// Table Name
  }

  createData(results) {
    return { 
      'employeeId': results[0].employeeId, 
      'createdDate': Util.getDate()
    }
  }

}