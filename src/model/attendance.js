const {Util, Connection, Helper, Model} = require('../../node_modules/stashook-utils');

module.exports = new class AttendanceModel extends Model {

  constructor() {
    super('usersattendance');// Table Name
  }

  createData(req, employeeId) {
    return { 
      'attendanceId': Util.primaryId("AT"), 
      'employeeId': employeeId, 
      'symbol': req.body.symbol,
      'mode': req.body.mode,
      'status': 'Marked',
      'lockStatus' : 'None',
      'attendanceDate': Util.getDate('YYYY-MM-DD 00:00:00'),
      'markedTime':Util.getDate()
    }
  }

  markData(symbol, attendanceId) {
    return { 
      'attendanceId': attendanceId, 
      'symbol': symbol,
      'status': 'Marked',
      'lockStatus' : 'None'
    }
  }

}