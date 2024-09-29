const {Util, Connection, Helper, Model} = require('../../node_modules/stashook-utils');

module.exports = new class TimesheetModel extends Model {

  constructor() {
    super('userstimesheet'); // Table Name
  }

  createData(attendaceId) {
    return { 
      'timesheetId': Util.primaryId("TS"), 
      'attendaceId': attendaceId,
      'status': 'None'
    }
  }

}