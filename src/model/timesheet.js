const {Util, Connection, Helper, Model} = require('../../node_modules/stashook-utils');

module.exports = new class TimesheetModel extends Model {

  constructor() {
    super('userstimesheet'); // Table Name
  }

  createData(attendanceId) {
    return { 
      'timesheetId': Util.primaryId("TS"), 
      'attendanceId': attendanceId,
      'status': 'None'
    }
  }

}