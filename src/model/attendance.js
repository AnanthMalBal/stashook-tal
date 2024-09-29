const {Util, Connection, Helper, Model} = require('../../node_modules/stashook-utils');

module.exports = new class AttendanceModel extends Model {

  constructor() {
    super('usersattendance');// Table Name
  }

  createData(req) {
    return { 
      'attendanceId': Util.primaryId("AT"), 
      'employeeId': req.body.employeeId, 
      'symbol': req.body.symbol,
      'mode': req.body.mode,
      'status': 'Marked',
      'attendanceDate': Util.getDate('YYYY-MM-DD 00:00:00'),
      'markedTime':Util.getDate()
    }
  }

  markData(symbol, attendanceId) {
    return { 
      'attendanceId': attendanceId, 
      'symbol': symbol,
      'status': 'Marked'
    }
  }

}