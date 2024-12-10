const {Model, JsonUtil} = require('stashook-utils');

module.exports = new class UsersDailyLogModel extends Model {

  constructor() {
    super('usersdailylog'); // Table Name
  }

  createData(req) {
    return { 
      'employeeId': req.sessionUser.employeeId,
      'taskDate' : req.body.attendanceDate,
      'projectId' : req.body.projectId,
      'processId' : req.body.processId,
      'timesheetId' : JsonUtil.unmaskField(req.body.timesheetId),
      'actualTime' : req.body.actualTime,
      'status' : 'Pending',
      'description' : req.body.description
    }
  }

}