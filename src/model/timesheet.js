const { Util, JsonUtil, Model } = require('stashook-utils');

module.exports = new class TimesheetModel extends Model {

  constructor() {
    super('userstimesheet'); // Table Name
  }

  createData(attendanceId) {
    return {
      'timesheetId': Util.primaryId("TS"),
      'attendanceId': attendanceId,
      'status': 'None',
      'lockStatus': 'None'
    }
  }


  getTimesheetData(req) {

    let searchData = [];
    searchData.push(req.sessionUser.employeeId);
    searchData.push(Util.getDateRange(req.body.fromDate, req.body.toDate));

    return searchData;
  }


  approveAttendanceData(req, isSpecial = false) {

    let special = isSpecial ? 'Special Approval : ' : '';

    let approvalData = [];
    approvalData.push(Util.getDate()); //ApprovedTime
    approvalData.push(req.body.status); //ApproveStatus
    approvalData.push(special + (req.body.comments ? req.body.comments : req.body.status)); //Approval Comments
    approvalData.push(req.sessionUser.employeeId);
    approvalData.push(JsonUtil.unmaskField(req.body.attendanceId));

    return approvalData;
  }

  approveTimesheetData(req, isSpecial = false) {

    let special = isSpecial ? 'Special Approval : ' : '';

    let approvalData = [];
    approvalData.push(Util.getDate()); //ApprovedTime
    approvalData.push(req.body.status); //ApproveStatus
    approvalData.push(special + (req.body.comments ? req.body.comments : req.body.status)); //Approval Comments
    approvalData.push(req.sessionUser.employeeId);
    approvalData.push(JsonUtil.unmaskField(req.body.timesheetId));

    return approvalData;
  }

  updateTimesheetData(req) {

    let updateData = [];
    updateData.push(req.body.hoursBillable);
    updateData.push(req.body.hoursNBNP);
    updateData.push(req.body.hoursNBP);
    updateData.push(Util.getDate());
    updateData.push(JsonUtil.unmaskField(req.body.timesheetId));

    return updateData;
  }

}