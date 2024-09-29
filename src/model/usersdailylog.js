const {Util, Connection, Helper, Model} = require('stashook-utils');

module.exports = new class UsersDailyLogModel extends Model {

  constructor() {
    super('usersdailylog'); // Table Name
  }

  createData(req) {
    return { 
      'projectId' : req.body.projectId,
      'processId' : req.body.processId,
      'timesheetId' : req.body.timesheetId,
      'actualTime' : req.body.actualTime,
      'status' : 'Pending',
      'description' : req.body.description
    }
  }

}