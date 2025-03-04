const {Util, Model} = require('stashook-utils');

module.exports = new class AttendanceModel extends Model {

  constructor() {
    super('users_attendance');// Table Name
  }

  markData(symbol, attendanceId) {
    return { 
      'attendanceId': attendanceId, 
      'symbol': symbol,
      'status': 'Marked',
      'lockStatus' : 'None'
    }
  }

  createData(req, employeeId) {
    return { 
      'attendanceId': Util.primaryId("AT"), 
      'employeeId': employeeId,
      'symbol': req.body.symbol,
      'mode': req.body.mode,
      'status': 'Marked',
      'lockStatus' : 'None',
      'date': Util.getDate('YYYY-MM-DD 00:00:00'),
      'markedTime':Util.getDate(),
      'markedBy': req.sessionUser.employeeId
    }
  }
  
attendanceUpdateData(req, result) {

  let updateData = [];
  updateData.push(req.body.symbol);
  updateData.push(Util.getDate());
  updateData.push(req.sessionUser.employeeId);
  updateData.push(result[0].attendanceId);

  return updateData;
}



}