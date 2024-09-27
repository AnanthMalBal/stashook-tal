const {Util, Connection, Helper, Model} = require('../../node_modules/stashook-utils');

module.exports = new class AttendanceModel extends Model {

  constructor() {
    super('usersattendance');// Table Name
  }

  createData(results) {
    return { 
      'employeeId': results[0].employeeId, 
      'createdDate': Util.getDate()
    }
  }

}