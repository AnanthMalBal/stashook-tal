const { JsonUtil, Util, Model } = require('stashook-utils');
const moment = require('moment');

module.exports = new class UsersProjectModel extends Model {

    constructor() {
        super('usersresourceproject');// Table Name
    }

    createData(req) {

        let employeeId = req.sessionUser.employeeId;
        let projectDuration = JsonUtil.unmaskField(req.body.projectDuration);
        let project = projectDuration.split(",");

        if (req.sessionUser.isAdmin && req.body.employeeId && req.body.employeeId.trim() !== "") {
            employeeId = req.body.employeeId;
        }

        return {
            'employeeId': employeeId,
            'projectId': project[0].trim(),
            'startDate': project[1].trim(),
            'endDate': project[2].trim(),
            'status': 1
        }
    }

    createBulkData(req) {
        let cols = ['autoId', 'employeeId', 'projectId', 'startDate', 'endDate', 'status'];
        let insData = [];
        let values = [];
        let primaryId = Util.primaryId('');
        let employeeId = req.body.employeeId ? req.body.employeeId : req.sessionUser.employeeId;
        let projectInfo;
        let buffer = '';
        
        let projects = req.body.values ;
        let details ;
        projects.forEach(elt => {

            buffer = Buffer.from(elt, 'base64');
            projectInfo = buffer.toString('utf8');
            details = projectInfo.split(',');
            primaryId = parseInt(primaryId) + 1;
            insData = [];
            insData.push('UPA' + primaryId);
            insData.push(employeeId);
            insData.push(details[0]);
            insData.push(moment(new Date(details[1])).format('YYYY-MM-DD HH:mm:ss'));
            insData.push(moment(new Date(details[2])).format('YYYY-MM-DD HH:mm:ss'));
            insData.push(1);

            values.push(insData);

        });

        return { cols, values };
    }
}