const {Model, JsonUtil, Util} = require('stashook-utils');

module.exports = new class UsersAssignedTasksModel extends Model {

  constructor() {
    super('users_assigned_tasks'); // Table Name
  }

  createData(req, result) {

    let project = "" ;
    let processInfo = [];
    let tasks = [];
    let taskId = 1000 ;
    result.forEach(element => {
        
        if(project === "" || project !== element.projectName)
        {
            project = element.projectName ;
            tasks = [];

            processInfo.push({
                "projectName" : project,
                "tasks": tasks
            })

        }   

        tasks.push({
            'taskId' : taskId++, 
            'processId' : element.processId,
            'processName' : element.processName
        });

    });


    let employeeId = req.body.employeeId ? JsonUtil.unmaskField(req.body.employeeId) : req.sessionUser.employeeId ;

    return {
      'autoId': Util.primaryId('AST'),
      'employeeId' : employeeId,
      'processInfo' : JSON.stringify(processInfo)  
    }
  }

}